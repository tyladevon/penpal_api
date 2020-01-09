require 'rack/test'
require 'rspec'
require 'pry'
require 'vcr'
require 'webmock/rspec'
require 'shoulda/matchers'
ENV['RACK_ENV'] = 'test'
require File.expand_path '../../routes.rb', __FILE__
module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end
# For RSpec 2.x and 3.x
RSpec.configure { |c| c.include RSpecMixin }
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec    # Keep as many of these lines as are necessary:
  end
end
VCR.configure do |config|
  config.ignore_localhost = true
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  # config.default_cassette_options = { :match_requests_on => [:method,
  #   VCR.request_matchers.uri_without_param(:access_token, :apikey)] }
  config.filter_sensitive_data("<PEXEL_API_KEY>") { ENV['PEXEL_API_KEY'] }
  config.filter_sensitive_data("<SPOTIFY_ACCESS_TOKEN>") { ENV['SPOTIFY_ACCESS_TOKEN'] }
end
