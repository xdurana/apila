module AwareLibrary
  class Query
    
    def initialize(path, term)
    	@path = path
    	@term = term
    	@apisummon = APISummon.new
    end

    def apis
      @apisummon
    end

    def response(data)
      Log.info({
        :datetime => Time.now,
        :term => @term
      })
      data
    end

    def documents
      list = Array.new
      search = apis.get_documents(@term)
      search.documents.each do |document|
        list << {
          :item => Item.new(document)
        }
      end
      response({ :items => list })
    end

    def conferences
      response(publications(apis.get_conferences(@term)))
    end

    def journals
      response(publications(apis.get_journals(@term)))
    end

    def publications(search)
      publications = Hash.new { |h,k| h[k] = [] }
      search.documents.each do |document|
        title = document.publication_title
        publications[title] << Item.new(document) if title
      end
      list = Array.new
      publications.each do |title, items|
        link = apis.get_publication_link(title, @term)
        list << {
          :publication => Publication.new(title, link, items)
        }
      end
      list.sort! { |x, y| x[:publication].count <=> y[:publication].count }
      { :publications => list.reverse }
    end

    def log
    	response(Log.all)
    end

  end
end