use SQL16

Declare Cur_CodeList Cursor For 
	Select Category, CoverageCount from HTMLCodeRun Order by CoverageCount

Declare @vCategoryCode varchar(50)

Open Cur_CodeList
FETCH NEXT From Cur_CodeList Into @vCategoryCode 
While @@FETCH_STATUS <> -1
Begin
	EXEC [mt_proc_Create_AdBlockReportsTables_Missing] @vCategoryCode, 0

	FETCH NEXT From Cur_CodeList Into @vCategoryCode
End
Close Cur_CodeList
Deallocate Cur_CodeList
