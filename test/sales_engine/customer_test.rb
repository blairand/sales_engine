require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine/customer'

class CustomerTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    customer = Customer.new(:first_name=> "Aimee", :id => 1, :last_name=>"Maher")
    assert_kind_of Customer, customer
    assert_equal "Maher", customer.last_name
  end

  def test_it_adds_customers
    @customer = []
    @customer << Customer.add(Customer.new(
      :first_name => "Aimee",
      :id         => 1,
      :last_name  => "Maher"))

    @customer << Customer.add(Customer.new(
      :first_name => "blair",
      :id         => 2,
      :last_name  => "anderson"))
    assert_equal 2, @customer.count
  end


end
