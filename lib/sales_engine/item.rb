module SalesEngine
  class Item  
    attr_reader :id, 
                :name, 
                :description, 
                :unit_price, 
                :merchant_id,
                :created_at, 
                :updated_at

    def initialize(input)
      @id = input[:id].to_i
      @name = input[:name]
      @description = input[:description]
      @unit_price = BigDecimal.new(input[:unit_price])/100.0
      @merchant_id = input[:merchant_id].to_i
      @created_at = Date.parse(input[:created_at])
      @updated_at = Date.parse(input[:updated_at])
    end

    def self.add(items)    
      @items = items
    end

    def self.all
      @items
    end

    def self.random
      all.sample
    end
    
    def self.find_by_id(value)
      all.find {|record| record.id == value}
    end

    def self.find_by_name(value)
      all.find {|record| record.name.downcase == value.downcase}
    end

    def self.find_all_by_name(value)
      all.find_all {|record| record.name.downcase == value.downcase}
    end

    def self.find_by_description(value)
      all.find {|record| record.description.downcase == value.downcase}
    end

    def self.find_all_by_description(value)
      all.find_all {|record| record.description.downcase == value.downcase}
    end

    def self.find_by_unit_price(value)
      all.find {|record| record.unit_price == value}
    end

    def self.find_all_by_unit_price(value)
      all.find_all {|record| record.unit_price == value}
    end

    def self.find_by_merchant_id(value)
      all.find {|record| record.merchant_id == value}
    end

    def self.find_all_by_merchant_id(value)
      all.find_all {|record| record.merchant_id == value}
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

    def invoice_items
      InvoiceItem.find_all_by_item_id(@id)
    end

    def merchant
      Merchant.find_by_id(@merchant_id)
    end

    def self.invoice_items(input)
      items = Hash.new(0)
      Invoice.paid_invoices.each do |invoice|
        invoice.invoice_items.each do |invoice_item|
          item = find_by_id(invoice_item.item_id)
          items[item] += invoice_item.send(input)      
        end
      end
      items
    end

    def best_day
      dates = Hash.new(0)
      Invoice.paid_invoices.each do |invoice|
        invoice.invoice_items.each do |invoice_item|
          if invoice_item.item_id == self.id
            dates[invoice.created_at] += invoice_item.quantity
          end
        end
      end
      dates.max_by {|k,v| v}[0]
    end

    def self.sort_list(items,number_of_results)
      items.sort_by {|k,v| -v}.map{|x| x[0]}.take(number_of_results)
    end

    def self.most_revenue(number=1)
      items = invoice_items(:revenue)
      sort_list(items,number)
    end

    def self.most_items(number=1)
      items = invoice_items(:quantity)
      sort_list(items,number)
    end

  end
end
