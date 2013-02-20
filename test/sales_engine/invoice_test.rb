require './test/sales_engine/test_helper'

class InvoiceTest < MiniTest::Unit::TestCase

  def test_it_finds_by_id
    a = Invoice.find_by_id("1")
    assert_equal "1", a.id
  end

  def test_it_finds_by_customer_id
    a = Invoice.find_by_customer_id("1")
    assert_equal "1", a.customer_id
  end

  def test_it_finds_all_by_customer_id
    a = Invoice.find_all_by_customer_id("1")
    assert_equal "1", a.first.customer_id
  end

  def test_it_find_by_merchant_id
    c = Invoice.find_by_merchant_id("26")
    assert_equal "26", c.merchant_id
  end

  def test_it_find_all_by_merchant_id
    c = Invoice.find_all_by_merchant_id("26")
    assert_equal "26", c.first.merchant_id
  end

  def test_it_finds_by_status
    b = Invoice.find_by_status("shipped")
    assert_equal "shipped", b.status
  end

  def test_it_finds_all_by_status
    b = Invoice.find_all_by_status("shipped")
    assert_equal "shipped", b.first.status
  end

  def test_it_finds_by_created_at
    a = Invoice.find_by_created_at(Date.parse("2012-03-25 09:54:09 UTC"))
    assert_equal Date.parse("2012-03-25 09:54:09 UTC"), a.created_at
  end

   def test_it_finds_all_by_created_at
    a = Invoice.find_all_by_created_at(Date.parse("2012-03-25 09:54:09 UTC"))
    assert_equal Date.parse("2012-03-25 09:54:09 UTC"), a.first.created_at
  end

  def test_it_finds_by_updated_at
    a = Invoice.find_by_updated_at(Date.parse("2012-03-25 09:54:09 UTC"))
    assert_equal Date.parse("2012-03-25 09:54:09 UTC"), a.updated_at
  end

  def test_it_finds_all_by_updated_at
    a = Invoice.find_all_by_updated_at(Date.parse("2012-03-25 09:54:09 UTC"))
    assert_equal Date.parse("2012-03-25 09:54:09 UTC"), a.first.updated_at
  end

  def test_it_finds_a_random_sample
    a = Invoice.random
    b = Invoice.random
    c = Invoice.random
    refute_equal a.id, b.id
    refute_equal b.id, c.id
  end

  def test_it_returns_successful_invoices
    a = Invoice.find_by_id("1")
    assert_equal a.success?, true
  end

  def test_it_returns_pending_invoices
    a = Invoice.find_by_id("1")
    assert_equal a.pending?, false
  end


  def test_it_returns_invoice_items
    a = Invoice.find_by_id("1")
    assert_equal 8, a.invoice_items.count
  end

  def test_it_returns_invoice_revenue
    a = Invoice.find_by_id("1")
    assert_equal 2106777, a.invoice_revenue
  end

  def test_it_returns_invoice_unit_quantity
    a = Invoice.find_by_id("1")
    assert_equal 47,a.invoice_unit_quantity
  end

  def test_it_returns_customer
    a = Invoice.find_by_id("2")
    assert_equal "1",a.customer.id
  end

  def test_it_returns_items_collection
    a = Invoice.find_by_id("1")
    assert_equal 8, a.items.count
  end

  def test_creating_a_new_invoice
    customer = Customer.new(id: 123, first_name: 'Sarah', last_name: 'Smythe')
    merchant = Merchant.new(id: 123, name: 'ACME Widgets')
    before_count = Invoice.count
    invoice = Invoice.create(customer: customer, merchant: merchant, status: "shipped")
    after_count = Invoice.count
    assert_equal before_count + 1, after_count
    assert_equal "ACME Widgets", invoice.merchant.name
    assert_equal "Sarah Smythe", invoice.customer.full_name
  end


end
