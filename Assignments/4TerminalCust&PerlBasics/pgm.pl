#! /usr/bin/perl

print "hello world \n";

$name = "Shree";
($age,$contact) = (24,"1234567890");
$info = "$name contact number is \" $contact \" \n";
$info = qq{$name contact number is "$contact"\n"};

print $info;


($a,$b) = (5,6);
($b,$a)=($a,$b);
print "$a,$b\n";


