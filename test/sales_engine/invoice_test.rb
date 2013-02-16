require './test/sales_engine/test_helper'

require './lib/sales_engine/invoice'

require './lib/sales_engine/invoice_loader'

class InvoiceTest < MiniTest::Unit::TestCase

  def setup
    InvoiceLoader.from_csv("./test/data/short_invoices.csv")
  end

  def teardown
    a = Array.new()
    Invoice.add(a)
  end
  
  def test_it_exists
    invoice = Invoice.new(
      :id=>1,
      :customer_id=>1,
      :merchant_id=>1,
      :status=>'shipped',
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"    
      )
    assert_kind_of Invoice, invoice
    assert_equal 1, invoice.id
  end

  def test_it_adds_invoice_items
    @invoices = []
    @invoices << Invoice.add(Invoice.new(
      :id=>1,
      :customer_id=>1,
      :merchant_id=>1,
      :status=>'shipped',
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"
      ))

     @invoices << Invoice.add(Invoice.new(
      :id=>2,
      :customer_id=>1,
      :merchant_id=>1,
      :status=>'shipped',
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"
      ))
    assert_equal 2, @invoices.count
  end  

  def test_it_finds_by_id
    a = Invoice.find_by_id("1")
    assert_equal "1", a.id
  end

  def test_it_finds_by_customer_id
    a = Invoice.find_by_customer_id("1")
    assert_equal "1", a.customer_id
  end

  # def test_it_finds_all_by_customer_id
  #   a = Invoice.find_all_by_customer_id("2")
  #   puts a
  # end

  def test_it_find_by_merchant_id
    c = Invoice.find_by_merchant_id("26")
    assert_equal "26", c.merchant_id
  end

  # def test_it_find_all_by_merchant_id
  #   c = Invoice.find_all_by_merchant_id("27")
  #   puts c
  # end

  def test_it_finds_by_status
    b = Invoice.find_by_status("shipped")
    assert_equal "shipped", b.status
  end

  # def test_it_finds_all_by_status
  #   b = Invoice.find_all_by_status("shipped")
  #   puts b
  # end

  def test_it_finds_by_created_at
    a = Invoice.find_by_created_at("2012-03-25 09:54:09 UTC")
    assert_equal "2012-03-25 09:54:09 UTC", a.created_at
  end

  #  def test_it_finds_all_by_created_at
  #   a = Invoice.find_all_by_created_at("2012-03-07 12:54:10 UTC")
  #   puts a
  # end

  def test_it_finds_by_updated_at
    a = Invoice.find_by_updated_at("2012-03-25 09:54:09 UTC")
    assert_equal "2012-03-25 09:54:09 UTC", a.updated_at
  end

  # def test_it_finds_all_by_updated_at
  #   a = Invoice.find_all_by_updated_at("2012-03-07 12:54:10 UTC")
  #   puts a
  # end

end
