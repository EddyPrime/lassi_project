class ProductsController < ApplicationController

    load_and_authorize_resource :except => [:index, :show, :create, :destroy]

    def index
        @products = Product.search(params[:search]).sort_by {|product| product.avg }.reverse
	end

    def show
        id = params[:id]
        if id.nil? then
            redirect_to products_path
            return
        end
		@product = Product.find(id)  #.find_by_id doesnt throw exception
	end

    def new

    end

    def edit

    end

    def create
        if current_user.roles_mask != 1
            redirect_to products_path
            return
        end
        @user = current_user
        product_params = params.require(:product).permit(:name, :product_type, :price)
        if product_params[:price].nil? or product_params[:price].eql?"" then
            flash[:notice] = "ERROR. You have to insert a price for the product!"
            redirect_to products_path
            return
        end
        if product_params[:price].to_i < 0 then
            flash[:notice] = "ERROR. You have to insert a positive price for the product!"
            redirect_to products_path
            return
        end
        if product_params[:name].nil? or product_params[:name].eql?"" then
            flash[:notice] = "ERROR. You have to insert a name for the product!"
            redirect_to products_path
            return
        end
        if product_params[:product_type].nil? or product_params[:product_type].eql?"" then
            flash[:notice] = "ERROR. You have to insert a type for the product!"
            redirect_to products_path
            return
        end
        product_params[:user_id] = @user.id
        @product = Product.create!(product_params)
        authorize! :create, @product
		#flash[:notice] = "#{@product.name} was successfully created."
        redirect_to products_path
        return
    end

    def update
		id = params[:id]
        if id.nil? then
            redirect_to products_path
            return
        end
		@product = Product.find(id)
		@product.update_attributes!(params.permit(:name, :type, :price))
		#flash[:notice] = "#{@product.name} was successfully updated."
		redirect_to product_path
	end

    def destroy
        if current_user.roles_mask != 1 && current_user.roles_mask != 2
            redirect_to products_path
            return
        end
        @user = current_user
        id = params[:id]
        if id.nil? then
            redirect_to products_path
            return
        end
        @product = Product.find(id)
        if current_user.roles_mask == 1 && @product.user_id != @user.id then
            redirect_to products_path
            return
        end
        #authorize! :destroy, @product
		@product.destroy!
        flash[:notice] = "#{@product.name} has been deleted."
        redirect_to products_path
        return
    end
end
