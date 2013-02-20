require 'csv'

module SalesEngine
  class MerchantLoader
    def self.from_csv(input = "./data/merchants.csv")
      merchants = []
      output = CSV.open(input, headers: true, header_converters: :symbol)
      output.each do |row|
        merchants << Merchant.new(row)
      end
      Merchant.add(merchants)
    end
  end
end
