class BestbuyService

  def conn
    Faraday.new(:url => "https://api.bestbuy.com") do |f|
      f.adapter            Faraday.default_adapter
    end
  end

  def stores_by_zip(zip)
    response = conn.get do |req|
      req.url "/v1/stores(area(#{zip},25))"
      req.params[:format] = 'json'
      req.params[:apiKey] = ENV['api_key']
    end
    raw = JSON.parse(response.body, symbolize_names: true)
    raw[:stores]
    require "pry"; binding.pry
  end
end
