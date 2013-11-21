#!bin/perl

use strict;
use warnings;
use File::Path qw(make_path);

my $file = $ARGV[0];
my @file;

my $source_path = "~/Downloads/CaraQ_Project/action_tga/others/";
#my $destination_path = "~/Documents/workspace/CaraQ/CaraQ/Assets/Texture/res_filter/10_others/";
my $destination_path = "/tmp/10_others/";

open (FILE, $file) or die "Could not open file '$file' : $!";
@file = <FILE>;
close(FILE);

# `$#file` if the final index of array @file
for (my $i = 1; $i < $#file; $i++) {
	chomp($file[$i]);
	$file[$i] =~ /^other_(\d+)\.tga$/;
	my $folder = $1;

	my $source_folder;
	if ($folder < 1000) {
		$source_folder = $source_path."0/";
	}
	else {
		$source_folder = $source_path."1/";
	}

	my $final_dest = $destination_path.$folder."/";
	make_path($final_dest);

	foreach my $angle ("A" .. "H") {
		my $filename = "other_".$folder."_".$angle.".tga";
		my $source_subfolder = $source_folder.$angle."/";
		print "cp $source_subfolder$filename $final_dest\n";
		system `cp $source_subfolder$filename $final_dest`;
	}
}
