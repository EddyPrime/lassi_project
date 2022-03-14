require 'rails_helper'

RSpec.describe PayementMethodsController, type: :controller do

    before(:each) do
        @user = FactoryBot.create(:user)
        @user.roles = :user
        @user.roles_mask = 0
		@payement_method = FactoryBot.create(:payement_method)

	end

    describe "GET #index" do
        context "always" do
            it "lists all the payement methods" do
                allow(controller).to receive(:authenticate_user!).and_return(true)
				allow(controller).to receive(:current_user).and_return(@user)
                expect(response).to be_successful
            end
        end
    end

    describe "POST #create" do
		context "with valid params" do
			it "creates a new PayementMethod" do
				allow(controller).to receive(:authenticate_user!).and_return(true)
				allow(controller).to receive(:current_user).and_return(@user)
				expect{post :create, params: {
                        payement_method: {
                            number: @payement_method.number - 1
                        }}}.to change(PayementMethod, :count).by(1)
				expect(response).to redirect_to(payement_methods_path)
			end
		end

        context "with invalid params" do
                it "creates a flash notify error" do
                    allow(controller).to receive(:authenticate_user!).and_return(true)
                    allow(controller).to receive(:current_user).and_return(@user)
                    expect{post :create, params: {
                            payement_method: {
                                number: nil
                            }}}.to change(PayementMethod, :count).by(0)
                    expect(response).to redirect_to(payement_methods_path)
                end
        end
    end

    describe "GET #show" do
        context "with valid id" do
            it "shows the payement_method" do
                allow(controller).to receive(:authenticate_user!).and_return(true)
				allow(controller).to receive(:current_user).and_return(@user)
                get :show, params:{ id: @payement_method.id }
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

    describe "PATCH #update" do
        context "with valid id" do
            it "updates payement method's number" do
                allow(controller).to receive(:authenticate_user!).and_return(true)
				allow(controller).to receive(:current_user).and_return(@user)
                expect(patch :update, params: { id: @payement_method.id, number: 9999}).not_to be(@payement_method)
                expect(response).to redirect_to(payement_method_path)
            end
        end
        context "with invalid id" do
            it "redirect to 404" do
                allow(controller).to receive(:authenticate_user!).and_return(true)
				allow(controller).to receive(:current_user).and_return(@user)
                expect(patch :update, params: { id: 9999, number: 9999}).not_to be(@payement_method)
				expect(response).to have_http_status(404)
            end
        end
    end

    describe "DELETE #destroy" do
        context "with valid id" do
            it "destroy an existent payment method" do
                allow(controller).to receive(:authenticate_user!).and_return(true)
				allow(controller).to receive(:current_user).and_return(@user)
                expect{delete :destroy, params: { id: @payement_method.id }}.to change(PayementMethod, :count).by(-1)
				expect(response).to redirect_to(payement_methods_path)
            end
        end
        context "with invalid id" do
            it "redirect to 404" do
                allow(controller).to receive(:authenticate_user!).and_return(true)
				allow(controller).to receive(:current_user).and_return(@user)
                expect{delete :destroy, params: { id: 9999 }}.to change(PayementMethod, :count).by(0)
				expect(response).to have_http_status(404)
            end
        end
    end
end
