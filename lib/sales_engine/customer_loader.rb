require 'csv'
require './lib/sales_engine/customer.rb'

class CustomerLoader
  
	def self.from_csv(input = "./data/customers.csv") 
    customer_array = []
    output = CSV.open(input, headers: true, header_converters: :symbol)
		output.each do |row|
      
      customer_array << Customer.new(row)
		
    end
    Customer.add(customer_array)
	end



end
