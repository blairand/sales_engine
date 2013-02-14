require './test/sales_engine/test_helper'

require './lib/sales_engine/invoice_loader'

class InvoiceLoaderTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    invoice_loader = InvoiceLoader.new
    assert_kind_of InvoiceLoader, invoice_loader
  end

  def test_it_loads_the_csv
    output = CSV.open("./data/invoices.csv", headers: true, header_converters: :symbol)
    assert_equal 4843, output.count
  end

  def invoices_are_loaded
    InvoiceLoader.from_csv
    assert_equal 4843, Invoice.all.count

  end

end
