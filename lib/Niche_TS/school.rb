class Niche_TS::School
	
   @@all = []
  
	 attr_accessor :name, :rank, :location,  :acceptance_rate, :cost, :description, :url
	
	 def self.all
     @@all
   end
      
    def initialize(name=nil, rank=nil, location=nil, acceptance_rate=nil, cost=nil, url=nil, description=nil)
	    @name = name
	    @rank = rank
	    @location = location
	    @acceptance_rate = acceptance_rate
	    @cost = cost
	    @url = url
	    @description = description
	    @@all << self
	  end
	    
	 def self.find_by_rank(search_rank)
     all.each do |school|
      if school.rank.gsub("#", "") == search_rank
      return school
      end	 
      end
   end
end 

