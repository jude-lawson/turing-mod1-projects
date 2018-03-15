class Game
  attr_reader :choice,
              :code

  def initialize
    @prompt = "> "
    @choice = ""
    @code = ""
  end

  def intro_prompt
    puts "\nWelcome to MASTERMIND"
    valid_choice = false
    valid_choices = ["p", "play", "i", "instructions", "q", "quit"]
    until valid_choice
      puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
      print @prompt
      choice = gets.chomp
      if valid_choices.include?(choice)
        valid_choice = true
        @choice = choice
      else
        puts "I don't understand that command. Please try again..."
      end
    end
  end

  def generate_code
    options = ["r", "g", "b", "y"]
    4.times do |index|
      @code[index] = options[rand(0..3)]
    end
    p @code.class
  end

  def check_guess(guess)
    if guess == @code
      return "You've won!"
    elsif guess.length < 4
      return "Your guess was too short."
    elsif guess.length > 4
      return "Your guess was too long."
    else
      #give feedback use self referenced method to return feedback
    end
  end

  def instruct
    puts "Instruct"
  end

  def exit_game
    puts "Exit Game"
  end

end