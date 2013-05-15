require 'httparty'

class InvoiceManager
  # attr_accessible :title, :body
  attr_accessor :web_svc_url
  include HTTParty
  format :json

  def get_invoice_by_accountdid(accountdid,status)

    puts @web_svc_url

    options = {}
    if status == 'Open'
       invStatus = 'OPN'
    elsif status == 'Closed'
      invStatus = 'CLS'
    else
      invStatus = 'ALL'
    end
    res = self.class.get(@web_svc_url+'/api/invoices?AccountDID='+accountdid+'&Status='+invStatus, options)

    puts res

    res

  end
end
