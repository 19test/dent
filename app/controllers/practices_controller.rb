class PracticesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @practices = Practice.all
    respond_to do |format|
      format.html
      format.json { render json: @practices }
    end
  end

  def show
    @professionals = @practice.professionals
    @default_image = default_image
    respond_to do |format|
      format.html 
      format.json { render json: @practice }
    end
  end

  def new
    @practice = Practice.new
    @professionals = []
    @professional = Professional.new
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def edit
    @professionals = @practice.professionals
    @professional = Professional.new
  end

  def create
    @practice = Practice.new(practice_params)

    respond_to do |format|
      if @practice.save
        format.html { redirect_to @practice, notice: 'practice was successfully created.' }
        format.json { render :show, status: :created, location: @practice }
      else
        format.html { render :new }
        format.json { render json: @practice.errors, 
            status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @practice.update(practice_params)
        format.html { redirect_to @practice, notice: 'practice was successfully updated.' }
        format.json { render :show, status: :ok, location: @practice }
      else
        format.html { render :edit }
        format.json { render json: @practice.errors, 
              status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @practice.destroy
    respond_to do |format|
      format.html { redirect_to practices_url, 
          notice: 'practice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_post
      @practice = Practice.find(params[:id])
    end

    def practice_params
      params.require(:practice).permit(:name, :address, :city, :province, :postal_code, :phone_number, :bio)
    end
end
