require 'spec_helper'

describe "cb_invoices/index" do
  before(:each) do
    assign(:cb_invoices, [
      stub_model(CbInvoice,
        :did => "Did",
        :invoice_number => "Invoice Number",
        :bill_company_name => "Bill Company Name",
        :status => "Status",
        :total => "9.99"
      ),
      stub_model(CbInvoice,
        :did => "Did",
        :invoice_number => "Invoice Number",
        :bill_company_name => "Bill Company Name",
        :status => "Status",
        :total => "9.99"
      )
    ])
  end

  it "renders a list of cb_invoices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Did".to_s, :count => 2
    assert_select "tr>td", :text => "Invoice Number".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
