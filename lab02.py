#!/usr/bin/python
#
#sat3310 -lab02
#create by srfranco@mtu.edu
#1/29/2025
#Comments
#
#Variables
#in this section we are just declaring variables and array that we are going to have to use
#Main
import random 
defaultdir = "/home/sat3310/Documents/labs/lab02/data/" 
nouns = "nouns.txt"
agentnouns = "agentnouns.txt"
count = 0
count2 = 0
randomnoun = ""
randomagentnoun = ""
#Open files
with open(defaultdir + nouns, 'rt') as f: #Openinng a file from the default directory named nouns and making it readable and a text file
    with open(defaultdir + agentnouns, 'rt') as f2: #Openinng a file from the default directory named nouns and making it readable and a text file
        for line in f:#Count words with a for loop
            count += 1
        for line in f2:
            count2 += 1
#Put words into a list
mynouns = open(defaultdir + nouns).readlines()#This is making a list called mynouns and going into the default directory and selecting the nouns file copying the informmation from the nouns files into mynouns
myagentnouns = open(defaultdir + agentnouns).readlines()

#Print counts
print ("There are" , count , "words in" , nouns) #using the for loop to count the number of words in the my noun list
print ("There are" , count2 , "words in" , agentnouns) #using the for loop to count the number of words in the my agent noun list

print ("There are", len(mynouns), "words in", nouns) #using the leng of the list to determine the amount of words in mynoun
print ("There are", len(myagentnouns), "words in", agentnouns) #using the leng of the list to determine the amount of words in myagentnoun

#Random select
randomnoun = random.choice(mynouns) # Creating a random noun by selecting from the random noun list
randomagentnoun = random.choice(myagentnouns) # Creating a random agentnoun by selecting from the random agentnoun list

#Print words
print (randomnoun , randomagentnoun) #print the random noun and agent noun

#Done

