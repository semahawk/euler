#!/usr/bin/perl -w

use strict;

=pod

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.

=cut

my $sum = 0;

sub factorial {
	my $n = shift;
	my $ans = 1;
	foreach my $i (reverse (1..$n)){
		$ans *= $i;
	}
	return $ans;
}

my $i = 2;
for (;;){
	$i++;
	my $lsum = 0;
	for (my $key = 0; $key < length($i); $key++) {
		my $digit = substr ($i, $key, 1);
		$lsum += factorial($i);
	}
	if ($lsum == $i){
		print "got: $i\n";
		$sum += $i;
	}
}

print "and the answer is: $sum\n";
