require 'spec_helper'

include ApplicationHelper

include Warden::Test::Helpers
Warden.test_mode!

describe "Projects" do

	before :each do
		@user = FactoryGirl.create(
      :user,
      :email    => 'name@stormsavvy.com',
      :password => 'autospec1',
      :password_confirmation => 'autospec1'
    )
    login_as(@user, :scope => :user)
    visit '/projects/new'
  end

  describe "GET /projects", :type => :feature do

    it "correct content on homepage" do
      current_path.should == new_project_path
      page.should have_content('New Project')
      page.body.should_not be_nil
      click_link 'Storm Savvy'
      page.should have_selector('a', :text => 'Storm Savvy')
    end

		it "saves the new project" do
      visit new_project_path
      current_path.should == new_project_path
      page.should have_content('New Project')
      fill_in 'Name', :with => 'ECP Improvements'
      fill_in 'Description', :with => 'Jungle Gym, etc.'
      click_button 'Save'
      page.should have_content('Project was successfully created.')
      current_path.should == '/projects'
    end

  end
end
