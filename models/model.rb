require 'net/http'
require 'json'
require 'pp'


def get_trivia_questions(topic, question_number)
   url = "https://qriusity.com/v1/questions?page=2&limit=5"
   uri = URI(url)
   response = Net::HTTP.get(uri)
   result = JSON.parse(response)
   
   #sort data and grab questions with choices, and answers
   q_and_a = {}
   correct_answers = []
   question_name = ""
   result.each do |question_info|
      question_info.each do |info_key,info_value|
         if info_key == "question"
            question_name = info_value
            q_and_a[question_name] = []
         elsif info_key.include?("option")
            q_and_a[question_name] << info_value
         elsif info_key.include?("answers")
            correct_answers << info_value
         end
      end
   end
end

pp q_and_a