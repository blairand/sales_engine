require 'sales_engine/invoice_item.rb'
require 'csv'

module SalesEngine
  class InvoiceItemLoader
    
    def self.from_csv(input = "./data/invoice_items.csv") 
      invoice_items = []
      output = CSV.open(input, headers: true, header_converters: :symbol)
      output.each do |row|
        invoice_items << InvoiceItem.new(row)
      end
      InvoiceItem.add(invoice_items)
    end
  end
end
