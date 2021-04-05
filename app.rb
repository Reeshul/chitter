# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb(:index)
  end

  post '/posted' do
    user = User.find(id: session[:user_id])
    if user
      Peep.create(message: params['post_peep'], user_email: user.email)
    else
      flash[:alert] = 'Please register or log in to peep.'
    end
    redirect('/')
  end

  get '/users/new' do
    erb(:"users/new")
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/')
  end

  get '/sessions/new' do
    erb(:"sessions/new")
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:alert] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:alert] = 'You have signed out.'
    redirect('/')
  end

  run! if app_file == $PROGRAM_NAME
end
