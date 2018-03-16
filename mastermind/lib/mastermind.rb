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

game.generate_code
puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
loop do
  puts "What would you like to guess?"
  guess = gets.chomp
  if guess == game.code.join
    p "You've won!"
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

# Game Flow Method List
  # game.instruct
  # game.generate_code
  # game.prompt
  # game.quit
  # game.
  # game.end_flow
  # game.give_feedback(guess)
  # player.add_guess