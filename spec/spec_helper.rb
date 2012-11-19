require 'rubygems'
require 'spork'

# Prawn spec setup:
require "devise"
require "prawn"
require "pdf/reader"
require "pdf/inspector"
require "email_spec"
require 'capybara/rspec'


RSpec.configure do |config|
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)
  config.include Devise::TestHelpers, :type => :controller
end

Prawn.debug = true

def create_pdf(klass=Prawn::Document)
  @pdf = klass.new(:margin => 0)
end

# Make some methods public to assist in testing
module Prawn::Graphics
  public :map_to_absolute
end

# SimpleCov setup:
require 'simplecov'
SimpleCov.start 'rails'

#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
end


Spork.each_run do
  # This code will be run each time you run your specs.
end


# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)


  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
end
