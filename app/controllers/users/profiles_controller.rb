class Users::ProfilesController < ApplicationController

  before_filter :authenticate_user!, except: [:show]

  def show
    @default_image = "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcS1Vam2cBYE0BiCYXcAjB_xM92rIMQQ7YZ9rY9levRJ01eerIUYnPtwoQBl"
    @user = User.find(params[:id])
    @professionals = ProfessionalsUsers.where("user_id =  ?", 1)
  end

  def edit
    @user = User.find(params[:id])
  end
end