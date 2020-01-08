require 'sinatra'

get '/api/v1/suggestion' do
  resource = DecisionMaker.get_suggestion(user_info)
  render json: Object.const_get(resource.type + 'ResourceSerializer').new(resource)
end
