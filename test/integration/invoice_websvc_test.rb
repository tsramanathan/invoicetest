require 'test_helper'
require 'httparty'

class InvoiceWebsvc < ActionDispatch::IntegrationTest

  include HTTParty
  base_uri 'http://10.10.46.117'
  format :json

  def test_get_invoice_by_accountdid_websvc


    options = {}
    accountdid = 'A0001470XXTJDVY3G4C'
    # options.merge!(:headers => {"Authorization" => "Partner CBCRM:Order4m3"})
    response = self.class.get('/financialrestservices2/api/invoices?AccountDID='+accountdid+'&Status=ALL', options)

    assert_equal 200,  response.code
  end

end