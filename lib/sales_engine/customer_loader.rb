require 'sales_engine/customer'

module SalesEngine
  class CustomerLoader
    
  	def self.from_csv(input = "./data/customers.csv") 
      customers = []
      output = CSV.open(input, headers: true, header_converters: :symbol)
  		output.each do |row|
        customers << Customer.new(row)
      end
      Customer.add(customers)
  	end
  end
end
