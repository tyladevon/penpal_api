require 'faraday'
require 'figaro'

class SpotifyService
  def self.get_song(pref, token)
    json = elf.get_json(pref, token)
    { song_name: json[:tracks][0][:name],
      artist_name: json[:tracks][0][:artists][0][:name],
      song_url: json[:tracks][0][:external_urls][:spotify],
      image: json[:tracks][0][:album][:images][1][:url],
      track_id: json[:tracks][0][:id] }
  end

  private

    def self.connection(pref, token)
      Faraday.new(url: 'https://api.spotify.com/v1/recommendations') do |f|
        f.authorization :Bearer, token
        f.request :url_encoded
        f.params[:seed_genres] = pref
        f.params[:limit] = 1
        f.adapter Faraday.default_adapter
      end
    end

    def self.get_json(pref, token)
      response = self.connection(pref, token).get
      JSON.parse(response.body, symbolize_names: true)
    end
end
