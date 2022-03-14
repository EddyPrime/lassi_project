class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def catch_404
    raise ActionController::RoutingError.new(params[:path])
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :data, :roles_mask, :email, :password)}
  end

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_path#, :alert => exception.message
  end

  rescue_from ActionController::RoutingError do |exception|
    render plain: '404 Page Not found', status: 404
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render plain: '404 Record Not found', status: 404
  end
end
