class Transaction  
  attr_reader :id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at

  def initialize(input)
    @id = input[:id]
    @invoice_id = input[:invoice_id]
    @credit_card_number = input[:credit_card_number]
    @result = input[:result]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
  end

  def self.add(transaction)
    @transaction ||= []
    @transaction << transaction
  end

  def self.all
    @transaction
  end

end
