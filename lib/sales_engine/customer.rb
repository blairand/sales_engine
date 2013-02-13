require './lib/sales_engine/customer_loader'

class Customer  
  attr_reader :id, :first_name, :last_name

  def initialize(input)
    @id = input[:id]
    @first_name = input[:first_name]
    @last_name = input[:last_name]
  end

  def self.add(customer)
    @customers ||= []
    @customers << customer
  end

  def self.all
    @customers
  end

  
end

