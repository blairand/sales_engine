require './test/sales_engine/test_helper'

require './lib/sales_engine/customer_loader'

class CustomerLoaderTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    customer_loader = CustomerLoader.new
    assert_kind_of CustomerLoader, customer_loader
  end
  
  def test_the_loader_imports_csv_records_correctly
    CustomerLoader.from_csv
    assert_equal 1000, Customer.all.count
  end

end
