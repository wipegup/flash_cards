require './lib/round'
require './lib/card_generator'

cards = CardGenerator.new('./lib/cards.txt').cards

p cards.length

# card_info = [
#   ["2+2", 4, :Geography],
#   ["5+3", 8, :STEM],
#   ["4+10", 14, :STEM],
#   ["7+14", 21, :Math]
# ]
#
# cards = []
# card_info.each do |card_arg|
#   cards << Card.new(*card_arg)
# end

# Build Deck
deck = Deck.new(cards)

round = Round.new(deck)

round.start
round.play_game
round.round_summary
