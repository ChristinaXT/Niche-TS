class Niche_TS::Scraper
	 def get_page
	   doc = Nokogiri::HTML(open("https://www.niche.com/colleges/search/best-colleges-for-theater/"))
	 end

	 def scrape_schools_index
	   self.get_page.css("div.search-result")	
	 end
    
	 def scrape_school_details(school)
		 @@school = school
		 doc = Nokogiri::HTML(open(school.url))
		 school.description = doc.css("span.bare-value").text
	 end
       
   def create_schools
     scrape_schools_index.each do |school_xml|
     Niche_TS::Scraper.new_from_index_xml_page(school_xml)
   end
     Niche_TS::School
    end
    
  def self.new_from_index_xml_page(school_xml)
	   Niche_TS::School.new(
	          
	    school_xml.css("h2.search-result__title").text, #name
	    school_xml.css("span.search-result-badge-ordinal").text, #rank
	    school_xml.css("li.search-result-tagline__item")[1].text, #location
	    school_xml.css("div.search-result-fact")[0].text, #acceptance_rate
	    school_xml.css("div.search-result-fact")[1].text, #cost
	    school_xml.css("a.search-result__link")[0].attribute('href').value #url
	         )
  end
	    
	def doc
    Nokogiri::HTML(open(self.url))
  end
     
end
