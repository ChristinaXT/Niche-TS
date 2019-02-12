class Niche_TS::School
	
	  @@all = []
  
	    attr_accessor :name, :location, :url,  :rank, :cost, :acceptance_rate
	
	    def self.all
    @@all
      end

	    
	   def self.new_from_index_xml_page(school_xml)
	        self.new(
	          
	            school_xml.css("h2.search-result__title").text #name
	            school_xml.css("span.search-result-badge-ordinal").text #rank
	            school_xml.css("li.search-result-tagline_item").text #location
	            school_xml.css("div.search-result-fact").text #acceptance_rate
	            school_xml.css("span.search-result-fact__value").text #cost
	            school_xml.css("a.search-result__link")[0].attribute('href').value #url
	          )
	    end
	
	    def initialize(name=nil, rank=nil, location=nil, acceptance_rate=nil, cost=nil, url=nil)
	        @name = name
	        @rank = rank
	        @location = location
	        @acceptance_rate = acceptance_rate
	        @cost = cost
	        @url = url
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
	      
end 
end