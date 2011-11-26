#!/usr/bin/perl -w

use strict;

=pod

Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

    1634 = 14 + 64 + 34 + 44
    8208 = 84 + 24 + 04 + 84
    9474 = 94 + 44 + 74 + 44

As 1 = 14 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

=cut

my $power = shift;
my $found = 0;
my @numbers = qw();
my $answer = 0;

my $i = 1;
for (;;){
	$i++;
	my $sum = 0;
	for (my $key = 0; $key < length($i); $key++) {
		my $digit = substr ($i, $key, 1);
		$sum += $digit ** $power;
	}
	if ($sum == $i){
		$found++;
		# print "got: $i\n";
		$answer += $i;
		last if ($found == 6);
		# Ok, I made it quite luckilly. For first I set it to 12 
		# founds but it was finding them fast, and stopped at sixth
		# so I thought these are the only ones. Gotcha, 30!
	}
}

print "and the answer is: $answer\n";
