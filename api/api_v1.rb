module AwareLibrary
	class API_v1 < Grape::API
		
		version 'v1', :using => :path

		resource :system do
	
			desc "Get the log"
			get :log do
				Presenter.new(Query.new(:log, nil).log)
			end
	
		end

		resource :summon do

			desc "Get the bare response"
			params do
        requires :term, :type => String, :desc => "Term"
      end			
			get :search do
				Presenter.new(Query.new(:search, params[:term]).search)
			end

			desc "Get the documents related to a term"
			params do
        requires :term, :type => String, :desc => "Term"
      end			
			get :documents do
				Presenter.new(Query.new(:documents, params[:term]).documents)
			end

			desc "Get the conferences related to a term"
			params do
        requires :term, :type => String, :desc => "Term"
      end			
			get :conferences do
				Presenter.new(Query.new(:conferences, params[:term]).conferences)
			end

			desc "Get the journals related to a term"
			params do
        requires :term, :type => String, :desc => "Term"
      end			
			get :journals do
				Presenter.new(Query.new(:journals, params[:term]).journals)
			end

		end
	end

end