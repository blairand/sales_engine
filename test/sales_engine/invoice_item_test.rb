require './test/sales_engine/test_helper'

require './lib/sales_engine/invoice_item'

class InvoiceItemTest < MiniTest::Unit::TestCase
  
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
end
