#! /usr/bin/perl

 @primes = (2,3,5,7,11,13);
 @infoArr = ("manipal","msois","mit","kmc",10,20);
$infoArr[6] = "place";
print join(',',@infoArr),"\n";
for  $var (@infoArr) {
	print $var,"\n";
}
foreach  $var (@primes) {
	print $var,"\n";
}
for (@infoArr){
	print $_,"\n";
}
