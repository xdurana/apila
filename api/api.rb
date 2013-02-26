require 'grape'

module AwareLibrary
	class API < Grape::API
		prefix 'api'
		format :json
		version 'v1', :using => :path
		resource :system do
			desc "hello world"
			get :hello do
				{ :hello => 'world' }
			end
		end
	end
end