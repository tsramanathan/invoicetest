include InvoiceHelper

class InvoiceController < ApplicationController
  require 'will_paginate/array'
  helper_method :sort_column, :sort_direction

  def index
    #   @settings = Account.get_saml_settings
    #
    ##
    #if @settings.nil?
    #  return redirect_to '/saml'
    #end
    #
    ## If we're viewing this unauthenticated, set our goback URL for after logging in
    #if session[:userid].nil?
    #  #session[:goback_to] = request.url
    #  session[:userid]=nil
    #  return redirect_to '/saml'
    #
    #end

    respond_to do |format|
      format.html # index.html.erb
    end

  end

  def show
    #@invoice_vm = session[:invoice_vm]

   #@page_results= CbInvoice.order(params[:sort])
    cbinvoice = session[:cbinvoice]
   @page_results = cbinvoice.order(sort_column + " " + sort_direction).paginate(per_page: 10, page: params[:page])
    respond_to do |format|
      format.html
    end
  end

  def get_invoices_by_accountdid
    account_did = params[:account_did]
    status = params[:status]
    inv_mgr = InvoiceManager.new()
    inv_mgr.web_svc_url = @web_svc_url
    res = inv_mgr.get_invoice_by_accountdid(account_did,status)


    resdecode = ActiveSupport::JSON.decode(res.body)
   # resdecode = '{"UserDID":"U005K66LLYKBP025XYR","AccountDID":"A002TY6DZ15JXLJMFY3","CreatedByID":"","TrackingCode":"cbnsv","PathEventDID":"PE002S86GWRXF6QQ9GM7","UserIPAddress":"127.0.0.1","IsCBRetailAccount":false,"BID":"2013040210189375b3e1fb704419803d6b91a9233db5","SessionID":"69a5e19b44c048028b816ea37119c862-419350148-00-4","UserAgent":"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; GTB7.4; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; InfoPath.3; MS-RTC LM 8)","ReferrerURL":null,"Locale":{"HostSite":"NL","LanguageCode":"NLDutch"},"ShoppingBag":null,"DirectDebit":null,"CCXML":"\u003c?xml version=\u00271.0\u0027 encoding=\u0027UTF-8\u0027?\u003e\r\n\u003ccreditcard\u003e\r\n    \u003cCCName\u003eart\u003c/CCName\u003e\r\n    \u003cCCNumber\u003e4111111111111111\u003c/CCNumber\u003e\r\n    \u003cCCType\u003eVisa\u003c/CCType\u003e\r\n    \u003cCCExpirationMonth\u003e9\u003c/CCExpirationMonth\u003e\r\n    \u003cCCExpirationYear\u003e2018\u003c/CCExpirationYear\u003e\r\n    \u003cCCAddress\u003e1234ff\u003c/CCAddress\u003e\r\n    \u003cCCCity\u003eOldenzaal\u003c/CCCity\u003e\r\n    \u003cCCState\u003eOverijssel\u003c/CCState\u003e\r\n    \u003cCCZip\u003e7570\u003c/CCZip\u003e\r\n    \u003cCCCountryCode\u003eNL\u003c/CCCountryCode\u003e\r\n    \u003cCCCSCCode\u003e455\u003c/CCCSCCode\u003e\r\n    \u003cCCVoiceAuthCode /\u003e\r\n\u003c/creditcard\u003e","ShoppingBagXML":"\u003c?xml version=\u00271.0\u0027 encoding=\u0027UTF-8\u0027?\u003e\r\n\u003cshoppingbag\u003e\r\n    \u003cCompanyCode\u003e750\u003c/CompanyCode\u003e\r\n    \u003cCoBrandCode\u003ecbnv\u003c/CoBrandCode\u003e\r\n    \u003cBillTrackingCode /\u003e\r\n    \u003cNumberofInstallments\u003e0\u003c/NumberofInstallments\u003e\r\n    \u003cItem\u003e\r\n        \u003cItemDID\u003eEP004V866GKF9D4T4NGH\u003c/ItemDID\u003e\r\n        \u003cQuantity\u003e1\u003c/Quantity\u003e\r\n        \u003cProductID\u003eFPSPRCITDE\u003c/ProductID\u003e\r\n        \u003cUsageProductID\u003eJCPRI0DE\u003c/UsageProductID\u003e\r\n        \u003cDuration\u003e12\u003c/Duration\u003e\r\n        \u003cDurationType\u003eMonth\u003c/DurationType\u003e\r\n        \u003cRetailAmount\u003e500.00\u003c/RetailAmount\u003e\r\n    \u003c/Item\u003e\r\n\u003c/shoppingbag\u003e","PostingPath":null}'
    @results = JSON.parse resdecode

    @invoice_vm = InvoiceVm.new()
    @invoice_vm = get_invoices(@results)#.paginate(per_page: 10, page: params[:page])
   # session[:invoice_vm]  = @invoice_vm
   # @page_results = @invoice_vm.invoices.paginate(per_page: 10, page: params[:page])
    session[:cbinvoice] = CbInvoice
    @page_results = CbInvoice.paginate(per_page: 10, page: params[:page])
    respond_to do |format|
      format.html {render :action => 'show', :invoice_vm => @invoice_vm}
      format.json { render json: @page_results }
    end
  end

  private

  def sort_column
    CbInvoice.column_names.include?(params[:sort]) ? params[:sort] : "invoice_number"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
