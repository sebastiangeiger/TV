class SessionsController < ApplicationController
  def create
    user = User.for_email(params[:email])
    if user.authenticate(params[:password])
      head :ok
    else
      head :unauthorized
    end
  end

  def destroy
  end
end
