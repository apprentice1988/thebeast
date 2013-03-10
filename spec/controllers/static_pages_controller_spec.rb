require 'spec_helper'

describe StaticPagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'newproduct'" do
    it "returns http success" do
      get 'newproduct'
      response.should be_success
    end
  end

  describe "GET 'beastflower'" do
    it "returns http success" do
      get 'beastflower'
      response.should be_success
    end
  end

  describe "GET 'fragrance'" do
    it "returns http success" do
      get 'fragrance'
      response.should be_success
    end
  end

  describe "GET 'clothes'" do
    it "returns http success" do
      get 'clothes'
      response.should be_success
    end
  end

  describe "GET 'grocery'" do
    it "returns http success" do
      get 'grocery'
      response.should be_success
    end
  end

  describe "GET 'gift'" do
    it "returns http success" do
      get 'gift'
      response.should be_success
    end
  end

  describe "GET 'cooperation'" do
    it "returns http success" do
      get 'cooperation'
      response.should be_success
    end
  end

  describe "GET 'story'" do
    it "returns http success" do
      get 'story'
      response.should be_success
    end
  end

end
