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

  def self.add(transactions)
    @transaction = transactions
  end

  def self.all
    @transaction
  end

  def self.random
    all.sample
  end

  def self.find_by_id(input)
    all.find {|record| record.id == input}
  end

  def self.find_by_invoice_id(input)
    all.find{|record| record.invoice_id == input}
  end

  def self.find_all_by_invoice_id(input)
    all.find_all{|record| record.invoice_id == input}
  end

  def self.find_by_credit_card_number(input)
    all.find{|record| record.credit_card_number == input}
  end

  def self.find_all_by_credit_card_number(input)
    all.find_all{|record| record.credit_card_number == input}
  end

  def self.find_by_result(input)
    all.find{|record| record.result == input}
  end

  def self.find_all_by_result(input)
    all.find_all{|record| record.result == input}
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

end
