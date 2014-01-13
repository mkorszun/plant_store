class Api::V1::PlantsController < Api::V1::BaseController

  include Api::PlantsHelper

  def index
    plants = Plant.where(:user => @user)
    render :json => plants.to_json(json_format_plant)
  end

  def show
    plant = Plant.where(:id => params[:id], :user => @user).first
    render :json => plant.to_json(json_format_plant)
  end

end
