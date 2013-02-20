require './test/sales_engine/test_helper'

module SalesEngine
  class TransactionTest < MiniTest::Unit::TestCase

    def test_it_finds_by_invoice_id
      a1 = Transaction.find_by_invoice_id("1")
      assert_equal "1", a1.invoice_id
    end

    def test_it_finds_all_by_invoice_id
      a2 = Transaction.find_all_by_invoice_id("10")
      assert_equal 1, a2.count
    end

    def test_it_finds_by_id
      a3 = Transaction.find_by_id("1")
      assert_equal "1", a3.id
    end

    def test_it_finds_by_credit_card_number
      a4 = Transaction.find_by_credit_card_number("4654405418249632")
      assert_equal "4654405418249632", a4.credit_card_number
    end

    def test_it_finds_all_by_credit_card_number
      c = Transaction.find_all_by_credit_card_number("4140149827486249")
      assert_equal 1, c.count
    end

    def test_it_returns_a_random
      a = Transaction.random
      b = Transaction.random
      refute_equal a.id,b.id
    end

    def test_it_finds_by_result
      c = Transaction.find_all_by_result("success")
      assert_equal 4648, c.count
    end

    def test_it_finds_by_created_at
      date7 = Date.parse("2012-03-27 14:54:10 UTC")
      a = Transaction.find_by_created_at(date7)
      assert_equal date7, a.created_at
    end

    def test_it_finds_all_by_created_at
      date8 = Date.parse("2012-03-27 14:54:10 UTC")
      a = Transaction.find_all_by_created_at(date8)
      assert_equal 5595, a.count
    end

    def test_it_finds_by_updated_at
      date9 = Date.parse("2012-03-27 14:54:10 UTC")
      a = Transaction.find_by_updated_at(date9)
      assert_equal date9, a.updated_at
    end

    def test_it_finds_all_by_updated_at
      date10 = Date.parse("2012-03-27 14:54:10 UTC")
      a10 = Transaction.find_all_by_updated_at(date10)
      assert_equal 5595, a10.count
      assert_equal date10, a10.first.updated_at
    end

    def test_it_checks_for_success
      a23 = Transaction.find_by_id("1")
      assert_equal true, a23.success? 
    end

    def test_if_finds_the_invoices_related_to_the_transaction
      a24 = Transaction.find_by_id("1").invoice
      assert_kind_of Invoice, a24
    end

  end
end
