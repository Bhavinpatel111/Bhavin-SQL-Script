 Use PEP03

 Declare Cur_FRTables Cursor For 
	Select Name From [MT2SQL13].SQL13.Sys.tables Where Name like 'FRDATAPEP%'
	and Name not like '%_Orphaned'
	and Name not like '%WeeklyTrend'
	order by create_date Desc
 
 Declare @vTableName varchar(100), @vSQL varchar(Max)

 OPEN Cur_FRTables
 FETCH NEXT FROM Cur_FRTables INTO @vTableName
 While @@FETCH_STATUS = 0 
 BEGIN
	
	SET @vSQL = 'IF EXISTS(Select * From Sys.Tables Where Name = '''+@vTableName+''')
				BEGIN
					Truncate Table ' + @vTableName + '
					Drop Table ' + @vTableName + '
				END

				Select * Into ' + @vTableName + ' From [MT2SQL13].SQL13.DBO.'+ @vTableName +'
				'
	Print @vSQL
	FETCH NEXT FROM Cur_FRTables INTO @vTableName
 END
 CLOSE Cur_FRTables
 DEALLOCATE Cur_FRTables
