USE [SQL06]
GO
/****** Object:  StoredProcedure [dbo].[mt_proc_Create_ID_Update]    Script Date: 7/31/2023 3:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		jhetler
-- Create date: Feb 2011
-- Description:	Creates generic ID update proc
--Exec mt_proc_Create_ID_Update_MediaDetailChange 'bpcDetailReports','MediaDetail',1
-- =============================================

Declare

 @codeTable as varchar(50) = 'UnipepDetailReports',
 @columnName as varchar(100) = 'Category',
 @IsDebug as bit = 1 --Values : "0 = Run / 1 = Print".

BEGIN
	SET NOCOUNT ON;
	declare @SQLInsert as nvarchar(4000)
	declare @SQLUpdate as nvarchar(4000)	
	declare @SQLIndex as nvarchar(4000)	
	declare @tempIndexName as varchar(1000), @vIndexExists Bit = 0 

	PRINT '-- START mt_proc_Create_ID_Update SP for  '+ @codeTable +'  '+@columnName +' at ' + convert(varchar(100),current_timestamp,20)
	
	SET @SQLIndex = 'IF Exists (select i.index_id, count(1) Cnt
						from sys.indexes i 
						Join sys.index_columns ic on ic.object_id = i.object_id and ic.index_id = i.index_id
						Join sys.columns c on c.object_id = i.object_id and ic.column_id = c.column_id
						Where i.object_id = OBJECT_ID(''' + @codeTable + ''')
						And c.name in (''' + @columnName + ''',''' + @columnName + 'ID'')
						Group by i.index_id Having count(1) > 1)
				SET @vIndexExists = 1 
			'
	Print @SQLIndex

	set @tempIndexName='IDX_temp_' + @columnName + '_' + @codeTable
	SET @SQLIndex = 'IF EXISTS (SELECT name FROM sysindexes WHERE name = ''' + @tempIndexName + ''') DROP index ' + @codeTable + '.' + @tempIndexName

	-- change by praksh 13/06/2013
	IF @IsDebug=0
		BEGIN
			exec sp_executesql @SQLIndex
		END
	ELSE
		BEGIN
			Print @SQLIndex
		END

	--SET @SQLIndex = 'CREATE INDEX ' + @tempIndexName + ' ON ' + @codeTable + '(' + @columnName + ')'
	--exec sp_executesql @SQLIndex
	--temp prformance test change - nishant
	SET @SQLIndex = 'CREATE INDEX ' + @tempIndexName + ' ON ' + @codeTable + '(' + @columnName + ') INCLUDE ('+@columnName+'ID)'
	
	-- change by praksh 13/06/2013
	IF @IsDebug=0
		BEGIN
			exec sp_executesql @SQLIndex
		END
	ELSE
		BEGIN
			Print @SQLIndex
		END

	set @SQLInsert = 'Insert Into IDDB.dbo.' + @columnname + ' (' + @columnname + ') 
			Select distinct  IsNull(detail.' + @columnname + ', '''')
			From ' + @codeTable + ' detail
			left outer join IDDB.dbo.' + @columnname + ' id on id.' + @columnname + '=detail.' + @columnname + '
			where id.' + @columnname + ' is null
			and detail.' + @columnname + ' is not null'

	If @columnName='MediaDetail'
		Set @SQLInsert=replace(replace(@SQLInsert,'MediaDetail','Media'),'detail.Media','detail.MediaDetail')

	If @columnName='ACBrandFamily'
		Set @SQLInsert=replace(replace(@SQLInsert,'ACBrandFamily','Brand'),'detail.Brand','detail.ACBrandFamily')

	-- change by praksh 13/06/2013
	IF @IsDebug=0
		BEGIN
			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @codeTable,'Start mt_proc_Create_ID_Update Insert In ', @codeTable +' '+ @columnName, GETDATE()

			exec sp_executesql @SQLInsert

			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @codeTable,'End mt_proc_Create_ID_Update Insert In ', @codeTable +' '+ @columnName, GETDATE()
		END
	ELSE
		BEGIN
			Print @SQLInsert
		END

	set @SQLUpdate = 'Update ReportTable Set ' + @columnname + 'ID = IDTable.' + @columnname + 'ID 
			From ' + @codeTable + ' ReportTable Join IDDB.dbo.' + @columnname + ' IDTable  On IsNull(ReportTable.' + @columnname + ', '''') 
			= IsNull(IDTable.' + @columnname + ', '''') Where Isnull(ReportTable.' + @columnname + 'ID,0) <> IDTable.' + @columnname + 'ID '

	If @columnName='MediaDetail'
	Set @SQLUpdate =replace(replace(@SQLUpdate,'IDTable.MediaDetail','IDTable.Media'),'IDDB.dbo.MediaDetail','IDDB.dbo.Media')

	If @columnName='ACBrandFamily'
	Set @SQLUpdate =replace(replace(@SQLUpdate,'IDTable.ACBrandFamily','IDTable.Brand'),'IDDB.dbo.ACBrandFamily','IDDB.dbo.Brand')

	-- change by praksh 13/06/2013
	IF @IsDebug=0
		BEGIN
			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @codeTable,'Start Update In mt_proc_Create_ID_Update', @codeTable +' '+ @columnName, GETDATE()

			exec sp_executesql @SQLUpdate

			INsert into CategoryCodeLog(CategoryCode,Details,SQL, QueryTime) Select @codeTable,'End Update In mt_proc_Create_ID_Update', @codeTable +' '+ @columnName, GETDATE()
		END
	ELSE
		BEGIN
			Print @SQLUpdate
		END

	SET @SQLIndex = ' DROP index ' + @codeTable + '.' + @tempIndexName

	-- change by praksh 13/06/2013
	IF @IsDebug=0
		BEGIN
			exec sp_executesql @SQLIndex
		END
	ELSE
		BEGIN
			Print @SQLIndex
		END

	PRINT '-- END mt_proc_Create_ID_Update SP : ' + convert(varchar(100),current_timestamp,20)
END
