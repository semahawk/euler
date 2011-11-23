#!/usr/bin/env ruby

alphabet = ("A".."Z").to_a

names = nil
File.open("names.txt") do |file|
	names = file.read.gsub('"', '').split(",").sort
end

worths = []
scores = []
names.each_with_index do |name, idx|
	worths[idx] = 0
	name.split("").each do |n|
		worths[idx] += alphabet.index(n) + 1
	end
	scores[idx] = worths[idx] * (names.index(name) + 1)
end

total = 0
scores.each do |i|
	total += i.to_i
end

puts "yer answerr be: #{total}"
