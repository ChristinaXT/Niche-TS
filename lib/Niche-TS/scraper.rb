class Niche-TS::Scraper
	

	    def get_page
	        doc = Nokogiri::HTML(open("https://www.niche.com/colleges/search/best-colleges-for-theater/"))
	    end
	    
	    