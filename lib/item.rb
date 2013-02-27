module AwareLibrary
	class Item
		def initialize(document)
			@document = document
		end

		def to_hash
			hash = {
				:title => @document.title,
				:link => @document.link
			}
    end
	end
end