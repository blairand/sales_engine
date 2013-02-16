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

  def test_it_finds_by_name
    a = Item.find_by_name("Item Qui Esse")
    assert_equal "Item Qui Esse", a.name
  end

  def test_it_finds_by_id
    a = Item.find_by_id("1")
    assert_equal "1", a.id
  end

  def test_it_finds_by_description
    a = Item.find_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.")
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", a.description
  end

  def test_it_finds_by_unit_price
    b = Item.find_by_unit_price("32301")
    assert_equal "32301", b.unit_price
  end

  def test_it_finds_all_by_unit_price
    b = Item.find_all_by_unit_price("22582")
    assert_equal 2, b.count
  end

  def test_it_find_by_merchant_id
    c = Item.find_by_merchant_id("1")
    assert_equal "1", c.merchant_id
  end
  
<<<<<<< HEAD
  # def test_it_find_all_by_merchant_id
  #   puts Item.find_all_by_merchant_id("1")
  # end
=======
  def test_it_find_all_by_merchant_id
    c = Item.find_all_by_merchant_id("1")
    assert_equal 10, c.count
  end

  def test_it_finds_by_created_at
    a = Item.find_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", a.created_at
  end

  def test_it_finds_all_by_created_at
    a = Item.find_all_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal 10, a.count
  end

  def test_it_finds_by_updated_at
    a = Item.find_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", a.updated_at
  end

  def test_it_finds_all_by_updated_at
    a = Item.find_all_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal 10, a.count
  end
>>>>>>> tests

end
