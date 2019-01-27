require './lib/card'

class CardGenerator
  attr_reader :cards

  def initialize(file_path)
    @file = IO.readlines(file_path)
    @cards = parse_from_file
    return @cards
  end

  def parse_from_file
    cards = []

    @file.each do |line|
      args = line.split(",")
      args[-1] = args[-1][0..-2].to_sym
      cards << Card.new(*args)
    end

    return cards
  end


end
