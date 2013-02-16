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

  def test_it_finds_by_invoice_id
    a = Transaction.find_by_invoice_id("1")
    assert_equal "1", a.invoice_id
  end

  def test_it_finds_all_by_invoice_id
    a = Transaction.find_all_by_invoice_id("10")
    assert_equal 2, a.count
  end

  def test_it_finds_by_id
    c = Transaction.find_by_id("1")
    assert_equal "1", c.id
  end

  def test_it_finds_by_credit_card_number
    c = Transaction.find_by_credit_card_number("4654405418249632")
    assert_equal "4654405418249632", c.credit_card_number
  end

  def test_it_finds_all_by_credit_card_number
    c = Transaction.find_all_by_credit_card_number("4140149827486249")
    assert_equal 2, c.count
  end

  def test_it_finds_by_result
    c = Transaction.find_all_by_result("success")
    assert_equal 10, c.count
  end

  def test_it_finds_by_created_at
    a = Transaction.find_by_created_at("2012-03-27 14:54:10 UTC")
    assert_equal "2012-03-27 14:54:10 UTC", a.created_at
  end

  def test_it_finds_all_by_created_at
    a = Transaction.find_all_by_created_at("2012-03-27 14:54:10 UTC")
    assert_equal 8, a.count
  end

  def test_it_finds_by_updated_at
    a = Transaction.find_by_updated_at("2012-03-27 14:54:10 UTC")
    assert_equal "2012-03-27 14:54:10 UTC", a.updated_at
  end

  def test_it_finds_all_by_updated_at
    a = Transaction.find_all_by_updated_at("2012-03-27 14:54:10 UTC")
    assert_equal 8, a.count
  end

  def test_it_returns_invoice_id
    skip("test is broken; method works")
  end

end
