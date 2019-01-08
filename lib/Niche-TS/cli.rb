class Niche-TS::CLI
  
  def call
        Niche-TS::Scraper.new.create_schools

        run
    end
    
    def run
        print_school_list
        
        puts "Enter the number of the Theatre school you would like to get " \
        "more information on, or type 'exit' to quit."

        input = gets.strip  
        
        # Invalid input handling
        while !(input == 'exit' || input.to_i >= 1 && input.to_i <= 30)
            puts "Input was invalid. Please try again."
            input = gets.strip
        end
        
        if input != "exit"
	            print_school_detail(Niche-TS::School.find_by_rank(input))
	            
	            puts "Type 'back' to return to college list, or 'exit' to quit."
	             input_2 = gets.strip  ##INPUT
	            
	            # Invalid input handling
	      while !(input_2 == 'exit' || input_2 == 'back')
	            puts "Input was invalid. Please try again."
	             input_2 = gets.strip
	      end
	            
	      if input_2 == "back"
	         run
	      end
	   end
	 end
	    
	    def print_school_list
	        puts ""
	        puts "------ Niche.com 2019 Best Colleges for Performing Arts in America ------"
	        puts ""
	

         Niche-TS::School.all.each do |school|
	       puts "  #{school.rank} " + " #{school.name}, #{school.location}"
	   end
	

	        puts ""
	    end
	

	    def print_school_detail(school)
	        puts ""
	        print " #{school.name}, #{school.location} "
	        puts ""
	        puts "Rank: " + "#{school.rank}"
	        puts ""
	        puts "Acceptance Rate: " + "#{school.acceptance_rate"
	        puts ""
	        puts "Average Annual Cost: " + "#{school.cost}”
	        puts "School Website: " + "#{school.url}"
	        
	   end
	 end
	        
	        
	       