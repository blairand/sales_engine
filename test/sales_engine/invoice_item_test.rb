require './test/sales_engine/test_helper'

require './lib/sales_engine/invoice_item'

require './lib/sales_engine/invoice_item_loader'

class InvoiceItemTest < MiniTest::Unit::TestCase

  def setup
    InvoiceItemLoader.from_csv("./test/data/short_invoice_items.csv")
  end

  def teardown
    a = Array.new
    InvoiceItem.add(a)
  end
  
  def test_it_exists
    invoice_item = InvoiceItem.new(
      :id=>1,
      :item_id=>1,
      :invoice_id=>1,
      :quantity=>1,
      :unit_price=>6543,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"
      )
    assert_kind_of InvoiceItem, invoice_item
    assert_equal 1, invoice_item.id
  end

  def test_it_adds_invoice_items
    @invoice_items = []
    @invoice_items << InvoiceItem.add(InvoiceItem.new(
      :item_id => 1,
      :id         => 1,
      :invoice_id  => 1,
      :quantity => 3,
      :unit_price => 7654,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"
      ))

     @invoice_items << InvoiceItem.add(InvoiceItem.new(
      :item_id => 1,
      :id         => 2,
      :invoice_id  => 2,
      :quantity => 3,
      :unit_price => 7654,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"
      ))
    assert_equal 2, @invoice_items.count
  end

  def test_it_finds_by_id
    a = InvoiceItem.find_by_id("1")
    assert_equal "1", a.id
  end

  def test_it_finds_by_created_at
    a = InvoiceItem.find_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", a.created_at
  end

  def test_it_finds_by_updated_at
    a = InvoiceItem.find_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", a.updated_at
  end

  def test_it_finds_by_invoice_id
    a = InvoiceItem.find_by_invoice_id("1")
    assert_equal "1", a.invoice_id
  end

  def test_it_finds_by_quantity
    b = InvoiceItem.find_by_quantity("5")
    assert_equal "5", b.quantity
  end

  def test_it_find_by_unit_price
    c = InvoiceItem.find_by_unit_price("29973")
    assert_equal "29973", c.unit_price
  end

end
