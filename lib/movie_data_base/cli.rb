class CLI

    def start
        puts "Welcome to my Movies Data Base!\nWhat is your name?"
        input = user_input
        greet(input)
    end

    def user_input
        gets.strip
    end

    def greet(name)
        puts "Greetings #{name}! Which Movie would you like to know about?"
    end

    def movie_list
        
    end
end