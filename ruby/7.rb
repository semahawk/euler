#!/usr/bin/env ruby

require 'prime'

primes = []
n = 0

begin
	primes << n if Prime.prime? n
	n += 1
end until primes.size >= 10001

puts primes.last
