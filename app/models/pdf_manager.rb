require 'httparty'

class PDFManager
  # attr_accessible :title, :body
  attr_accessor :web_svc_url
  include HTTParty
  format :json

  def generate_pdf(invoicedid)
    options = {}
    res = self.class.get(@web_svc_url+'/api/pdf/'+invoicedid, options)
  end
end
