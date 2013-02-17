[![Code Climate](https://codeclimate.com/github/blairand/sales_engine.png)](https://codeclimate.com/github/blairand/sales_engine)

#SalesEngine

__Project for gSchool, to practice building a system of several interacting Ruby objects using TDD.__

### Learning Goals

* Build a system using multiple interacting classes
* Use duck typing to share interactions across similar types
* Use modules to share common code
* Maintain high test coverage
* Use tests to drive creation of code

### Abstract

To Write a data reporting tool that manipulates and reports on merchant transactional data.

### Getting Started

1. `$ git clone git@github.com:blairand/sales_engine.git`
2. `$ bundle`
3. `$ ruby lib/sales_engine.rb`

### Data Supplied

We have several files of source data in the repo. its all fake.  including:

* `customers.csv` - customer names and other attributes
* `transactions.csv` - individual transactions with a marker relating a customer, merchant, invoice, and credit card
* `invoices.csv` - invoices that link transactions to invoice items and hold a status
* `invoice_items.csv` - the item, quantity, and unit price paid for an item in a transaction
* `items.csv` - items available for sale at the merchants
* `merchants.csv` - merchant names and identifying information


### Understandings

* The data was created from customer orders where:
  * One invoice connects the customer to multiple invoice items, one or more transactions, and one merchant
  * At least one transaction where their credit card is charged. If the charge fails, more transactions may be created for that single invoice.
  * One or more invoice items: one for each item that they ordered
* The transaction references only the invoice
* The invoice item references an item and an invoice
* The item is connected to many invoice items and one merchant
* The merchant is connected to many invoices and many items
* Prices, as represented in the CSVs, are in cents. Anytime you return a revenue total (like in `Merchant#revenue`) you must return a `BigDecimal` representating dollars and cents (two decimals, rounded to the nearest cent).

### Restrictions

Project implementation may *not* use:

* Rails' `ActiveRecord` library or a similar object-relational mappers (including `Sequel`, `DataMapper`, etc)
* Your implementation may not use `Struct` or `OpenStruct`
