require './lib/Game'
require './lib/Player'

player = Player.new
game = Game.new(player)
puts "Welcome to MASTERMIND\n\n"

loop do
  puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  initial_choice = gets.chomp
  if initial_choice == "p" || initial_choice == "play"
    break
  elsif initial_choice == "i" || initial_choice == "instructions"
    p game.instructions
  elsif initial_choice == "q" || initial_choice == "quit"
    game.quit
  else
    puts "I'm not sure what you said."
  end
end

def start_round(game)
  game.start_time = Time.now
  p game.start_time
  game.generate_code
  puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  loop do
    puts "What would you like to guess?"
    guess = gets.chomp
    if guess == game.code.join
      p game.end_time
      game.over(guess)
      p "Beginning time: #{game.start_time}"
      p "End time: #{game.end_time}"
      break
    elsif guess == "c" || guess == "cheat"
      p game.code
    elsif guess == "quit"
      game.quit
    elsif guess.length < 4
      puts "That guess was too short"
    elsif guess.length > 4
      puts "That guess was too long"
    else 
      game.evaluate_guess(guess)
    end
  end
end

start_round(game)

loop do
  p "Would you like to (p)lay again or (q)uit"
  play_again = gets.chomp.downcase
  if play_again == "p" || play_again =="play"
    game.start_time = Time.now
    new_player = Player.new
    new_game = Game.new(new_player)
    start_round(new_game)
  elsif play_again == "q" || play_again == "quit"
    p "Thanks for playing!"
    break
  else
    p "I'm sorry. I don't understand what you said. Could you please try again?"
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