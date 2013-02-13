require './lib/sales_engine/customer_loader'
require './lib/sales_engine/invoice_item_loader'

class SalesEngine

  def self.startup
    CustomerLoader.from_csv
    InvoiceItemLoader.from_csv
  end

end

SalesEngine.startup

puts InvoiceItem.all
puts InvoiceItem.all.first.id
