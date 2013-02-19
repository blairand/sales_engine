require './test/sales_engine/test_helper'

class CustomerTest < MiniTest::Unit::TestCase
  def setup
    CustomerLoader.from_csv("./test/data/short_customers.csv")
    InvoiceLoader.from_csv("./test/data/short_invoices.csv")
    InvoiceItemLoader.from_csv("./test/data/short_invoice_items.csv")
    ItemLoader.from_csv("./test/data/short_items.csv")
    TransactionLoader.from_csv("./test/data/short_transactions.csv")
    MerchantLoader.from_csv("./test/data/short_merchants.csv")
  end

  def teardown
    Customer.add([])
    Invoice.add([])
    Transaction.add([])
    Merchant.add([])
    InvoiceItem.add([])
    Item.add([])
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
    a = Customer.find_by_created_at(Date.parse("2012-03-27 14:54:09 UTC"))
    assert_equal Date.parse("2012-03-27 14:54:09 UTC"), a.created_at
  end

  def test_it_finds_all_by_created_at
    a = Customer.find_all_by_created_at(Date.parse("2012-03-27 14:54:10 UTC"))
    assert_equal 10, a.count
  end

  def test_it_finds_by_updated_at
    a = Customer.find_by_updated_at(Date.parse("2012-03-27 14:54:09 UTC"))
    assert_equal Date.parse("2012-03-27 14:54:09 UTC"), a.updated_at
  end

  def test_it_finds_all_by_updated_at
    a = Customer.find_all_by_updated_at(Date.parse("2012-03-27 14:54:11 UTC"))
    assert_equal 10, a.count
  end

  def test_it_finds_by_first_name
    a = Customer.find_by_first_name("Dejon")
    assert_equal "Dejon", a.first_name
  end

  def test_it_find_all_by_first_name
    c = Customer.find_all_by_first_name("Loyal")
    assert_equal 2, c.count
  end

  def test_it_finds_by_last_name
    b = Customer.find_by_last_name("Nader")
    assert_equal "Nader", b.last_name
  end

  def test_it_find_all_by_last_name
    d = Customer.find_all_by_last_name("Considine")
    assert_equal 2, d.count
  end

  def test_it_returns_a_random
    a = Customer.random
    b = Customer.random
    refute_equal a.id,b.id
  end
  
  # def test_it_finds_the_favorite_merchant
  #   a = Customer.find_by_id("1").invoices
  #   assert_equal 8, a.count
  #   b = Customer.find_by_id("1").favorite_merchant
  #   assert_equal "Blair", b.name
  # end

  def test_it_returns_invoices_for_a_customer_instance
    a = Customer.find_by_id("1")
    b = a.invoices
    assert_equal 8, b.count
    assert_equal "1", b.first.id
    assert_equal "1", a.id
  end

  # def test_it_creates_hash_of_merchants_and_customer
  #   a = Customer.find_by_id("1").merchants_per_customer
  #   puts 
  # end 

  # def test_it_sorts_the_hash_by_purchases

  #   a = Customer.find_by_id("1").sorted_merchants_per_customer
  #   puts a
  # end



  # def test_it_collects_transactions_for_each_invoice
  #   a = Customer.find_by_id("1").transactions
  #   puts a
  # end

end
