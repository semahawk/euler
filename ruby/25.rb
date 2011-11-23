#!/usr/bin/env ruby

def solveme
	l = 1        # line. actually, number's order
	a, b = 1, 0
	
	while true
		if a.to_s.size >= 1000
			puts "and the answer is: #{l}"; break
		else
			a, b, l = a + b, a, l + 1
		end
	end
end

solveme
