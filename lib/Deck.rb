class Deck
  attr_reader :cards
  def initialize( cards )
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    count = 0
    @cards.each do |c|
      if c.categry == category
        count +=1
      end
    end
    return count
  end
end
