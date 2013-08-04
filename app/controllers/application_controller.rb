class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
    unless token
      render json: { error: "No token given"}, status: :unauthorized
    end
  end
end
