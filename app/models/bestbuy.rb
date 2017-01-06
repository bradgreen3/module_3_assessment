class Bestbuy
  attr_reader :long_name, :city, :distance, :phone, :store_type

  def initialize(raw_store)
    @long_name = raw_store[:longName]
    @city = raw_store[:city]
    @distance = raw_store[:distance]
    @phone = raw_store[:phone]
    @store_type = raw_store[:storeType]
  end

  def self.stores_by_zip(zip)
    stores = BestbuyService.new.stores_by_zip(zip)
    stores.map do |store|
      Bestbuy.new(store)
    end
  end
end
