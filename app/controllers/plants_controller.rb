class PlantsController < ApplicationController

  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  before_action :new_plant, only: [:create]
  before_action :get_kinds, only: [:edit, :new]

  def index
    @plants = Plant.where(:user => current_user)
  end

  def show
  end

  def new
    @plant = Plant.new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @plant.save
        format.html { redirect_to @plant, notice: 'Plant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @plant }
      else
        format.html { render action: 'new' }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @plant.update(plant_params)
        format.html { redirect_to @plant, notice: 'Plant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @plant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @plant.destroy
    respond_to do |format|
      format.html { redirect_to plants_url }
      format.json { head :no_content }
    end
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def new_plant
    @plant = Plant.new(plant_params)
    @plant.user_id = current_user.id
  end

  def get_kinds
    @global_kinds = GlobalKind.all
  end

  def plant_params
    params.require(:plant).permit(:name, :description, :global_kind_id)
  end

end
