require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine'

class SalesEngineTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    new_engine = SalesEngine.new
    assert_kind_of SalesEngine, new_engine
  end

end