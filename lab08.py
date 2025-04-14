#!/usr/bin/python
# sat3310 - lab08
# created by srfranco@mtu.edu
# 4/2/2025


# Variables
databasepath = '/home/sat3310/Documents/labs/lab08/data/'
databasefile = 'wireless.dbl'

# Modules
import sqlite3

# Create the DB connection
conn = sqlite3.connect(databasepath+databasefile)
print ("Opened", databasepath+databasefile, "sucuessfully!");

# Make an SQL statement
# This is creating and SQL query where we are selecting the column called manuf,
# then calculates the averagle of the GPSBest alt column and counts the number 
# of rows for each manuf. Then from the wireless table we are going to group
# the manuf, and then order then by the average sort them in ascending order 
sql = ('SELECT manuf, AVG(GPSBestAlt), COUNT(*) FROM wireless GROUP BY manuf ORDER BY AVG(GPSBestAlt)');

# Execute the SQL statement
cursor = conn.execute( sql )

# Display the results
# This is a loop that iterates over the rows in the database using the cursor object.
for row in cursor:
    print ("Manufacturer: ", row[0])
    print ("Average altitude: ", row[1])
    print ("Count: ", row[2], "\n")

# Close the DB connection
conn.close()

