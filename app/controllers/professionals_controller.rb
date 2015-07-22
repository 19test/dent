class ProfessionalsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

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
        if params["professional"]["practice_ids"]
          params['professional']['practice_ids'].each do |id|
            practice = Practice.find(id)
            practice.add_professional(@professional)
          end
        end

        user = User.where("email =? ", params['email']).first
        if user
          @professional.add_user(user)
        end

        format.html { redirect_to :back, notice: 'professional was successfully created.' }
        format.json { render :show, status: :created, location: @professional }
      else
        format.html { render :new }
        format.json { render json: @professional.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @professional = Professional.find(params[:id])
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