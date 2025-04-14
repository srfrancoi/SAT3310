# sat3310 - lab04
# created by srfranco@mtu.edu
# 2/17/2025

# Variables
$defaultdir = "C:\Users\sat3310\Documents\labs\lab04\data\words"
$nounsfile = "nouns.txt"
$agentnounsfile = "agentnouns.txt"

# Main

# List files
Get-ChildItem -Path $defaultdir #the get-child item is just outputting contents of the defaultdir variable 
								#it’s is the same concept of dir in cmd

# Put words into a list
$nouns = Get-Content $defaultdir\$nounsfile
$agentnouns = Get-Content $defaultdir\$agentnounsfile

# Count words
$numnouns = $nouns.count
$numagentnouns = $agentnouns.count

# Print counts
Write-Host "There are $numnouns nouns in $nounsfile"
Write-Host "There are $numagentnouns agent-nouns in $agentnounsfile"
Write-Host $nounsfile $nouns | Measure-Object -Word
Write-Host $agentnounsfile $agentnouns | Measure-Object -Word

# Random select
$randomnoun = $nouns | Get-Random
$randomagentnoun = $agentnouns | Get-Random

# Print words
Write-Host "You are a $randomnoun $randomagentnoun !"

# Done