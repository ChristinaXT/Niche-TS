class Niche_TS::Scraper
	

	    def get_page
	        doc = Nokogiri::HTML(open("https://www.niche.com/colleges/search/best-colleges-for-theater/"))
	    end
	    
	    def scrape_schools_index
	      self.get_page.css ("#maincontent > div > div > section > div.search-results > ol")
	    end
	    
	    def create_schools
        scrape_schools_index.each do |school_xml|
            Niche_TS::School.new_from_index_xml_page(school_xml)
        end
        Niche_TS::School.all
    end
end
	    