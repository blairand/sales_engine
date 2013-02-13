require 'csv'
require './lib/sales_engine/invoice_item.rb'

class InvoiceItemLoader
  
  def self.from_csv(input = "./data/invoice_items.csv") 
    output = CSV.open(input, headers: true, header_converters: :symbol)
    output.each do |row|
      InvoiceItem.add(InvoiceItem.new(row))
    end
  end

end
