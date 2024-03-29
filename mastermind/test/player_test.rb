require 'minitest/autorun'
require 'minitest/pride'
require './lib/Player'

class PlayerTest < MiniTest::Test
  def setup
    @player = Player.new()
  end

  def test_player_exists
    assert_instance_of Player, @player
  end

  def test_player_guesses_can_be_added
    @player.add_guess("RGGB")
    @player.add_guess("YGGB")
    assert_equal ["RGGB", "YGGB"], @player.guesses
  end

  def test_player_name_can_be_updated
    @player.update_name("Lawson")
    assert_equal "Lawson", @player.name
  end

  def test_history_can_be_displayed
    @player.update_name("Jude")
    @player.add_guess("RGGB")
    @player.add_guess("BGGY")
    assert_equal "So far, Jude has guessed: \nRGGB\nBGGY", @player.show_history
  end

end
