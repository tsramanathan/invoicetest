require "spec_helper"

describe CbInvoicesController do
  describe "routing" do

    it "routes to #index" do
      get("/cb_invoices").should route_to("cb_invoices#index")
    end

    it "routes to #new" do
      get("/cb_invoices/new").should route_to("cb_invoices#new")
    end

    it "routes to #show" do
      get("/cb_invoices/1").should route_to("cb_invoices#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cb_invoices/1/edit").should route_to("cb_invoices#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cb_invoices").should route_to("cb_invoices#create")
    end

    it "routes to #update" do
      put("/cb_invoices/1").should route_to("cb_invoices#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cb_invoices/1").should route_to("cb_invoices#destroy", :id => "1")
    end

  end
end
