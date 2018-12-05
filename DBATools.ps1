#import dbatools module
import-module dbatools -DisableNameChecking;

#customized by Des Dheressa
#Navigate to the dbatools module
cd C:\Users\desdheressa\Documents\WindowsPowerShell\Modules\dbatools

# Create session to the host and enter it (commands will be run on remote host)
#$Cred = Get-Credential
$RemoteHost = 'CSHSMGT'
$Session = New-PSSession -ComputerName $RemoteHost #-Credential $Cred
Enter-PSSession $Session

# Declare remote credential. Pass DOMAIN\USERNAME
$RemoteCred = Get-Credential

#connect to the instance. Changed -sqlCredential to credential
Connect-dbainstance -sqlinstance WSQ03053 -credential $RemoteCred
$target = Connect-dbainstance -sqlinstance CVTC14 -credential $RemoteCred
Get-DbaAgDatabase -SqlInstance $target

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

#Script to test all Active directory groups that have logins on particular SQL Instance
Test-DbaValidLogin -SqlServer NGTest -FilterBy GroupsOnly -Detailed

#shows database and login usage
Watch-DbaDbLogin -SqlServer CSHSTESTDB3_1 -SqlCms cmserver1
