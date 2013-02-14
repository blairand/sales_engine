require './test/sales_engine/test_helper'

require './lib/sales_engine/merchant'

class MerchantTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    merchant = Merchant.new(
      :name=> "ABC", 
      :id => 1,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"
      )
    assert_kind_of Merchant, merchant
    assert_equal "ABC", merchant.name
  end

  def test_it_adds_merchants
    @merchant = []
    @merchant << Merchant.add(Merchant.new(
      :name => "ABC",
      :id         => 1,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"))

    @merchant << Merchant.add(Merchant.new(
      :name => "Blair",
      :id         => 2,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"))
    assert_equal 2, @merchant.count
  end


end
