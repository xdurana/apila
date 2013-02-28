module AwareLibrary	
	class Log
		@db = Mongo::MongoClient.new.db("aware-library")		
		def self.info(data)
			@db.collection('logs').insert(data)
		end
		def self.all
			@db.collection('logs').find
		end
	end
end