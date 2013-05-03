require 'test_helper'
require 'httparty'

class PDFWebsvc < ActionDispatch::IntegrationTest

  include HTTParty
  base_uri 'http://10.10.46.117'
  format :json

  def test_generate_pdf_websvc


    options = {}
    invoicedid = 'I006BM6RFLQLWJVB4BM'
    # options.merge!(:headers => {"Authorization" => "Partner CBCRM:Order4m3"})
    response = self.class.get('/financialrestservices2/api/pdf/'+invoicedid, options)

    assert_equal 200,  response.code
  end

end