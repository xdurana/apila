module AwareLibrary
	class API_v1 < Grape::API
		version 'v1', :using => :path

		resource :system do
			desc "Hello world"
			get :hello do
				{ :hello => 'world' }
			end
		end

		resource :summon do
			desc "Get the documents related to a term"
			params do
        requires :term, :type => String, :desc => "Term"
      end			
			get :documents do
				Source.search_documents(params[:term])
			end

			desc "Get the conferences related to a term"
			params do
        requires :term, :type => String, :desc => "Term"
      end			
			get :conferences do
				Source.search_conferences(params[:term])
			end

			desc "Get the journals related to a term"
			params do
        requires :term, :type => String, :desc => "Term"
      end			
			get :journals do
				Source.search_journals(params[:term])
			end
		end
	end
end