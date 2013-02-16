require './test/sales_engine/test_helper'
require './lib/sales_engine/item'
require './lib/sales_engine/merchant'
require './lib/sales_engine/merchant_loader'

class MerchantTest < MiniTest::Unit::TestCase
  def setup
    MerchantLoader.from_csv("./test/data/short_merchants.csv")
  end

  def teardown
    a = Array.new
    Merchant.add(a)
  end

  def test_it_exists
    merchant = Merchant.new(
      :name=> "ABC", 
      :id => 1,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"
      )
    assert_kind_of Merchant, merchant
    assert_equal "ABC", merchant.name
  end

  def test_it_adds_merchants
    @merchant = []
    @merchant << Merchant.add(Merchant.new(
      :name => "ABC",
      :id         => 1,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"))

    @merchant << Merchant.add(Merchant.new(
      :name => "Blair",
      :id         => 2,
      :created_at=>"2012-03-27 14:54:09 UTC",
      :updated_at=>"2012-03-27 14:54:09 UTC"))
    assert_equal 2, @merchant.count
  end

  def test_it_returns_random_merchant
    a = Merchant.random
    b = Merchant.random
    refute_equal a.id, b.id
  end


  def test_it_finds_by_name
    a = Merchant.find_by_name("Schroeder-Jerde")
    assert_equal "Schroeder-Jerde", a.name
  end

  def test_it_find_all_by_name
    c = Merchant.find_all_by_name("Williamson Group")
    assert_equal 2, c.count
  end

  def test_it_finds_by_id
    a = Merchant.find_by_id("1")
    assert_equal "1", a.id
  end

  def test_it_finds_by_created_at
    a = Merchant.find_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", a.created_at
  end

  def test_it_finds_all_by_created_at
    a = Merchant.find_all_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal 9, a.count
  end

  def test_it_finds_by_updated_at
    a = Merchant.find_by_updated_at("2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", a.updated_at
  end

  def test_it_finds_all_by_updated_at
    a = Merchant.find_all_by_updated_at("2012-03-27 14:53:59 UTC")
    assert_equal 8, a.count
  end

  # def test_it_returns_a_collection_of_item_instances
  #   a = Merchant.find_by_id("3")
  #   assert_equal 5, a.items.count 
  # end

  # def test_it_returns_a_collection_of_invoice_instances
  #   a = Merchant.find_by_invoice("3")
  #   assert_equal 5, a.invoices.count 
  # end
end
