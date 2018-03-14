def quiz_checker(answers,user_answers,options)
  correct = 0
  options.length.times do |i|
    if options[i][answers[i]-1] == user_answers[i]
      correct += 1
    end
  end
  {:correct => correct.to_s, :total_questions => answers.length.to_s}
end