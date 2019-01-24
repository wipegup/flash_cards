class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct
  end

  def current_card
    return @deck[@turns.length]
  end

  def take_turn(guess)
    turn =  Turn.new(guess, current_card)
    @turns << turn

    return turn

  end

  def
end
