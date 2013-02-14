require './lib/sales_engine/invoice_loader'

class Invoice  
  attr_reader :id, :customer_id, :merchant_id, :status


  def initialize(input)
    @id = input[:id]
    @customer_id = input[:customer_id]
    @merchant_id = input[:merchant_id]
    @status = input[:status]
  end

  def self.add(invoice)
    @invoices ||= []
    @invoices << invoice
  end

  def self.all
    @invoices
  end
end

