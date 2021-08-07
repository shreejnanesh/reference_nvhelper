#! /usr/bin/perl

sub question {
 "Write a Perl script to create, access and delete array elements using command line arguments. Create a Perl script using the instructions below: [4 Marks]
- Get the values using command line arguments.
- If the command lines arguments are empty, display message “pass arguments using command line arguments”.
- If the command line arguments are greater than 5, display message “more arguments”
- If the command line arguments are less than 3, display message “less arguments”
- If option –a means add car names to the array “car”, after –a need to pass the items to store in the array. In the below example it should add ford and bmw to an array “car”
		Example : ./pgm.pl –a ford bmw
- If option –d means delete the car, after d need to give the index of element to delete
		Example: ./pgm.pl –d 5 ( it should delete 5th item from the array)
- If option –e means exit the program";
}

use strict;
use warnings;
use Getopt::Long qw(GetOptions);
use Data::Dumper;

my @value = @ARGV;			#Copying all command line arguments to array
my $NoOfArgs = $#ARGV+1;	#Storing the count of arguments passed from command

my @car = ();				#Array to store if data is sent using -a
my $deleteIndex = -1;		#Variable to store the index of data to delete (-d) default value is -1 for furthur calculations
my $exithelper =0;			#Variable to detect Exit (-e) flag

#exit+ will increment the $exithelper variable. another approach is to negate use ! istead of + and initialize with 0
# <a|A|add> will accept minimum 3 arguments max of 5 and store it to array car. (s is used to accept string)
# <d|D|delete> will accept the index of the element to be deleted (i is used to accept integer, <f can be used to accept float>)
# <e|E|exit> will exit the program. -e or -E or -exit can be used as option for this 
GetOptions('a|A|add=s{3,5}' => \@car , 'd|D|delete=i' => \$deleteIndex , 'e|E|exit+' => \$exithelper ) 
or die "Usage:\n\t$0 -a{3-5:args} : adds data to the array, add 3 to 5 arguments  \n\t$0 -d{index} : Delete an index \n\t$0 -e : exit\n";

#Exits if -e is given in the CLA
if ($exithelper == 1) { exit; }

#Validates for Number of Argumnets Passed the argumnet should be greater than 3 less than 5
if ($NoOfArgs == 0) {
	print "Pass Arguments using Command Line Arguments\n";
} elsif($NoOfArgs < 3) {
	print "Less Arguments are passed\n";
} elsif ($NoOfArgs > 5){
	print "More Arguments are passed\n";
} 

#if index is greater than -1 and less than size of car will delete the data from array else prints the error
if ($deleteIndex > -1 && $deleteIndex < (scalar @car)){
	splice(@car,$deleteIndex,1);
} else {
	print "Index entered should be less than Array size. Current Array Size = ",scalar @car," Index Starts from 0.\n";
}

#Print the data using default dumper format
print Dumper {'Car' => \@car , 'deleteIndex' => $deleteIndex , 'exit' => $exithelper};


#if any argument have to be made mandatory below format can be used
# my $argument = shift @ARGV;
# die "a mandatory parameter `argument'" unless $argument;