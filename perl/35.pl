#!/usr/bin/perl

=pod

The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?

=cut

use strict;
use warnings;
use List::MoreUtils "uniq";

my @primes;
my @non_primes;

sub is_prime {
  my $n = shift;
  #return 0 if ($n ~~ @non_primes); # unstable
  return 1 if ($n ~~ @primes);
  return 0 if ($n == 1);
  return 1 if ($n == 2);
  for (my $i = $n - 1; $i > 1; $i--){
    if ($n % $i == 0){
      # unstable start
      #for (my $m = $n; $m < 1_000_000; $m += $n){
        #push @non_primes, $m;
      #}
      #push @non_primes, $n;
      # unstable end
      return 0;
    }
  }

  return 1;
}

for (my $i = 1; $i < 1_000_000; $i++){
  printf "# $i\n" if ($i % 1000 == 0);
  my $all_prime = 1;
  my @rots = ();

  next if ($i ~~ @primes);
  #next if ($i ~~ @non_primes); # unstable
  next if (!is_prime $i);

  for my $j (0 .. length($i) - 1){
    $rots[$j]  = "";
    $rots[$j] .= substr $i, $j;
    $rots[$j] .= substr $i, 0, $j;
    $all_prime = 0 if (!is_prime $rots[$j]);
  }

  if ($all_prime){
    print "+ @rots\n";
    push @primes, uniq @rots;
  }
}

print $#primes + 1 . "\n";

