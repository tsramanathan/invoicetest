require 'spec_helper'

describe SamlController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'consume'" do
    it "returns http success" do
      get 'consume'
      response.should be_success
    end
  end

  describe "GET 'complete'" do
    it "returns http success" do
      get 'complete'
      response.should be_success
    end
  end

  describe "GET 'fail'" do
    it "returns http success" do
      get 'fail'
      response.should be_success
    end
  end

end
