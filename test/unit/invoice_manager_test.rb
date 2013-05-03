require 'test_helper'


class InvoiceManagerTest < ActiveSupport::TestCase

  test "get invoice mock test valid success" do
    @invoice_mgr = InvoiceManager.new
    @account_did = 'A0001470XXTJDVY3G4C'
    @invoice_mgr.stub!(:get_invoice_by_accountdid).with(@account_did).and_return({ :result_count => 10 })

    #assert_equal 'Success', @product_mgr.get_products[:websvc_response]
    assert @invoice_mgr.get_invoice_by_accountdid(@account_did)[:result_count] > 0

  end

  test "get invoice mock test valid failure" do
    @invoice_mgr = InvoiceManager.new
    @account_did = 'AATest'
    @invoice_mgr.stub!(:get_invoice_by_accountdid).with(@account_did).and_return({ :result_count => nil })

    #assert_equal 'Success', @product_mgr.get_products[:websvc_response]
    assert_equal nil, @invoice_mgr.get_invoice_by_accountdid(@account_did)[:result_count]

  end
end