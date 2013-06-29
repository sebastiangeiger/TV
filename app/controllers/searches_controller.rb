class SearchesController < ApplicationController
  respond_to :json
  def create
    @tv_shows = TvShowSearchService.new(name: params[:query]).results
  end
end
