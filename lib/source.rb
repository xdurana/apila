module AwareLibrary
  class Source

    @@apisummon = APISummon.new

    def self.apis
      @@apisummon
    end

    def self.search_documents(term)
      list = Array.new
      search = apis.get_documents(term)
      search.documents.each do |document|
        list << {
          :item => Item.new(document)
        }
      end
      { :items => list }
    end

    def self.search_conferences(term)
      get_publications(apis.get_conferences(term), term)
    end

    def self.search_journals(term)
      get_publications(apis.get_journals(term), term)
    end

    def self.get_publications(search, term)
      publications = Hash.new { |h,k| h[k] = [] }
      search.documents.each do |document|
        title = document.publication_title
        publications[title] << Item.new(document) if title
      end
      list = Array.new
      publications.each do |title, items|
        link = apis.get_publication_link(title, term)
        list << {
          :publication => Publication.new(title, link, items)
        }
      end
      list.sort! { |x, y| x[:publication].count <=> y[:publication].count }
      { :publications => list.reverse }
    end

  end
end