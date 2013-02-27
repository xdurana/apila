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
      publications = Hash.new { |h,k| h[k] = [] }
      search.documents.each do |document|
        title = document.publication_title
        publications[title] << Item.new(document) if title
      end
      list = Array.new
      publications.each do |title, items|
        list << {
          :publication => {
            :title => title,
            :link => apis.get_publication_link(title, term),
            :count => items.count,
            :items => items
          }
        }
      end
      list.sort! { |x, y| x[:count] <=> y[:count]}
      list.reverse
    end

  end
end