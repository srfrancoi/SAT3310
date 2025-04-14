#!/usr/bin/python3
#created by srfranco@mtu.edu
#date 4/8/2025

# Modules
import sqlite3

# Variables
databasepath ='/home/sat3310/Documents/labs/lab10/data/'
databasefile = 'wireless.dbl'
debug = True

# Database Connection
conn = sqlite3.connect(databasepath+databasefile)
cursor = conn.cursor()

# User input for manufacturer
manufacturer = input("Enter the wireless manufacturer to query: ")
# manufacturer = "Apple"
# manufacturer = "Apple'; CREATE TABLE hacked(Name);--“

# SQL Statement
sqlcmd = "SELECT * FROM wireless WHERE manuf='%s'" % manufacturer
# this is going to take the variable manufacturer and use that 
# in the sql query
if debug:
    print ("The SQL command is: ", sqlcmd)
    # if debug is set to true then print the sql command is 
    # the variable sqlcmd

cursor.execute( sqlcmd )
#cursor.executescript( sqlcmd )

# Print Results
results = cursor.fetchall()
print ("Results: ", results)

# Close Database connection
conn.close()

