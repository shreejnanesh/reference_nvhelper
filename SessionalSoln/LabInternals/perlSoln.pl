#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;
use Data::Dumper;
use feature 'say';


sub question{
  "Name of the instance, instance-Number, Area-per instance and power per instance. 
  Generate output file in the registration_number.txt 
  1. Sort the file based on Area-per-Instance
  2. Count the total number of instances 
  3. Calculate the total area of all the instances 
  4. Calculate the total area of RAM 
  5. Calculate the average area of the instances
  6. Print the smallest instance based on area 
  7. Print the instance which uses more power
  8. Find what is the difference between highest and lower Power-Per-instance"
}

my $FileName = "data.txt";
my $outFileName = "201038012.txt";
my (@areaPI, @powerPI);
my @filedata;
my $totalNoOfInstances;
my $areaOfInstances;
my $ramArea;
my $averageAreaOfInstances;
my $val=0;
my $differencePower;
my $header;

open my $fh, '<', $FileName or die "cant open the file: $!";
 	while (my $line = <$fh>) {
 		chomp $line;
 		$line =~ s/[ ?\t]+/ /g;
 		if ($val==0) {
 			$header = $line;
 		}
			if ($val!=0) {	
				$totalNoOfInstances+=(split / /, $line)[1];
				$areaOfInstances+=(split / /, $line)[2];
				push(@filedata,$line);
				if ((split / /, $line)[0]=~m/RAM/) {
					$ramArea+=(split / /, $line)[2];
				}
				$averageAreaOfInstances += (split / /, $line)[1] * (split / /, $line)[2];
				push(@areaPI,(split / /, $line)[2]);	
				push(@powerPI,(split / /, $line)[3]);
				}
			$val++;
			}
close $fh or die "cant close";


@filedata = sort {(split(' ',$a))[2] <=> (split(' ',$b))[2]} @filedata;
$averageAreaOfInstances /=$totalNoOfInstances;
@powerPI = sort { $b <=> $a } @powerPI;
$differencePower = $powerPI[0]-$powerPI[-1];


open $fh, '>', $outFileName or die "cant open the file: $!";
	print $fh $header,"\n";
	print $fh @filedata,"\n";
	print $fh "\n";
 	print $fh "The total number of instances : $totalNoOfInstances\n";
	print $fh "Total area of all the instances : $areaOfInstances\n";
 	print $fh "Total area of RAM  : $ramArea\n";
 	print $fh "Average area of the instances : $averageAreaOfInstances\n";
	print $fh "smallest instance based on area :",(sort { $a <=> $b } $areaPI[0]),"\n";
  print $fh "Instance which uses more power : $powerPI[0]\n";
  print $fh "The difference between highest and lower Power-Per-instance : $differencePower\n";
close $fh or die "cant close";
