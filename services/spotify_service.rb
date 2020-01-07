require 'faraday'

class SpotifyService

  def self.get_song(pref, token)
    self.get_json(pref, token)
  end


  private

  def self.connection(pref, token)
    Faraday.new(url: 'https://api.spotify.com/v1//v1/search') do |f|
      f.authorization :Bearer, token
      f.request :url_encoded
      f.params[:q] = pref
      f.params[:type] = 'track'
      f.adapter Faraday.default_adapter
    end
  end

  def self.get_json(pref, token)
    response = self.connection(pref, token).get
    JSON.parse(response.body)
  end

end

require "pry"; binding.pry
