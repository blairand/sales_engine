require './lib/sales_engine/item'

class Merchant  
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(input)
    @id = input[:id]
    @name = input[:name]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
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

  def single_merchant_successful_invoices
    successful_invoices = []
    invoices.each do |invoice|
      if invoice.success? 
        successful_invoices.push(invoice)
      end
    end
    successful_invoices
  end

  def single_merchant_revenue
    single_merchant_successful_invoices.collect{|invoice| invoice.invoice_revenue}.inject(:+)
  end

  def self.merchant_revenue
    merchants_revenues = Hash.new(0)
    all.each do |merchant|
      merchants_revenues[merchant.id] = merchant.single_merchant_revenue
    end
    merchants_revenues.sort_by{|merchant_id,merchant_revenue| merchant_revenue }.reverse!
  end


  def self.most_revenue(number=1)
    sorted_list = merchant_revenue
    sorted_list[0...number].collect do |merchant|
      find_by_id(merchant[0])
    end
  end


end
