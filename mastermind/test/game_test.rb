require 'minitest/autorun'
require 'minitest/pride'
require './lib/Game'
require './lib/Player'

class GameTest < MiniTest::Test
  
  def setup
    @game = Game.new(Player.new)
  end

  def test_game_exists
    assert_instance_of Game, @game
  end

  def test_game_welcome_message
    skip
    assert_equal "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.", @game.welcome
  end

  # Do some research
  def test_game_does_collect_user_input
    skip
    assert_equal String, @game.prompt.class
  end

  def test_game_instructs
    assert_equal "Here are some instructions", @game.instructions
  end

  def test_game_quits
  end

  def test_game_can_cheat
  end

  def test_can_be_won
  end

  def test_end_flow_prints_congratulatory_message
  end

  def test_game_does_give_feedback
  end

  def test_guesses_can_be_added
  end

end
