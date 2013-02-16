require './lib/sales_engine/merchant_loader'
require './lib/sales_engine/customer_loader'
require './lib/sales_engine/item_loader'
require './lib/sales_engine/invoice_item_loader'
require './lib/sales_engine/merchant_loader'
require './lib/sales_engine/transaction_loader'
require './lib/sales_engine/invoice_loader'

class SalesEngine

  def self.startup
    CustomerLoader.from_csv
    MerchantLoader.from_csv
    ItemLoader.from_csv
    InvoiceItemLoader.from_csv
    TransactionLoader.from_csv
    InvoiceLoader.from_csv
  end

end

SalesEngine.startup

puts Item.find_all_by_merchant_id("7")
puts Invoice.find_all_by_merchant_id("7")
