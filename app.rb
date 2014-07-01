require 'bundler'
Bundler.require
require_relative 'models/to_do'
require_relative 'config'

get '/' do
  @to_dos = To_do.all
  erb :index
end

get '/to_dos/new' do
  erb :new
end

post '/to_dos' do
  to_do = To_do.create({
    description: params[:description],
    due_date: params[:due_date]
    })
  redirect '/'
end

get '/to_dos/:id/edit' do
  @to_do = To_do.find(params[:id])
  erb :edit
end

put '/to_dos/:id' do
  to_do = To_do.find(params[:id])
  to_do.description = params[:description]
  to_do.due_date = params[:due_date]
  to_do.save
  redirect '/'
end

delete '/to_dos/:id' do
  to_do = To_do.find(params[:id])
  to_do.delete
  redirect '/'
end
