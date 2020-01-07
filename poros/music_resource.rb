class MusicResource

  def initialize(user_info)
    @type = 'music'
    @data = { url: get_music(user_info[:music_preferences])[:song_url], song_name: get_music(user_info[:music_preferences])[:song_name]  }
  end

  def get_music(music_pref)
    @song || = begin
      service = SpotifyService.new
      service.get_song(music_pref.sample)
    end
  end

end
