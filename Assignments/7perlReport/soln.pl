#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;

use feature 'say';
use Getopt::Long qw(GetOptions);
use Data::Dumper;

sub question {
"Lab:7 
Write a Perl script
-	To take the filename (netlist) and the component name from the command line argument.
-	It should validate the number of command line arguments. If it less than two, It should display “Invalid arguments” 
-	It can accept more component name 
-	It should find and count the number component present in the file. 
-	It should print a list of all the component names found and the number of appearances.
BONUS POINT : 
1.	Include reporting 
2.	Include subroutines";
}





my $netlistFile;
my @componentName;
my %compCount;


validateArguments();
performOptionProcess();
readFileAndExtract($netlistFile,@componentName);
createReport(%compCount);
#print Dumper {'netlistFile' => $netlistFile , 'componentName' => \@componentName , 'compCount' => \%compCount};






sub performOptionProcess {		
	GetOptions('f|netfile=s' => \$netlistFile ,
			   'c|component=s{1,}' => \@componentName) 
	or die "Usage:
		syntax	./soln.pl -f 'string' -c 'string1' 'string2'
		c = name of the component
		f = netlist file to process\n";


	foreach my $x (@componentName) {
		$compCount{"$x"}=0;
	}
}


sub readFileAndExtract {
	my ($fileName,@inCompArg) = @_;
	open my $fh, '<' , $fileName or die "cannot open the verilog file $!";
		while (my $line = <$fh>) {
			chomp $line;	
			my ($stdCellName,$modulename) = (split /\\/, $line);	
			chop $stdCellName;
			foreach my $x (@inCompArg) {
				if ($x eq $stdCellName) {
					$compCount{"$x"} += 1;
				}
			}
		}
	close $fh or die "cannot close the file $!";
}

sub validateArguments {
	if (($#ARGV+1) < 2) {
		say "Invalid Arguments";
		exit;
	}
}

sub createReport {
	my (%InHash) = @_;
	my @compname = keys%InHash;
	my @compval = values%InHash;

	select(STDOUT);
	$~ = "OUTDATA";
	$^ = "OUTDATA_TOP";
	my $k=0;
	while ($k < scalar @compname) {
		write;
		$k++;
	}

format OUTDATA_TOP =
@||||||||||||||||||||||||||||||
"Netlist Description Set"
=====================================
@<<<<<<<<<<<<<<<@|||@>>>>>>>>>>>>>>>>
"Component Name","|" ,"Component Count"
-------------------------------------
. 	

format OUTDATA =
@<<<<<<<<<<<<<<<@|||@>>>>>>>>>>>>>>>>
$compname[$k], "=>" ,$compval[$k]
.
}