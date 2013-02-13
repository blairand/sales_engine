require './lib/sales_engine/merchant_loader'

class Merchant  
  attr_reader :id, :name

  def initialize(input)
    @id = input[:id]
    @name = input[:name]
  end

  def self.add(merchant)
    @merchants ||= []
    @merchants << merchant
  end

  def self.all
    @merchants
  end
end
