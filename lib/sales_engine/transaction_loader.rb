require 'csv'
require './lib/sales_engine/transaction.rb'

class TransactionLoader
  
  def self.from_csv(input = "./data/transactions.csv") 
    output = CSV.open(input, headers: true, header_converters: :symbol)
    output.each do |row|
      Transaction.add(Transaction.new(row))
    end
  end
end
