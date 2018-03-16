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
    colors_of_guess.each_with_index do |color_guessed, index|
      if @code.include?(color_guessed["color"])
        color_guessed["correct_color"] = true
      end

      if color_guessed["color"] == @code[index]
        color_guessed["correct_position"] = true
      end
    end
    @player.guesses << colors_of_guess
    p colors_of_guess
    # Gather colors of guess into an array for feedback
    colors_of_guess_for_feedback = colors_of_guess.map do |color_guess|
      color_guess["color"]
    end

    # Get number of correct colors and positions in guess
    number_of_correct_colors = 0
    number_of_correct_positions = 0
    colors_of_guess.each do |color_guess|
      if color_guess["correct_color"] == true
        number_of_correct_colors += 1
      end

      p color_guess["correct_position"]
      if color_guess["correct_position"] == true
        number_of_correct_positions += 1
      end

    end
    
    #Give feedback
    p "'#{colors_of_guess_for_feedback.join.upcase}' has #{number_of_correct_colors} elements with #{number_of_correct_positions} in the correct positions. You've taken #{@player.guesses.length} guesses."
  end

  def generate_code
    # options = ["r", "g", "b", "y"]
    # 4.times do |index|
    #   @code << options[rand(0..3)]
    # end
    @code = ["r", "r", "g", "b"]
  end
end