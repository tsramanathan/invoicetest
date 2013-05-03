include ApplicationHelper

class PdfController < ApplicationController


  def index()
   invoice_did = params[:id]

    pdf_mgr = PDFManager.new()
    pdf_mgr.web_svc_url = @web_svc_url
    pdf_string = pdf_mgr.generate_pdf(invoice_did)
    pdf_display = Base64.decode64(pdf_string)
    File.open(invoice_did+'.pdf','wb'){|f| f.write(pdf_display)}
    send_file("./"+params[:id]+'.pdf', :type => 'application/pdf', :disposition => 'inline',:popup =>['new_window', 'height=300,width=600'])
    #popup_pdf
  end

  def popup_pdf
    link_to 'pdf', { :action => 'view_pdf' },:popup => ['new_window', 'height=300,width=600']
  end
  # controller
  def view_pdf
    send_data pdf.render, :filename => "./"+params[:id]+'.pdf',:type =>"application/pdf"
  end
end
