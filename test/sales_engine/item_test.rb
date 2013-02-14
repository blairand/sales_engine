require './test/sales_engine/test_helper'

require './lib/sales_engine/item'

class ItemTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    item = Item.new(:name=> "ABC", :id => 1)
    assert_kind_of Item, item
    assert_equal "ABC", item.name
  end

  def test_it_adds_items
    @item = []
    @item << Item.add(Item.new(
      :name => "ABC",
      :id         => 1,
      :description => "lame",
      :unit_price => 200,
      :merchant_id => 1))

    @item << Item.add(Item.new(
       :name => "Blair",
      :id         => 2,
      :description => "cool",
      :unit_price => 400,
      :merchant_id => 4))
    assert_equal 2, @item.count
  end


end
