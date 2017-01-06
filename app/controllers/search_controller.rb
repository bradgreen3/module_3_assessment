class SearchController < ApplicationController
  def index
    @stores = Bestbuy.stores_by_zip(params[:zip])
  end
end
