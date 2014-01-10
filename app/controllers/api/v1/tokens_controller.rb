class Api::V1::TokensController < ActionController::Base

  include Api::TokensHelper
  protect_from_forgery

  def create
    user = User.find_by_email(params[:email])
    if user.valid_password?(params[:password])
      token_str = get_token_for_user(user).token
      render :json => {:token => token_str}
    else
      render :json => {:errors => 'unauthorized'}, :status => :unauthorized
    end
  end

end