#! /usr/bin/perl

use strict;
use warnings;
use diagnostics;

use feature 'say';

my $netlist ="Netlist.v";

open my $fh, '<', $netlist
	or die "cannot open the file :$!";
	my %dataBase;
	while (my $line = <$fh>) {
		chomp $line;
		
		my ($stdCellName,$modulename,$ports) = ((split /\\/, $line)[0],(split /\(\./, (split /\\/, $line)[1]));
		chop $ports;
		chop $ports; 
#		say $stdCellName," ",$modulename," ",$ports;

		my @portArr = split/ \(|\), .|\)/, $ports;
		my %portHash;
		for (my $var = 0; $var < scalar @portArr; $var += 2) {
			$portHash{"$portArr[$var]"}=$portArr[$var+1];
		}

#		while (my ($k,$v)=each %portHash){print "Module Port = $k; Wire  = $v\n"}
		
		my %moduleSet;
		%{$moduleSet{$modulename}} = %portHash;

#		while (my ($k,$v)=each %moduleSet){
#			print "Module name = $k;\n";
#			my %j=%{$moduleSet{$k}};
#			while (my ($key,$val)=each %j){print "Port = $key; Wire  = $val;\n"}
#			print "\n";
#		}

		if (!exists $dataBase{$stdCellName}) {				
			@{$dataBase{"$stdCellName"}} = %moduleSet;
		} else {
			push @{$dataBase{$stdCellName}} , %moduleSet;

		}	
	}

	
	while (my ($k,@v)= each %dataBase) {
		say "STD : $k";
		@v = @{$dataBase{$k}};
		for (my $var = 0; $var < scalar @v; $var +=2) {
	#		my %temp = $v[$var+1];
			print $v[$var],"\n";
			print values $v,"\n";

		}


		# while (my %item = each @v){
		#	say keys %item;
			# while (my ($p,$o)=each %item){
			# 	print "Module name = $p;\n";
			# 	my %j=%{$item{$p}};
			# 	while (my ($key,$val)=each %j){print "Port = $key; Wire  = $val;\n"}
			# 	print "\n";
			# }
		# }

		# while (my %item = each @v){
		# 	say values %item;
		# }
	}

close $fh or die "cannot close the file :$!" ;