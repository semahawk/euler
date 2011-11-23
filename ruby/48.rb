#!/usr/bin/env ruby

$sum = 0

for n in 1..1000
	$sum += n**n
end

puts "and the answer is: #{$sum.to_s[-10..-1]}"
