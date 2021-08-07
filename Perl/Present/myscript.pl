#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;
use POSIX;

use Getopt::Long qw(GetOptions);
use feature 'say';

my $noOfInputs = 2;
my $noOfBits = 4;
my $inPinName = "in";
my $outPinName = "add";
my $verFileName = "output.v";

GetOptions('i|NoOfInputs=i' => \$noOfInputs ,
		   'b|NoOfBits=i' => \$noOfBits ,
		   'p|InPinName=s' => \$inPinName,
		   'o|OutPinName=s' => \$outPinName,
		   'f|VerFileName=s' => \$verFileName) 
or die "Usage:
	syntax	./myscipt.pl -i (integer) -b (integer) -p 'string' -o 'string' -f 'string'
	i = number of inputs for the module
	b = number of bits for each input
	p = name for input port
	o = name for output port
	f = output verilog file name (include .v as am extension)\n";


my $result = beginModule();
	$result = processInputs($result);
	$result = processOutput($result);
	$result = dataFlwComboLogic($result);
	$result = endModule($result);

#Can Also be Used like
#my $res = endModule(dataFlwComboLogic(processOutput(processInputs(beginModule))));

#say $result;

open my $fh, '>', $verFileName or die "cant open the file: $!";
 print $fh $result;
close $fh or die "cant close";

exec ("iverilog $verFileName") or print "cannot execute the output file";



sub beginModule {
	return ("module Adder_$noOfInputs\_In_$noOfBits\_Bit (");	
}

sub processInputs {
	my ($inArg) = @_;
	for (my $var = 0; $var < $noOfInputs; $var++) {
		$inArg=$inArg."\n\tinput [$noOfBits\:1] $inPinName$var,";
	}
	return $inArg;
}

sub processOutput {
	my ($inArg) = @_;
	my $outBitWidth = ceil(log(((2**$noOfBits)-1)*$noOfInputs)/log(2));
	return ($inArg."\n\toutput [$outBitWidth\:1] $outPinName);");
}

sub dataFlwComboLogic {
	my ($inArg) = @_;
	$inArg =$inArg."\n\n assign $outPinName = ";
	for (my $var = 0; $var < $noOfInputs; $var++) {
		$inArg = $inArg."$inPinName$var";
		$inArg = charAnnotation($inArg,$var,'+',';');
	}
	return $inArg;
}

sub charAnnotation {
	my ($instring,$loopVar,$Char1,$char2) = @_;
	$instring = ($loopVar+1==$noOfInputs) ? ($instring.$char2) : ($instring.$Char1);
	return $instring;
}

sub endModule {
	my ($inArg) = @_;
	return ($inArg."\n\nendmodule\n");	
}


