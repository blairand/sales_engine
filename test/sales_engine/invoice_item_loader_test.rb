require './test/sales_engine/test_helper'

require './lib/sales_engine/invoice_item_loader'

class InvoiceItemLoaderTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    invoice_item_loader = InvoiceItemLoader.new
    assert_kind_of InvoiceItemLoader, invoice_item_loader
  end

  def test_it_loads_the_csv
    output = CSV.open("./data/invoice_items.csv", headers: true, header_converters: :symbol)
    assert_equal 21687, output.count
  end

end
