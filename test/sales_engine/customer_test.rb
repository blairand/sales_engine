require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine/customer'

class CustomerTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    customer = Customer.new
    assert_kind_of Customer, customer
  end

end
