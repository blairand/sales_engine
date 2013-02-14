require './test/sales_engine/test_helper'
require './lib/sales_engine/transaction_loader'

class TransactionLoaderTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    transaction_loader = TransactionLoader.new
    assert_kind_of TransactionLoader, transaction_loader
  end

  def test_the_loader_imports_csv_records_correctly
    TransactionLoader.from_csv
    assert_equal 5595, Transaction.all.count
  end

end
