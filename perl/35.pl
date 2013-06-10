#!/usr/bin/perl

=pod

The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?

=cut

use strict;
use warnings;
use List::MoreUtils "uniq";

# not every prime here, only the cyclic ones
my %primes;
# numbers that are non primes for granted
my %non_primes;

# fill in the twos
for (my $t = 4; $t < 1_000_000; $t += 2){
  $non_primes{$t} = undef;
}

sub is_prime {
  my $n = shift;
  #print "HEHEHEH\n", return 0 if (exists $non_primes{$n});
  #print "HEHEHEH\n", return 1 if (exists $primes{$n});
  if (exists $non_primes{$n}){
    #print "skipping $n, non prime\n";
    return 0;
  }
  if (exists $primes{$n}){
    #print "skipping $n, PRIME\n";
    return 1;
  }
  return 0 if ($n == 1);
  return 1 if ($n == 2);
  for (my $i = $n - 1; $i > 1; $i--){
    if ($n % $i == 0){
      for (my $m = $n; $m < 1_000_000; $m += $n){
        $non_primes{$m} = undef;
      }
      $non_primes{$n} = undef;
      return 0;
    }
  }

  return 1;
}

for (my $i = 1; $i < 1_000_000; $i++){
  printf "# $i\n" if ($i % 1000 == 0);
  my $all_prime = 1;
  my @rots = ();

  next if (exists $primes{$i});
  next if (exists $non_primes{$i});
  next if (!is_prime $i);

  for my $j (0 .. length($i) - 1){
    $rots[$j]  = "";
    $rots[$j] .= substr $i, $j;
    $rots[$j] .= substr $i, 0, $j;
    $all_prime = 0 if (!is_prime $rots[$j]);
  }

  if ($all_prime){
    foreach my $rot (uniq @rots){
      $primes{$rot} = undef;
      print "+ $rot\n";
    }
  }
}

print scalar keys %primes, "\n";

