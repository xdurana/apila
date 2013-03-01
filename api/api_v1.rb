module AwareLibrary
	class API_v1 < Grape::API

		version 'v1', :using => :path

		resource :status do
	
      get :ping do
        Presenter.new({
        	:status => 'ok',
        	:data => 'pong'
       	})
      end

			get :log do
				Presenter.new(Query.new(:log, nil).log)
			end
	
		end

		resource :summon do

			desc "Get the bare response"
			get :search do
				Presenter.new({
					:route => route,
					:query => Query.new(params).search
				})
			end

		end

		resource :uoc do

			desc "Get the documents related to a term"
			params do
        requires :term, :type => String, :desc => "Term"
      end			
			get :documents do
				Presenter.new(Query.new(params).documents)
			end

			desc "Get the conferences related to a term"
			params do
        requires :term, :type => String, :desc => "Term"
      end			
			get :conferences do
				Presenter.new(Query.new(params).conferences)
			end

			desc "Get the journals related to a term"
			params do
        requires :term, :type => String, :desc => "Term"
      end			
			get :journals do
				Presenter.new(Query.new(params).journals)
			end

		end
	end

end