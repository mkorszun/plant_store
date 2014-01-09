class Api::V1::PlantsController < ApplicationController

  include Api::PlantsHelper

  before_action :get_auth_token, :get_token, :auth_token, :validate_token, only: [:index, :show]
  after_action :update_token_validity, only: [:index, :show]

  def index
    plants = Plant.where(:user => @user)
    render :json => plants.to_json(json_format)
  end

  def show
    plant = Plant.where(:id => params[:id], :user => @user).first
    render :json => plant.to_json(json_format)
  end

  private

  def update_token_validity
    @token.validity = Time.now + 12.hours
    @token.save
  end

  def validate_token
    if @token.validity < Time.now
      render :json => {:errors => 'expired_token'}, :status => :unauthorized
    end
  end

  def auth_token
    @user = @token.user
    if !@user
      render :json => {:errors => 'unknown_user'}, :status => :unauthorized
    end
  end


  def get_token
    @token = Token.find_by_token(@auth_token)
    if !@token
      render :json => {:errors => 'unknown_token'}, :status => :unauthorized
    end
  end

  def get_auth_token
    @auth_token = request.headers['Plant-Store-Token']
    if !@auth_token
      render :json => {:errors => 'missing_token'}, :status => :unauthorized
    end
  end

end
