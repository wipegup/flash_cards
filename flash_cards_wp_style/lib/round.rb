require './lib/card'
require './lib/scorer.rb'

class Round

  def initialize(cards)
    @cards = cards
  end

  def start
    puts "Welcome! You're playing with #{@cards.length} cards."
    puts " --------------------------------------"

    @scorer = Scorer.new()
    play_game
  end

  def shuffle
    @cards.shuffle!
  end

  def play_game
    @cards.each do |card|
      guess = solicit_response(card.question)
      puts @scorer.score(card, guess)
      puts "-------------------\n"
    end
  end

  def solicit_response(question)
    p question
    print ">"

    return gets.chomp
  end

  def display_score
    @scorer.score_summary
  end

  def complete_summary
    @scorer.incorrect_summary
    print "\n\n"
    @scorer.correct_summary
  end
end
