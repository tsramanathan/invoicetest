require 'test_helper'

class PdfControllerTest < ActionController::TestCase
  test "should show index" do
    post :index, :id => 'I006BM6RFLQLWJVB4BM'
    assert_response :success
  end
end