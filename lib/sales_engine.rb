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

# puts Customer.all.first.inspect+"\n"
# puts Merchant.all.first.inspect+"\n"
# puts Item.all.first.inspect+"\n"
# puts InvoiceItem.all.first.inspect+"\n"
# puts Transaction.all.first.inspect+"\n"
# puts Invoice.all.first.inspect+"\n"

# # puts Customer.find_all_by_last_name("Cornelia")
#  Merchant.random
