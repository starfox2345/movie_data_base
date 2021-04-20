class API

    def self.get_data
        response = RestClient.get('https://yts.mx/api/v2/list_movies.json?quality=3D')
        movie_data = JSON.parse(response)["data"]["movies"]
        # :title, :year, :rating
        movie_data.each do |movie|
            Movies.new(movie)
        end
        # binding.pry
    end
end