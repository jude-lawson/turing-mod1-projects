require './lib/Game'
require './lib/Player'

puts "Welcome to MASTERMIND\n\n"
player = Player.new
game = Game.new(player)
loop do
  print "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n> "
  initial_choice = gets.chomp.downcase
  if initial_choice == "p" || initial_choice == "play"
    loop do
      print `clear`
      print "What difficulty level would you like to use - (b)eginner, (i)ntermediate, or (a)dvanced? > "
      difficulty = gets.chomp.downcase
      if difficulty == "b"|| difficulty == "beginner"
        game.set_difficulty("beginner")
        break
      elsif difficulty = "i" || difficulty == "intermediate"
        game.set_difficulty("intermediate")
        break
      elsif difficulty = "a" || difficulty == "advanced"
        game.set_difficulty("advanced")
        break
      else
        puts "I'm sorry, I did not understand that answer. Please answer either with (b)eginner, (i)ntermediate, or (a)dvanced."
      end
    end
    break
  elsif initial_choice == "i" || initial_choice == "instructions"
    puts game.instructions
  elsif initial_choice == "q" || initial_choice == "quit"
    Process.exit
  else
    puts "I'm not sure what you said."
  end
end

def start_round(game)
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
end

start_round(game)

# loop do
#   print "Would you like to (p)lay again or (q)uit? > "
#   play_again = gets.chomp.downcase
#   if play_again == "p" || play_again =="play"
#     new_player = Player.new
#     new_game = Game.new(new_player)
#     loop do
#       print `clear`
#       print "What difficulty level would you like to use - (b)eginner, (i)ntermediate, or (a)dvanced? > "
#       difficulty = gets.chomp.downcase
#       if difficulty == "b"|| difficulty == "beginner"
#         new_game.set_difficulty("beginner")
#         break
#       elsif difficulty = "i" || difficulty == "intermediate"
#         new_game.set_difficulty("intermediate")
#         break
#       elsif difficulty = "a" || difficulty == "advanced"
#         new_game.set_difficulty("advanced")
#         break
#       else
#         puts "I'm sorry, I did not understand that answer. Please answer either with (b)eginner, (i)ntermediate, or (a)dvanced."
#       end
#     end
#     start_round(new_game)
#   elsif play_again == "q" || play_again == "quit"
#     puts "Thanks for playing!"
#     break
#   else
#     puts "I'm sorry. I don't understand what you said. Could you please try again?"
#   end
# end

# Game Flow Method List
  # game.instruct
  # game.generate_code
  # game.prompt
  # game.quit
  # game.
  # game.end_flow
  # game.give_feedback(guess)
  # player.add_guess