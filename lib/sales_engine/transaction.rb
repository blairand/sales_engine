module SalesEngine
  class Transaction
    attr_reader :id, 
                :invoice_id,
                :credit_card_number,
                :credit_card_expiration_date,
                :result,
                :created_at,
                :updated_at

    def initialize(input)
      @id = input[:id].to_i
      @invoice_id = input[:invoice_id].to_i
      @credit_card_number = input[:credit_card_number]
      @credit_card_expiration_date = input[:credit_card_expiration_date]
      @result = input[:result]
      @created_at = Date.parse(input[:created_at])
      @updated_at = Date.parse(input[:updated_at])
    end

    def self.create(input)
      new_transaction = self.new(
        id: self.count+1,
        invoice_id: input[:invoice_id],
        credit_card_number: input[:credit_card_number],
        credit_card_expiration_date: input[:credit_card_expiration_date],
        result: input[:result],
        created_at: Time.new.to_s,
        updated_at: Time.new.to_s)

      @transaction << new_transaction
    end

    def self.add(transactions)
      @transaction = transactions
    end

    def self.all
      @transaction
    end

    def self.count
      @transaction.count
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

    def success?
      @result == "success"
    end

    def invoice
      Invoice.find_by_id(@invoice_id)
    end

  end
end
