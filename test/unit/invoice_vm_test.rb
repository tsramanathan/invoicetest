require 'test_helper'
include InvoiceHelper

class InvoiceVmTest < ActiveSupport::TestCase

  test "test invoice view model" do

    @invoice_vm = fill_invoice_vm()

    assert_equal('CB01947553', @invoice_vm.invoices[0].invoice_number)
    assert_equal('CreateBasicAccount', @invoice_vm.invoices[0].bill_company_name)
    assert_equal('OPN', @invoice_vm.invoices[0].status)
    assert_equal('4500.00', @invoice_vm.invoices[0].total)
  end

  def fill_invoice_vm
    invoice_mgr = InvoiceManager.new()
    res = invoice_mgr.get_invoice_by_accountdid('A0001470XXTJDVY3G4C','ALL')
    resdecode = ActiveSupport::JSON.decode(res.body)
    @results = JSON.parse resdecode
    invoice_vm  = get_invoices(@results)

    invoice_vm
  end
end
