require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end


  post '/questions' do 
    erb :questions
    
    
  end 
  
  post '/results' do 
    erb :results
  end 

end
