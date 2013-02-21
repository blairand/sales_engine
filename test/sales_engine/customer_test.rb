require './test/sales_engine/test_helper'

module SalesEngine
  class CustomerTest < MiniTest::Unit::TestCase

    def test_it_finds_by_id
      a = Customer.find_by_id(1)
      assert_equal 1, a.id
    end

    def test_it_finds_by_created_at
      date4 = Date.parse("2012-03-27 14:54:09 UTC")
      a = Customer.find_by_created_at(date4)
      assert_equal date4, a.created_at
    end

    def test_it_finds_all_by_created_at
      date5 = Date.parse("2012-03-27 14:54:10 UTC")
      a = Customer.find_all_by_created_at(date5)
      assert_equal 1000, a.count
    end

    def test_it_finds_by_updated_at
      date6 = Date.parse("2012-03-27 14:54:09 UTC")
      a = Customer.find_by_updated_at(date6)
      assert_equal date6, a.updated_at
    end

    def test_it_finds_all_by_updated_at
      date7 = Date.parse("2012-03-27 14:54:11 UTC")
      a = Customer.find_all_by_updated_at(date7)
      assert_equal 1000, a.count
    end

    def test_it_finds_by_first_name
      a = Customer.find_by_first_name("Dejon")
      assert_equal "Dejon", a.first_name
    end

    def test_it_find_all_by_first_name
      c = Customer.find_all_by_first_name("Loyal")
      assert_equal 2, c.count
    end

    def test_it_finds_by_last_name
      b = Customer.find_by_last_name("Nader")
      assert_equal "Nader", b.last_name
    end

    def test_it_find_all_by_last_name
      d = Customer.find_all_by_last_name("Considine")
      assert_equal 2, d.count
    end

    def test_it_returns_a_random
      a = Customer.random
      b = Customer.random
      refute_equal a.id,b.id
    end
    
    def test_it_returns_invoices_for_a_customer_instance
      a = Customer.find_by_id(1)
      b = a.invoices
      assert_equal 8, b.count
      assert_equal 1, b.first.id
      assert_equal 1, a.id
    end

    def test_it_returns_merchants_per_customer
      a = Customer.find_by_id(2).merchants_per_customer
      assert_equal 1, a["27"]
    end 

    def test_it_returns_sorted_merchants_per_customer
      a = Customer.find_by_id(2).sorted_merchants_per_customer
      assert_equal "27", a
    end

    def test_it_returns_favorite_merchant
      MerchantLoader.from_csv
      CustomerLoader.from_csv
      InvoiceItemLoader.from_csv
      a = Customer.find_by_id(2).favorite_merchant
      assert_equal "Shields, Hirthe and Smith", a.name
    end
    
    def test_it_returns_transactions
      CustomerLoader.from_csv
      TransactionLoader.from_csv
      a = Customer.find_by_id(1)
      assert_equal 1, a.transactions.count
    end

  end
end
