class SessionsController < ApplicationController
  respond_to :json
  def create
    user = User.for_credentials(params)
    if user.authenticated?
      @session = Session.create(user: user)
    else
      render json: { error: user.error }, status: :unauthorized
    end
  end

  def destroy
  end
end
