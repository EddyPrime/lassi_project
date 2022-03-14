require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

    before(:each) do
		@user = FactoryBot.create(:user)
        @user.roles = :vendor
        @user.roles_mask = 1
        @product = FactoryBot.create(:product, user_id: @user.id)
    end

    describe "GET #index" do
        context "always" do
            it "lists all products" do
                expect(response).to be_successful
            end
        end
    end


    describe "POST #create" do
		context "with valid params" do
			it "creates a new Product" do
				allow(controller).to receive(:authenticate_user!).and_return(true)
				allow(controller).to receive(:current_user).and_return(@user)
				expect{post :create, params: {
                        product: {
                            name: @product.name,
                            product_type: @product.product_type,
                            price: @product.price
                        }}}.to change(Product, :count).by(1)
				expect(response).to redirect_to(root_path)
			end
		end

        context "with invalid price" do
                it "creates a flash notify error" do
                    allow(controller).to receive(:authenticate_user!).and_return(true)
                    allow(controller).to receive(:current_user).and_return(@user)
                    expect{post :create, params: {
                        product: {
                            name: @product.name,
                            product_type: @product.product_type,
                            price: nil
                        }}}.to change(Product, :count).by(0)
				expect(response).to redirect_to(products_path)
                end
        end

        context "with invalid name" do
                it "creates a flash notify error" do
                    allow(controller).to receive(:authenticate_user!).and_return(true)
                    allow(controller).to receive(:current_user).and_return(@user)
                    expect{post :create, params: {
                        product: {
                            name: nil,
                            product_type: @product.product_type,
                            price: @product.price
                        }}}.to change(Product, :count).by(0)
				expect(response).to redirect_to(products_path)
                end
        end
    end

    
    describe "DELETE #destroy" do
        context "with valid id" do
            it "destroy an existent product" do
                allow(controller).to receive(:authenticate_user!).and_return(true)
                allow(controller).to receive(:current_user).and_return(@user)
                expect{delete :destroy, params: { id: @product.id }}.to change(Product, :count).by(-1)
				expect(response).to redirect_to(products_path)
            end
        end
        context "with invalid id" do
            it "redirect to 404" do
                allow(controller).to receive(:authenticate_user!).and_return(true)
				allow(controller).to receive(:current_user).and_return(@user)
                expect{delete :destroy, params: { id: 9999 }}.to change(Product, :count).by(0)
				expect(response).to have_http_status(404)
            end
        end
    end

end
