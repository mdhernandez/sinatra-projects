require 'sinatra'
require 'sinatra/reloader'


a = rand(101)
get '/' do
 erb :index, :locals => {:a => a}
end