require './test/sales_engine/test_helper'

require './lib/sales_engine/invoice'

class InvoiceTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    invoice = Invoice.new(
      :id=>1,
      :customer_id=>1,
      :merchant_id=>1,
      :status=>'shipped'    
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
      :status=>'shipped'
      ))

     @invoices << Invoice.add(Invoice.new(
      :id=>2,
      :customer_id=>1,
      :merchant_id=>1,
      :status=>'shipped'
      ))
    assert_equal 2, @invoices.count
  end
end
