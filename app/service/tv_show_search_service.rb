class TvShowSearchService
  def initialize(query)
    @query = query
  end
  def results
    tv_show = TvShow.arel_table
    if @query[:name].blank?
      []
    else
      TvShow.where(tv_show[:name].matches("%#{@query[:name]}%"))
    end
  end
end
