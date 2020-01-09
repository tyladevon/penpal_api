class BuddyResource
  attr_reader :type, :data

  def initialize(user_info)
    @type = 'buds'
    @data = nil
  end
end
