Use Masteracfv

--select pagedetailid Into Mapids from MasterACFV..ACFVDetailReports

--Insert Into Mapids 
--select pagedetailid from MasterACFVHistory..ACFVDetailReports

Select d.PageDetailID
INto ACFVINCR..Mapids_DElete
from MasterMappingTables..MasterMapPageDetailID d
Left JOin Mapids a on d.PageDetailID = a.PageDetailID
Where a.PageDetailID is null
and d.TypeId = 1 
 

-- select Count(1) from ACFVINCR..Mapids_DElete

Declare @vCnt Int = 2, @vI Int = 0
--While exists (select top 1 * from ACFVINCR..Mapids_DElete)
While (@vI < @vCnt)
Begin
	SET @vI = @vI + 1 

	If OBJECT_ID('Tempdb..#T') is not null
		Drop table #T

	select top 100000 PageDetailID INto #T from ACFVINCR..Mapids_DElete

	--select * from MasterMappingTables..MasterMapPageDetailID where PageDetailID in (
	--	select PageDetailID from #T)

	DElete a
	from MasterMappingTables..MasterMapPageDetailID a JOin #T b on a.PageDetailID = b.PageDetailID

	DElete a
	from ACFVINCR..Mapids_DElete a JOin #T b on a.PageDetailID = b.PageDetailID
End
