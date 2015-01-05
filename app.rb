require 'sinatra'
require 'date'
require './twitter'
require 'json'



configure do
  set :server, 'thin'
  configure_twitter
end

get '/' do
  @notloaded = true
  erb :index
end

get '/me' do
  @notloaded = false
  erb :me
end

get '/contact' do
  @notloaded = false
  erb :contact
end

get '/work' do
  @notloaded = false
  erb :work
end

get '/cv' do
  @notloaded = false
  erb :cv
end

not_found do
  'this does not exist'
end

# POSTS

post '/gtweet', :provides => :json do
  content_type :json
  tweet_back_days (params[:back].to_i)
end