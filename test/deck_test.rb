require 'minitest/autorun'
require 'minitest/pride'
require './lib/Card'
require './lib/Deck'

class DeckTest < Minitest::Test
  def setup
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
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    @deck.cards.zip(@cards).each do |deck_card, input_card|
      assert_equal input_card, deck_card
    end

  end

  def test_it_has_count
    assert_equal @deck.count, @cards.length
  end

  def test_it_has_cards_in_category
    category_hash = {}

    @cards.each do |card|
      category = card.category
      if !category_hash.key?(category)
        category_hash[category] = 1
      else
        category_hash[category] +=1
      end
    end

    category_hash.each_key do |category|
      assert_equal @deck.cards_in_category(category), category_hash[category]
    end

  end

  def test_it_has_categories_in_deck
    categories = []
    @cards.each do |card|
      categories << card.category
    end

    categories.uniq.each do |category|
      assert @deck.categories_in_deck.include?(category)
    end
  end


end
