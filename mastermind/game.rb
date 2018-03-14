class Game

  def initialize
    @round = 0
  end

  def start_round
    @round += 1
    puts "You've started a new game, and it's round #{@round}"
  end
end