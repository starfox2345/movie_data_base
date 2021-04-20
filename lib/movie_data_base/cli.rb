class CLI


    def start
        puts "Welcome to my Movies Data Base!\nWhat is your name?"
        API.get_data
        input = user_input
        greet(input)
    end

    def user_input
        gets.strip
    end

    def greet(name)
        puts "Greetings #{name}! Which Movie would you like to know about?"
        menu
    end

    def menu
        puts "Enter 'L' to list the movies"
        puts "Enter 'EXIT' or 'E' to exit"
        selection = user_input     
        if selection.upcase == "L"
            movie_list
        elsif selection.downcase == "exit" || selection.downcase == "e"
            byebye
        else
            invalid
        end
    end
# :title, :year, :rating
    def movie_list
        Movies.all.each.with_index(1) do |movies, index|
            puts "#{index}. #{movies.title}"
        end
        puts "What would you like to do now?"
        puts "Enter 'y' to learn more about the movies"
        puts "Enter 'n' to go back to the menu"
        input = user_input
        if input.downcase == "y"
            select_movie
        elsif input.downcase == "n"
            menu
        else
            puts "I dunno what you wanted to do so I sent you back to the list of movies"
            movie_list
        end
    end

    def select_movie
        puts "Enter the name of the movie you would like to learn more about"
        selection = user_input
        movie_select = Movies.find_by_selection(selection)
        movie_details(movie_select)
    end

    def movie_details(movie)
        puts "Title: #{movie.title}"
        puts "Year: #{movie.year}"
        puts "Ration: #{movie.rating}"
        puts "Would you like to learn more about the movies?"
        puts "Enter 'Y' for Yes"
        puts "Enter 'N' for No"
        input = user_input
        if input.upcase == "Y"
            select_movie
        elsif input.upcase == "N"
            menu
        else
            invalid
        end
    end

    def byebye
        puts "Thank you for using the Data Base!"
    end

    def invalid
        puts "Invalid input. Please try again."
        menu
    end
end