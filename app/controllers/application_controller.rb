class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
    error = nil
    unless token
       error = "No token given"
    end
    if error
      render json: { error: error}, status: :unauthorized
    end
  end
end
