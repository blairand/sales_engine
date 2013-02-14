require './lib/sales_engine/merchant_loader'
require './lib/sales_engine/customer_loader'
require './lib/sales_engine/item_loader'
require './lib/sales_engine/invoice_item_loader'
require './lib/sales_engine/merchant_loader'
require './lib/sales_engine/transaction_loader'

class SalesEngine

  def self.startup
    CustomerLoader.from_csv
    MerchantLoader.from_csv
    ItemLoader.from_csv
    InvoiceItemLoader.from_csv
    MerchantLoader.from_csv
    TransactionLoader.from_csv
  end

end

SalesEngine.startup

puts Transaction.all
puts Transaction.all.first.credit_card_number

