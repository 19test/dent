class Users::ProfilesController < ApplicationController

  before_filter :authenticate_user!, except: [:show]

  def show
    @default_image = default_image
    @user = User.find(params[:id])
    @professionals = ProfessionalsUsers.where("user_id =  ?", 1)
  end

  def edit
    @user = User.find(params[:id])
  end
end