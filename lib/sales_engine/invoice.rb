require './lib/sales_engine/transaction'
require './lib/sales_engine/invoice_item'

class Invoice  
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at


  def initialize(input)
    @id = input[:id]
    @customer_id = input[:customer_id]
    @merchant_id = input[:merchant_id]
    @status = input[:status]
    @created_at = Date.parse(input[:created_at])
    @updated_at = Date.parse(input[:updated_at])
  end

  def self.create(input)
    created_invoice = self.new(
      id: self.count+1,
      customer_id: input[:customer].id,
      merchant_id: input[:merchant].id,
      status: input[:status],
      created_at: Time.new.to_s,
      updated_at: Time.new.to_s)

    @invoices << created_invoice

    InvoiceItem.create(input[:items],created_invoice.id)
    created_invoice
  end

  def self.add(invoice)
    @invoices = invoice
  end

  def self.all
    @invoices
  end

  def self.count
    @invoices.count
  end

  def self.random
    all.sample
  end

  def self.find_by_id(value)
    all.find {|record| record.id == value}
  end

  def self.find_by_customer_id(value)
    all.find {|record| record.customer_id == value}
  end

  def self.find_all_by_customer_id(value)
    all.find_all {|record| record.customer_id == value}
  end

  def self.find_by_merchant_id(value)
    all.find {|record| record.merchant_id == value}
  end

  def self.find_all_by_merchant_id(value)
    all.select {|record| record.merchant_id == value}
  end

  def self.find_by_status(value)
    all.find {|record| record.status == value}
  end

  def self.find_all_by_status(value)
    all.find_all {|record| record.status == value}
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

  def transactions
    Transaction.find_all_by_invoice_id(@id)
  end

  def success?
    transactions.any?{|transaction| transaction.success?}
  end

  def pending?
    transactions.any?{|transaction| !transaction.success?}
  end

  def invoice_items
    InvoiceItem.find_all_by_invoice_id(@id)
  end

  def invoice_revenue
      invoice_data_collector(:revenue)
  end

  def invoice_unit_quantity 
      invoice_data_collector(:quantity)
  end

  def invoice_data_collector(attribute)
    invoice_items.collect do |invoice_item|
      invoice_item.send(attribute)
    end.inject(:+)
  end

  def customer
    Customer.find_by_id(@customer_id)
  end

  def items
    invoice_items.collect{|invoice_item| invoice_item.item}
  end

end


