#!/usr/bin/env ruby

$chain = {}            # the chain(s)
$longest_chain = 2     # how long is the longest chain
$longest_number = 2    # what number made the longest chain
$number = 13           # there's is actually no matter, what you set here.
                       #   it is just need to be.

def oddize n
	n * 3 + 1
end

def evenize n
	n / 2
end

for n in (1..1000000)
	$number = n
	$chain[:"#{n}"] = [n]
	begin
		if $number.odd?
			$number = oddize $number
			$chain[:"#{n}"] << $number
		else
			$number = evenize $number
			$chain[:"#{n}"] << $number
		end
	end until $chain[:"#{n}"].last.eql? 1 # begin
	
	if $chain[:"#{n}"].size > $longest_chain
		$longest_chain = $chain[:"#{n}"].size
		$longest_number = n
	end
end # for

print "and the answer is:    #{$longest_number}"
