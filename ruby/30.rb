#!/usr/bin/env ruby

powers = []
sum = 0

(2..354294).each do |number|
  number.to_s.split("").collect { |e| e.to_i }.each do |i|
    puts "Awesome! => #{number}" if 
end
