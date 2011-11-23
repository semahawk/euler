#!/usr/bin/env ruby

sum = 0
n = (2**1000).to_s

n.split("").each { |n| sum += n.to_i }

puts "and the answer is: #{sum}"
