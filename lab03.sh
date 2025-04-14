#!/usr/bin/bash
#
#sat3310 - lab03
#created by srfranco@mtu.edu
#2/5/2025

# Variables
declare -a mynounsarray #declaring that this variable is going to be an array
declare -a myagentnounsarray #declaring that this variable is going to be an array
defaultdir="/home/sat3310/Documents/labs/lab03/data/" #stating what the variable is
nouns="nouns.txt" #stating what the variable is
agentnouns="agentnouns.txt" #stating what the variable is

# Main

# List files

# Put words into a list
readarray -t mynounsarray < $defaultdir$nouns #reading the file nouns from the default directory and removing the newline character and input them into mynounsarray
readarray -t myagentnounsarray < $defaultdir$agentnouns #reading the file agentnouns from the default directory and removing the newline character and input them into myagentnounsarray

# Count words
numnouns=${#mynounsarray[@]} #counting the number in elements in the array and adds them to the variable numnouns (the # is what is counting the elements in this case)
numagentnouns=${#myagentnounsarray[@]} #counting the number in elements in the array and adds them to the variable numnouns (the # is what is counting the elements in this case)

# Print counts
echo "There are $numnouns words in $defaultdir$nouns" #printing the variables to the screen
echo "There are $numagentnouns words in $defaultdir$agentnouns" #printing the variables to the screen

# Random select
randomnoun=${mynounsarray[RANDOM % numnouns]} #selecting a random element in the array of nouns
randomagentnoun=${myagentnounsarray[RANDOM % numagentnouns]} #selecting a random element in the array of agentnouns

# Print words
echo "You are a $randomnoun $randomagentnoun!" #printing the variables to the screen

# Done
