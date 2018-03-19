require './lib/Game'
require './lib/Player'

puts "Welcome to MASTERMIND\n\n"

round_number = 0
loop do
  player = Player.new
  game = Game.new(player)
  print round_number == 0 ? "Would you like to (p)lay, read the (i)nstructions, or (q)uit? > " : "Would you like to (p)lay again or (q)uit? > "
  flow_start_choice = gets.chomp.downcase
  if flow_start_choice == "p" || flow_start_choice == "play"
    round_number += 1
    # Get user input for difficulty
    loop do
      print "What difficulty level would you like to use - (b)eginner, (i)ntermediate, or (a)dvanced? > "
      difficulty = gets.chomp.downcase
      if difficulty == "b" || difficulty == "beginner"
        game.set_difficulty("beginner")
        break
      elsif difficulty == "i" || difficulty == " intermediate"
        game.set_difficulty("intermediate")
        break
      elsif difficulty == "a" || difficulty == "advanced"
        game.set_difficulty("advanced")
        break
      elsif difficulty == "q" || difficulty == "quit"
        Process.exit
      else
        puts "Sorry, I did not understand that choice. Could you please try again?"
      end
    end

    # Start game loop
    game.start_game_timer
    game.generate_code
    puts `clear`
    puts game.start_message
    loop do
      print "What's your guess? > "
      guess = gets.chomp
      if guess == game.code.join
        puts game.over(guess)
        break
      elsif guess == "c" || guess == "cheat"
        puts "The secret code is #{game.code.join}"
      elsif guess == "quit" || guess == "q"
        Process.exit
      elsif guess.length < game.code.length
        puts "That guess was too short."
      elsif guess.length > game.code.length
        puts "That guess was too long."
      else 
        puts game.evaluate_guess(guess)
      end
    end

  elsif flow_start_choice == "i" || flow_start_choice == "instructions" && round_number == 0
    puts game.instructions
    break
  elsif flow_start_choice == "q" || flow_start_choice == "quit"
    Process.exit
  break
  else
    puts "I'm sorry, I did not understand that choice. Could you please try again?"
  end
end

# puts "Thanks for playing!"
