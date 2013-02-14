require './lib/sales_engine/transaction_loader'

class Transaction  
  attr_reader :id, :invoice_id, :credit_card_number, :result

  def initialize(input)
    @id = input[:id]
    @invoice_id = input[:invoice_id]
    @credit_card_number = input[:credit_card_number]
    @result = input[:result]
  end

  def self.add(transaction)
    @transaction ||= []
    @transaction << transaction
  end

  def self.all
    @transaction
  end
end
