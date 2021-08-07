#!/usr/bin/perl

print "currentfilename".__FILENAME__."\n";

=begin comment
blah
blah
blah
$var1 = 10;
=cut

$var1 = 15;
$var2 =20;
$var3 = $var1 + $var2;
$var3 = $var3." bhuvan";
print "hi there ","$var3\n";

$var1 = "hello there VLSI where VLsi cz vlsi";
$var2 = "vlsi msis";
$var1 =~ s/vlsi/meow/gi; #substitution
print "$var1\n";

$var1 =~ tr/vlsi/meow/; #translation
print "$var1\n";

print "\$var1\n";

$var1 = "1011010101010100010";
$var1 =~ tr/10/01/;
print "$var1\n";


$var2 = "1101";
$var2 = reverse $var2;
print "$var2\n";


#____________________________________________________________________________________________________________________________________
$var1 = "/root/Desktop/VLSI/file1.txt";
@var = split(/\//,$var1);
 print "@var[-1]\n"; #print "@var[4]\n"

@var =("1","2","3","4");
@var = qw(1 2 3 4);
@varOnetoThree = (1..10);
push(@varOnetoThree,11); #add a value to last
push(@varOnetoThree,11,12,13);
push(@varOnetoThree,@var);

unshift(@varOnetoThree,0); #add a value to begining
$var1 = pop(@varOnetoThree);
pop(@varOnetoThree); #remove a value from last
shift(@varOnetoThree); #remove a value fom begining
print "@varOnetoThree\n";

@var = qw(21 12 23 4);
@var= sort @var;  #sort with lexical convention compares the first element
@var = sort {$a <=> $b} @var; #sort with ascending order
@var = sort {$b <=> $a} @var; #sort with descending order
print "@var\n";

#____________________________________________________________________________________________________________________________________
%hashvar1 = ('bhu' => 10, 'sat' =>2 , 'ab' => 15 , 'rg' => 20);

$hashvar1{'ak'}=25;
$hashvar1{'pdp'}=30;
delete $hashvar1{'sat'};

@key = keys%hashvar1;
@val = values%hashvar1;
$members=@val;
print "@key\n";
print "@val\n";
print "size $members\n"

#____________________________________________________________________________________________________________________________________

# ---------- HASHES ----------
# Hashes use keys to access values
 
my %employees = (
  "Sue" => 35,
  "Paul" => 43,
  "Sam" => 39
);
 
# Use $ to access the hash value
# Note you don't have to use quotes for the key
printf("Sue is %d \n", $employees{Sue});
 
# Add a new key value to a hash
$employees{Frank} = 44;
 
# Iterate over hash and print keys and values
while (my ($k,$v)=each %employees){print "$k $v\n"}
 
# You can slice data from a hash
my @ages = @employees{"Sue", "Sam"};
say @ages;
 
# Convert a hash into an array
my @hash_array = %employees;
say @hash_array;
 
# Delete a key / value
delete $employees{'Frank'};
 
# Cycle through all key values with each
while (my ($k,$v)=each %employees){print "$k $v\n"}
 
# Check if Sam exists and print out using the Ternary
# Operator
say ((exists $employees{'Sam'}) ? "Sam is here" : "No Sam");
 
# Cycle through keys with keys
for my $key (keys %employees){
  if ($employees{$key} == 35){
    say "Hi Sue";
  }
}
 