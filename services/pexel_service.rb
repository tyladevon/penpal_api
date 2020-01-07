require 'faraday'

class PexelService

  def self.get_photo(pref)
    self.get_json(pref)[:photos].sample[:url]
  end

  private

  def self.connection(pref)
    Faraday.new(url: 'https://api.pexels.com/v1/search?') do |f|
      f.params[:query] = pref
      f.headers[:Authorization] = '563492ad6f917000010000017946788e05ac45fca7d0980652b59263'
      f.adapter Faraday.default_adapter
    end

  end

  def self.get_json(pref)
    response = self.connection(pref).get
    JSON.parse(response.body, symbolize_names: true)
  end

end
require "pry"; binding.pry
