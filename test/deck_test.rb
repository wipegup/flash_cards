require 'minitest/autorun'
require 'minitest/pride'
require './lib/Card'
require './lib/Deck'

class DeckTest < Minitest::Test
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
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    @deck.cards.each do |card|
      assert_instance_of Card, card
    end

  end

  def test_it_has_count
    assert_equal @deck.count, @questions.length
  end

  def test_it_has_cards_in_category
    @categories.uniq.each do |cat|
      assert_equal @deck.cards_in_category(cat), @categories.count(cat)
    end

  end
end
