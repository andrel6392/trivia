require 'dotenv/load'
require 'bundler'
require 'pp'
Bundler.require

require_relative 'models/data-sorter.rb'
require_relative 'models/quiz-calculator.rb'

class ApplicationController < Sinatra::Base
# hash that keeps data throughout multiple routes the same
enable :sessions
#encrypt data for usage across multiple routes
set :session_secret, 'christy li' 


  get '/' do
    erb :index
  end


  post '/questions' do 
    # settings my variables for the questions.erb page
    @user_topic = params["trivia-topic"]
    @user_num = params["trivia-qnumber"]
    @user_hash = get_trivia_questions(@user_topic, @user_num)
    @quiz_questions = @user_hash.keys.drop(1)
    # saving values into session hash for usage in a later route
    session[:trivia_qnumber] = @user_num
    session[:quiz_options] = @user_hash.values.drop(1)
    session[:user_hash] = @user_hash
    session[:quiz_questions] = @quiz_questions
    session[:quiz_answers] = @user_hash.values.shift
    erb :questions
  end 
  
  post '/results' do
    # checking number of correct answers while recalling data retrieved from a different route
    @correct_answers = quiz_checker(session[:quiz_answers],params.values,session[:quiz_options])
    @user_hash = session[:user_hash]
    @quiz_questions = session[:quiz_questions]
    @quiz_options = session[:quiz_options]
    @user_options = params.values
    @quiz_answers = session[:quiz_answers]
    erb :results
    
  end 

end
