#!/usr/bin/perl
#
#sat3310 -lab02
#create by srfranco@mtu.edu
#1/29/2025
#Comments
#
#Variables
#in this section we are just declaring variables and array that we are going to have to use 
$deaultdir - "/home/sat3310/Documents/labs/lab02/data/";
$nouns = "nouns.txt";
$agentnouns = "agentnouns.txt";
$randomnoun = "";
$randomagentnoun = "";
@arraynouns = [];
@arrayagentnouns = [];
$countnouns = 0;
$countagentnouns = 0;
$DEBUG = "True";
#Main
#
#List Files
#
#Open files
#
open(NOUNSFILE, "<", $defaultdir.$nouns); #opens a file called nounsfile from the vaiable defaultdir adding the file named nouns
open(AGENTNOUNSFILE, "<",$defaultdir.$agentnouns);#opens a file called agentnounsfile from the vaiable defaultdir adding the file named agentnouns

#Close files
@arraynouns = <NOUNSFILE>; #putting the nounsfile into an array
@arrayagentnouns = <AGENTNOUNSFILE>; #putting the agentnouns file into an array

#
#Count words
#
open(NOUNSFILE, "<", $defaultdir.$nouns); #opens a file called nounsfile from the vaiable defaultdir adding the file named nouns
open(AGENTNOUNSFILE, "<",$defaultdir.$agentnouns);#opens a file called agentnounsfile from the vaiable defaultdir adding the file named agentnouns
$countnouns++ while <NOUNSFILE>; #counting the nouns in the file nouns file in a while loop
$countagentnouns++ while <AGENTNOUNSFILE>; #counting the agent nouns in the file agennounsfile

#Put words into an array
#
#@arraynouns = <NOUNSFILE>;
#@arrayagentnouns = <AGENTNOUNSFILE>;

#Print counts
#
print "There are $countnouns words in $nouns\n"; #printing the amount of nouns with a while loop
print "There are $countagentnouns words in $agentnouns\n"; #printing the amount of agent nouns with a while loop
#close NOUNSFILE;
#close AGENTNOUNSFILE;


#Random select
#

$randomnoun = $arraynouns[rand @arraynouns]; # the random noun which is picked from the array of nouns
$randomagentnoun = $arrayagentnouns[rand @arrayagentnouns]; #this is the random noun from the array agent nouns 

#Print Words
#
print "The random noun is $randomnoun\n"; # this is just printing what the random noun is 
print "The random agent noun is $randomagentnoun\n"; #this is just printing what the random agent noun is
print "There are " . scalar @arraynouns . " words in $nouns\n"; #using the size of the file when put into an array with the scalar
print "There are " . scalar @arrayagentnouns . " words in $agentnouns\n"; #using the size of the file when put into an array for agent nouns

#Done!
