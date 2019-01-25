require 'minitest/autorun'
require './lib/card'
require './lib/round'
require './lib/turn'

class RoundTest < Minitest::Test

  def setup
    # Create list of Questions,Answers, and Categories
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
    assert_equal @deck, round.deck
    # assert_equal 0, round.number_correct
    assert_equal [], round.turns
  end

  def test_it_has_current_card
    # assert_
  end
end
