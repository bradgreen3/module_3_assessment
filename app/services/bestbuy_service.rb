class BestbuyService
  
  def initialize(api_key)
    @api_key = api_key
  end

  def conn
    Faraday.new(:url => "https://api.bestbuy.com/v1") do |f|
      f.params[:api_key] = ENV['api_key']
      f.adapter            Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

end
