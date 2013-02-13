require 'csv'

class CustomerLoader

	def self.from_csv(input = "./data/customers.csv") 
		output = CSV.open(input, headers: true, header_converters: :symbol)
		# output.each do |row|
		# 	Customer.new(row)
		# end
	end

end
