require './test/sales_engine/test_helper'

module SalesEngine
  class InvoiceItemTest < MiniTest::Unit::TestCase

    def test_it_returns_a_random
      a = InvoiceItem.random
      b = InvoiceItem.random
      refute_equal a.id,b.id
    end

    def test_it_finds_item_id
      ii1 = InvoiceItem.find_by_item_id("539")
      assert_equal "539", ii1.item_id
    end

    def test_it_finds_all_by_item_id
      ii2 = InvoiceItem.find_all_by_item_id("1832")
      assert_equal 4, ii2.count
    end

    def test_it_finds_by_id
      ii3 = InvoiceItem.find_by_id("1")
      assert_equal "1", ii3.id
    end

    def test_it_finds_by_invoice_id
      ii4 = InvoiceItem.find_by_invoice_id("1")
      assert_equal "1", ii4.invoice_id
    end

    def test_it_finds_all_by_invoice_id
      ii5 = InvoiceItem.find_all_by_invoice_id("2")
      assert_equal 4, ii5.count
    end

    def test_it_finds_by_quantity
      ii6 = InvoiceItem.find_by_quantity(10)
      assert_equal 10, ii6.quantity
    end

    def test_it_finds_all_by_quantity
      ii7 = InvoiceItem.find_all_by_quantity(10)
      assert_equal 2140, ii7.size
    end

    def test_it_find_by_unit_price
      ii8 = InvoiceItem.find_by_unit_price("29973")
      assert_equal "29973", ii8.unit_price
    end

    def test_it_find_all_by_unit_price
      ii9 = InvoiceItem.find_all_by_unit_price("29973")
      assert_equal 4, ii9.count
    end

    def test_it_finds_by_created_at
      date10 = Date.parse("2012-03-27 14:54:09 UTC")
      ii10 = InvoiceItem.find_by_created_at(date10)
      assert_equal date10, ii10.created_at
    end

    def test_it_finds_all_by_created_at
      date11 = Date.parse("2012-03-27 14:54:09 UTC")
      ii11 = InvoiceItem.find_all_by_created_at(date11)
      assert_equal 21687, ii11.count
    end

    def test_it_finds_by_updated_at
      date12 = Date.parse("2012-03-27 14:54:09 UTC")
      ii12 = InvoiceItem.find_by_updated_at(date12)
      assert_equal date12, ii12.updated_at
    end

    def test_it_finds_all_by_updated_at
      date13 = Date.parse("2012-03-27 14:54:09 UTC")
      ii13 = InvoiceItem.find_all_by_updated_at(date13)
      assert_equal 21687, ii13.count
    end

    def test_invoice_relationship
      ii14 = InvoiceItem.find_by_id("16934")
      assert_equal "16934", ii14.id
    end

    def test_returns_item
      ii15 = InvoiceItem.find_by_id("16934")
      assert_equal "Item Cupiditate Magni", ii15.item.name
    end

    def test_it_returns_invoice_item_revenue
      ii16 = InvoiceItem.find_by_id("2")
      assert_equal 209916, ii16.revenue
    end

    def test_creating_a_new_invoice
      item1 = Item.find_by_id("1")
      item2 = Item.find_by_id("2") 
      items = [item1,item1,item2]
      before_count = InvoiceItem.count
      invoice_item = InvoiceItem.create(items,1234)
      after_count = InvoiceItem.count
      assert_equal before_count + 2, after_count
      # assert_equal Invoice.count, invoices.last.id
      # assert_equal customer.id, invoices.last.customer_id
    end

  end
end
