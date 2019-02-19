require 'colorize'

class Niche_TS::CLI

  def call
        Niche_TS::Scraper.new.create_schools
        
        run
   end

   def run
        print_school_list
        puts "=======================================================================" .colorize(:blue)
        puts "WANT TO KNOW ABOUT THE TOP 25 COLLEGES FOR THEATRE?"
        puts "ENTER THE NUMBER OF THE THEATRE SCHOOL BY RANK"
        puts "YOU WOULD LIKE TO GET MORE INFORMATION ON, OR TYPE 'EXIT' TO QUIT.  "
        puts "=======================================================================" .colorize(:blue)

        input = gets.strip

        # Invalid input handling
        while !(input == 'exit' || input.to_i >= 1 && input.to_i <= 25)
            puts "Input was invalid. Please try again."
            input = gets.strip
        end

        if input != "exit"
          school = Niche_TS::School.find_by_rank(input)
              Niche_TS::Scraper.new.scrape_school_details(school)
              print_school_detail(Niche_TS::School.find_by_rank(input))

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


         Niche_TS::School.all.each do |school|
	       puts "  #{school.rank} " + " #{school.name} "
	   end


	        puts ""
	    end


	    def print_school_detail(school)
	        puts ""
	        puts "Name: " .colorize(:blue) + "#{school.name}"
	        puts ""
	        puts "Location:" .colorize(:green)  + "#{school.location}"
	        puts ""
	        puts "Rank: ".colorize(:red) + "#{school.rank}"
	        puts ""
	        puts "Acceptance Rate: ".colorize(:cyan) + "#{school.acceptance_rate}"
	        puts ""
	        puts "Average Annual Cost: ".colorize(:magenta) + "#{school.cost}"
	        puts ""
	        puts "Program Description: ".colorize(:yellow) + "#{school.description}"
	        puts ""
	        puts "School Website: ".colorize(:blue) + "#{school.url}"
	   end
	 end
