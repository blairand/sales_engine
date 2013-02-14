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

  # def self.find_by_first_name(value)
  # end

  # def self.find_by_last_name(value)
  # end


  # def self.find_all_by_first_name(value)
  #   find_all_by_attribute(:first_name, value)
  # end

  # def self.find_all_by_last_name(value)
  #   find_all_by_attribute(:last_name, value)
  # end 

  # def self.find_all_by_attribute(attribute,value)
  #   all.select {|record| record.send(attribute) == value}
  # end

end

