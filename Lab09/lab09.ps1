# sat3310 - lab09
# created by srfranco@mtu.edu
# 4/8/2025

# Variables
$mySqlServer = "(localdb)\sat3310"
$myDatabase = "clients"
$myTable = "clients"
$database = "sat3310"
 
# SQL Command
# Select everything
#$query = "SELECT * FROM wireless"
$query = "SELECT manuf, COUNT(*) FROM wireless GROUP BY manuf ORDER BY COUNT(*)"

# SQL Connection setup
#Invoke-Sqlcmd -ServerInstance "(localdb)\sat3310" -Database "sat3310" -Query "SELECT * FROM wireless WHERE Manuf='Apple';"

$results = Invoke-Sqlcmd -ServerInstance "$mySqlServer" -Database "$myDatabase" -Query "SELECT * FROM $MyTable"

# Results
Write-Output $results
