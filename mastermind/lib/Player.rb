class Player

  attr_reader :name,
              :guesses

  def initialize()
    @name = "Player 1"
    @guesses = []
  end
  
  def add_guess(guess)
    @guesses << guess
  end

  def show_history
    "So far, #{@name} has guessed: \n#{@guesses.join("\n")}"
  end

  def update_name(new_name)
    @name = new_name
  end

end