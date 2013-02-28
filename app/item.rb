module AwareLibrary
	class Item
		
		def initialize(document)
			@document = document
		end

		def to_hash
			hash = {
				:title => @document.title,
				:link => @document.link,
				:id => @document.id,
				:open_url => @document.open_url,
				:subject_terms => @document.subject_terms,
				:authors => @document.authors
			}
    end

	end
end