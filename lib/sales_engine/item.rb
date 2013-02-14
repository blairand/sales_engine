require './lib/sales_engine/item_loader'

class Item  
  attr_reader :id, :name, :description, :unit_price, :merchant_id

  def initialize(input)
    @id = input[:id]
    @name = input[:name]
    @description = input[:description]
    @unit_price = input[:unit_price]
    @merchant_id = input[:merchant_id]
  end

  def self.add(item)
    @items ||= []
    @items << item
  end

  def self.all
    @items
  end
end

