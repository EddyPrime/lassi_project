require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

    before(:each) do
		@user = FactoryBot.create(:user)
        @user.roles_mask = 0
        @product = FactoryBot.create(:product)
        @purchase = FactoryBot.create(:purchase, user: @user, product: @product)
        @purchase.product_id = @product.id
        @review = FactoryBot.create(:review)
	end

    describe "GET #index" do
        context "always" do
            it "lists all reviews" do
                expect(response).to be_successful
            end
        end
    end

    describe "POST #create" do
		context "with valid params" do
			it "creates a new Review" do
				allow(controller).to receive(:authenticate_user!).and_return(true)
                allow(controller).to receive(:current_user).and_return(@user)
				expect{post :create, params: {
                        review: {
                            product_id: @product.id,
                            user_id: @user.id,
                            value: @review.value
                        }}}.to change(Review, :count).by(1)
				expect(response).to redirect_to(products_path)
			end
		end
        context "with invalid value" do
                it "creates a flash notify error" do
                    allow(controller).to receive(:authenticate_user!).and_return(true)
                    allow(controller).to receive(:current_user).and_return(@user)
                    expect{post :create, params: {
                        review: {
                            product_id: @product.productId,
                            user_id: @user.uid,
                            value: nil
                        }}}.to change(Review, :count).by(0)
				expect(response).to redirect_to(products_path)
                end
        end
	end
end
