include 'faraday'

class SpotifyService

  def get_song(pref)
  end


  private

  def connection(pref)
    Faraday.new(url: '') do |f|
      f.params[:query] = pref
      f.params[:access_token] = ENV[]
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(pref)
  end


end
