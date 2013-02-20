require './test/sales_engine/test_helper'

module SalesEngine
  class ItemTest < MiniTest::Unit::TestCase

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
      assert_equal 1, b.count
    end

    def test_it_find_by_merchant_id
      c = Item.find_by_merchant_id("1")
      assert_equal "1", c.merchant_id
    end

    def test_it_find_all_by_merchant_id
      c = Item.find_all_by_merchant_id("1")
      assert_equal 15, c.count
    end

    def test_it_finds_by_created_at
      a = Item.find_by_created_at(Date.parse("2012-03-27 14:53:59 UTC"))
      assert_equal Date.parse("2012-03-27 14:53:59 UTC"), a.created_at
    end

    def test_it_finds_all_by_created_at
      a = Item.find_all_by_created_at(Date.parse("2012-03-27 14:53:59 UTC"))
      assert_equal 2483, a.count
    end

    def test_it_finds_by_updated_at
      a = Item.find_by_updated_at(Date.parse("2012-03-27 14:54:09 UTC"))
      assert_equal Date.parse("2012-03-27 14:54:09 UTC"), a.updated_at
    end

    def test_it_finds_all_by_updated_at
      a = Item.find_all_by_updated_at(Date.parse("2012-03-27 14:54:09 UTC"))
      assert_equal 2483, a.count
    end

    def test_it_finds_the_most_revenue_for_x_items
      a10 = Item.most_revenue(5)
      assert_equal "Item Dicta Autem", a10.first.name
      assert_equal "Item Amet Accusamus", a10.last.name
    end

    def test_it_finds_the_most_items_for_x_items
      most = Item.most_items(37)
      assert_equal "Item Nam Magnam", most[1].name
      assert_equal "Item Ut Quaerat", most.last.name
    end

    def test_it_describes_the_best_day
      item10 = Item.find_by_name "Item Accusamus Ut" 
      date10 = Date.parse "Sat, 24 Mar 2012"
      assert_equal date10, item10.best_day.to_date
    end

  end
end
