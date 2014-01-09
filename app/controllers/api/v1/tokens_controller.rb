class Api::V1::TokensController < ApplicationController

  protect_from_forgery
  require 'securerandom'

  def create
    user = User.find_by_email(params[:email])
    if user.valid_password?(params[:password])
      token_str = get_token(user).token
      render :json => {:token => token_str}
    else
      render :json => {:errors => 'unauthorized'}, :status => :unauthorized
    end
  end

  def destroy

  end

  def failure

  end

  private

  def get_token(user)
    Token.delete_all(user_id: user.id)
    token_str = SecureRandom.uuid()
    token = Token.new(:token => token_str, :user => user, :validity => Time.now + 12.hours)
    token.save
    return token
  end

end