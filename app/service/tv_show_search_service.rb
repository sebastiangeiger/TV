class TvShowSearchService
  def initialize(query)
    @query = query
  end
  def results
    tv_show = TvShow.arel_table
    TvShow.where(tv_show[:name].matches("%#{@query[:name]}%"))
  end
end
