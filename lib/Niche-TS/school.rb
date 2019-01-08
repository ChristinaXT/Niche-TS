class Niche-TS::School
	

	    attr_accessor :name, :location, :url,  :rank, :cost, :acceptance_rate
	

	    @@all = []
	

	    def initialize(name=nil, location=nil, rank=nil, url=nil, cost=nil, acceptance_rate=nil)
	        @name = name
	        @location = location
	        @rank = rank
	        @url = url
	        @cost = cost
          @acceptance_rate = acceptance_rate
	        @@all << self
	    end
