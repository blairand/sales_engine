require './lib/sales_engine/invoice_item_loader'

class InvoiceItem  
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price

  def initialize(input)
    @id = input[:id]
    @item_id = input[:item_id]
    @invoice_id = input[:invoice_id]
    @quantity = input[:quantity]
    @unit_price = input[:unit_price]
  end

  def self.add(invoice_items)
    @invoice_items ||= []
    @invoice_items << invoice_items
  end

  def self.all
    @invoice_items
  end

  
end

