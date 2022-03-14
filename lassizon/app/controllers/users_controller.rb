class UsersController < ApplicationController

    def index
        if current_user && current_user.roles_mask == 2
            @users = User.where.not(id: current_user.id)
        else
            current_user
        end
    end

    def show
        id = params[:id]
        if id.nil? then
            redirect_to products_path
            return
        end
		@user = User.find(id)
    end

    def edit

    end

    def new

    end

    def update
        @user = current_user
        authorize! :update, @user, :message => "You fool! You cannot update user"
        @user.update_attributes!(params[:user].permit(:name, :surname, :data, :position))
        #flash[:notice] = "#{@user.name} was successfully updated."
        redirect_to user_path(@user)
    end

    def destroy
        id = params[:id]
        if id.nil? then
            redirect_to products_path
            return
        end
        @user = User.find(id)
        #authorize! :destroy, @user, :message => "You fool! You cannot destroy user"
        @user.destroy
        #flash[:notice] = "#{@user.name} has been deleted."
        if current_user && current_user.roles_mask == 2
            redirect_to user_path(current_user)
            return
        end
        redirect_to products_path
        return
    end

   def create
        @user = User.user!(params[:user].permit(:name, :surname, :data, :position))
        authorize! :create, @user, :message => "You fool! You cannot create user!"
        #flash[:notice] = "#{@user.name} was successfully created."
        redirect_to user_path(@user)
    end
end
