module AwareLibrary
	class API_v1 < Grape::API
		version 'v1', :using => :path
		resource :system do
			desc "hello world"
			get :hello do
				{ :hello => 'world' }
			end
		end
	end
end