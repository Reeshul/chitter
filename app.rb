# frozen_string_literal: true

require 'sinatra/base'
require "./lib/peep"

# App controller inherits from Sinatra::Base
class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/posted' do
    Peep.create(message: params["post_peep"])
    redirect("/")
  end

  run! if app_file == $PROGRAM_NAME
end
