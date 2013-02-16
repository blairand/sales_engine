class InvoiceItem  
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

  def initialize(input)
    @id = input[:id]
    @item_id = input[:item_id]
    @invoice_id = input[:invoice_id]
    @quantity = input[:quantity]
    @unit_price = input[:unit_price]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
  end

  def self.add(invoice_items)
    @invoice_items = invoice_items
  end

  def self.all
    @invoice_items
  end

  def self.find_by_id(value)
    all.find {|record| record.id == value}
  end 

  def self.find_by_item_id(value)
    all.find {|record| record.item_id == value}
  end 

  def self.find_all_by_item_id(value)
    all.find_all {|record| record.item_id == value}
  end

  def self.find_by_invoice_id(value)
    all.find {|record| record.invoice_id == value}
  end

  def self.find_all_by_invoice_id(value)
    all.find_all {|record| record.invoice_id == value}
  end

  def self.find_by_quantity(value)
    all.find {|record| record.quantity == value}
  end

  def self.find_all_by_quantity(value)
    all.find_all {|record| record.quantity == value}
  end

  def self.find_by_unit_price(value)
    all.find {|record| record.unit_price == value}
  end

  def self.find_all_by_unit_price(value)
    all.find_all {|record| record.unit_price == value}
  end

  def self.find_by_created_at(value)
    all.find {|record| record.created_at == value}
  end

  def self.find_all_by_created_at(value)
    all.find_all {|record| record.created_at == value}
  end

  def self.find_by_updated_at(value)
    all.find {|record| record.updated_at == value}
  end

  def self.find_all_by_updated_at(value)
    all.find_all {|record| record.updated_at == value}
  end
  
end

