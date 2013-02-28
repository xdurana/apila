module AwareLibrary
  class APISummon

    def initialize
      @credentials = YAML.load_file("config/summon.yml")
      @service = Summon::Service.new(
        :access_id => @credentials["access_id"],
        :secret_key => @credentials["secret_key"]
      )
    end

    def get_documents(term)
      search = @service.search(
        "s.q" => term,
        "s.hl" => false,
        "s.pn" => 1,
        "s.ps" => 40
      )
    end

    def get_conferences(term)
      search = @service.search(
        "s.q" => term,
        "s.fvf" => "ContentType,Conference Proceeding",
        "s.hl" => false,
        "s.pn" => 1,
        "s.ps" => 40
      )  
    end

    def get_journals(term)
      search = @service.search(
        "s.q" => term,
        "s.fvf" => "ContentType,Journal Article",
        "s.hl" => false,
        "s.pn" => 1,
        "s.ps" => 40
      )  
    end

    def get_publication_link(name, term)
      "#{@credentials["base_url"]}search?s.cmd=setHoldingsOnly(false)&t.publicationtitle=#{name}&fsv=ContentType,#{term}"
    end

  end
end