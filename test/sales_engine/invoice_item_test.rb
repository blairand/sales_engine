require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine/invoice_item'

class InvoiceItemTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    invoice_item = InvoiceItem.new(
      :id=>1,
      :item_id=>1,
      :invoice_id=>1,
      :quantity=>1,
      :unit_price=>6543
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
      :unit_price => 7654
      ))

     @invoice_items << InvoiceItem.add(InvoiceItem.new(
      :item_id => 1,
      :id         => 2,
      :invoice_id  => 2,
      :quantity => 3,
      :unit_price => 7654
      ))
    assert_equal 2, @invoice_items.count
  end
end
