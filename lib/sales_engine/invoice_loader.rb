require 'csv'
require './lib/sales_engine/invoice.rb'

class InvoiceLoader
  
  def self.from_csv(input = "./data/invoices.csv") 
    output = CSV.open(input, headers: true, header_converters: :symbol)
    output.each do |row|
      Invoice.add(Invoice.new(row))
    end
  end
end
