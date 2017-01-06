class SearchController < ApplicationController
  def index
    @stores = Bestbuy.stores(ENV['api_key'], params[:zip])
  end
end
