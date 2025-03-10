Declare Cur_DBList Cursor For
	Select name from sys.databases
	Where Name like 'Datas%'

Declare @vDBName Varchar(50), @vSQL varchar(Max), @vURL Nvarchar(100)

SET @vURL = 'https://promodatabasebackup.blob.core.windows.net/backups/'

Open Cur_DBList
FETCH NEXT FROM Cur_DBList Into @vDBName

While @@FETCH_STATUS <> -1
Begin
	Print @vDBName

	SET @vSQL = 'BACKUP DATABASE ' + @vDBName + 
				' TO URL = N''' + @vURL + @@SERVERNAME + '/' + @vDBName + '.Bak''
				WITH CREDENTIAL = ''Credpromodatabasebackup'', INIT, COMPRESSION, NOUNLOAD, FORMAT, SKIP, STATS = 1'
	Print @vSQL
	Exec(@vSQL)
	FETCH NEXT FROM Cur_DBList Into @vDBName
End
Close Cur_DBList
Deallocate Cur_DBList
