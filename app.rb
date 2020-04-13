require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :chitter_feed
  end

  post '/' do
    Peep.create(text: params['text'])
    redirect '/'
  end

  run! if app_file == $0
end