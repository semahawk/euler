#!/usr/bin/env ruby

$sum = 0
$number = 100

def factorial n
	if n == 1
		1
	else
		n * factorial(n - 1)
	end
end

def main
	factorial($number).to_s.split("").each { |n| $sum += n.to_i }
end

main
puts "and the answer is: #{$sum}"
