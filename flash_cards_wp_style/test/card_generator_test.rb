require 'minitest/autorun'
require './lib/card_generator'
require './lib/card'

class CardGeneratorTest < Minitest::Test

  def setup
    @file_path = './lib/cards.txt'
    @card_gen = CardGenerator.new(@file_path)
  end

  def test_it_has_cards
    cards = @card_gen.cards

    cards.each do |card|
      assert_instance_of Card, card
    end
  end

  def test_cards_have_correct_info
    # Returns array, each line an element
    raw_info = IO.readlines(@file_path)

    cards = @card_gen.cards
    assert_equal cards.length, raw_info.length

    cards.zip(raw_info).each do |card, info|
      info = info.split(",")
      assert_equal card.question, info[0]
      assert_equal card.answer, info[1]
      assert_equal card.category, info[2][0..-2].to_sym
    end
  end
end
