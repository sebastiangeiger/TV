class SearchesController < ApplicationController
  respond_to :json
  def create
    @tv_shows = TvShow.all
  end
end
