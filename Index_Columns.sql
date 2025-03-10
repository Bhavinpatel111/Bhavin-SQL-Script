Declare Cur_Indexes Cursor
	For select i.object_id, i.index_id, i.name
		from sys.sysobjects o 
			Join sys.indexes i On i.object_id = o.id
		where o.name = 'ACFVDetailReports'
		Order by i.object_id, i.index_id

Declare @vObjId Int, @vIndexId Int, @vIndexName varchar(100), @vColumns varchar(1000), @vColumns_Include varchar(1000)

Declare @Index_Details Table(
					Index_Name varchar(100),
					Index_Column varchar(1000),
					Index_Include_Column varchar(1000))

Open Cur_Indexes
Fetch Next From Cur_Indexes Into @vObjId, @vIndexId, @vIndexName
While @@FETCH_STATUS = 0 
Begin
	SET @vColumns = ''

	Select @vColumns = @vColumns + c.name + ','
	From sys.index_columns ic 
	Join sys.columns c on c.object_id = @vObjId and c.column_id = ic.column_id
	Where ic.object_id = @vObjId
	And ic.index_id = @vIndexId
	AND ic.is_included_column = 0 

	SET @vColumns = LEFT(@vColumns, LEN(@vColumns)-1)

	SET @vColumns_Include = ''

	Select @vColumns_Include = @vColumns_Include + c.name + ','
	From sys.index_columns ic 
	Join sys.columns c on c.object_id = @vObjId and c.column_id = ic.column_id
	Where ic.object_id = @vObjId
	And ic.index_id = @vIndexId
	AND ic.is_included_column = 1

	If LEN(@vColumns_Include)> 0
		SET @vColumns_Include = LEFT(@vColumns_Include, LEN(@vColumns_Include)-1)

	Insert Into @Index_Details
		Values(@vIndexName, @vColumns, @vColumns_Include)

	Fetch Next From Cur_Indexes Into @vObjId, @vIndexId, @vIndexName
End

Close Cur_Indexes
Deallocate Cur_Indexes

Select * from @Index_Details
