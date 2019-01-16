class Niche-TS::School
	

	    attr_accessor :name, :location, :url,  :rank, :cost, :acceptance_rate
	

	    @@all = []
	    
	    def self.new_from_index_xml(school_xml)
	        self.new(
	            school_xml.css("h2 class="search-result__title").text, #name
	            school_xml.css("<div class="profile__address”>”).text, #location
	            school_xml.css("div class="<div class="rankings__collection__ranking"><span class="rankings__collection__ordinal">1</span> of<!-- --> 247</div>")[0].text, #rank
	            "https://www.niche.com/colleges/search/best-colleges-for-theater/" + school_xml.css("<div class="profile__website__label">Website</div>")[0].attribute('href').value, #url
	            school_xml.css("<span class="bare-value">").text.strip, #description
	        )
	    end
	   
	
	    def initialize(name=nil, location=nil, rank=nil, url=nil, cost=nil, acceptance_rate=nil)
	        @name = name
	        @location = location
	        @rank = rank
	        @url = url
	        @cost = cost
          @acceptance_rate = acceptance_rate
	        @@all << self
	    end
	    
	    def doc
        Nokogiri::HTML(open(self.url))
    end
    
     def self.find_by_rank(search_rank)
        all.each do |school|
            if school.rank == search_rank
                return school
            end
        end
end 