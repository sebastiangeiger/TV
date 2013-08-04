class SessionsController < ApplicationController
  respond_to :json
  def create
    user = User.for_credentials(params)
    unless user.authenticated?
      render json: { error: user.error }, status: :unauthorized
    end
  end

  def destroy
  end
end
