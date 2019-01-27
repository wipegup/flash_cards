require './lib/card'

class Scorer
  def initialize()
    @turns = {true => [], false => []}
    @feedback = {true => "Correct!",
                 false => "Incorrect."}
    @score = {'Total' =>[0,0]}
  end

  def check_category_in_score(category)
    if !@score.has_key?(category)
      @score[category] = [0,0.0]
    end
  end
  def increment_question_totals(category)
    # Check to see if category exists in score table;
    # if not, add to table
    check_category_in_score(category)


    # Increment question totals
    increment_score_array(category, "total")

  end

  def increment_score_array(category, total_or_correct)
    if total_or_correct == "correct"
      index = 0
    elsif total_or_correct == "total"
      index = 1
    else
      return "Error"
    end

    @score['Total'][index] +=1
    @score[category][index] +=1

    return true
  end

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
