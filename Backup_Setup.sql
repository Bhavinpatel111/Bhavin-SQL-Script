--Drop table BackupDatabaseList
Create Table BackupDatabaseList
(
	ServerName varchar(20), DBName varchar(30), Status Bit Default 0, StartTime DateTime, EndTime DateTime 
	, Primary Key(ServerName, DBName)
)

Insert Into BackupDatabaseList values(@@SERVERNAME, 'Master', 0, Null, Null)
Insert Into BackupDatabaseList values(@@SERVERNAME, 'Msdb', 0, Null, Null)
Insert Into BackupDatabaseList values(@@SERVERNAME, 'IDDB', 0, Null, Null)
Insert Into BackupDatabaseList values(@@SERVERNAME, 'SQL06', 0, Null, Null)
Insert Into BackupDatabaseList values(@@SERVERNAME, 'MasterACFVHistory', 0, Null, Null)
Insert Into BackupDatabaseList values(@@SERVERNAME, 'MasterACFV', 0, Null, Null)
Insert Into BackupDatabaseList values(@@SERVERNAME, 'MasterClientCoverage', 0, Null, Null)


-- select * from BackupDatabaseList
