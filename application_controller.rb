require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/data-sorter.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    puts params
    erb :index
  end


  post '/questions' do 
    erb :questions
    
    
  end 
  
  post '/results' do 
    erb :results
  end 

end
