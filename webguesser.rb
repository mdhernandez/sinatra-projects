require 'sinatra'
require 'sinatra/reloader'


a = rand(101)

def check_guess(num, a)
  result = ""
  if num.to_i == a 
    result = "You got it right!\nThe Secret Number was #{a}"
  elsif num.to_i > a
    if num.to_i > a + 5
	  result = "Way too high"
	else
      result = "Too high"
   end
  else
    if num.to_i + 5 < a
	  result = "Way too low"
	else
      result = "Too low"
	end
  end
  return result
end

get '/' do
 guess = params["guess"]
 message = check_guess(guess, a)
 erb :index, :locals => {:message => message}
end

