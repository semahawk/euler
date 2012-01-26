#!/usr/bin/env ruby

# 
# Tubis's solution. Mine is taking too much time :D
# 

require 'prime'

def triangle
	a, b = 1, 1
	loop do
		yield a
		b += 1
		a += b
	end
end

p enum_for(:triangle).find {|x| x.prime_division.collect(&:last).inject(1) {|product, e| product * (e + 1)} > 500 }
