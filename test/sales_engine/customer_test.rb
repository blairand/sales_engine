require './test/sales_engine/test_helper'

require './lib/sales_engine/customer'

require './lib/sales_engine/customer_loader'

class CustomerTest < MiniTest::Unit::TestCase
  def setup
    CustomerLoader.from_csv("./test/data/short_customers.csv")
  end

  def teardown
    a = Array.new
    Customer.add(a)
  end
  
  def test_it_exists
    customer = Customer.new(
      :first_name=> "Aimee", 
      :id => 1, 
      :last_name=>"Maher", 
      :created_at=>"2012-03-27 14:54:09 UTC", 
      :updated_at=>"2012-03-27 14:54:09 UTC")
    
    assert_kind_of Customer, customer
    assert_equal "Maher", customer.last_name
  end

  def test_it_adds_customers
    @customer = []
    @customer << Customer.add(Customer.new(
      :first_name => "Aimee",
      :id         => 1,
      :last_name  => "Maher",
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"))

    @customer << Customer.add(Customer.new(
      :first_name => "blair",
      :id         => 2,
      :last_name  => "anderson",
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"))
    assert_equal 2, @customer.count
  end

  def test_it_finds_by_id
    a = Customer.find_by_id("1")
    assert_equal "1", a.id
  end

  def test_it_finds_by_created_at
    a = Customer.find_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", a.created_at
  end

  def test_it_finds_by_updated_at
    a = Customer.find_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", a.updated_at
  end

  def test_it_finds_by_first_name
    a = Customer.find_by_first_name("Dejon")
    assert_equal "Dejon", a.first_name
  end

  def test_it_finds_by_last_name
    b = Customer.find_by_last_name("Nader")
    assert_equal "Nader", b.last_name
  end

    def test_it_find_all_by_first_name
    c = Customer.find_all_by_first_name("Loyal")
    assert_equal 2, c.count
  end

  def test_it_find_all_by_last_name
    d = Customer.find_all_by_last_name("Considine")
    assert_equal 2, d.count
  end

end
