class Users::ProfilesController < ApplicationController

  before_filter :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
end