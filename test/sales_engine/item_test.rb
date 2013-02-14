require './test/sales_engine/test_helper'

require './lib/sales_engine/item'

require './lib/sales_engine/item_loader'

class ItemTest < MiniTest::Unit::TestCase

  def setup
    ItemLoader.from_csv("./test/data/short_items.csv")
  end

  def teardown
    a = Array.new
    Item.add(a)
  end
  
  def test_it_exists
    item = Item.new(
      :name=> "ABC", 
      :id => 1,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC")
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
      :merchant_id => 1,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"))

    @item << Item.add(Item.new(
       :name => "Blair",
      :id         => 2,
      :description => "cool",
      :unit_price => 400,
      :merchant_id => 4,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"))
    assert_equal 2, @item.count
  end


end
