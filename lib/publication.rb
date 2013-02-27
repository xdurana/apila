module AwareLibrary
	class Publication

		def initialize(title, link, items)
			@title = title
			@link = link
			@items = items
		end

		def count
			@items.count
		end

		def to_hash
			hash = {
        :title => @title,
        :link => @link,
        :count => self.count,
        :items => @items
      }
    end
	end
end