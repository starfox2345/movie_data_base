class Movies
    attr_accessor :title, :year, :rating
    
    @@all = []

    def initialize(movies_hash)
        movies_hash.each do |key, value|
        self.send("#{key}=", value) if self.respond_to?("#{key}=") #will only  
        end                         #execute this if attributes exists within attr_accessor
        save
    end

    def save
        @@all << self # self refers to the object of the instance. 
    end
    
    def self.all #instance name = all modified by self. This is a class method
        @@all    #Now this is a class method.
    end          #self.all == Movies.all, but using Movies.all is no good
                 #if the user were to change the name of this file, then 
                 #Movies.all will no longer be valid, but self.all will.

    def self.find_by_selection(movie_name)
        self.all.detect do |movie|
            movie.title == movie_name
        end
    end
end             