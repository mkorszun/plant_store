class Api::V1::TokensController < ApplicationController

  protect_from_forgery

  def create
    if auth()
      render :json => { :token => 'sadasdasdsada' }
    else
      render :json => { :errors => 'unauthorized' }, :status => :unauthorized
    end
  end

  def destroy

  end

  def failure

  end

  private

  def auth
    user = User.find_by_email(params[:email])
    user.valid_password?(params[:password])
  end

end