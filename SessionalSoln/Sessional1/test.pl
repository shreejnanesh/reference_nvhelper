#! /usr/bin/perl


use strict;
use warnings;
use Getopt::Long qw(GetOptions);

my @value = @ARGV;
my $NoOfArgs = $#ARGV+1;

if ($NoOfArgs == 0) {
	print " pass args using cla \n";
} elsif($NoOfArgs < 3) {
	print "less Args \n";
} elsif ($NoOfArgs > 5){
	print "more Args \n";
} 
my @car;
my $source_address;
	

while (1) {
	GetOptions('from=s' => \$source_address) or die "Usage: $0 --from NAME\n";
	if ($source_address eq '-a') {
		push(@car,$ARGV[0]);
		push(@car,$ARGV[1]);
		push(@car,$ARGV[2]);
	#    print $source_address,"\n";
	} elsif ($source_address eq '-d') {
		@car[$ARGV[1]]="";		
	} elsif ($source_address eq '-e') {
	 exit;
	}
}

	

print @car;





#print @value,$NoOfArgs;
