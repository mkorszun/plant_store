class Api::V1::TokensController < ActionController::Base

  include Api::TokensHelper
  protect_from_forgery
  before_action :read_user

  def create
    if @user.valid_password?(params[:password])
      token_str = get_token_for_user(@user).token
      render :json => {:token => token_str}
    else
      render :json => {:errors => 'unauthorized'}, :status => :unauthorized
    end
  end

  private

  def read_user
    @user = User.find_by_email(params[:email])
    if !@user
      render :json => {:errors => 'unknown_user'}, :status => :unauthorized
    end
  end

end