module Refinery
  class SearchController < ::ApplicationController
  	layout "search_layout"
    # Display search results given the query supplied
    before_filter :set_blog_instance_variable 
    
    def show
      @results = Refinery::SearchEngine.search(params[:query], params[:page])
      present(@page = Refinery::Page.find_by_link_url("/search"))
    end

  end
end