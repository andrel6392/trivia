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
    @user_hash = get_trivia_questions()
    erb :questions
    
    
  end 
  
  post '/results' do 
    erb :results
  end 

end
