require './lib/Game'
require './lib/Player'

puts "Welcome to MASTERMIND\n\n"
game = ""
loop do
  print "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n> "
  initial_choice = gets.chomp.downcase
  player = Player.new
  if initial_choice == "p" || initial_choice == "play"
    loop do
      print `clear`
      print "What difficulty level would you like to use - (b)eginner, (i)ntermediate, or (a)dvanced? > "
      difficulty = gets.chomp.downcase
      if difficulty == "b"|| difficulty == "beginner"
        game = Game.new(player,difficulty)
        puts "Beginner game"
        break
      elsif difficulty = "i" || difficulty == "intermediate"
        game = Game.new(player,difficulty)
        puts "Intermediate game"
        break
      elsif difficulty = "a" || difficulty == "advanced"
        game = Game.new(player,difficulty)
        puts "Advanced game"
        break
      else
        puts "I'm sorry, I did not understand that answer. Please answer either with (b)eginner, (i)ntermediate, or (a)dvanced."
      end
    end
    break
  elsif initial_choice == "i" || initial_choice == "instructions"
    puts game.instructions
  elsif initial_choice == "q" || initial_choice == "quit"
    game.quit
  else
    puts "I'm not sure what you said."
  end
end

def start_round(game)
  game.start_game_timer
  game.generate_code
  puts `clear`
  puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  loop do
    print "What's your guess? > "
    guess = gets.chomp
    if guess == game.code.join
      game.over(guess)
      break
    elsif guess == "c" || guess == "cheat"
      puts "The secret code is #{game.code.join}"
    elsif guess == "quit" || guess == "q"
      game.quit
    elsif guess.length < 4
      puts "That guess was too short."
    elsif guess.length > 4
      puts "That guess was too long."
    else 
      game.evaluate_guess(guess)
    end
  end
end

start_round(game)

loop do
  print "Would you like to (p)lay again or (q)uit? > "
  play_again = gets.chomp.downcase
  if play_again == "p" || play_again =="play"
    new_player = Player.new
    new_game = Game.new(new_player, new_difficulty)
    start_round(new_game)
  elsif play_again == "q" || play_again == "quit"
    puts "Thanks for playing!"
    break
  else
    puts "I'm sorry. I don't understand what you said. Could you please try again?"
  end
end

# Game Flow Method List
  # game.instruct
  # game.generate_code
  # game.prompt
  # game.quit
  # game.
  # game.end_flow
  # game.give_feedback(guess)
  # player.add_guess