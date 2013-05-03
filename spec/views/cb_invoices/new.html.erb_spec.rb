require 'spec_helper'

describe "cb_invoices/new" do
  before(:each) do
    assign(:cb_invoice, stub_model(CbInvoice,
      :did => "MyString",
      :invoice_number => "MyString",
      :bill_company_name => "MyString",
      :status => "MyString",
      :total => "9.99"
    ).as_new_record)
  end

  it "renders new cb_invoice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cb_invoices_path, "post" do
      assert_select "input#cb_invoice_did[name=?]", "cb_invoice[did]"
      assert_select "input#cb_invoice_invoice_number[name=?]", "cb_invoice[invoice_number]"
      assert_select "input#cb_invoice_bill_company_name[name=?]", "cb_invoice[bill_company_name]"
      assert_select "input#cb_invoice_status[name=?]", "cb_invoice[status]"
      assert_select "input#cb_invoice_total[name=?]", "cb_invoice[total]"
    end
  end
end
