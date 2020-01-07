class DecisionMaker

  def pick_resource(user_info)
    resource = user_info[:resource_preferences].sample
  end

  def generate_resource(resource)
    if resource == 'media'
      photo = MediaDecision.new
      photo.get_photo
    end

    if resource == 'music'
      song = MusicDecision.new
      song.get_song
    end
  end

end
