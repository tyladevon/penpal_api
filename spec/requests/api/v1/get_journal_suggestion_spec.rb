require 'spec_helper'
require './poros/decision_maker'
require 'json'
require 'dotenv'
Dotenv.load

RSpec.describe 'PenpalApi' do
  it 'receives a journal suggestion request with user info' do
    json_response = File.read('./spec/fixtures/journal_resource_response.json')
    user_info = {
      current_feeling: 'sad',
      feeling_preferences: ['sad', 'down'],
      resource_preferences: ['journal'],
      media_preferences: { dogs: true, cats: false, animals: true, babies: false, celestial: false, landscapes: false }}.to_json

    stub_request(:get, '/api/v1/suggestion').with(query: { user_info: user_info }).to_return(status: 200, body: json_response)
  end
end
