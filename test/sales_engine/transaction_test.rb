require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine/transaction'

class TransactionTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    transaction = Transaction.new(:invoice_id=> 6000, :id => 1)
    assert_kind_of Transaction, transaction
    assert_equal 6000, transaction.invoice_id
  end

  def test_it_adds_transaction
    @transaction = []
    @transaction << Transaction.add(Transaction.new(
      :invoice_id => 6000,
      :id         => 1,
      :credit_card_number => 9876543209876543,
      :result => "failed"))

    @transaction << Transaction.add(Transaction.new(
      :invoice_id => 6001,
      :id         => 2,
      :credit_card_number => 9876543209876590,
      :result => "failed"))
    assert_equal 2, @transaction.count
  end


end
