class Api::V1::PlantsController < Api::V1::BaseController

  def index
    plants = Plant.where(:user => @user)
    render :json => plants.to_json(json_format)
  end

  def show
    plant = Plant.where(:id => params[:id], :user => @user).first
    render :json => plant.to_json(json_format)
  end

end
