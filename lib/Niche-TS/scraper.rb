class Niche-TS::Scraper
	

	    def get_page
	        doc = Nokogiri::HTML(open("https://www.niche.com/colleges/search/best-colleges-for-theater/"))
	    end
	    
	    def scrape_schools
	      get_page.css ("tbody.single-school-cell")
	    end
	    
	    def create_schools
        scrape_schools.each do |school_xml|
            Niche-TS::School.new_from_xml(school_xml)
        end
        Niche-TS::School.all
    end
end
	    