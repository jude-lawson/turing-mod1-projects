require './Game'

game = Game.new
game.intro_prompt

#Game Flow
choice = game.choice.downcase
if choice == "p" || choice == "play"
  game.generate_code
  game_is_running = true
  while game_is_running
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\nWhat's your guess? > "
    guess = gets.chomp.downcase
    guess_is = game.check_guess(guess)
    puts guess_is
  end
      
elsif choice == "i" || choice == "instructions"
  game.instruct
else
  game.exit_game
end

