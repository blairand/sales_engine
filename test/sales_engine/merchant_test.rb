require './test/sales_engine/test_helper'

class MerchantTest < MiniTest::Unit::TestCase
  def setup
    # CustomerLoader.from_csv("./test/data/short_customers.csv")
    # InvoiceLoader.from_csv("./test/data/short_invoices.csv")
    # InvoiceItemLoader.from_csv("./test/data/short_invoice_items.csv")
    # ItemLoader.from_csv("./test/data/short_items.csv")
    # TransactionLoader.from_csv("./test/data/short_transactions.csv")
    # MerchantLoader.from_csv("./test/data/short_merchants.csv")
    CustomerLoader.from_csv
    InvoiceLoader.from_csv
    InvoiceItemLoader.from_csv
    ItemLoader.from_csv
    TransactionLoader.from_csv
    MerchantLoader.from_csv
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
    merchant = Merchant.new(
      :name=> "ABC", 
      :id => 1,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"
      )
    assert_kind_of Merchant, merchant
    assert_equal "ABC", merchant.name
  end

  def test_it_adds_merchants
    @merchant = []
    @merchant << Merchant.add(Merchant.new(
      :name => "ABC",
      :id         => 1,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"))

    @merchant << Merchant.add(Merchant.new(
      :name => "Blair",
      :id         => 2,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"))
    assert_equal 2, @merchant.count
  end

  def test_it_returns_random_merchant
    a = Merchant.random
    b = Merchant.random
    refute_equal a.id, b.id
  end


  def test_it_finds_by_name
    a = Merchant.find_by_name("Schroeder-Jerde")
    assert_equal "Schroeder-Jerde", a.name
  end

  def test_it_find_all_by_name
    c = Merchant.find_all_by_name("Williamson Group")
    assert_equal 2, c.count
  end

  def test_it_finds_by_id
    a = Merchant.find_by_id("1")
    assert_equal "1", a.id
  end

  def test_it_finds_by_created_at
    a = Merchant.find_by_created_at(Date.parse("2012-03-27 14:53:59 UTC"))
    assert_equal Date.parse("2012-03-27 14:53:59 UTC"), a.created_at
  end

  def test_it_finds_all_by_created_at
    a = Merchant.find_all_by_created_at(Date.parse("2012-03-27 14:53:59 UTC"))
    assert_equal 100, a.count
  end

  def test_it_finds_by_updated_at
    a = Merchant.find_by_updated_at(Date.parse("2012-03-27 14:53:59 UTC"))
    assert_equal Date.parse("2012-03-27 14:53:59 UTC"), a.updated_at
  end

  def test_it_finds_all_by_updated_at
    a = Merchant.find_all_by_updated_at(Date.parse("2012-03-27 14:53:59 UTC"))
    assert_equal 100, a.count
  end

  def test_it_returns_a_collection_of_item_instances
    a = Merchant.find_by_id("1")
    assert_equal 15, a.items.count 
  end

  def test_it_returns_a_collection_of_invoice_instances
    a = Merchant.find_by_id("1")
    assert_equal 59, a.invoices.count 
  end

  def test_it_returns_successful_invoices
    a = Merchant.find_by_id("1")
    assert_equal 56, a.single_merchant_invoices.count
  end

  def test_it_returns_quantity_sold
    a = Merchant.find_by_id("1")
    assert_equal 1380, a.quantity_sold
  end

  def test_it_returns_merchant_quantity
    a = Merchant.merchant_quantity
    assert_equal 100, a.count
  end

  def test_it_returns_most_items
    a = Merchant.most_items
    assert_equal 1, a.count
  end

  def test_it_returns_revenue
    a = Merchant.find_by_id("1")
     assert_equal 528774, a.revenue.to_i
  end

  def test_it_returns_date_specific_single_merchant_invoices
    a = Merchant.find_by_id("1")
    assert_equal 1, a.date_specific_single_merchant_invoices(Date.parse("2012-03-27 14:53:59 UTC")).count
  end

  def test_it_returns_merchant_revenue
    a = Merchant.merchant_revenue
    assert_equal 100, a.count
  end

  def self.most_revenue
    a = Merchant.most_revenue
    assert_equal 8, a.count
  end

  def test_it_returns_revenue_date
    a = Merchant.revenue(Date.parse("2012-03-27 14:53:59 UTC"))
    assert_equal 8, a.count
  end

  def test_it_returns_customers_with_pending_invoices
    a = Merchant.find_by_id("1")
    assert_equal 11, a.customers_with_pending_invoices.count
  end

  def test_it_finds_favorite_customer
    a = Merchant.find_by_id("1")
    assert_equal "941", a.favorite_customer.id
  end

  def test_it_returns_customers_and_invoices
    a = Merchant.find_by_id("1")
    assert_equal 56, a.customers_and_invoices.count
  end

  def test_it_finds_sorted_customers_collection
    a = Merchant.find_by_id("1")
    assert_equal "941", a.sorted_customers
  end

end
