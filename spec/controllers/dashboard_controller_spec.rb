require 'spec_helper'

describe DashboardController do

  describe "GET 'index'" do
    xit "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

end
