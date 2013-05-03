require 'spec_helper'

describe "CbInvoices" do
  describe "GET /cb_invoices" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get cb_invoices_path
      response.status.should be(200)
    end
  end
end
