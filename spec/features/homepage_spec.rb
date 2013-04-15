require 'spec_helper'

include ApplicationHelper

include Warden::Test::Helpers
Warden.test_mode!

describe "homepage" do

  before :each do
    @user = FactoryGirl.create(
      :user,
      :email    => 'testem@stormsavvy.com',
      :password => 'testem',
      :password_confirmation => 'testem'
    )
  end

  it "renders sign-in page" do
    visit '/index'
    page.should have_text('Sign in')
    page.should have_text('Making SWPPP Easy')
    page.should have_text('Free Email Alerts & Reports')
    page.should have_text('Sign Up Now For Free Access')
  end

  it "signs user in with correct credentials" do
    visit '/users/sign_in' 
    fill_in 'Email', :with => 'testem@stormsavvy.com'
    fill_in 'Password', :with => 'testem'
    click_button 'Sign in'
    page.should have_content 'Signed in successfully.'
  end

  it "signs in as another user" do
    visit '/users/sign_in'
    fill_in 'Email', :with => 'barney@stormsavvy.com'
    fill_in 'Password', :with => 'foobarbaz'
    click_button 'Sign in'
    page.should have_content 'Invalid email or password'
  end

  it "renders correct links and pages after login" do
    visit '/users/sign_in' 
    fill_in 'Email', :with => 'testem@stormsavvy.com'
    fill_in 'Password', :with => 'testem'
    click_button 'Sign in'

    click_link "Inspections"
    visit new_inspection_event_path
    current_path.should == new_inspection_event_path

    click_link "Settings"
    current_path.should == edit_user_registration_path

    click_link "Sign out"
    current_path.should == '/index'
  end

  it "renders correct links and pages from home page" do
    visit '/index'
    click_link "Privacy"
    current_path.should == privacy_path

    visit '/index'
    click_link "Terms"
    current_path.should == terms_path

    visit '/index'
    click_link "Sign in"
    current_path.should == new_user_session_path
  end
end
