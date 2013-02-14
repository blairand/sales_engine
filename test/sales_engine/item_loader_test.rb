require './test/sales_engine/test_helper'

require './lib/sales_engine/item_loader'

class ItemLoaderTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    item_loader = ItemLoader.new
    assert_kind_of ItemLoader, item_loader
  end

  def test_it_loads_the_csv
    output = CSV.open("./data/items.csv", headers: true, header_converters: :symbol)
    assert_equal 2483, output.count
  end

end
