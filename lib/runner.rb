require './turn.rb'
require './card.rb'
c = Card.new("2+2",4,:Math)

t = Turn.new(5,c)

require 'pry'

binding.pry
