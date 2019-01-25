class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0 # change to method
  end

  def current_card
    return @deck[@turns.length]
  end

  def take_turn(guess)
    turn =  Turn.new(guess, current_card)
    @turns << turn

    if turn.correct?
      @number_correct +=1
    end

    return turn

  end

  def number_correct_by_category(category)

    @turns.each do |turn|
        ####
    end
  end


end
