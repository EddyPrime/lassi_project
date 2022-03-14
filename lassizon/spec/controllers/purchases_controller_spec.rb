require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do

    before(:each) do
		@user = FactoryBot.create(:user)
        @user.roles = :user
        @product = FactoryBot.create(:product)
        @purchase = FactoryBot.create(:purchase, :product => @product, :user => @user)
	end

    describe "GET #index" do
        context "always" do
            it "lists all purchases" do
                expect(response).to be_successful
            end
        end
    end

    describe "GET #show" do
        context "with valid id" do
            it "shows the purchase" do
                allow(controller).to receive(:authenticate_user!).and_return(true)
				allow(controller).to receive(:current_user).and_return(@user)
                get :show, params:{ id: @purchase.id }
                expect(response).to have_http_status(200)
            end
        end

        context "with invalid id" do
            it "shows 404:Record Not Found" do
                allow(controller).to receive(:authenticate_user!).and_return(true)
				allow(controller).to receive(:current_user).and_return(@user)
                get :show, params:{ id: 9999 }
                expect(response).to have_http_status(404)
            end
        end
    end
end
