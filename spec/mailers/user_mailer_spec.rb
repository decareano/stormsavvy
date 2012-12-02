require "spec_helper"

describe UserMailer do

  before { ActionMailer::Base.deliveries = [] }

  before(:each) do

    @user = FactoryGirl.create(:user)
    @project = FactoryGirl.create(:project)
    @site = FactoryGirl.create(:site)

    @project1 = @user.projects.new(
      :name => 'ec park and rec',
      :description => 'playground improvements',
      :startdate => DateTime.new(2011),
      :finishdate => DateTime.new(2012)
      )
    @project1.save

    @site1 = @project1.sites.new(
      :name => 'ec jungle gym',
      :zipcode => 94530
      )
    @site1.save

    @site2 = @project1.sites.new(
      :name => 'ec playground',
      :zipcode => 94530
      )
    @site2.save
  end

  describe "pester_admins" do

    before(:each) do
      @receipient = "walter@stormsavvy.com"
      @mailer = UserMailer.mailout(@recipient).deliver
    end

    it "should send something via mailout" do
      ActionMailer::Base.deliveries.should_not be_empty
    end

    it "should render successfully" do
      lambda { @mailer }.should_not raise_error
    end

    it "should not have empty text body" do
      @mailer.body.should_not be_nil
      # @mailer.body.should have_selector("ul.projects")
      # @mailer.body.should have_selector("ul.sites")
      # @mailer.body.should have_selector('.chance-of-rain', :text => 'chance of rain')
    end

    it "renders user, project and site count" do
      @numprojects.should_not be_nil
      @numusers.should_not be_nil
      @numsites.should_not be_nil
    end

    it "renders forecast table" do
      @forecast.should_not be_nil
    end
  end

  describe "mailout mailer" do

    # TODO: Debug project factory table
    before(:each) do
      @receipient = "walter@stormsavvy.com"
      @mailer = UserMailer.mailout(@recipient).deliver
    end

    it "should send something via mailout" do
      ActionMailer::Base.deliveries.should_not be_empty
    end

    it "should render successfully" do
      lambda { @mailer }.should_not raise_error
    end

    it "should have text in body" do
      @mailer.body.should_not be_empty
      # @mailer.body.should have_selector("ul.projects")
      # @mailer.body.should have_selector("ul.sites")
      # @mailer.body.should have_selector('.chance-of-rain', :text => 'chance of rain')
    end
  end

end
