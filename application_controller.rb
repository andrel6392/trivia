require 'dotenv/load'
require 'bundler'
require 'pp'
Bundler.require

require_relative 'models/data-sorter.rb'

class ApplicationController < Sinatra::Base
enable :sessions


  get '/' do
    erb :index
  end


  post '/questions' do 
    @user_topic = params["trivia-topic"]
    @user_num = params["trivia-qnumber"]
    @user_hash = get_trivia_questions(@user_topic, @user_num)
    @quiz_questions = @user_hash.keys
    @quiz_questions.shift 
    @quiz_options = @user_hash.values #2 dimensional array of options for each question
    @quiz_answers = @quiz_options.shift #answers for questions
    session[:user_hash] = @user_hash
    # puts "Questions:"
    # pp @quiz_questions
    # puts "Options:" 
    # pp @quiz_options
    # puts "Answers:"
    # pp @quiz_answers
    erb :questions
  end 
  
  post '/results' do
    puts session[:user_hash]
    @questions = params["quiz_questions"]
    erb :results
    
  end 

end
