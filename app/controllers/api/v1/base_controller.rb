class Api::V1::BaseController < ActionController::Base

  protect_from_forgery with: :exception

  include Api::PlantsHelper
  include Api::TokensHelper

  before_action :get_token, :auth_token, only: [:index, :show]

end