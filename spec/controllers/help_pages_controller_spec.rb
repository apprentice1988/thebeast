require 'spec_helper'

describe HelpPagesController do

  subject {page}

  describe "faq page" do
    before {visit faq_path}

    it {should have_selector('h5', text: "Q：为什么我收到的花跟网上的图片不太一样？")}
  end

  describe "newbieguide page" do
    before {visit newbieguide_path}

    it {should have_selector('h5', text: "新用户注册)}
    end
  end

  describe "afterservice page" do
    before {visit afterservice_path}

    it {should have_selector('h5', text: "投诉方式")}
  end

  describe "shippingintro page" do
    before {visit afterservice_path}

    it {should have_selector('h5', text: "投诉方式")}
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

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

end
