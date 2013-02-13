require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/merchant_loader'

class MerchantLoaderTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    merchant_loader = MerchantLoader.new
    assert_kind_of MerchantLoader, merchant_loader
  end

  def test_it_loads_the_csv
    output = CSV.open("./data/merchants.csv", headers: true, header_converters: :symbol)
    assert_equal 100, output.count
  end

end
