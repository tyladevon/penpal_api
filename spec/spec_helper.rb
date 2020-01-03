ENV["RACK_ENV"] = "test"
require 'bundler'
require 'simplecov'
require 'capybara/dsl'

Bundler.require(:default, :test)
require File.expand_path('../../config/environment.rb', __FILE__)
SimpleCov.start

Capybara.app = PenpalApi
Capybara.save_path = 'tmp/capybara'

RSpec.configure do |c|
  c.include Capybara::DSL
end
