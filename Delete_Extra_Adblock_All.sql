Use SQL17

Declare Cur_Category Cursor 
	For select Category from HTMLCodeRun order by CoverageCount desc  offset 0 row fetch next 1 row only 

Declare @vCategory varchar(20), @vSQL varchar(max),  @vNSQL Nvarchar(max), @vRemainCount Int , @vIncorrect Int

Declare @vCategoryStatus As Table ( Category Varchar(20), Incorrect Int, RemainCnt Int)

SET NOCOUNT ON 

Open Cur_Category
Fetch next From Cur_Category Into @vCategory

While @@FETCH_STATUS = 0 
Begin
	SET @vIncorrect = 0 
	SET @vSQL = '
				Drop Table If Exists ACFVINCR..' + @vCategory + '_DeleteAdblock

				select a.adblockid
				Into ACFVINCR..' + @vCategory + '_DeleteAdblock
				from ' + @vCategory + 'AdBlockReports a 
				Left JOin ACFVDetailReports b on a.adblockid = b.adblockid
				Where b.adblockid is null
				'
	Exec (@vSQL)
	--Print (@vSQL)

	SET @vIncorrect = @@RowCount
	Print 'Total incorrect adblock : ' + Convert(varchar, @vIncorrect) + ' for the category code : ' + @vCategory
	Insert Into @vCategoryStatus Values( @vCategory, @vIncorrect, 0)

	SET @vSQL = '
					While Exists (Select top 1 * from ACFVINCR..' + @vCategory + '_DeleteAdblock with (nolock))
					Begin
						If OBJECT_ID(''TempDb..#T'') is not null 
							Drop Table #T

						Select top 100000 * Into #T from ACFVINCR..' + @vCategory + '_DeleteAdblock with (nolock)

						Delete a
						From ' + @vCategory + 'AdBlockReports a Join #T b on a.AdBlockId = b.AdBlockId

						Delete a
						From ACFVINCR..' + @vCategory + '_DeleteAdblock a Join #T b on a.AdBlockId = b.AdBlockId
					End 
				'
	
	Exec (@vSQL)

	SET @vRemainCount = 0 

	SET @vNSQL = 'Select @vRemainCount = Count(1) From ' + @vCategory + 'AdBlockReports with (Nolock)'

	Exec Sp_Executesql @vNSQL, N'@vRemainCount Int Output', @vRemainCount OutPut

	Print 'Records count after delete : ' + Convert(varchar, @vRemainCount)
	Update @vCategoryStatus Set RemainCnt = @vRemainCount Where Category = @vCategory

	Fetch next From Cur_Category Into @vCategory
End

Close Cur_Category
Deallocate Cur_Category

Select * from @vCategoryStatus

======================================================================================
-- ## Full codes
======================================================================================

Use PEP00

Declare Cur_Category Cursor 
	For select Category from MasterACFV..CategoryCodeRunFlag order by ProcessOrder desc  offset 13 row fetch next 7 row only 

Declare @vCategory varchar(20), @vSQL varchar(max),  @vNSQL Nvarchar(max), @vRemainCount Int , @vIncorrect Int

Declare @vCategoryStatus As Table ( Category Varchar(20), Incorrect Int, RemainCnt Int)

SET NOCOUNT ON 

Open Cur_Category
Fetch next From Cur_Category Into @vCategory

While @@FETCH_STATUS = 0 
Begin
	SET @vIncorrect = 0 
	SET @vSQL = '
				Drop Table If Exists ACFVINCR..' + @vCategory + '_DeleteAdblock

				select a.adblockid
				Into ACFVINCR..' + @vCategory + '_DeleteAdblock
				from ' + @vCategory + 'AdBlockReports a 
				Left JOin ' + @vCategory + 'DetailReports b on a.adblockid = b.adblockid
				Where b.adblockid is null
				'
	Exec (@vSQL)
	--Print (@vSQL)

	SET @vIncorrect = @@RowCount
	Print 'Total incorrect adblock : ' + Convert(varchar, @vIncorrect) + ' for the category code : ' + @vCategory
	Insert Into @vCategoryStatus Values( @vCategory, @vIncorrect, 0)

	SET @vSQL = '
					While Exists (Select top 1 * from ACFVINCR..' + @vCategory + '_DeleteAdblock with (nolock))
					Begin
						If OBJECT_ID(''TempDb..#T'') is not null 
							Drop Table #T

						Select top 100000 * Into #T from ACFVINCR..' + @vCategory + '_DeleteAdblock with (nolock)

						Delete a
						From ' + @vCategory + 'AdBlockReports a Join #T b on a.AdBlockId = b.AdBlockId

						Delete a
						From ACFVINCR..' + @vCategory + '_DeleteAdblock a Join #T b on a.AdBlockId = b.AdBlockId
					End 
				'
	
	exec (@vSQL)

	SET @vRemainCount = 0 

	SET @vNSQL = 'Select @vRemainCount = Count(1) From ' + @vCategory + 'AdBlockReports with (Nolock)'

	Exec Sp_Executesql @vNSQL, N'@vRemainCount Int Output', @vRemainCount OutPut

	Print 'Records count after delete : ' + Convert(varchar, @vRemainCount)
	Update @vCategoryStatus Set RemainCnt = @vRemainCount Where Category = @vCategory

	Fetch next From Cur_Category Into @vCategory
End

Close Cur_Category
Deallocate Cur_Category

Select * from @vCategoryStatus

