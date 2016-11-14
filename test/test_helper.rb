require 'minitest/reporters'
Minitest::Reporters.use!

# require 'simplecov'
# simplecov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'rails/test_help'
require 'vcr'
require 'webmock/minitest'


require 'vcr'
require 'webmock/minitest'



class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # helper method to keep api calls under limit(ish) 
  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes' # don't forget to delete these if you update your app, new ones will be recorded
    config.hook_into :webmock

    config.default_cassette_options = {:record => :new_episodes, :match_requests_on => [:method, :uri, :body]}
  end
end













