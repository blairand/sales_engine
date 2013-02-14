require './test/sales_engine/test_helper'

require './lib/sales_engine/merchant_loader'

class MerchantLoaderTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    merchant_loader = MerchantLoader.new
    assert_kind_of MerchantLoader, merchant_loader
  end

   def test_the_loader_imports_csv_records_correctly
    MerchantLoader.from_csv
    assert_equal 100, Merchant.all.count
  end

end
