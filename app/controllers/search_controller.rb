class SearchController < ApplicationController
  def index
    @stores = Bestbuy.stores_by_zip(params[:zip])
    flash[:notice] = "There are #{@stores.count} stores"
  end
end
