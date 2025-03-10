RESTORE DATABASE DataSP50
FROM URL = N'https://promodatabasebackup.blob.core.windows.net/backups/MT2SQL17/DataSP50.Bak'
WITH CREDENTIAL = 'Credpromodatabasebackup', 
MOVE N'DataSP50' To N'D:\SQLDATA\DataSP50.mdf', 
MOVE N'DataSP50_Log' To N'D:\SQLDATA\DataSP50.ldf',
Recovery, Replace

RESTORE DATABASE DataSP50Int 
FROM URL = N'https://promodatabasebackup.blob.core.windows.net/backups/MT2SQL17/DataSP50Int.Bak'
WITH CREDENTIAL = 'Credpromodatabasebackup', 
MOVE N'DataSP50' To N'D:\SQLDATA\DataSP50Int.mdf', 
MOVE N'DataSP50_Log' To N'D:\SQLDATA\DataSP50Int.ldf',
Recovery, Replace


RESTORE DATABASE DataSPDev50
FROM URL = N'https://promodatabasebackup.blob.core.windows.net/backups/MT2SQL17/DataSPDev50.Bak'
WITH CREDENTIAL = 'Credpromodatabasebackup', 
MOVE N'DataSP50' To N'D:\SQLDATA\DataSPDev50.mdf', 
MOVE N'DataSP50_Log' To N'D:\SQLDATA\DataSPDev50.ldf',
Recovery, Replace

RESTORE DATABASE DataSPDev50Int
FROM URL = N'https://promodatabasebackup.blob.core.windows.net/backups/MT2SQL17/DataSPDev50Int.Bak'
WITH CREDENTIAL = 'Credpromodatabasebackup', 
MOVE N'DataSP50' To N'D:\SQLDATA\DataSPDev50Int.mdf', 
MOVE N'DataSP50_Log' To N'D:\SQLDATA\DataSPDev50Int.ldf',
Recovery, Replace

RESTORE DATABASE DataSPUpdate50
FROM URL = N'https://promodatabasebackup.blob.core.windows.net/backups/MT2SQL17/DataSPUpdate50.Bak'
WITH CREDENTIAL = 'Credpromodatabasebackup', 
MOVE N'DataSPUpdate50_1' To N'D:\SQLDATA\DataSPUpdate50.mdf', 
MOVE N'DataSPUpdate50_log_2' To N'D:\SQLDATA\DataSPUpdate50.ldf',
Recovery, Replace


RESTORE DATABASE DataSPUpdate50Int
FROM URL = N'https://promodatabasebackup.blob.core.windows.net/backups/MT2SQL17/DataSPUpdate50Int.Bak'
WITH CREDENTIAL = 'Credpromodatabasebackup', 
MOVE N'DataSPUpdate50Int_1' To N'D:\SQLDATA\DataSPUpdate50Int.mdf', 
MOVE N'DataSPUpdate50Int_log_2' To N'D:\SQLDATA\DataSPUpdate50Int.ldf',
Recovery, Replace

