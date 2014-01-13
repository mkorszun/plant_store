class Api::V1::BaseController < ActionController::Base

  protect_from_forgery with: :exception

  include Api::TokensHelper
  before_action :read_token, :authorize_token, only: [:index, :show]

end