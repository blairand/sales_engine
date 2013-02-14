require './test/sales_engine/test_helper'

require './lib/sales_engine/invoice'

require './lib/sales_engine/invoice_loader'

class InvoiceTest < MiniTest::Unit::TestCase

  def setup
    InvoiceLoader.from_csv("./test/data/short_invoices.csv")
  end

  def teardown
    a = Array.new
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
end
