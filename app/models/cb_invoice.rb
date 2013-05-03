class CbInvoice < ActiveRecord::Base
  attr_accessible :bill_company_name, :did, :invoice_date, :invoice_number, :status, :total
end
