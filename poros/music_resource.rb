class MusicResource

  def get_song
    decision = MusicDecision.new
    song = decision.get_genre
  end

end
