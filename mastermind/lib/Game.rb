require 'json'

class Game
  attr_reader :choice,
              :code,
              :instructions,
              :player,
              :start_time,
              :end_time,
              :difficulty

  def initialize(player)
    @code = []
    @difficulty = ""
    @player = player
    @instructions = "This game is about guessing a randomly generated sequence of colors in a particular order. When prompted, enter a guess in the form of successive letters representing the colors (r)ed, (g)reen, (b)lue, or (y)ellow.\n\nAn example guess > 'RRGB'.\n\nThe game will run until you guess the corect answer (giving feedback for incorrect answers along the way), or until you type (q)uit."
    @start_time = Time.new
    @end_time = Time.new
    @total_time = ""
  end


  def start_game_timer
    @start_time = Time.now
  end

  def set_difficulty(difficulty)
    @difficulty = difficulty
  end

  def start_message
    case @difficulty
    when "beginner"
      "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    when "intermediate"
      "I have generated a beginner sequence with six elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, and (m)agenta. Use (q)uit at any time to end the game."
    when "advanced"
      "I have generated a beginner sequence with eight elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (m)agenta, and (c)yan. Use (q)uit at any time to end the game."
    end
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
    # Gather colors of guess into an array for feedback
    colors_of_guess_for_feedback = colors_of_guess.map do |color_guess|
      case color_guess["color"].downcase
      when "r"
        "\033[31mR\033[30m"
      when "g"
        "\033[32mG\033[30m"
      when "b"
        "\033[34mB\033[30m"
      when "y"
        "\033[33mY\033[30m"
      when "m"
        "\033[35mM\033[30m"
      when "c"
        "\033[36mC\033[30m"
      else
        color_guess["color"].upcase
      end
    end

    # Get number of correct colors and positions in guess
    number_of_correct_colors = 0
    already_correct_color_characters = []
    number_of_correct_positions = 0
    colors_of_guess.each do |color_guess|
      if color_guess["correct_color"] == true && already_correct_color_characters.include?(color_guess["color"]) == false
        number_of_correct_colors += 1
        already_correct_color_characters << color_guess["color"]
      end

      if color_guess["correct_position"] == true
        number_of_correct_positions += 1
      end

    end
    
    #Give feedback
    "'#{colors_of_guess_for_feedback.join}\033[30m' has #{number_of_correct_colors} correct #{number_of_correct_colors == 1 ? "element" : "elements"} with #{number_of_correct_positions} in the correct #{number_of_correct_positions == 1 ? "position" : "positions"}. You've taken #{@player.guesses.length} #{player.guesses.length > 1 ? "guesses" : "guess"}."
  end

  def generate_code
    case @difficulty
    when "beginner"
      options = ["r", "g", "b", "y"]
      4.times do |index|
        @code << options[rand(0..3)]
      end
    when "intermediate"
      options = ["r", "g", "b", "y", "m"]
      6.times do |index|
        @code << options[rand(0..3)]
      end
    when "advanced"
      options = ["r", "g", "b", "y", "m", "c"]
      8.times do |index|
        @code << options[rand(0..3)]
      end
    end
  end

  def add_high_score
    if File.exist?("lib/data/scores.json")
      high_scores_data_file = File.read("lib/data/scores.json")
      high_scores_data = JSON.parse(high_scores_data_file)
      high_scores_data["scores"] << ({"name" => @player.name, "pattern" => @code, "guesses" => @player.guesses.length, "time" => @total_time })
      high_scores = JSON.generate(high_scores_data)
    else
      high_scores = JSON.generate({"scores" => [{"name" => @player.name, "pattern" => @code, "guesses" => @player.guesses.length, "time" => @total_time }]})
    end
    high_scores_data_file = IO.write("lib/data/scores.json", high_scores, {mode: "w+"})
  end

  def sort_and_present_high_score
    # create an array of arrays where inner arrays have score as first value and index in hash as the second
    # slice it to get top 10
    #
  end

  def over(correct_guess)
    @end_time = Time.now
    seconds_to_complete = @end_time.to_i - @start_time.to_i
    minutes_to_complete = seconds_to_complete / 60
    remaining_seconds_after_minutes = seconds_to_complete % 60
    @total_time = "#{minutes_to_complete}m#{remaining_seconds_after_minutes}s"
    if minutes_to_complete > 0
      @total_time = "#{minutes_to_complete}m#{remaining_seconds_after_minutes}s"
      "Congratulations! You guessed the sequence #{correct_guess.upcase} in #{@player.guesses.length} #{player.guesses.length == 1 ? "guess" : "guesses"} over #{minutes_to_complete} #{minutes_to_complete == 1 ? "minute" : "minutes"}, #{remaining_seconds_after_minutes} #{remaining_seconds_after_minutes == 1 ? "second" : "seconds"}."
    else
      @total_time = "0m#{seconds_to_complete}s"
      "Congratulations! You guessed the sequence #{correct_guess.upcase} in #{@player.guesses.length} #{player.guesses.length == 1 ? "guess" : "guesses"} over #{seconds_to_complete} #{seconds_to_complete == 1 ? "second" : "seconds"}."
    end
  end
end