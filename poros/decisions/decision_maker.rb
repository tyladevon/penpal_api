class DecisionMaker

  def self.initialize(user_info)
    @resource = user_info[:resource_preferences].sample
  end

  def self.generate_resource
    Object.const_get(@resource.capitalize + 'Resource').new(user_info)
  end


end
