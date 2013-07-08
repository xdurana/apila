module AwareLibrary
  class Query

    def initialize(params)
    	@params = params
    	@apisummon = APISummon.new
    end

    def apis
      @apisummon
    end

    def keyword
      @params[:keyword]
    end

    def query
      @params.reject {|key,value| !key.start_with? "s" }
    end

    def response(data)
      data
    end

    def search
      apis.search(query)
    end

    def documents
      list = Array.new
      search = apis.get_documents(keyword)
      search.documents.each do |document|
        list << {
          :item => Item.new(document)
        }
      end
      response({
        :items => list
      })
    end

    def conferences
      response(publications(apis.get_conferences(keyword)))
    end

    def journals
      response(publications(apis.get_journals(keyword)))
    end

    def publications(search)
      publications = Hash.new { |h,k| h[k] = [] }
      search.documents.each do |document|
        title = document.publication_title
        publications[title] << Item.new(document) if title
      end
      list = Array.new
      publications.each do |title, items|
        link = apis.get_publication_link(title, keyword)
        list << {
          :publication => Publication.new(title, link, items)
        }
      end
      list.sort! { |x, y| x[:publication].count <=> y[:publication].count }
      { :publications => list.reverse }
    end

  end
end