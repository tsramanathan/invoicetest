class InvoiceVm
  # attr_accessible :title, :body
    attr_accessor :invoices

    def initialize(invoices=[])
      @invoices = invoices
    end
end

class Invoices
    attr_accessor :did, :invoice_number, :bill_company_name, :invoice_date, :status, :total
end

