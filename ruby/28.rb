#!/usr/bin/env ruby

dimension = 5
numbers_count = dimension**2

=begin

dimension = 5

	21 22 23 24 25
	20  7  8  9 10
	19  6  1  2 11
	18  5  4  3 12
	17 16 15 14 13


dimension = 7

	43 44 45 46 47 48 49
	42 21 22 23 24 25 26
	41 20  7  8  9 10 27
	40 19  6  1  2 11 28
	39 18  5  4  3 12 29
	38 17 16 15 14 13 30
	37 36 35 34 33 32 31

=end

raise RuntimeError, "`dimension' must be odd!" if dimension.even?

dimension.times do |row|
	(numbers_count - dimension..numbers_count).each do |n|
		print n.to_s + " "
	end
	puts
end

puts
