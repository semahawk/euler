#!/usr/bin/perl -w
use strict;

sub bitize {
	my @bits = qw();
	my $num = $_[0];

	while ($num >= 1){
		# even
		if ($num % 2 == 0){
			push(@bits, 0);
		# odd
		} else {
			push(@bits, 1);
		}
		
		$num /= 2;
	}
	
	reverse @bits;
}

my $n = 1;
my $sum = 0;

while ($n < 1000000){
	if (reverse($n) == $n &&
		bitize($n) == reverse(bitize($n))){
		$sum += $n;
	}
	$n++;
}

print "and the answer is: $sum\n";
