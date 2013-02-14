require './test/sales_engine/test_helper'

require './lib/sales_engine/transaction_loader'

class TransactionLoaderTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    transaction_loader = TransactionLoader.new
    assert_kind_of TransactionLoader, transaction_loader
  end

  def test_it_loads_the_csv
    output = CSV.open("./data/transactions.csv", headers: true, header_converters: :symbol)
    assert_equal 5595, output.count
  end

end
