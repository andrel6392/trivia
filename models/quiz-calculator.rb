def quiz_checker(answers,user_answers,options)
  correct = 0
  # checks if the user answer is the correct answer by going into the answer array
  # pulling out the correct answer then putting that number into the options 2-D array
  options.length.times do |i|
    if options[i][answers[i]-1] == user_answers[i]
      correct += 1
    end
  end
  # returns hash with needed data
  {:correct => correct.to_s, :total_questions => answers.length.to_s}
end