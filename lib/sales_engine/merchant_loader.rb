require 'csv'
require './lib/sales_engine/merchant.rb'

class MerchantLoader
  
  def self.from_csv(input = "./data/merchants.csv") 
    output = CSV.open(input, headers: true, header_converters: :symbol)
    output.each do |row|
      Merchant.add(Merchant.new(row))
    end
  end
end
