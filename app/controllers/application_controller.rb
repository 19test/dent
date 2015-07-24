class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?


  def authenticate_user!(force: true)
    unless user_signed_in?
      redirect_to root_url, 
        :notice => {error: "You must be signed in to view that page"}.to_json
    end
  end

  def authenticate_self!
    unless current_user.id == params["id"]
      redirect_to root_url, 
        :notice => {error: "You cannot edit someone else's profile"}
    end
  end

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :user_name << :bio << :phone << :profile_pic
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
