class PayementMethodsController < ApplicationController

    before_action :authenticate_user!
    load_and_authorize_resource :except => [:index, :create]

  def index
    if current_user.roles_mask != 0
      redirect_to products_path
      return
    end
	  @payement_methods = PayementMethod.where(user_id: current_user.id).all
	end

  def show
		id = params[:id]
    if id.nil? then
        redirect_to products_path
        return
    end
		@payement_method = PayementMethod.find(id)
	end

  def new

  end

  def edit

  end

  def create
    if current_user.roles_mask != 0
      redirect_to products_path
      return
    end
    @user = current_user
    payement_methods_params = params.require(:payement_method).permit(:number)
    number = payement_methods_params[:number]
    if payement_methods_params[:number].nil? or payement_methods_params[:number].eql?"" then
      flash[:notice] = "ERROR. You have to insert the number of the payement method."
      redirect_to payement_methods_path
      return
    end
    if PayementMethod.where(number: number.to_i, user_id: @user.id).count > 0 then
      #flash[:notice] = "ERROR."
      redirect_to payement_methods_path
      return
    end

    payement_methods_params[:user_id] = @user.id
    @payement_method = PayementMethod.create!(payement_methods_params)
    #authorize! :create, @payement_method
		#flash[:notice] = "#{@payement_method.number} was successfully created."
		redirect_to payement_methods_path
  end

  def update
		id = params[:id]
    if id.nil? then
        redirect_to products_path
        return
    end
		@payement_method = PayementMethod.find(id)
		@payement_method.update_attributes!(params.permit(:number))
		#flash[:notice] = "#{@payement_method.number} was successfully updated."
		redirect_to payement_method_path
	end

  def destroy
    if current_user.roles_mask != 0
        redirect_to products_path
        return
    end
		id = params[:id]
    if id.nil? then
        redirect_to products_path
        return
    end
		@payement_method = PayementMethod.find(id)
		@payement_method.destroy
		#flash[:notice] = "#{@payement_method.number} has been deleted."
		redirect_to payement_methods_path
  end

end
