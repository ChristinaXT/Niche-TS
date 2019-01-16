require 'colorize'

class Niche-TS::CLI
  
  def call
        Niche-TS::Scraper.new.create_schools

        run
    end
    
    def run
        print_school_list
        puts "===========================================" .colorize(:blue)
        puts "WANT TO KNOW ABOUT THE TOP 10 COLLEGES FOR THEATRE?"
        puts "ENTER THE NUMBER OF THE THEATRE SCHOOL BY RANK YOU WOULD LIKE TO GET MORE INFORMATION ON, OR TYPE 'EXIT' TO QUIT.  " 
        puts "===========================================" .colorize(:blue)

        input = gets.strip  
        
        # Invalid input handling
        while !(input == 'exit' || input.to_i >= 1 && input.to_i <= 10)
            puts "Input was invalid. Please try again."
            input = gets.strip
        end
        
        if input != "exit"
	            print_school_detail(Niche-TS::School.find_by_rank(input))
	            
	            puts "Type 'back' to return to college list, or 'exit' to quit.".colorize(:yellow)
	             input_2 = gets.strip  ##INPUT
	            
	            # Invalid input handling
	      while !(input_2 == 'exit' || input_2 == 'back')
	            puts "Input was invalid. Please try again.".colorize(:red)
	             input_2 = gets.strip
	      end
	            
	      if input_2 == "back"
	         run
	      end
	   end
	 end
	    
	    def print_school_list
	        puts ""
	        puts "------ Niche.com 2019 Best Colleges for Performing Arts in America ------".colorize(:yellow)
	        puts ""
	

         Niche-TS::School.all.each do |school|
	       puts "  #{school.rank} " + " #{school.name}, #{school.location}"
	   end
	

	        puts ""
	    end
	

	    def print_school_detail(school)
	        puts ""
	        print "__________________________".colorize(:blue)
	        print " #{school.name}, #{school.location} "
	        print "__________________________".colorize(:blue)
	        puts ""
	        puts "Rank: ".colorize(:blue) + "#{school.rank}"
	        puts ""
	        puts "Acceptance Rate: ".colorize(:blue) + "#{school.acceptance_rate}"
	        puts ""
	        puts "Average Annual Cost: ".colorize(:blue) + "#{school.cost}”
	         puts "School Website: ".colorize(:blue) + + "#{school.url}"
	        
	   end
	 end
	        
	        
	       