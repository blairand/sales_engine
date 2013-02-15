class Item  
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

  def initialize(input)
    @id = input[:id]
    @name = input[:name]
    @description = input[:description]
    @unit_price = input[:unit_price]
    @merchant_id = input[:merchant_id]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
  end

  def self.add(item)
    @items ||= []
    @items << item
  end

  def self.all
    @items
  end
  def self.find_by_id(value)
    all.find {|record| record.id == value}
  end

  def self.find_by_name(value)
    all.find {|record| record.name == value}
  end

  def self.find_by_description(value)
    all.find {|record| record.description == value}
  end

  def self.find_by_unit_price(value)
    all.find {|record| record.unit_price == value}
  end

  def self.find_by_merchant_id(value)
    all.find {|record| record.merchant_id == value}
  end

  def self.find_by_created_at(value)
    all.find {|record| record.created_at == value}
  end

  def self.find_by_updated_at(value)
    all.find {|record| record.updated_at == value}
  end


end

