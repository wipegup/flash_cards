class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    # @number_correct = 0 # change to method
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
    num_correct = 0
    @turns.each do |turn|
      if turn.correct?
        num_correct +=1
      end
    end

    return num_correct
  end

  def number_correct_by_category(category)
    correct_by_category = 0
    @turns.each do |turn|
        if turn.correct? && turn.card.category == category
          correct_by_category +=1
        end
    end
  end


end
