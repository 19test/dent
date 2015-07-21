class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  def authenticate_user!
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
end
