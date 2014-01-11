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
    if @plant.save
      redirect_to @plant, notice: 'Plant was successfully created.'
    else
      format.html { render action: 'new' }
    end
  end

  def update
    if @plant.update(plant_params)
      format.html { redirect_to @plant, notice: 'Plant was successfully updated.' }
    else
      format.html { render action: 'edit' }
    end
  end

  def destroy
    @plant.destroy
    redirect_to plants_url
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
