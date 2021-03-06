require 'net/http'
require 'json'
require 'pp'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE


def get_trivia_questions(topic_number, question_number)
   
   # goes to api that is linked and pulls out the data that is then turned into a JSON data setup
   rand_page = rand(10)
   url = "https://qriusity.com/v1/categories/#{topic_number}/questions?page=#{rand_page}&limit=#{question_number}"
   uri = URI(url)
   response = Net::HTTP.get(uri)
   result = JSON.parse(response)
   
   #sort data and grab questions with choices, and answers into a hash
   q_and_a = {"answers" => []}
   question_name = ""
   result.each do |question_info|
      question_info.each do |info_key,info_value|
         # each if statement pushes data into the correct key value pair
         if info_key == "question"
            question_name = info_value
            q_and_a[question_name] = []
         elsif info_key.include?("option")
            q_and_a[question_name] << info_value
         elsif info_key.include?("answers")
            q_and_a["answers"] << info_value
         end
      end
   end
   q_and_a
end
