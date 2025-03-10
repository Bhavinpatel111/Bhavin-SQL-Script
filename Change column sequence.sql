
Declare cur_Display_Change cursor For 
	select distinct rc.RptTemplateID
	from ReportFormatControl rc 
	Join ReportFormatTemplatesDetail rfd  on rc.RptTemplateID = rfd.RptTemplateID
	Join vw_catinfo c on c.CategoryCodeId = rc.CategoryCodeID
	where rfd.FieldID = 92 
	and c.Category = 'lo'
	and c.FVCCType in (2,4,6)

Declare	@vTempleteId Bigint
Declare	@vSearchFieldId int = 73 -- Pagedetailid
Declare	@vSearchDispSeq int 

Open cur_Display_Change
Fetch Next From cur_Display_Change Into @vTempleteId

While @@FETCH_STATUS = 0 
Begin
	Set @vSearchDispSeq = null 

	Select @vSearchDispSeq = DisplaySeq
	From ReportFormatTemplatesDetail where RptTemplateID = @vTempleteId and FieldID = @vSearchFieldId
	
	--Begin tran
		Update ReportFormatTemplatesDetail
		set DisplaySeq = DisplaySeq + 1 
		where RptTemplateID = @vTempleteId
		and DisplaySeq > @vSearchDispSeq
		and DisplaySeq is not null

		Print @@rowcount

		Update ReportFormatTemplatesDetail
		set DisplaySeq = (@vSearchDispSeq + 1 )
		where RptTemplateID = @vTempleteId
		and FieldID = 92 

		Print @@rowcount

	Print 'Template Id -> ' + convert(varchar, @vTempleteId) + ' Display Seq -> ' + convert(varchar,@vSearchDispSeq)
	--Print @vTempleteId

	Fetch Next From cur_Display_Change Into @vTempleteId
End

Close cur_Display_Change
Deallocate cur_Display_Change
