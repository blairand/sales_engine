require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/csv_loader'

class CSVLoaderTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    new_loader = CSVLoader.new
    assert_kind_of CSVLoader, new_loader
  end

end
