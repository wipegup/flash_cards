require './lib/deck'
require './lib/turn'
class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    # @number_correct = 0 # change to method
  end

  def start
    puts "Welcome! You're playing with #{@deck.cards.length} cards."
    puts " --------------------------------------"
    while @turns.length < @deck.cards.length
      solicit_response
    end
    round_summary
  end

  def round_summary
    puts " **************** GAME OVER **************"
    puts "You had #{number_correct} out of #{@turns.length} correct"

    @deck.categories_in_deck.each do |category|
      correct = number_correct_by_category(category).to_f
      total = @deck.cards_in_category(category)

      puts "#{category} -- #{(correct/total*100).round} %"
    end
  end

  def solicit_response
    puts ""
    puts "This is card number #{(@turns.length) +1} out of #{@deck.cards.length}"
    puts current_card.question
    puts ">"
    guess = gets.chomp.to_i

    turn = take_turn(guess)

    puts turn.feedback
  end

  def current_card
    return @deck.cards[@turns.length]
  end

  def take_turn(guess)
    turn =  Turn.new(guess, current_card)
    @turns << turn

    # if turn.correct?
    #   @number_correct +=1
    # end

    return turn

  end

  def number_correct
    correct_turns = @turns.find_all do |turn|
      turn.correct?
    end

    return correct_turns.length
  end

  def number_correct_by_category(category)
    correct_in_category = @turns.find_all do |turn|
      turn.correct? && turn.card.category == category
    end

    return correct_in_category.length
  end



end
