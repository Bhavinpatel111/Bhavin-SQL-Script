use SQL13

DEclare Cur_mas Cursor For select Category from MasterACFV..CategoryCodeRunFlag with (nolock) 
Declare @vCategory varchar(20)

Open Cur_mas
FETCH NEXT FRom Cur_mas Into @vCategory
While @@FETCH_STATUS = 0 
Begin
	exec CreateMPVTables @sourcePDTCode  = 'FULL' -- 'cotPepINCRDetailReports' --'Full'
						 ,@sourceMPVCode  = 'MasterACFV..ACFV' -- 'ACFVINCR..TempACFV' -- 'MasterACFV..ACFV'
						 ,@sourceServer  ='' 
						 ,@sourceDB  ='' 
						 ,@destCode = @vCategory
						 ,@fieldName = 'ACPromoIncentive'
						 ,@replaceTable = 1
						 ,@IsDebug = 0

	Print @vCategory
	FETCH NEXT FRom Cur_mas Into @vCategory
ENd

Close Cur_mas
Deallocate Cur_mas

-- select 'Drop table ' + name ,  * from sys.tables where name like '%ACPromoIncentive'