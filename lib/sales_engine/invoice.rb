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

  def self.find_by_id(value)
    all.find {|record| record.id == value}
  end

  def self.find_by_customer_id(value)
    all.find {|record| record.customer_id == value}
  end

  def self.find_by_status(value)
    all.find {|record| record.status == value}
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

