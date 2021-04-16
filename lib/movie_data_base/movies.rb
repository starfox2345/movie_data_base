class Movies
    attr_accessor :movie_count, :limit, :page_number

    @@all = []

    def initialize(movie_count, limit, page_number)
        @movie_count = movie_count
        @limit = limit
        @page_number = page_number
        save
    end

    def save
        @@all << self
    end
    
    def self.all
        @@all
    end
end