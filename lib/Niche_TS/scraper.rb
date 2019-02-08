class Niche_TS::Scraper


	    def get_page
	        doc = Nokogiri::HTML(open("https://www.niche.com/colleges/search/best-colleges-for-theater/"))
	    end

	    def scrape_schools_index
	      self.get_page.css ("skip-to-main-content__link")
				#href="#maincontent"
	    end

			def scrape_school_details(school)
				doc = Nokogiri::HTML(open(url))

				school_details = {
				:location => doc.css("profile__address").text,
				:rank => doc.css("span.rankings__collection__ordinal").text,
	      :url => doc.css("a.profile__website__link").text,
	 			:cost => doc.css("div.scalar__value").text,
	 			:acceptance_rate => doc.css("scalar").text,

    }

			end


	    def create_schools
        scrape_schools_index.each do |school_xml|
            Niche_TS::School.new_from_index_xml_page(school_xml)
        end
        Niche_TS::School
    end
end