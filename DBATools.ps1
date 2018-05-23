#customized by Des Dheressa
#Navigate to the dbatools module
cd C:\Users\desdheressa\Documents\WindowsPowerShell\Modules\dbatools

# Set some vars

$new = "CSHSTESTDB3_1"

$old = $instance = "CSHSTESTDB3_2"

$allservers = $old, $new


# Alternatively, use Registered Servers? 

Get-DbaRegisteredServer -SqlInstance $instance | Out-GridView



# Quick overview of commands

Start-Process https://dbatools.io/commands



# Need to restore a database? It can be as simple as this:

Restore-DbaDatabase -SqlInstance $instance -Path "C:\temp\AdventureWorks2012-Full Database Backup.bak"

# Return TempDB size
Get-DbaTempdbUsage -SqlInstance CSHSTESTDB3_1

#Get Backup History
Get-DbaBackupHistory -SqlServer NGTest 

# Returns all user database files and free space information for the local host. Filters the output object by any files that have a percent used of greater than 80%.
Get-DbaDatabaseSpace -SqlInstance CSHSTESTDB3_1 | Where-Object {$_.PercentUsed -gt 80} 

