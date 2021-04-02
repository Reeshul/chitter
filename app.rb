# frozen_string_literal: true

require 'sinatra/base'

# App controller inherits from Sinatra::Base
class Chitter < Sinatra::Base
  get '/' do
    'Hello World'
  end

  run! if app_file == $PROGRAM_NAME
end
