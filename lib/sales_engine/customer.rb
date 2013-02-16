class Customer  
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(input)
    @id = input[:id]
    @first_name = input[:first_name]
    @last_name = input[:last_name]
    @created_at = input[:created_at]
    @updated_at = input[:updated_at]
  end

  def self.add(customers)
    @customers = customers
  end

  def self.all
    @customers
  end

  def self.random
    all.sample
  end

  def self.find_by_id(value)
    all.find {|record| record.id == value}
  end

  def self.find_by_first_name(value)
    all.find {|record| record.first_name == value}
  end

  def self.find_all_by_first_name(value)
    all.find_all {|record| record.first_name == value}
  end

  def self.find_by_last_name(value)
    all.find {|record| record.last_name == value}
  end

  def self.find_all_by_last_name(value)
    all.find_all {|record| record.last_name == value}
  end 

  def self.find_by_created_at(value)
    all.find{|record| record.created_at == value}
  end

  def self.find_all_by_created_at(value)
    all.find_all{|record| record.created_at == value}
  end

  def self.find_by_updated_at(value)
    all.find{|record| record.updated_at == value}
  end

  def self.find_all_by_updated_at(value)
    all.find_all{|record| record.updated_at == value}
  end

  def invoices
    Invoice.find_all_by_customer_id(@id)
  end

  # def self.find_all_by_attribute(attribute,value)
  #   all.select {|record| record.send(attribute) == value}
  # end

  #  def self.find_by_attribute(attribute,value)
  #   all.find {|record| record.send(attribute) == value}
  # end

end

