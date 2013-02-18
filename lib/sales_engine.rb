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
a = Time.new
# # puts Item.find_by_id("1").merchant
# # puts Item.find_by_id("1").invoice_items
# #puts InvoiceItem.find_by_id("1").revenue
# # puts InvoiceItem.find_by_id("1").item
# # puts Invoice.find_by_id("13").pending?
puts Merchant.find_by_id("1").inspect
# #puts Merchant.most_revenue(5)
b = Time.new
puts b-a

a = Time.new
#puts Merchant.most_items
b = Time.new
puts b-a


