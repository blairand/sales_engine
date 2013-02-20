module SalesEngine
  class InvoiceItem  
    attr_reader :id, 
                :item_id, 
                :invoice_id, 
                :quantity, 
                :unit_price, 
                :created_at, 
                :updated_at

    def initialize(input)
      @id = input[:id].to_i
      @item_id = input[:item_id].to_i
      @invoice_id = input[:invoice_id].to_i
      @quantity = input[:quantity].to_i
      @unit_price = input[:unit_price].to_i
      @created_at = Date.parse(input[:created_at])
      @updated_at = Date.parse(input[:updated_at])
    end

    def self.create(items,invoice_id)
      item_quantity = items.inject(Hash.new(0)) do |memo, item|
        memo[item] += 1 ; memo
      end

      item_quantity.each do |item, quantity|
        new_invoice_item = self.new(
          id: self.count+1,
          item_id: item.id,
          invoice_id: invoice_id.to_s,
          quantity: quantity,
          unit_price: item.unit_price,
          created_at: Time.new.to_s,
          updated_at: Time.new.to_s
          )
        @invoice_items << new_invoice_item
      end

    end

    def self.add(invoice_items)
      @invoice_items = invoice_items
    end

    def self.count
      all.count
    end

    def self.all
      @invoice_items
    end

    def self.random
      all.sample
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

    def invoice
      Invoice.find_by_id(@invoice_id)
    end

    def item
      Item.find_by_id(@item_id)
    end

    def revenue
      @quantity.to_i * @unit_price.to_i
    end

    def quantity
      @quantity.to_i
    end

  end
end

