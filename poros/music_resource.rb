require './services/spotify_service'

class MusicResource
  attr_reader :type, :data

  def initialize(user_info)
    @type = 'music'
    @token = user_info[:spotify_token]
    @data = { url: get_music(user_info[:music_preferences])[:song_url],
              song_name: get_music(user_info[:music_preferences])[:song_name],
              artist_name: get_music(user_info[:music_preferences])[:artist_name],
              image: get_music(user_info[:music_preferences])[:image] }
  end

  def get_music(music_pref)
    @song ||= SpotifyService.get_song(music_pref.sample, @token) 
  end

end
