require './lib/sales_engine/transaction'
require './lib/sales_engine/invoice_item'

class Invoice  
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at


  def initialize(input)
    @id = input[:id]
    @customer_id = input[:customer_id]
    @merchant_id = input[:merchant_id]
    @status = input[:status]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
  end

  def self.add(invoice)
    @invoices ||= []
    @invoices << invoice
  end

  def self.all
    @invoices
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

  def invoice_items
    InvoiceItem.find_all_by_invoice_id(@id)
  end

  def customer
    Customer.find_by_id(@customer_id)
  end

  def items
    invoice_items.collect {|invoice_item| invoice_item.item}
  end

end


