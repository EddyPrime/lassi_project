class ReviewsController < ApplicationController

    load_and_authorize_resource :except => [:create]

    def new
    end

    def create
        if current_user && current_user.roles_mask != 0
            return
        end
        @user = current_user
        review_params = params.require(:review).permit(:value, :product_id)
        if review_params[:value].eql?"" then
            flash[:notice] = "ERROR. You have to insert a value for the review!"
            redirect_to products_path
            return
        end
        if Purchase.where(product_id: review_params[:product_id], user_id: @user.id).count < 1 then
            flash[:notice] = "ERROR. You have not purchased this product!"
            redirect_to products_path
            return
        end
        review_params[:user_id] = @user.id
        @review = Review.create!(review_params)
		authorize! :create, @review
		#flash[:notice] = "#{@review.value} was successfully created."
		redirect_to products_path
    end

end
