require 'csv'

module SalesEngine
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
end
