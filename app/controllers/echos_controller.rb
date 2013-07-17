class EchosController < ApplicationController
  respond_to :json
  def index
    @text = params[:text]
  end
end
