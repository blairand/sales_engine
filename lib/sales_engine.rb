require './lib/sales_engine/merchant_loader'
require './lib/sales_engine/customer_loader'
require './lib/sales_engine/item_loader'

class SalesEngine

  def self.startup
    CustomerLoader.from_csv
    MerchantLoader.from_csv
    ItemLoader.from_csv
  end

end

SalesEngine.startup

puts Item.all
puts Item.all.first.name
