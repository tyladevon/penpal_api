class ActivityResource
  attr_reader :type, :data

  def initialize(user_info)
    @type = 'activity'
    @data = nil
  end

end
