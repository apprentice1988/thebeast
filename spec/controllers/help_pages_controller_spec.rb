require 'spec_helper'

describe HelpPagesController do

  subject {page}

  describe "GET 'faq'" do
    it "returns http success" do
      get 'faq'
      response.should be_success
    end
  end

  describe "GET 'newbieguide'" do
    it "returns http success" do
      get 'newbieguide'
      response.should be_success
    end
  end

  describe "GET 'afterservice'" do
    it "returns http success" do
      get 'afterservice'
      response.should be_success
    end
  end

  describe "GET 'shippingintro'" do
    it "returns http success" do
      get 'shippingintro'
      response.should be_success
    end
  end

  describe "GET 'privacy'" do
    it "returns http success" do
      get 'privacy'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
  end
end
