class Api::V1::PlantsController < Api::V1::BaseController

  skip_before_filter :verify_authenticity_token

  include Api::PlantsHelper

  def index
    plants = Plant.where(:user => @user)
    render :json => plants.to_json(json_format_plant)
  end

  def show
    plant = Plant.where(:id => params[:id], :user => @user).first
    render :json => plant.to_json(json_format_plant)
  end

  def create
    Plant.create!(
        :user => @user,
        :name => params['name'],
        :description => params['description'],
        :global_kind_id => params['global_kind_id']
    )
    render :nothing => true, :status => :created
  end

end
