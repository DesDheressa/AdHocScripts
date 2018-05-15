#returns currently running queries against a server to be specified

$title = "Current Running SQL Queries"
$SqlServer = Read-Host "Enter SQL Server Instance name:"
$SqlQuery = "SELECT s.TEXT,r.total_elapsed_time,r.session_id,r.status,r.command FROM sys.dm_exec_requests r `
             CROSS APPLY sys.dm_exec_sql_text(sql_handle) s" 
Invoke-Sqlcmd -ServerInstance $SqlServer -Database "NGProd" -Query $SqlQuery | Out-GridView -Title $title

#test push3