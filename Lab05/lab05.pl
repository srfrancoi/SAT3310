#!/usr/bin/perl
# sat3310 - lab05
# created by srfranco@mtu.edu
# 3/11/2025

use LWP::Simple;

# Variables
$dataurl = "http://pages.mtu.edu/~toarney/sat3310/lab07/";
$datafile = "fortune500.tsv";
$datapath = "/home/sat3310/Documents/labs/lab05/data/";

# Main


# Get a file - list of websites
#getstore($dataurl.$datafile, $datapath.$datafile);
	##This is getting the urls from the datafile and the data path is the path to the datafile where it is saved.
# Parse websites file
open(FILE, "<", $datapath.$datafile);

while ($line = <FILE>) {
	my @website=split("\t",$line);
	push @arrayofurls, $website[2];
	}
	## The variable line splits a string stored in the variable line and puts it into the array website and tabs separate it the string.
close FILE;
$|=1;

shift @arrayofurls;


# Start the loop
foreach my $website (@arrayofurls) {
	my $completeurl = "http://".$website;
	my ($type, $length, $modtime, $expiretime, $servertype) = head($completeurl);
	if ($servertype eq "") {$servertype = "Unknown"};
	##This checks if the servertype string contains a forward slash and will extract the substring
	#from the start of the variable servertype to the first slash aka the whole thing because there is no slashes
	if (index($servertype, "/") > 0) { 
		$servertypesubstring = substr($servertype, 0,
		index($servertype, "/"));
		}
	else {
		$servertypesubstring = $servertype;
		}
	push (@arrayofservertypes, $servertypesubstring);
		$working++;
	print "Working... $working of $totalsize done.";
	print
	"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
	}
	print "\n";

# Sort results
%servertypehash = ();
foreach my $servername (@arrayofservertypes) {
	$servertypehash{$servername}++;
	print "Hash: $servername\t $servertypehash{$servername}\n";
	}

# Count results
print "\nResults:\n";
foreach my $server (sort { $servertypehash{$a} <=> $servertypehash{$b} } keys %servertypehash) {
        print "$servertypehash{$server} \t $server\n";
    }

# Print results

