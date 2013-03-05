module AwareLibrary
	module JSONable
	  def as_json(*a)
	    self.class.attrs.inject({}) do |json, attr|
	      json.merge attr.name => self.send(attr.name)
	    end.to_json(*a)
	  end
	end
end