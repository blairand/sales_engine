require './lib/sales_engine/customer_loader'
require './lib/sales_engine/invoice_item_loader'
require './lib/sales_engine/merchant_loader'


class SalesEngine

  def self.startup
    CustomerLoader.from_csv
    InvoiceItemLoader.from_csv
    MerchantLoader.from_csv
  end

end

SalesEngine.startup
