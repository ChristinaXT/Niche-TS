class Niche_TS::Scraper


	    def get_page
	        doc = Nokogiri::HTML(open("https://www.niche.com/colleges/search/best-colleges-for-theater/"))
	    end

	    def scrape_schools_index
	      self.get_page.css("div.search-result")
			
	    end

    
			def scrape_school_details(school)
				url = school.url
				binding.pry
				doc = Nokogiri::HTML(open(url))
        
			
				school.location = doc.css("profile__address").text
				
	 			cost = doc.css("div.scalar__value").text
	 			acceptance_rate = doc.css("scalar").text

  

			end


	    def create_schools
        scrape_schools_index.each do |school_xml|
            Niche_TS::School.new_from_index_xml_page(school_xml)
        end
        Niche_TS::School
    end
end