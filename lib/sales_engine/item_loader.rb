require 'csv'
require './lib/sales_engine/item.rb'

class ItemLoader
  
  def self.from_csv(input = "./data/items.csv") 
    output = CSV.open(input, headers: true, header_converters: :symbol)
    output.each do |row|
      Item.add(Item.new(row))
    end
  end
end
