require './test/sales_engine/test_helper'

require './lib/sales_engine/merchant'

class MerchantTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    merchant = Merchant.new(:name=> "ABC", :id => 1)
    assert_kind_of Merchant, merchant
    assert_equal "ABC", merchant.name
  end

  def test_it_adds_merchants
    @merchant = []
    @merchant << Merchant.add(Merchant.new(
      :name => "ABC",
      :id         => 1))

    @merchant << Merchant.add(Merchant.new(
      :name => "Blair",
      :id         => 2))
    assert_equal 2, @merchant.count
  end


end
