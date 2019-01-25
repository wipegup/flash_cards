require './lib/card'
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

    @cards.each do |card|
      if card.category == category
        count +=1
      end
    end
    return count
  end

  def categories_in_deck
    categories = @cards.map do |card|
      card.category
    end

    return categories.uniq
  end

end
