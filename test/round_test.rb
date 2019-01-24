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

end
