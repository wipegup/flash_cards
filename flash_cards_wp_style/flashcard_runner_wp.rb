require './lib/card_generator'
require './lib/round'


cards = CardGenerator.new('./lib/cards.txt').cards

round = Round.new(cards)

round.start
round.display_score
