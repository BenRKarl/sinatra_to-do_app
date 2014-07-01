require 'bundler'
Bundler.require
require_relative 'models/to_do'
require_relative 'config'

get '/' do
  @to_dos = To_do.all
  erb :index
end
