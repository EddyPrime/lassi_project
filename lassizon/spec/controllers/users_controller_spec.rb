require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    before(:each) do
		@user = FactoryBot.create(:user)
	end

end
