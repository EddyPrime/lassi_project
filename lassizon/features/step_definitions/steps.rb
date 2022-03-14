require 'uri'

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Given /^I am a registered user$/ do
  @product = FactoryBot.create(:product)
  @user = FactoryBot.create(:user, :roles_mask => 0)
  @user.roles_mask = 0
  visit "users/sign_in"
  fill_in "user_email", :with => @user.email
  fill_in "user_password", :with => @user.password
  click_button('Log in').click
    @payement_method = FactoryBot.create(:payement_method, :user_id => @user.id)

end

Given /^I am a registered vendor$/ do
  visit "users/sign_in"
  @user = FactoryBot.create(:user, :roles => :user)
  @user.roles_mask = 1
  @product = FactoryBot.create(:product, :user_id => @user.id)
  fill_in "user_email", :with => @user.email
  fill_in "user_password", :with => @user.password
  click_button('Log in').click
end

Given /^I am Superadmin$/ do
  @product = FactoryBot.create(:product)
  @user = FactoryBot.create(:user, :roles_mask => 2)
  @user.roles_mask = 2
  @utente = FactoryBot.create(:user, :roles_mask => 0)
  visit "users/sign_in"
  fill_in "user_email", :with => @user.email
  fill_in "user_password", :with => @user.password
  click_button('Log in').click
end

Given /^I am logged in$/ do
  visit "users/sign_in"
  @user = FactoryBot.create(:user, :roles => :admin)
  @product = FactoryBot.create(:product)
  fill_in "user_email", :with => @user.email
  fill_in "user_password", :with => @user.password
  click_button('Log in').click
end

When /^I click (.*)/ do |element|
  click_on(element)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )follow '([^"]*)'$/ do |link|
  first(:link, link).click
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end


Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    expect(current_path).to be == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end


Then /^(?:|I )should see '([^"]*)'$/ do |text|
  if page.respond_to? :should
    expect(page).to have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    expect(page).to have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

Then /^(?:|I )should not see '([^"]*)'$/ do |text|
  if page.respond_to? :should
    expect(page).to have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

When /^(?:|I )press '([^"]*)'$/ do |button|
  click_button(button)
end

Then /^I should see the products$/ do
  visit products_path
end

When /^I follow "buy_link"$/ do
    expect(page).to have_content("buy_link")
end

Then /^I should see the list of users on Lassizon$/ do
    expect(page).to have_selector(:id, "list_of_users")
end

Then /^I should see the number of product I am selling on Lassizon$/ do
    expect(page).to have_selector(:id, "number_of_product")
end

And /^I have an account$/ do
  @user = FactoryBot.create(:user, :roles_mask => 0)
end

Given /^I am logged as user$/ do
  @user = FactoryBot.create(:user, :roles_mask => 0)
  @user.roles_mask = 0
  @payement_method = FactoryBot.create(:payement_method, :user_id => @user.id)
  visit "users/sign_in"
  fill_in "user_email", :with => @user.email
  fill_in "user_password", :with => @user.password
  click_button('Log in').click
end

Then /^I should see the map with my position$/ do
    expect(page).to have_selector(:id, "map")
end

And /^I insert my credentials$/ do
    fill_in "user_email", :with => @user.email
    fill_in "user_password", :with => @user.password
end
