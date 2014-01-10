module Api::TokensHelper

  require 'securerandom'

  def authorize_token
    @user = @token.user
    if !@user
      render :json => {:errors => 'unknown_user'}, :status => :unauthorized
    end
  end

  def read_token
    @token = Token.find_by_token(params['key'])
    if !@token
      render :json => {:errors => 'unknown_token'}, :status => :unauthorized
    end
  end

  def get_token_for_user(user)
    if !(token = Token.find_by_user_id(user.id))
      return create_token_for_user(user)
    else
      return token
    end
  end

  private

  def create_token_for_user(user)
    return Token.create(:token => SecureRandom.uuid(), :user => user)
  end

end