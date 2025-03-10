Use PEP02

Declare Cur_Category Cursor For
	select  Category from MasterACFV..CategoryCodeRunFlag with (nolock) 
	Order by Category OFFSET 0 ROWS FETCH NEXT 100 ROW ONLY

Declare @vCategory varchar(20), @vSQL varchar(Max)

Open Cur_Category
FETCH NEXT FROM Cur_Category INTO @vCategory

While @@FETCH_STATUS =  0 
Begin
	
	SET @vSQL = '
				IF Object_ID(''ACFVINCR..'+@vCategory+'_QTR'') IS Not Null
					Drop Table ACFVINCR..'+@vCategory+'_QTR
				
				Select A.PagedetailId Into ACFVINCR..'+@vCategory+'_QTR
				From ' + @vCategory + 'DetailReports A Left Join ' + @vCategory + 'FlyerReports B
				on A.FlyerId = B.FlyerId where B.FlyerId is Null
				'
	EXEC (@vSQL)

	SET @vSQL = '
				While Exists(Select Top 1 * From ACFVINCR..'+@vCategory+'_QTR With (NoLock))
				Begin
					IF Object_ID(''TempDB..#T'') IS Not Null
						Drop Table #T

					Select Top 10000 * Into #T From ACFVINCR..'+@vCategory+'_QTR With (NoLock)

					Delete A
					From ' + @vCategory + 'DetailReports A
					Join #T B ON A.PagedetailId = B.PagedetailId

					Delete A
					From ACFVINCR..'+@vCategory+'_QTR A
					Join #T B ON A.PagedetailId = B.PagedetailId
				End
				'
	EXEC (@vSQL)
	
	SET @vSQL = '
				IF Object_ID(''ACFVINCR..'+@vCategory+'_QTR_ADB'') IS Not Null
					Drop Table ACFVINCR..'+@vCategory+'_QTR_ADB
				
				Select A.AdBlockID Into ACFVINCR..'+@vCategory+'_QTR_ADB
				From ' + @vCategory + 'AdBlockReports A Left Join ' + @vCategory + 'DetailReports B
					on A.AdBlockID = B.AdBlockID where B.AdBlockID is Null
				'
	EXEC (@vSQL)

	SET @vSQL = '
				While Exists(Select Top 1 * From ACFVINCR..'+@vCategory+'_QTR_ADB With (NoLock))
				Begin
					IF Object_ID(''TempDB..#ADB'') IS Not Null
						Drop Table #ADB

					Select Top 10000 * Into #ADB From ACFVINCR..'+@vCategory+'_QTR_ADB With (NoLock)

					Delete A
					From ' + @vCategory + 'AdBlockReports A
					Join #ADB B ON A.AdBlockID = B.AdBlockID

					Delete A
					From ACFVINCR..'+@vCategory+'_QTR_ADB A
					Join #ADB B ON A.AdBlockID = B.AdBlockID
				End
				'
	EXEC (@vSQL)
	
	SET @vSQL = '
					If Exists (Select * From Sys.Tables Where Name = ''' + @vCategory + 'MPVACPromoIncentive'')
					Begin
						Delete A
						From ' + @vCategory + 'MPVACPromoIncentive A
						Left Join ' + @vCategory + 'DetailReports B ON A.PagedetailId = B.PagedetailId
						Where B.PagedetailId Is Null
					END

					If Exists (Select * From Sys.Tables Where Name = ''' + @vCategory + 'MPVVariety'')
					Begin
						Delete A
						From ' + @vCategory + 'MPVVariety A
						Left Join ' + @vCategory + 'DetailReports B ON A.PagedetailId = B.PagedetailId
						Where B.PagedetailId Is Null
					END

					If Exists (Select * From Sys.Tables Where Name = ''' + @vCategory + 'MPVSKUType'')
					Begin
						Delete A
						From ' + @vCategory + 'MPVSKUType A
						Left Join ' + @vCategory + 'DetailReports B ON A.PagedetailId = B.PagedetailId
						Where B.PagedetailId Is Null
					END

					If Exists (Select * From Sys.Tables Where Name = ''' + @vCategory + 'MPVSKU'')
					Begin
						Delete A
						From ' + @vCategory + 'MPVSKU A
						Left Join ' + @vCategory + 'DetailReports B ON A.PagedetailId = B.PagedetailId
						Where B.PagedetailId Is Null
					END

					If Exists (Select * From Sys.Tables Where Name = ''' + @vCategory + 'MPVPageEvent'')
					Begin
						Delete A
						From ' + @vCategory + 'MPVPageEvent A
						Left Join ' + @vCategory + 'DetailReports B ON A.PagedetailId = B.PagedetailId
						Where B.PagedetailId Is Null
					END

					If Exists (Select * From Sys.Tables Where Name = ''' + @vCategory + 'MPVOrigin'')
					Begin
						Delete A
						From ' + @vCategory + 'MPVOrigin A
						Left Join ' + @vCategory + 'DetailReports B ON A.PagedetailId = B.PagedetailId
						Where B.PagedetailId Is Null
					END

					If Exists (Select * From Sys.Tables Where Name = ''' + @vCategory + 'MPVOfferType'')
					Begin
						Delete A
						From ' + @vCategory + 'MPVOfferType A
						Left Join ' + @vCategory + 'DetailReports B ON A.PagedetailId = B.PagedetailId
						Where B.PagedetailId Is Null
					END

					If Exists (Select * From Sys.Tables Where Name = ''' + @vCategory + 'MPVOffer'')
					Begin
						Delete A
						From ' + @vCategory + 'MPVOffer A
						Left Join ' + @vCategory + 'DetailReports B ON A.PagedetailId = B.PagedetailId
						Where B.PagedetailId Is Null
					END
				'

	EXEC (@vSQL)

	FETCH NEXT FROM Cur_Category INTO @vCategory
END
Close Cur_Category
Deallocate Cur_Category
