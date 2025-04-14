#!/usr/bin/python3
# sat3310 - lab05
# created by srfranco@mtu.edu
# 3/11/2025

#Modules
import csv
import requests
import collections
import sys

# Variables
dataurl = 'https://pages.mtu.edu/~toarney/sat3310/lab08/'
datafile = 'fortune500.tsv'
datapath = '/home/sat3310/Documents/labs/lab05/data/'
mytimeout = 5
myserverresponses = []
mywebsitecount = 0
mytotalwebsitecount = 0
mydebug = True

# Download a file
#mydownloadfile = requests.get(dataurl + datafile)

# Write the downloaded file
#open(datapath + datafile, 'wb').write(mydownloadfile.content)

# Count the lines in the downloaded file
file = open(datapath + datafile)
reader = csv.DictReader(file)
lines = len(list(reader))
mytotalwebsitecount = lines
if mydebug:
    print("Total websites: ", mytotalwebsitecount)

# Read each line from downloaded file
with open(datapath + datafile, 'rt') as myinputfile:
    myline = csv.DictReader(myinputfile, delimiter='\t')

# Get the HTTP server response
    for row in myline:
        mywebsite = "http://" + row.get("Website","")
        if mydebug:
            print(row["Company"], row["Website"], mywebsite)
        try:
            myresponse = requests.get(mywebsite, timeout=mytimeout) 
            #send a get request to the webstie variable and timeout with the variable set for timeout
            myservertype = myresponse.headers['server']
            #extract the server type from the response headers
        except:
            #if any errors set the server type as Unkown
            myservertype = 'Unknown'
        finally:

# Count the websites
            #this is going to count the websites regarless of whether and exception occurred
            mywebsitecount +=1
            #add the server type to the lists of myservertype
            myserverresponses.append(myservertype)
            if mydebug:
                #if debug mode is one print myserver type
                print(myservertype)
                print ("Working: ", mywebsitecount, "of", mytotalwebsitecount, end='\r',flush=True)
myinputfile.close()

# Count lines
if mydebug:
    #if debug is turned on print mywebsitecount and the total number of server responses collected
    print(mywebsitecount)
    print(len(myserverresponses))

# Count and sort results
    #print results to the screen with some space fromt he calculations
    print ("\n\nResults:\n")
    #Create a counter object to count occerrences of each server type
    counter = collections.Counter(myserverresponses)
    #iterate through the most common server types and their frequencies and print the freq of the server
    #and separate them with a tab space and print the server name
    for servers, freq in counter.most_common():
        print (freq, "\t", servers)
