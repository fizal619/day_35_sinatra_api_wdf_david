require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pp'

# http://api.openweathermap.org/data/2.5/weather?zip=94040,us?APPID=#{}


get '/' do 
  erb :index
end

get '/weather' do
  response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{params['search']}&APPID=#{ENV['WEATHER_KEY']}")
  
  @data = {
    city: response["name"],
    weather: response["weather"][0]["description"]
  }

  JSON @data
  # erb :index
end
