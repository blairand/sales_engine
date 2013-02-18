class Item  
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

  def initialize(input)
    @id = input[:id]
    @name = input[:name]
    @description = input[:description]
    @unit_price = input[:unit_price]
    @merchant_id = input[:merchant_id]
    @created_at = Date.parse(input[:created_at])
    @updated_at = Date.parse(input[:updated_at])
  end

  def self.add(items)    
    @items = item
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

  # def successful_invoice_items
  #   items_and_stuff = Hash.new(0)

  #   all.each do |item|
  #     item.invoice_item.invoice.success?
  #       items_and_stuff[invoice_item.item_id] = invoice_item.revenue
  #     end
  #   end
  #   items_and_stuff
  # end

  # def sort_list
  #   successful_invoice_items.sort_by do |id,value|
  #     value
  #   end.reverse!
  # end

  # def self.most_revenue(number=1)
  #   sorted_list = successful_invoice_items
  #   sorted_list[0...number].collect do |item|
  #     find_by_id(item[0])
  #   end
  # end

  # def self.most_items(number=1)
  #   sorted_list = unit_revenue_or_quantity(:quantity)
    
  #   sorted_list[0...number].collect do |item|
  #     find_by_id(item[0])
  #   end
  # end

end

