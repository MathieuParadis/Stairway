#6ème sans ascenseur

#1 Jeu vidéo
#Tu vas maintenant coder un super jeu qui déchire. 
#Mario n'a qu'à bien se tenir avec sa pyramide ! 
#Nous allons imaginer un programme dans lequel une gentille personne 
#va devoir monter 10 marches en fonction d'un jet de dé. Une version 
#informatique du jeu de l'oie en quelque sorte !

#Voici comment cela va se dérouler : à l'exécution, le programme lance une partie. 
#Le joueur est tout en bas d'un escalier à 10 marches, et à chaque tour il va lancer un dé :
# - S’il fait 5 ou 6, il avance d'une marche et le programme le lui dit (ainsi que la marche où il est à présent)
# - S’il fait 1, il descend d'une marche et le programme le lui dit (ainsi que la marche où il est à présent)
# - S’il fait 2, 3, ou 4 rien ne se passe, et le programme le lui dit (ainsi que la marche où il est resté)
#Quand le joueur atteint la 10ème marche, le programme l'en informe avec un message super enthousiaste, 
#et le jeu se termine.


def what_to_play
    puts "Welcome \n"
    puts "What would you like to play \n"
    puts "To play the game, press 1 \nTo launch a simulation, press 2 \nTo see the rules, press 3\nTo exit, press 4"
    what_to_do = case enter_choice
        when 1 then game_program
        when 2 then stat_program
        when 3 then display_rules
        when 4 then exit
        else 
            puts "Sorry, I did not understand"
            puts "Try again" 
            print "\n \n"
            what_to_play
    end
end

def enter_choice
    print "> "
    player_choice = gets.to_i
    return player_choice
end

def display_rules
    print "\n \n"
    puts "---RULES---"
    puts "Your charater is stucked in a dungeon"
    puts "He must reach the top of the stairs to escape "
    puts "At the beginning of the game your start totally down, and 10 stairs seperate you from the top "
    puts "You have control over your character movement by launching the dice"
    print "\n"
    puts "If you get 5 or 6, your character goes up 1 stair"
    puts "If you get 1, your character goes down 1 stair"
    puts "And if you get 2, 3, or 4, nothing happens"
    print "\n \n"
    
    puts "To come back to the main menu, press 0"
    what_to_do = case enter_choice
        when 0 then what_to_play
        else 
            puts "Sorry, I did not understand"
            puts "Try again" 
            print "\n \n"
            enter_choice
    end
end


def game_program
    print "\n"
    puts "Welcome on THP, the Game"


    def start_game
        print "\n \n"
        puts "Great, let's get going"
        print "\n \n"
        puts "---NEW GAME---"
        print "\n \n"
        game(choose_your_character)
    end

    def throw_dice 
        print "\n \n"
        dice_result = 0
        puts "Press Enter to throw the dice"
        what_to_do = case enter_choice
            when 0 then dice_result = rand(1..6) 
            else 
                puts "Sorry, I did not understand"
                puts "Try again" 
                print "\n \n"
                throw_dice
        end 
        
        puts "You did a #{dice_result}"
        print "\n"
        return dice_result
    end

    def calculate_new_position(i, array, number_of_times_played, x)
        #Position avant lancé de dé
        position = array.index(x)

        #Position après lancé de dé
        if ((i==5 || i==6) && position!=0)
            array.delete(array[position])
            position -= 1
            array.insert(position, x)
        elsif ( i== 1 && position != (array.length) -1 )
            array.delete(array[position])
            position += 1
            array.insert(position, x)
        else
            array = array
        end

        
        if position == 0
            puts array
            print "\n"
            puts "---- CONGRATULATIONS ----"
            puts "You made it out in #{number_of_times_played} times"
            print "\n \n"
            display_options_after_win

        else
            puts "Round #{number_of_times_played}"
            print "\n"
            puts array
        end
    end

    def display_options_after_win
        puts "Would you like to play again?"
        puts "To launch a new game, press 1 \nTo go back to the main menu, press 0 \nTo exit, press 3"
        what_to_do = case enter_choice
            when 1 then start_game
            when 0 then what_to_play 
            when 3 then exit
            else 
                puts "Sorry, I did not understand"
                puts "Try again" 
                print "\n \n"
                display_options_after_win
        end
    end


    def game(x)
        puts "Your character is represented by a #{x}, and _ are the stairs"
        dungeon = Array.new(10, "_").push(x)
        player_score = 0 
        puts dungeon
        
        while dungeon[0] != x do 
            player_score +=1
            calculate_new_position(throw_dice, dungeon, player_score, x)
        end
    end

    def choose_your_character
        puts "Choose your character (any alpha-numeric character of your choice"
        print "> "
        character_choice = gets.chomp
        return character_choice
    end

    start_game

end

#2 Statistiques
#L'une des grandes forces de l'informatique est de pouvoir faire un nombre conséquent d'itérations 
#et de pouvoir sortir des moyennes et médianes très facilement.
#Fais donc une méthode average_finish_time qui va simuler au moins 100 parties, 
#et te retourner le nombre de tours moyen pour arriver à la 10ème marche.

def stat_program

    def throw_dice 
        return rand(1..6) 
    end 
        


    def calculate_new_position(i, array, number_of_times_played)
        #Position avant lancé de dé
        position = array.index("X")

        #Position après lancé de dé
        if ((i==5 || i==6) && position!=0)
            array.delete(array[position])
            position -= 1
            array.insert(position, "X")
        elsif ( i== 1 && position != (array.length) -1 )
            array.delete(array[position])
            position += 1
            array.insert(position, "X")
        else
            array = array
        end

        
        if position == 0
            return number_of_times_played
        end
    end


    def game
        dungeon = Array.new(10, "_").push("X")
        player_score = 0 
        
        while dungeon[0] != "X" do 
            player_score +=1
            calculate_new_position(throw_dice, dungeon, player_score)
        end
        return player_score
    end

    def enter_score_into_array(array_score, score)
        array_score.push(score)
        return array_score
    end

    def calcule_average(array_score, number_of_games_played)
        s = array_score.reduce { |sum, number| sum + number }
        average = s/(number_of_games_played.to_f)
        return average
    end

    def simulation(n)

    scores = []
        for i in 1..n
            array_scores = enter_score_into_array(scores, game)
        end
        average_on_n_games = calcule_average(array_scores, n)
        puts "#{n} have been simulated"
        puts "The average number of rounds required to finish the game is #{average_on_n_games}"
    end

    def input_number
        n = gets.to_i
        return n
    end



    def perform
        print "\n"
        print "---Simulation---"
        print "\n"
        puts "How many games do you wish to simulate? Choose a number between 1 and 100"
        print "> "
        n=input_number
        if (n<1 || n>100)
            puts "Wrong number, try again!!"
            perform
        else
            simulation(n)
        end
    end

    perform

    print "\n"
    gets.chomp

    what_to_play

end

what_to_play