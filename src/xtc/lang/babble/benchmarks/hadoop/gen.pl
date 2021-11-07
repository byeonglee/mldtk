#!/usr/bin/perl -w

if (@ARGV < 2) {
  print "usage: gen.pl [num_tuples] [num_partitions]\n";
  print "example: gen.pl 1000000 16\n";
  exit 1;
}

open FILE, ">", "input.txt" or die $!;

my $num_tuples = $ARGV[0];
my $num_partitions = $ARGV[1];
for ($i = 0; $i < $num_tuples; $i++) {
  $x = $i % $num_partitions;
  $y = $num_partitions - ($i % $num_partitions);
  print FILE $x . "\t" . $y . "\n"; 
}

close FILE;
