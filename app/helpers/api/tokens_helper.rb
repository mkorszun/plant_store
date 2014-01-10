module Api::TokensHelper

  def auth_token
    @user = @token.user
    if !@user
      render :json => {:errors => 'unknown_user'}, :status => :unauthorized
    end
  end

  def get_token
    @token = Token.find_by_token(params['key'])
    if !@token
      render :json => {:errors => 'unknown_token'}, :status => :unauthorized
    end
  end

end