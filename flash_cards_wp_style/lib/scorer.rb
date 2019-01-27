require './lib/card'

class Scorer

  def initialize()
    @turns = {true => [], false => []}
    @feedback = {true => "Correct!",
                 false => "Incorrect."}
    @score = {'Total' =>[0,0]}
  end

  def score(card, guess)
    correct = card.answer == guess

    puts @feedback[correct]


    if !@score.has_key?(card.category)
      @score[card.category] = [0,0.0]
    end

    @score['Total'][1] +=1
    @score[card.category][1] +=1

    if !correct
      turn = [card, guess]
    else
      turn = card
      @score[card.category][0] +=1
      @score['Total'][0] +=1
    end

    @turns[correct] << turn

  end

  def score_summary
    puts " **************** GAME OVER **************"
    puts "You had #{@score['Total'][0]} out of #{@score['Total'][1]} correct"

    @score.keys.each do |key|
      if key != 'Total'
        correct, total = @score[key]
        puts "#{key} -- #{(correct/total*100).round} %"
      end
    end
  end
end
