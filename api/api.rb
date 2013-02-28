module AwareLibrary
	class API < Grape::API
		prefix 'api'
		format :json

	  helpers do
	    def logger
	      API.logger
	    end
	  end
	  
    rescue_from :all do |e|
	    rack_response({ :message => "rescued from #{e.class.name}" })
	  end

 		mount ::AwareLibrary::API_v1

	end

	class Presenter
		def initialize(data)
			@data = data
		end
		def to_hash
      {
    		:version => 1,
    		:data => @data
     	}
		end
	end

end