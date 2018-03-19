require 'minitest/autorun'
require 'minitest/pride'
require './lib/Game'
require './lib/Player'

class GameTest < MiniTest::Test
  
  def setup
    @game = Game.new(Player.new("Player 1"))
    @game.set_difficulty("beginner")
  end

  def test_game_exists
    assert_instance_of Game, @game
  end

  def test_difficulty_can_be_set_to_beginner
    @game.set_difficulty("beginner")
    assert_equal "beginner", @game.difficulty
  end

  def test_difficulty_can_be_set_to_intermediate
    @game.set_difficulty("intermediate")
    assert_equal "intermediate", @game.difficulty
  end

  def test_difficulty_can_be_set_to_advanced
    @game.set_difficulty("advanced")
    assert_equal "advanced", @game.difficulty
  end

  def test_beginner_start_message
    assert_equal "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.", @game.start_message
  end

  def test_intermediate_start_message
    @game.set_difficulty("intermediate")
    assert_equal "I have generated a beginner sequence with six elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, and (m)agenta. Use (q)uit at any time to end the game.", @game.start_message
  end

  def test_advanced_start_message
    @game.set_difficulty("advanced")
    assert_equal "I have generated a beginner sequence with eight elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (m)agenta, and (c)yan. Use (q)uit at any time to end the game.", @game.start_message
  end

  def test_game_beginner_code_generation

    @game.generate_code
    assert_equal 4,@game.code.length
  end
  
  def test_game_intermediate_code_generation
    @game.set_difficulty("intermediate")
    @game.generate_code
    assert_equal 6, @game.code.length
  end

  def test_game_advanced_code_generation
    @game.set_difficulty("advanced")
    @game.generate_code
    assert_equal 8, @game.code.length
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
    assert_equal Time, @game.end_time.class
  end

  def test_game_over_displays_message
    assert_kind_of String, @game.over('RGBY')
  end

  def test_game_does_give_feedback
    assert_equal String, @game.evaluate_guess('RGBY').class
  end

  def test_guesses_can_be_added
    assert_output("Hello\n") {puts "Hello"}
  end

end
