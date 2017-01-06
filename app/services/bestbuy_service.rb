class BestbuyService

# https://api.bestbuy.com/v1/stores(area(80202, 25))?format=json&apiKey=6tmxnbn286qhnt4act7h3tt8

  def initialize(api_key)
    @api_key = api_key
  end

  def conn
    Faraday.new(:url => "https://api.bestbuy.com/v1") do |f|
      f.params[:api_key] = ENV['api_key']
      f.adapter            Faraday.default_adapter
    end
  end

  def stores_by_zip(zip)
    response = conn.get "/stores/(area(#{zip}), 25)", {limit: 10, radius: 6}
    raw = JSON.parse(response.body, symbolize_names: true)
    raw[:????]
  end

end
