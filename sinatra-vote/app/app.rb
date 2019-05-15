#!/usr/bin/env ruby

require 'sinatra'
require 'active_support/all'
require 'json'
require 'erb'
require 'yaml/store'
require 'erubis'

enable :sessions
set :session_secret, ENV['SESSION_SECRET']
set :bind, '0.0.0.0'
set :port, 8080

Choices = {
  'HAM' => 'Hamburger',
  'PIZ' => 'Pizza',
  'CUR' => 'Curry',
  'NOO' => 'Noodles',
}

get '/' do
  @title = "Welcome to voting app"
  erb :index, :format => :html5
end

post '/vote' do
  if params[:vote].empty?
    raise 'votes param is empty'
  elsif session[:voted] != true
    @title = 'Thank you for your vote!'
    @vote = params['vote']
    @store = YAML::Store.new 'votes.yml'
    @store.transaction do
      unless @store['votes'][@vote].nil?
        @store['votes'][@vote] += 1
      end
    end
    session[:voted] = true
  else
    @title = 'You have already voted!'
  end
  erb :vote
end

get '/results' do
  @title = 'Results so far:'
  @store = YAML::Store.new 'votes.yml'
  @votes = @store.transaction { @store['votes'] }
  erb :results
end
