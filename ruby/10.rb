#!/usr/bin/env ruby

require 'prime'

primes = [2]
n = 0
sum = 0

begin
	if Prime.prime? n
		primes << n
		sum += n
	end
	n += 1
end until primes.last >= 2000000

sum = sum - primes.last

puts "last: #{primes.last}"
puts "sum: #{sum}"
