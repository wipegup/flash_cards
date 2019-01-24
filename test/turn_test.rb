require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    @guess_true = "Juneau"
    @guess_false = "Washington"

  end


  def test_it_exists
    turn_t = Turn.new(@guess_true, @card)
    turn_f = Turn.new(@guess_false, @card)

    assert_instance_of Turn, turn_t
    assert_instance_of Turn, turn_f
  end

  def test_it_has_guess
    turn_t = Turn.new(@guess_true, @card)
    turn_f = Turn.new(@guess_false, @card)

    assert_equal @guess_true, turn_t.guess
    assert_equal @guess_false, turn_f.guess
  end

  def test_it_has_card
    turn_t = Turn.new(@guess_true, @card)
    turn_f = Turn.new(@guess_false, @card)

    assert_instance_of Card, turn_t.card
    assert_instance_of Card, turn_f.card
  end

  def test_it_has_correct?
    turn_t = Turn.new(@guess_true, @card)
    turn_f = Turn.new(@guess_false, @card)

    assert_equal true, turn_t.correct?
    assert_equal false, turn_f.correct?

  end

  def test_it_has_feedback
    turn_t = Turn.new(@guess_true, @card)
    turn_f = Turn.new(@guess_false, @card)

    assert_equal "Correct!", turn_t.feedback
    assert_equal "Incorrect.", turn_f.feedback
  end
end
