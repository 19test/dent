class ProfessionalsController < ApplicationController

  def index
    @professionals = Professional.all
  end

  def show
    @professional = Professional.find(params[:id])
  end

  def new
    @professional = Professional.new
  end

  def edit
    @professional = Professional.find(params[:id])
  end

  def create
    @professional = Professional.new(professional_params)
    respond_to do |format|
      if @professional.save

        params['professional']['practice_ids'].each do |id|
          practice = Practice.find(id)
          @professional.add_practice(practice)
          practice.add_professional(@professional)
        end
        # params['user_ids'].each do |id|
        #   @professional.add_user(id)
        # end 

        format.html { redirect_to :back, notice: 'professional was successfully created.' }
        format.json { render :show, status: :created, location: @professional }
      else
        format.html { render :new }
        format.json { render json: @professional.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @professional.update(professional_params)
        format.html { redirect_to @professional, notice: 'professional was successfully updated.' }
        format.json { render :show, status: :ok, location: @professional }
      else
        format.html { render :edit }
        format.json { render json: @professional.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @professional = Professional.find(params[:id])
    @professional.destroy
    respond_to do |format|
      format.html { redirect_to professionals_url, notice: 'professional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


private

  def professional_params
      params.require(:professional).permit(:name, :email, :phone_number, :bio)
  end


end