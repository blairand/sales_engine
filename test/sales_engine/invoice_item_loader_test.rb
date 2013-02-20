require './test/sales_engine/test_helper'

require './lib/sales_engine/invoice_item_loader'
module SalesEngine
  class InvoiceItemLoaderTest < MiniTest::Unit::TestCase
    
    def test_it_exists
      invoice_item_loader = InvoiceItemLoader.new
      assert_kind_of InvoiceItemLoader, invoice_item_loader
    end

    def test_the_loader_imports_csv_records_correctly
      InvoiceItemLoader.from_csv
      assert_equal 21687, InvoiceItem.all.count
    end

  end
end
