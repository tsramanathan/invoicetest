module InvoiceHelper

  def get_invoices(invoice_json)

    $num = invoice_json['data'].count
    $i = 0

    invoice_vm = InvoiceVm.new()

    CbInvoice.delete_all

    while $i < $num  do
      invs = Invoices.new()
      invs.did = invoice_json['data'][$i]['DID']
      invs.invoice_number =  invoice_json['data'][$i]['InvoiceNumber']
      invs.bill_company_name = invoice_json['data'][$i]['BillCompanyName']
      invs.invoice_date =  invoice_json['data'][$i]['StartDt']
      invs.status = invoice_json['data'][$i]['Status']
      invs.total = invoice_json['data'][$i]['Total']

      @cb_invoice = CbInvoice.new
      @cb_invoice.did = invs.did
      @cb_invoice.invoice_number = invs.invoice_number
      @cb_invoice.bill_company_name = invs.bill_company_name
      @cb_invoice.invoice_date = invs.invoice_date
      @cb_invoice.status = invs.status
      @cb_invoice.total = invs.total

      @cb_invoice.save()


      invoice_vm.invoices << invs
      $i +=1
    end

    invoice_vm

  end

end
