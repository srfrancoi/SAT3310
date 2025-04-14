
#Variables
$datafile = "fortune500.tsv"
$dataurl = "http://pages.mtu.edu/~toarney/sat3310/lab07/"
$datapath = "C:\Users\sat3310\Documents\labs\lab06\data\"
$count = 0
$servertypes = @()
$sites = Import-CSV -Path $datapath$datafile -Delimiter "`t"
$numberofwebsites = $sites.Length
$timeout = 3000

#download
try {
    Invoke-WebRequest -Uri $dataurl$datafile -OutFile $datapath$datafile -ErrorAction Stop
    Write-Host "Successfully downloaded $datafile"
} catch {
    Write-Host "Error downloading $datafile; $($_.Exception.Message)"
    exit  # Stop the script if the download fails
}
Write-Host "There are $numberofwebsites in $datapath$datafile"

foreach ($website in $sites)
{
	$count++
	$uri = $website.Website
	Write-Progress -Activity "Working... $count of $numberofwebsites." -Status "Percent complete $(($count/$numberofwebsites)*100)%" 
	$ErrorActionPreference = 'silentlyContinue'
	$webrequest = Invoke-Webrequest -Uri $uri -Method Head -Timeout 1
	if ($webrequest.Headers.Server)
	{
		$servertypes+=$webrequest.Headers.Server
	}
	else
	{
		$servertypes+="unknown"
	}
}
$servertypes | Group-Object | Sort-Object count | Select-Object name,count
