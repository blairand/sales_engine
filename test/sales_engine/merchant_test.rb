require './test/sales_engine/test_helper'

class MerchantTest < MiniTest::Unit::TestCase

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

  def test_it_returns_a_random_instance
    MerchantLoader.from_csv
    a = Merchant.random
    b = Merchant.random
    refute_equal a.id, b.id
  end

  def test_it_returns_a_collection_of_item_instances
    MerchantLoader.from_csv
    ItemLoader.from_csv
    a = Merchant.find_by_id("1")
    assert_equal 15, a.items.count 
  end

  def test_it_returns_a_collection_of_invoice_instances
    MerchantLoader.from_csv
    InvoiceLoader.from_csv
    a = Merchant.find_by_id("1")
    assert_equal 59, a.invoices.count 
  end

  def test_it_returns_single_merchant_invoices
    MerchantLoader.from_csv
    InvoiceLoader.from_csv
    TransactionLoader.from_csv
    a = Merchant.find_by_id("1")
    assert_equal 56, a.single_merchant_invoices.count
  end

  def test_it_returns_quantity_sold
    MerchantLoader.from_csv
    InvoiceLoader.from_csv
    InvoiceItemLoader.from_csv
    TransactionLoader.from_csv
    a = Merchant.find_by_id("1")
    assert_equal 1380, a.quantity_sold
  end

  def test_it_returns_merchant_quantity
    MerchantLoader.from_csv
    InvoiceLoader.from_csv
    InvoiceItemLoader.from_csv
    TransactionLoader.from_csv
    a = Merchant.merchant_quantity
    assert_equal 100, a.count
  end

  def test_it_returns_most_items
    MerchantLoader.from_csv
    InvoiceLoader.from_csv
    InvoiceItemLoader.from_csv
    TransactionLoader.from_csv
    a = Merchant.most_items
    assert_equal 1, a.count
  end

  def test_it_returns_date_specific_single_merchant_invoices
    a = Merchant.find_by_id("1")
    assert_equal 2, a.date_specific_single_merchant_invoices(Date.parse("2012-03-27 14:53:59 UTC")).count
  end

  def test_it_returns_instance_revenue
    MerchantLoader.from_csv
    ItemLoader.from_csv
    CustomerLoader.from_csv
    InvoiceLoader.from_csv
    InvoiceItemLoader.from_csv
    TransactionLoader.from_csv
    merchant = Merchant.find_by_name "Dicki-Bednar"
    assert_equal BigDecimal.new("1148393.74"), merchant.revenue
  end

  def test_it_returns_instance_revenue_with_given_date
    MerchantLoader.from_csv
    ItemLoader.from_csv
    CustomerLoader.from_csv
    InvoiceLoader.from_csv
    InvoiceItemLoader.from_csv
    TransactionLoader.from_csv
    merchant = Merchant.find_by_name "Willms and Sons"
    date = Date.parse "Fri, 09 Mar 2012"
    assert_equal BigDecimal.new("8373.29"), merchant.revenue(date)
  end


  def test_it_returns_total_revenue_from_all_merchants_for_a_given_date
    MerchantLoader.from_csv
    ItemLoader.from_csv
    CustomerLoader.from_csv
    InvoiceLoader.from_csv
    InvoiceItemLoader.from_csv
    TransactionLoader.from_csv
    date = Date.parse "Tue, 20 Mar 2012"
    revenue = Merchant.revenue(date)
    assert_equal revenue, BigDecimal.new("2549722.91")
  end


  def test_it_returns_x_merchants_with_the_most_revenue
    merchant = Merchant.most_revenue(3)
    assert_equal "Dicki-Bednar", merchant.first.name
    assert_equal "Okuneva, Prohaska and Rolfson", merchant.last.name
  end

  def test_it_returns_x_items_with_highest_revenue
    moist = Merchant.most_items(5)
    assert_equal "Kassulke, O'Hara and Quitzon", moist.first.name 
    assert_equal "Daugherty Group", moist.last.name
    assert_equal 5, moist.count
  end

  def test_it_returns_customers_with_pending_invoices
    merchant = Merchant.find_by_name "Parisian Group"
    customers = merchant.customers_with_pending_invoices
    assert_equal 9, customers.count
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
    a = Merchant.find_by_id("1").sorted_customers
    assert_equal "941", a
  end

end
