class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session
  before_filter :set_global_search_variable
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:student_id, :email, :password, :password_confirmation) }
  end

  def set_global_search_variable
    @users = Graduation.search(params[:q])
  end

  def after_sign_in_path_for(resource)
    if current_user.is_graduate
      #graduate path
      user_profiles_path
    else
      #admin path
      members_path
    end
  end
end
