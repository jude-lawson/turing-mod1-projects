require 'minitest/autorun'
require 'minitest/pride'
require './lib/Game'
require './lib/Player'

class GameTest < MiniTest::Test
  
  def setup
    @game = Game.new(Player.new, "beginner")
  end

  def test_game_exists
    assert_instance_of Game, @game
  end

  def test_game_beginner_code_generation
    @game.generate_code
    assert_equal 4,@game.code.length
  end
  
  def test_game_intermediate_code_generation
    game = Game.new(Player.new, "intermediate")
    assert_equal 6, game.code.length
  end

  def test_game_advanced_code_generation
    game = Game.new(Player.new, "advanced")
    assert_equal 8, game.code.length
  end

  def test_game_instructs
    assert_equal "This game is about guessing a randomly generated sequence of colors in a particular order. When prompted, enter a guess in the form of successive letters representing the colors (r)ed, (g)reen, (b)lue, or (y)ellow.\n\nAn example guess > 'RRGB'.\n\nThe game will run until you guess the corect answer (giving feedback for incorrect answers along the way), or until you type (q)uit.", @game.instructions
  end

  def test_game_timer_can_start
    @game.start_game_timer
    assert_equal Time, @game.start_time.class
  end

  def test_game_timer_can_end
    @game.over('RGBY')
    assert_equal Time,@game.end_time.class
  end

  def test_game_over_displays_message
    assert_equal String, @game.over('RGBY')
  end
  # def test_game_over_end_game_message_for_less_than_one_minute
  # end

  def test_game_does_give_feedback
    assert_equal String, @game.evaluate_guess('RGBY').class
  end

  def test_game_can_quit
    
  end

  def test_guesses_can_be_added
  end

end
