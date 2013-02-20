require 'sales_engine/version'
require 'sales_engine/merchant'
require 'sales_engine/merchant_loader'
require 'sales_engine/customer'
require 'sales_engine/customer_loader'
require 'sales_engine/item'
require 'sales_engine/item_loader'
require 'sales_engine/invoice_item'
require 'sales_engine/invoice_item_loader'
require 'sales_engine/transaction'
require 'sales_engine/transaction_loader'
require 'sales_engine/invoice'
require 'sales_engine/invoice_loader'

require 'bigdecimal'
require 'date'
require 'csv'

module SalesEngine
  def self.startup
    MerchantLoader.from_csv
    CustomerLoader.from_csv
    ItemLoader.from_csv
    InvoiceItemLoader.from_csv
    TransactionLoader.from_csv
    InvoiceLoader.from_csv
  end
end

