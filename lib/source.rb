module AwareLibrary
  class Source

    @@apisummon = APISummon.new

    def self.apis
      @@apisummon
    end

    def self.search_documents(term)
      search = apis.get_documents(term)
    end

    def self.search_conferences(term)
      search = apis.get_conferences(term)
      get_publications(search, term)
    end

    def self.search_journals(term)
      search = apis.get_journals(term)
      get_publications(search, term)
    end

    def self.get_publications(search, term)
      publications = Hash.new(0)
      search.documents.each do |document|
        if document.publication_title
          publications[document.publication_title] += 1
        end
      end
      list = Array.new
      publications.each do |title, count|
        link = apis.get_publication_link(title, term)
        list << {
          :title => title,
          :count => count,
          :link => link
        }
      end
      list.sort! { |x, y| x[:count] <=> y[:count]}
      list.reverse.to_json
    end

  end
end