require './lib/card'

class Scorer
  def initialize()
    @turns = {true => [], false => []}
    @feedback = {true => "Correct!",
                 false => "Incorrect."}
    @score = {'Total' =>[0,0]}
  end

  def score(card, guess)
    # Determine whether or not correct guess
    correct = card.answer == guess

    # Print feedback to terminal
    puts @feedback[correct]

    # Check to see if category exists in score table;
    # if not, add to table
    if !@score.has_key?(card.category)
      @score[card.category] = [0,0.0]
    end

    # Increment question totals
    @score['Total'][1] +=1
    @score[card.category][1] +=1

    # Check if correct.
    # If not correct, save guess and card
    if !correct
      turn = [card, guess]

    # If correct increment "correct" totals; save only card
    else
      turn = card
      @score[card.category][0] +=1
      @score['Total'][0] +=1
    end

    # Add "turn" information to turns hash
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

  def correct_summary
    puts "You got these questions right:"
    puts "---------------------------"
    @turns[true].each do |card|
      puts card.to_s
      print "\n"
    end
    print "\n\n"
  end

  def incorrect_summary
    puts "You got these questions wrong:"
    puts "---------------------------"
    @turns[false].each do |card, guess|
      puts card.to_s
      puts "Your Guess: #{guess}\n\n"
    end
    print "\n\n"
  end

end
