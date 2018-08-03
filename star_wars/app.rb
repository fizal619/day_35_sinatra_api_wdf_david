require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/' do
  erb :index
end

post '/results' do 
  response = HTTParty.get("https://swapi.co/api/people/#{params['person_id']}/")
  @results = {
    name: response['name'],
    eye_color: response['eye_color'],
    birth_year: response['birth_year'],
    height: response['height']
  }
  erb :index
end