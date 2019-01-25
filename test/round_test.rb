require 'minitest/autorun'
require './lib/card'
require './lib/round'
require './lib/deck'
require './lib/turn'

class RoundTest < Minitest::Test

  def setup
    # Create Question, Answer and Category for cards
    card_info = [
      ["2+2", 4, :Geography],
      ["5+3", 8, :STEM],
      ["4+10", 14, :STEM],
      ["7+14", 21, :Math]
    ]

    @cards = []
    card_info.each do |card_arg|
      @cards << Card.new(*card_arg)
    end

    # Build Deck
    @deck = Deck.new(@cards)

    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_attributes
    assert_equal @deck, @round.deck
    # assert_equal 0, round.number_correct
    assert_equal [], @round.turns
  end

  def test_it_has_current_card
    num_previous_turns = @round.turns.length
    assert_equal @cards[num_previous_turns], @round.current_card
  end

  def test_it_has_take_turn
    assert_instance_of Turn, @round.take_turn(4)
  end

  def test_take_turn_adds_to_turn_array
    num_previous_turns = @round.turns.length
    turn = @round.take_turn(4)
    assert_equal num_previous_turns+1, @round.turns.length
  end

  def test_take_turn_returns_and_stores_correct_turn
    num_previous_turns = @round.turns.length
    # Correct answer for next card
    guess = @cards[num_previous_turns].answer

    # Guess correctly
    return_from_correct_turn = @round.take_turn(guess)
    assert_equal return_from_correct_turn, @round.turns[-1]

    # Guess incorrectly on subsequent card
    return_from_incorrect_turn = @round.take_turn(guess)
    assert_equal return_from_incorrect_turn, @round.turns[-1]
  end

  def test_number_correct
    turns = @round.turns
    num_correct = 0

    turns.each do |turn|
      if turn.correct?
        num_correct +=1
      end
    end

    assert_equal num_correct, @round.number_correct

  end
end
