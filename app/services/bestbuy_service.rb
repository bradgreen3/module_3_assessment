class BestbuyService

# https://api.bestbuy.com/v1/stores(area(80202, 25))?format=json&apiKey=6tmxnbn286qhnt4act7h3tt8

  def conn
    Faraday.new(:url => "https://api.bestbuy.com/v1") do |f|
      f.adapter            Faraday.default_adapter
    end
  end

  def stores_by_zip(zip)
    response = conn.get do |req|
      req.url "/stores(area(#{zip}, 25))"
      req.params[:format] = 'json'
      req.params[:apiKey] = ENV['api_key']
    end
    raw = JSON.parse(response.body, symbolize_names: true)
    raw[:stores]
  end
end
