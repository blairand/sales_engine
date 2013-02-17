require './lib/sales_engine/item'

class Merchant  
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(input)
    @id = input[:id]
    @name = input[:name]
    @created_at = Date.parse(input[:created_at])
    @updated_at = Date.parse(input[:updated_at])
  end

  def self.add(merchants)
    @merchants = merchants
  end

  def self.all
    @merchants
  end

  def self.random
    all.sample
  end

  def self.find_by_id(input)
    all.find {|record| record.id == input}
  end

  def self.find_by_name(input)
    all.find {|record| record.name == input}
  end

  def self.find_all_by_name(input)
    all.find_all {|record| record.name == input}
  end

  def self.find_by_created_at(input)
    all.find {|record| record.created_at == input}
  end

  def self.find_all_by_created_at(input)
    all.find_all {|record| record.created_at == input}
  end
  
  def self.find_by_updated_at(input)
    all.find {|record| record.updated_at == input}
  end

  def self.find_all_by_updated_at(input)
    all.find_all {|record| record.updated_at == input}
  end

  def items
    Item.find_all_by_merchant_id(self.id)
  end

  def invoices 
    Invoice.find_all_by_merchant_id(@id)
  end

  def single_merchant_invoices
    successful_invoices = []
    invoices.each do |invoice|
      if invoice.success? 
        successful_invoices.push(invoice)
      end
    end
    successful_invoices
  end

  def quantity_sold
    single_merchant_invoices.collect do |invoice|
      invoice.invoice_unit_quantity
    end.inject(:+)
  end

  def self.merchant_quantity
    merchant_volumes = Hash.new(0)
    all.each do |merchant|
      merchant_volumes[merchant.id] = merchant.quantity_sold
    end
    merchant_volumes.sort_by do |id, quantity|
      quantity
    end.reverse!
  end

  def self.most_items(number=1)
    sorted_list = merchant_quantity
    sorted_list[0...number].collect do |merchant|
      find_by_id(merchant[0])
    end
  end

  def revenue
    single_merchant_invoices.collect do |invoice|
      invoice.invoice_revenue
    end.inject(:+)
  end

  def self.merchant_revenue
    merchants_revenues = Hash.new(0)
    all.each do |merchant|
      merchants_revenues[merchant.id] = merchant.revenue
    end
    merchants_revenues.sort_by do |id,revenue|
      revenue
    end.reverse!
  end

  def self.most_revenue(number=1)
    sorted_list = merchant_revenue
    sorted_list[0...number].collect do |merchant|
      find_by_id(merchant[0])
    end
  end

  def customers_with_pending_invoices
    customers = []
    invoices.each do |invoice|
      customers.push(invoice.customer) if invoice.pending? 
    end
    customers
  end

end
