#! /usr/bin/perl

#perl -e 'print "hello world\n"'

use strict; #this prevents implicit creation of global variables
use warnings;
use diagnostics;

use feature 'say';
use feature "switch";

#-------------------------------------------------------------------------------

print "hello world \n";

my $name = "Shree";
my ($age,$contact) = (24,"1234567890");
my $info = "$name contact number is \" $contact \" \n";
$info = qq{$name contact number is "$contact"\n"};

print $info;

my $information = << "END";
i have a lot
of information
but its difficult to 
END

say $information;

printf("%d, %f \n",$age,$age);

my ($a,$b) = (5,6);
($b,$a)=($a,$b);
say "$a,$b";

#-------------------------------------------------------------------------------

say "$a + $b = ",$a+$b;
say "$a - $b = ",$a-$b;
say "$a / $b = ",$a/$b;
say "$a * $b = ",$a*$b;
say "$a % $b = ",$a%$b;
print "$a ** $b = ",$a**$b,"\n";

say "exp 1 = ",exp 1; 						#e^1
say "hex 10 = ",hex 10;						#converting from hex to decimal
say "oct 10 = ",oct 10;
say "int 6.45 = ",int 6.45;					#typecasting
say "log 2 = ",log 2;
say "sqrt 9 = ",sqrt 9;
say "Random Between 0-10 =", int (rand 11); #even if paranthesis are not there its fine


#different assignment operators
# += -+ *= /=

my $value = 5;
$value += 1;

say "val = $value";

say "val++ = ", $value++;
say "++val = ", ++$value;
say "val-- = ", $value--;
say "--val = ", --$value;

say "$a + $b * $value = ",$a + $b * $value;
say "($a + $b) * $value = ",($a + $b) * $value;

#-------------------------------------------------------------------------------

#undef 0 0.0 "" "0" #this will declare the failure cases of conditional block
#operators Numbers == != < > <= >= ! && ||
#operators string eq ne lt le gt ge

my $have_VID = 1;
if($age < 18){
	say "you cant vote";
} elsif(!$have_VID){
	say "you cant vote";
} else {
	say "you can vote";
}

my $covidTest=1;
my $WearMask=1;
my $covidResult=0;

if (($age >16 && $age <18)||!$have_VID) {
	say "you can apply for VID";
} elsif (!$have_VID){
	say "you cant vote";
} elsif ($age > 45 && (!$covidTest || !$WearMask)||$covidResult ){
	say "you cant vote";
} else {
	say "you can vote";
}
 
if($name eq $contact){
	say "Strings are equal";
} else {
	say "strings are not equal";
}

unless ($WearMask) {
	say "Wear Mask";
}

say (($age > 18) ? "can vote" : "can't vote");

#-------------------------------------------------------------------------------

my $expression=5;
for (my $i = 0; $i < $expression; $i++) {
	say $i;
}

my $i =1;
while ($i<10) {
	if ($i % 2 ==0) {
		$i++;
		next;
	}
	if ($i == 7) {
		last;
	}
	say $i;
	$i++;
}

# my ($lNumb,$guess)=(5,0);

# do{
# 	say "guess a number between 1-10";
# 	$guess = <STDIN>;
# }	while ($guess != $lNumb); 

# say "you guessed correct";

given($age){
	when ($_ > 16) {
		say "Drive";
		continue;
	}
	when ($_ > 18) {
		say "Vote";
#		continue		#if you dont give continue it will stop at this point of looping
	}
	default {
		say "Drink Tea";
	}
}

#-------------------------------------------------------------------------------

my $stringsHelps = "i have a really really long string";

say "length of the string ", length $stringsHelps;
printf("long is at %d \n", index $stringsHelps,"long" );
printf("last g is at %d \n", rindex $stringsHelps,"g" );

$stringsHelps = $stringsHelps."still making longer\n";
say "Index 9 through 6 is ", substr $stringsHelps , 9, 6;

chomp $stringsHelps; #removes the new line
printf("last character is %s\n",chop $stringsHelps);
say "uppercase : ", uc $stringsHelps;
say "lowercase : ", lc $stringsHelps;
say "1st uppercase : ", ucfirst $stringsHelps;

# s/// takes a list of characters on the left and replaces :substituition
# tr/// translation
# them with characters on the right
# g = Replace all occurances
# i = ignore case

$stringsHelps =~ s/ /,/g;
say $stringsHelps;
my $doubleString = $stringsHelps x 2;
say $doubleString;

my @abz = ('a' .. 'z');

print join(",",@abz), "\n";
my $myletter = 'c';
say "next letter ", ++$myletter;

#-------------------------------------------------------------------------------

my @primes = (2,3,5,7,11,13);
my @infoArr = ("manipal","msois","mit","kmc",10,20);
$infoArr[6] = "place";
say join(',',@infoArr);
for my $var (@infoArr) {
	say $var;
}
foreach my $var (@primes) {
	say $var;
}
for (@infoArr){
	say $_;
}

my @mInfo = @infoArr[0,3];	#split
say join(",",@mInfo);
say "length of array: ",scalar @infoArr;

my ($place ,$clg ,$institue ,$med ,$num1 , $num2 ,$title)=@infoArr;
say "$title $place";

say "popped value ", pop @primes;
say "pushed value ", push @primes,17;
say "first item ",shift @primes;
say "unshifted item ", unshift @primes, 2;
say "remove index 0-2 ", splice @primes,0,2;

my $names = "shree jnan jnanesh sj";
my @nameArr = split / /,$names;
say join(",",@nameArr);
@nameArr = reverse @nameArr;
@nameArr = reverse sort @nameArr;
say join(",",@nameArr);

my @num =(1,2,3,4,5,6,7,8,9);
my @oddArr = grep {$_ % 2} @num;
say join(",",@oddArr);
my @dblArr = map {$_ * 2} @num;
say join(",",@dblArr);

#-------------------------------------------------------------------------------

sub sumTwo{
	my ($num1, $num2) = @_;

	$num1 ||= 1;
	$num2 ||= 1;
	return $num1 + $num2;
}
say "sum of two numbers ",sumTwo(10,20);


sub summany{
	my $sum =0;
	foreach my $val (@_){
		$sum += $val;
	}
	return $sum;
}
say "sum of many numbers ",summany(1,2,3,4,5,6,78,9);

# sub increment {
#   state $execute_total = 0;
#   $execute_total++;
#   say "Executed $execute_total times";
# }
# increment();
# increment();

sub factorial {
  my ($num) = @_;
  return 0 if $num <= 0;
  return 1 if $num == 1;
  return $num * factorial($num - 1);
} 
say "Factorial 4 = ", factorial(4);

#-------------------------------------------------------------------------------


# $fh is the file handle which is used to access the file
# < means we are opening the file for reading
# $! Provides an error message

my $Net_File = 'Netlist.v';
open my $fh, '<', $Net_File
  or die "Can't open file : $!";
 

while(my $info = <$fh>){
  	chomp($info);
  	my ($Net_name, $job) = split /\\/, $info;
 	print "$Net_name module has nets connected $job \n";
}
 
# Close the file
close $fh or die "Couldn't Close File : $!";
 
# Open the file for appending
open $fh, '>>', $Net_File
  or die "Can't open file : $!";
 
# Append to the file
print $fh "\nDFFQX2 \\temp_reg[7] (.CK (clk), .D (n_20), .Q (temp[7]));";
 
close $fh or die "Couldn't Close File : $!";
 
# Open file to read write it
open $fh, '+<', $Net_File
  or die "Can't open file : $!";
 
  # Seek to the beginning
  seek $fh, 0, 0;
 
  # Insert item
 print $fh "DFFQX3 \\temp_reg[7] (.CK (clk), .D (n_20), .Q (temp[7]));";
 
  # Close the file
  close $fh or die "Couldn't Close File : $!";
 
#-------------------------------------------------------------------------------

