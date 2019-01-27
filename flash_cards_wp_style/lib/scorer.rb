require './lib/card'

class Scorer
  def initialize()
    @turns = {true => [], false => []}
    @feedback = {true => "Correct!",
                 false => "Incorrect."}
    @score = {'Total' =>[0,0]}
  end

################
# Updating Score
################

  def score(card, guess)
    # Determine whether or not correct guess
    correct = card.answer == guess
    category = card.category

    # Increment question totals for "total" and category
    increment_question_totals(category)

    # Check if correct.
    # If not correct, save guess and card
    if !correct
      turn = [card, guess]

    # If correct increment "correct" totals; save only card
    else
      turn = card
      increment_score_array(category, "correct")
    end

    # Add "turn" information to turns hash
    @turns[correct] << turn

    # Return feedback
    return @feedback[correct]
  end

  def increment_question_totals(category)

    check_category_in_score(category)

    increment_score_array(category, "total")

  end

  def check_category_in_score(category)
    if !@score.has_key?(category)
      @score[category] = [0,0.0]
    end
  end

  def increment_score_array(category, total_or_correct)
    index_hash = {"correct" =>0, "total"=>1}
    index = index_hash[total_or_correct]

    @score['Total'][index] +=1
    @score[category][index] +=1

  end

#####################
# Creating Summaries
#####################

  def score_summary
    puts " **************** GAME OVER **************"
    puts "You had #{@score['Total'][0]} out of #{@score['Total'][1]} correct\n\n"

    @score.keys.each do |category|
      if category != 'Total'
        correct, total = @score[category]
        puts "#{category} -- #{(correct/total*100).round} %"
      end
    end

    puts "************************\n"
  end

  def correct_summary
    puts "You got these questions right:"
    puts "---------------------------"

    @turns[true].each do |card|
      puts "#{card.to_s}\n\n"
    end
  end

  def incorrect_summary
    puts "You got these questions wrong:"
    puts "---------------------------"

    @turns[false].each do |card, guess|
      puts card.to_s
      puts "Your Guess: #{guess}\n\n"
    end
  end
end
