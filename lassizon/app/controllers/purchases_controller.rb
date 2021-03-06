class PurchasesController < ApplicationController

    before_action :authenticate_user!
    load_and_authorize_resource :except => [:create]

    def index
        if current_user.roles_mask != 0
            redirect_to products_path
            return
        end
        @purchases = Purchase.where(user_id: current_user.id)
    end

    def create
        if current_user.roles_mask != 0
            redirect_to products_path
            return
        end
        @user = current_user
        if PayementMethod.where(user_id: current_user.id).count < 1 then
	    flash[:error] = "ERROR! You need a payment method to buy a product!"
	    redirect_to products_path
            return
        end
        purchase_params = params.require(:purchase).permit(:product_id, :price)
        if purchase_params[:price].eql?"" then
            #flash[:notice] = "ERROR."
            redirect_to purchases_path
            return
        end
        if purchase_params[:product_id].eql?"" then
            #flash[:notice] = "ERROR."
            redirect_to purchases_path
            return
        end

        purchase_params[:user_id] = @user.id
        product = Product.where(id: purchase_params[:product_id]).first
        purchase_params[:description] = product.name + ' ' + product.product_type
        @purchase = Purchase.create!(purchase_params)
		#authorize! :create, @purchase
		#flash[:notice] = "#{@purchase} was successfully created."
		redirect_to purchases_path
    end

    def show
        id = params[:id]
        if id.nil? then
            redirect_to products_path
            return
        end
		@purchase = Purchase.find(id)
	end

end
