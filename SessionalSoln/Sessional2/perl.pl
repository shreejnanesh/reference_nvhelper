#!/usr/bin/perl

use strict;
use feature 'say';
use Data::Dumper;

sub question {
	"
	Write a Perl program to generate a report of your current directory using formats.
	File name , owner of the file , when they created the file, 
	the total number of files created and how much space occupied by the user.
	"
}

my @dirnames =`ls -l`;

my $numberoffiles = scalar @dirnames -1;
my ($fileName, $owner, $createddt, $space, $totalspace)=0;

for (my $var = 1; $var <= $numberoffiles; $var++) {
	select(STDOUT);
	$~ = "OUTDATA";
	$^ = "OUTDATA_TOP";
	$dirnames[$var] =~ s/  */ /g; #spaces are important
	$fileName = (split / /,$dirnames[$var])[8];
	$owner= (split / /,$dirnames[$var])[3];
	$createddt= ((split / /,$dirnames[$var])[5]."-".(split / /,$dirnames[$var])[6]." : ".(split / /,$dirnames[$var])[7]);
	$space= (split / /,$dirnames[$var])[4];
	$totalspace+=$space;
	write;
}

say "total number of files ", $numberoffiles;
say "total space consumed ",$totalspace;


format OUTDATA_TOP =
@|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
"File report"
================================================================
@<<<<<<<<<<<<<<<@<<<<<<<<<<<<<<<@<<<<<<<<<<<<<<<@<<<<<<<<<<<<<<<
"File name" , "owner " , "Created date", "Space"
----------------------------------------------------------------
. 	

format OUTDATA =
@<<<<<<<<<<<<<<<@<<<<<<<<<<<<<<<@<<<<<<<<<<<<<<<@<<<<<<<<<<<<<<<
$fileName , $owner , $createddt, $space
.