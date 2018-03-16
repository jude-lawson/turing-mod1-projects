class Game
  attr_reader :choice,
              :code,
              :instructions

  def initialize(player)
    @code = []
    @player = player
    @instructions = "Here are some instructions"
  end

  # def prompt
  #   puts "What is your guess? > "
  #   guess = gets.chomp
  # end

  def quit
    Process.exit
  end

  def evaluate_guess(guess)
    colors_of_guess = []
    guess.length.times do |index|
      colors_of_guess << { "color" => guess[index], "correct_color" => false, "correct_position" => false }
    end
    p "Feedback evaluate #{colors_of_guess}, code is #{@code}"
    colors_of_guess.each do |color_guessed|
      color_guessed["color"]
    end
  end

  def generate_code
    options = ["r", "g", "b", "y"]
    4.times do |index|
      @code << options[rand(0..3)]
    end
    p @code.class
  end

  # def evaluate_guess_values(guess)
  #   p @player
  # end

  # def give_feedback(guess)
  #   if guess
  #     puts "Feedback on your guess: #{guess}"
  #   end
  # end

  # def exit_game
  # end

end