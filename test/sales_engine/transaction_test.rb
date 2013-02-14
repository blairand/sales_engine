require './test/sales_engine/test_helper'

require './lib/sales_engine/transaction'

require './lib/sales_engine/transaction_loader'

class TransactionTest < MiniTest::Unit::TestCase

  def setup
    TransactionLoader.from_csv("./test/data/short_transactions.csv")
  end

  def teardown
    a = Array.new
    Transaction.add(a)
  end
  
  def test_it_exists
    transaction = Transaction.new(
      :invoice_id=> 6000, 
      :id => 1,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"
      )
    assert_kind_of Transaction, transaction
    assert_equal 6000, transaction.invoice_id
  end

  def test_it_adds_transaction
    @transaction = []
    @transaction << Transaction.add(Transaction.new(
      :invoice_id => 6000,
      :id         => 1,
      :credit_card_number => 9876543209876543,
      :result => "failed",
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"))

    @transaction << Transaction.add(Transaction.new(
      :invoice_id => 6001,
      :id         => 2,
      :credit_card_number => 9876543209876590,
      :result => "failed",
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"))
    assert_equal 2, @transaction.count
  end


end
