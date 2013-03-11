require 'spec_helper'

describe AccountsController do

  describe "GET 'basicinfo'" do
    it "returns http success" do
      get 'basicinfo'
      response.should be_success
    end
  end

  describe "GET 'deliveraddress'" do
    it "returns http success" do
      get 'deliveraddress'
      response.should be_success
    end
  end

  describe "GET 'ordersinfo'" do
    it "returns http success" do
      get 'ordersinfo'
      response.should be_success
    end
  end

  describe "GET 'subscriptioninfo'" do
    it "returns http success" do
      get 'subscriptioninfo'
      response.should be_success
    end
  end

  describe "GET 'myinvitation'" do
    it "returns http success" do
      get 'myinvitation'
      response.should be_success
    end
  end

  describe "GET 'cancelapplication'" do
    it "returns http success" do
      get 'cancelapplication'
      response.should be_success
    end
  end

end
