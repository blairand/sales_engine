require './lib/sales_engine/customer_loader'

class SalesEngine

  def self.startup
    CustomerLoader.from_csv
  end

end

SalesEngine.startup

