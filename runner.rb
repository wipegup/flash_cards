require './lib/turn'
require './lib/card'
c = Card.new("2+2",4,:Math)

t = Turn.new(5,c)

require 'pry'

binding.pry
