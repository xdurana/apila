module AwareLibrary
	class API < Grape::API
		prefix 'api'
		format :json
		mount ::AwareLibrary::API_v1
	end
end