require 'spec_helper'

describe "cb_invoices/show" do
  before(:each) do
    @cb_invoice = assign(:cb_invoice, stub_model(CbInvoice,
      :did => "Did",
      :invoice_number => "Invoice Number",
      :bill_company_name => "Bill Company Name",
      :status => "Status",
      :total => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Did/)
    rendered.should match(/Invoice Number/)
    rendered.should match(/Bill Company Name/)
    rendered.should match(/Status/)
    rendered.should match(/9.99/)
  end
end
