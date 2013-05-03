require 'test_helper'

class InvoiceControllerTest < ActionController::TestCase

  test "should show index" do
    get :index
    assert_response :success
  end

  test "should show show" do
    post :get_invoices_by_accountdid, :account_did => 'A0001470XXTJDVY3G4C'
    get :show
    assert_response :success
  end

  test "should get_invoices_by_accountdid" do

    post :get_invoices_by_accountdid, :account_did => 'A0001470XXTJDVY3G4C'
    # assert_response :success
    assert_routing 'invoice/show',{:action => 'show',:controller => 'invoice'}
  end
end