require 'csv'
require './lib/sales_engine/invoice.rb'

class InvoiceLoader
  
  def self.from_csv(input = "./data/invoices.csv") 
    invoices = []
    output = CSV.open(input, headers: true, header_converters: :symbol)
    output.each do |row|
      invoices << Invoice.new(row)
    end
    Invoice.add(invoices)
  end
end
