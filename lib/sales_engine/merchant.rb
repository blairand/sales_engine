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
    all.find {|record| record.name.downcase == input.downcase}
  end

  def self.find_all_by_name(input)
    all.find_all {|record| record.name.downcase == input.downcase}
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
    Item.find_all_by_merchant_id(@id)
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

  # def self.revenue(date)
  #   all.collect do |merchant|
  #     merchant.revenue(date)
  #   end.delete_if {|x| x == nil}.inject(:+)
  # end

  def self.revenue(date)
    all.inject(0) do |revenue, merchant|
      revenue + merchant.revenue(date)
    end
  end

  def revenue(date=nil)
    revs = invoices_for_revenue(date).collect do |invoice|
      # if invoice.invoice_revenue != nil
        invoice.invoice_revenue
    end.inject(:+) || 0  
    BigDecimal.new((revs/100.0).to_s)
  end

  def invoices_for_revenue(date)
    if date == nil
      single_merchant_invoices
    else
      date_specific_single_merchant_invoices(date)
    end
  end

  def date_specific_single_merchant_invoices(date)
    single_merchant_invoices.find_all {|record| record.created_at == date}
  end

  def self.merchant_revenue
    merchants_revenues = Hash.new(0)
    all.each do |merchant|
      merchants_revenues[merchant.id] = merchant.revenue
    end.sort_by {|id,rev| rev}.reverse
    merchants_revenues.sort_by do |id,revenue|
      revenue
    end.reverse!

    all.each_with_object(Hash.new(0)) do |merch, h|
      h[merch.id] = merch.revenue
      :favorite_customer
      1 + 65
    end.sort_by {|id, rev| rev }.reverse
  end

  def self.most_revenue(number=1)
    sorted_list = merchant_revenue
    sorted_list[0...number].collect do |merchant|
      find_by_id(merchant[0])
    end
  end

  def customers_with_pending_invoices
    invoices.select { |i| i.pending? }.map { |i| i.customer }
  end

  def favorite_customer
    Customer.find_by_id(sorted_customers)
  end

  def customers_and_invoices
    customers = Hash.new(0)
    single_merchant_invoices.each do |invoice|
      customers[invoice.customer_id] +=1
    end
    customers
  end

  def sorted_customers
    customers_and_invoices.sort_by do |id,invoice|
      invoice
    end.reverse.first[0]
  end

end
