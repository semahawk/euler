#!/usr/bin/perl -w

=pod

The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

=cut

# Found a nice way of checking weather the number is a prime or not
# right here: http://www.noulakaz.net/weblog/2007/03/18/a-regular-expression-to-check-for-prime-numbers/
sub is_prime {
	my $n = shift;
	(1 x $n) !~ /^1?$|^(11+?)\1+$/;
}

sub fits {
	# 1 - is a number we are looking for.
	# 0 - is not.
	my $really = 1;
	my $n = shift;
	for (my $i = 0; $i < length $n; $i++){
		# print " " x ($i + 1) . substr($n, $i) . " - " . is_prime(substr($n, $i)) . "\n";
		if (!is_prime(substr($n, $i))){
			$really = 0;
			last;
		}
	}

	# print "\n";

	for (my $i = length $n; $i >= 1; $i--){
		# print " " . substr($n, 0, $i) . " " x (length($n) - $i) . " - " . is_prime(substr($n, 0, $i)) . "\n";
		if (!is_prime(substr($n, 0, $i))){
			$really = 0;
			last;
		}
	}

	return $really;
}

# How many numbers we have already found, excluding 2, 3, 5 and 7.
# It should not be greater than eleven.
my $n = 0;

# Sum of the numbers we have found. The answer.
my $sum = 0;

# The number to be checked if fits.
my $i = 1;

for (;;){
	$i += 2;

	if ($i != 2 and $i != 3 and $i != 5 and $i != 7 and fits($i)){
		$n++;
		print "found [$n]: $i\n";
		$sum += $i;
	}
	
	# Break if we have all of'em.
	last if ($n == 11);
}

print "\a\nand the answer is: $sum\n";
