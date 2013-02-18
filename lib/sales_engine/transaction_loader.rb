require 'csv'
require './lib/sales_engine/transaction.rb'

class TransactionLoader
  
  def self.from_csv(input = "./data/transactions.csv") 
    transactions = []
    output = CSV.open(input, headers: true, header_converters: :symbol)
    output.each do |row|
      transactions << Transaction.new(row)
    end
     Transaction.add(transactions)
  end
end
