class EchosController < ApplicationController
  before_filter :authenticate_user, only: :protected
  respond_to :json

  def index
    @text = params[:text]
  end

  def protected
    @text = params[:text]
  end
end
