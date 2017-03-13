class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :nickname, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :nickname, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:slug, :date_of_birth, :home_page, :user_description, :first_name, :last_name, :nickname, :current_password, :password, :password_confirmation) }
  end


  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end

  def with_timezone
    timezone = Time.find_zone(cookies[:timezone])
    Time.use_zone(timezone) { yield }
  end

  def user_not_authorized
    flash[:error] = "well that was naughty, dont worry we wont tell anyone"
    redirect_to request.headers["Referer"] || overviews_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

end
