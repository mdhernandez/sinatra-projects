require 'sinatra'
require 'sinatra/reloader'

a = rand(101)
get '/' do
 "THE SECRET NUMBER IS #{a}"
end