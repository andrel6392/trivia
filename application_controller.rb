require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/data-sorter.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end


  post '/questions' do 
    puts params
    @user_topic = params["trivia-topic"]
    @user_num = params["trivia-qnumber"]
    @user_hash = get_trivia_questions(@user_topic, @user_num)
    erb :questions
  end 
  
  post '/results' do 
    erb :results
  end 

end
