class SessionsController < ApplicationController
  def create
    user = User.for_credentials(params)
    if user.authenticated?
      head :ok
    else
      head :unauthorized
    end
  end

  def destroy
  end
end
