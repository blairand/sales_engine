require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/customer_loader'

class CustomerLoaderTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    customer_loader = CustomerLoader.new
    assert_kind_of CustomerLoader, customer_loader
  end

  def test_it_loads_the_customers	
  	output = CustomerLoader.from_csv("./data/customers.csv")
  	assert_equal 1000, output.count
  end
end
