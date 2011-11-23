#!/usr/bin/perl -w

=pod

If we list all the natural numbers below 10 that are multiples of
3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

=cut

use strict;

my $sum = 0;

for my $i (0..999){
	$sum += $i if ( $i % 5 == 0 ) or ( $i % 3 == 0 )
}

print "and the answer is: $sum\n"
