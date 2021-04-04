# frozen_string_literal: true

require 'sinatra/base'
require './lib/peep'
require "./lib/user"

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb(:index)
  end

  post '/posted' do
    user = User.find(id: session[:user_id])
    Peep.create(message: params['post_peep'], user_email: user.email)
    redirect('/')
  end

  get '/users/new' do
    erb(:"users/new")
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect("/")
  end

  run! if app_file == $PROGRAM_NAME
end
