#!bin/perl

use strict;
use warnings;

my $file = $ARGV[0];
my @file;

my %map;
my $no = '"no"';

open (FILE, $file) or die "Could not open file '$file' : $!";
@file = <FILE>;
close(FILE);

# `$#file` if the final index of array @file
for (my $i = 1; $i < $#file; $i++) {
  my @columns = split("\t", $file[$i]);

  if (defined(chomp($columns[13]))) {
    my @others = split (' ', $columns[13]);

    for (my $j=0; $j<=$#others; $j++) {
      my @attr = split('/', $others[$j]);

      $map{$attr[0]} = 1;
    }
  }
}

my $size = keys %map;

foreach my $key (sort {$a <=> $b} keys %map ) {
  print "other_$key.tga\n";
}
