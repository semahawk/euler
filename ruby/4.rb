#!/usr/bin/env ruby

$palindromes = []
$n = nil

for i in 100..999
	for j in 100..999
		$palindromes << (i * j) if (i * j).to_s == (i * j).to_s.reverse
	end
end

puts "and the answer is: #{$palindromes.sort.max}"
