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

    puts "************************\n"
  end


  def print_card(card)
    puts "Question: #{card.question}"
    puts "Answer: #{card.answer}"
  end

  def correct_summary
    puts "You got these questions right:"
    puts "---------------------------"
    @turns[true].each do |card|
      print_card(card)
      print "\n"
    end
    print "\n\n"
  end

  def incorrect_summary
    puts "You got these questions wrong"
    puts "---------------------------"
    @turns[false].each do |card, guess|
      print_card(card)
      puts "Your Guess: #{guess}\n\n"
    end
    print "\n\n"
  end

end
