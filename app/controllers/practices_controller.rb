class PracticesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @practices = Practice.all
  end

  def show
    @practice = Practice.find(params[:id])
  end

  def new
    @practice = Practice.new
    @professionals = []
    @professional = Professional.new
  end

  def edit
    @practice = Practice.find(params[:id])
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
    @practice = Practice.find(params[:id])
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
    @practice = Practice.find(params[:id])
    @practice.destroy
    respond_to do |format|
      format.html { redirect_to practices_url, 
          notice: 'practice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def practice_params
      params.require(:practice).permit(:name, :address, :phone_number)
    end
end
