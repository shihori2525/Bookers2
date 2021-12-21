class ApplicationController < ActionController::Base
  before_action:configure_permitted_params,if: :devise_controller?

  def after_sign_in_path_for(resource)
   user_path(current_user.id)
  end

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
  end

end
