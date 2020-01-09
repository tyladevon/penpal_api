class JournalResource
  attr_reader :type, :data
  
  def initialize(user_info)
    @type = 'journal'
    @data = nil
  end
end
