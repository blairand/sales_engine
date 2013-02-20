require 'csv'

module SalesEngine
  class ItemLoader
    def self.from_csv(input = "./data/items.csv")
      items = []
      output = CSV.open(input, headers: true, header_converters: :symbol)
      output.each do |row|
        items << Item.new(row)
      end
      Item.add(items)
    end
  end
end
