require 'tty-prompt'

    # def login
    # prompt = TTY::Prompt.new
    # question = "Main Menu"
    # choices = ["New User","Returning User","Exit"]
    # login_page = prompt.select(question, choices, required: true)
    # if login_page == "New User" 
    #     name = prompt.ask("What's your name")
    #     @new_user = User.new(name: name)
    #     @new_user.save
    #      puts "Welcome #{@new_user.name}, bottoms up!"
    
    # elsif login_page == "Returning User"
    #       olduser = prompt.select("Find your name below!.", (User.all.map{|user| user.name}))
    #       olduser = User.all.find_by(name: name)
    #       puts "Hi  welcome back!"
    # end

    def homepage
        prompt = TTY::Prompt.new
        questions = "Main Menu"
        choices = ["Community Brew Board", "All Beers", "Add/Update", "exit"]
        home_page = prompt.select(questions, choices, required: true,  echo: false)

        if home_page == "Community Brew Board"
            # puts BeerList.all 
            BeerList.all.each do |beer|
                 user = User.find_by(id: beer.user_id)
                 userBeer = Beer.find_by(id: beer.beer_id)
                 puts "_____________________"
                 puts "User: #{user.name}"
                 puts "Beer Name: #{userBeer.name}"
                 puts "Beer Rating: #{beer.rating}"
                 puts "_____________________"
                 puts "_____________________"
            rescue
            end
            goback = prompt.yes?("go back?" ,"yes")
                homepage
    
        end


        if home_page == "All Beers" 
          selection = prompt.select("choose beer" ,(Beer.all.map{|beer| beer.name}), "go back")
          beer_chose = Beer.find_by name: selection
    
            if selection == "go back"
                homepage
            else
            found_beer = Beer.find_by(name: selection)
            puts found_beer.name
            puts found_beer.brewer
            puts found_beer.abv
            goback = prompt.yes?("go back?" ,"yes")
                homepage
            end

        end

            if  home_page == "Add/Update"
            selection = prompt.select("choose one" ,"Add Beer", "Remove a Beer", "Update a beer that you've added", "go back")

          if selection == "Add Beer"
            name = prompt.ask("Beer Name?")
            brewer = prompt.ask("Brewery?")
            abv = prompt.ask("ABV?")
            @new_beer = Beer.new(name: name, brewer: brewer, abv: abv)
            @new_beer.save
            puts "Beer Added!"
             homepage

        elsif selection == "Remove a Beer"
            beertodelete = prompt.select("choose beer" ,(Beer.all.map{|beer| beer.name}), "exit")
            beerchosen = Beer.all.map do |beer| 
                if beer.name == beertodelete 
                    beer.destroy
                    puts "Beer deleted!"
                    
                 end
                 homepage
                end
    
          
          
          elsif selection == "Update a beer that you've added"
             name_update = prompt.select("choose beer" ,(Beer.all.map{|beer| beer.name}))
             selected_beer = Beer.find_by(name: name_update)
             new_name = prompt.ask("Enter updated beer name:")
             selected_beer.name = new_name
             new_brewer = prompt.ask("Enter updated brewery name:")
             selected_beer.brewer = new_brewer
             new_abv = prompt.ask("Enter updated beer ABV:")
             selected_beer.abv = new_abv
             selected_beer.save 
             puts "New Beer Name: #{selected_beer.name}"
             puts "New Brewer: #{selected_beer.name}"
             puts "New ABV: #{selected_beer.name}"
            

          elsif selection == "go back"
            #  goback = prompt.yes?("go back?" ,"yes")
                homepage
          
          
          end

        end
    
        
    end