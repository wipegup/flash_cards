require 'minitest/autorun'
require './lib/card'
require './lib/round'
require './lib/turn'

class RoundTest <Minitest::Test

  def setup
    # Create list of Questions,Answers, and Categories
    @questions = ["2+2", "5+3","4+10", "7+14"]
    @answers = [4,8,14,21]
    @categories = [:Geography, :STEM, :STEM, :Math]

    # Create Cards and add to list
    @cards = []

    @questions.zip(@answers, @categories).each do |args|
      @cards << Card.new(*args)
    end

    # Build Deck
    @deck = Deck.new(@cards)

    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_attributes
    assert_instance_of Deck, round.deck
    assert_equal 0, round.number_correct
    assert_instance_of Array, round.turns
  end

  def test_it_has_current_card
    # assert_
  end
end
