require 'sinatra'
require 'sinatra/reloader'

def caesar (str, key)
  c_arr = str.chars
  s_key = key % 26
  c_arr.map! do |letter|
    ordinal = letter.ord
	if((ordinal <= 122 && ordinal >= 97) || (ordinal <=90 && ordinal >= 65))
	  ordinal += s_key
	  if (ordinal > 122 || (ordinal > 90 && (ordinal - s_key) <= 90))
	    ordinal -= 26
	  elsif(ordinal < 65 || (ordinal < 97 && (ordinal + s_key) >= 97))
	    ordinal += 26
	  end
    end	
	letter = ordinal
  end
  newstr = c_arr.pack('c*')
  return newstr
end

#caesar cipher test cases
#puts caesar("What a string!", 5)
#puts caesar("What a string!", 57)
#puts caesar("What a string!", -5)
#puts caesar(" What a string!", -57)



get '/' do
  to_encrypt = params["uncoded"].to_s
  encrypt_key = params["key"].to_i
  encrypted_str = caesar(to_encrypt, encrypt_key)
  erb :caesar_index, :locals => {:encrypted_str => encrypted_str}
end