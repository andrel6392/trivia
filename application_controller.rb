require 'dotenv/load'
require 'bundler'
require 'pp'
Bundler.require

require_relative 'models/data-sorter.rb'
require_relative 'models/quiz-calculator.rb'

class ApplicationController < Sinatra::Base
enable :sessions
set :session_secret, 'christy li' 


  get '/' do
    erb :index
  end


  post '/questions' do 
    @user_topic = params["trivia-topic"]
    @user_num = params["trivia-qnumber"]
    @user_hash = get_trivia_questions(@user_topic, @user_num)
    @quiz_questions = @user_hash.keys.drop(1)
    session[:trivia_qnumber] = @user_num
    session[:quiz_options] = @user_hash.values.drop(1)
    session[:user_hash] = @user_hash
    session[:quiz_questions] = @quiz_questions
    session[:quiz_answers] = @user_hash.values.shift
    erb :questions
  end 
  
  post '/results' do
    @correct_answers = quiz_checker(session[:quiz_answers],params.values,session[:quiz_options])
    @user_hash = session[:user_hash]
    @quiz_questions = session[:quiz_questions]
    erb :results
    
  end 

end
