--Select * into tempdb.dbo.promoincentiveupdateint from MT2SQL13.tempdb.dbo.promoincentiveupdateint
--select top 4 * from MasterACFV..ACFVMPVACPromoIncentive
--truncate table MasterACFV..ACFVMPVACPromoIncentive

--Insert into MasterACFV..ACFVMPVACPromoIncentive
--select * from tempdb.dbo.promoincentiveupdateintMPV


 Declare @Cnt As Int=1
		,@Consolidated as Int=0
		,@Msg as varchar(500)
 While @Cnt >0
 Begin
 
 IF EXISTS (SELECT * FROM tempdb.sys.objects WHERE name = N'ClientACPromoIncentiveTemp')
		Drop table tempdb.dbo.ClientACPromoIncentiveTemp

	 select top 10000 *
	 Into tempdb.dbo.ClientACPromoIncentiveTemp
	 from tempdb.dbo.promoincentiveupdateint with (nolock)
	
	CREATE NONCLUSTERED INDEX [ID] ON tempdb.dbo.ClientACPromoIncentiveTemp(PageDetailID)

	Update PDT Set MPVACPromoIncentive = CWM.ACPromoIncentive, MPVACPromoIncentiveID = CWM.ACPromoIncentiveID
	From ACFVDetailReports PDT 
	Join tempdb.dbo.ClientACPromoIncentiveTemp CWM
	On PDT.PageDetailID = CWM.PageDetailID

	Delete A From tempdb.dbo.promoincentiveupdateint  A JOIN tempdb.dbo.ClientACPromoIncentiveTemp B ON A.PageDetailID=B.PageDetailID

	Set @Cnt=@@RowCount
	Set @Consolidated=@Consolidated+@Cnt
	Set @Msg='ACFVAccessoriesList records Update: '+Cast(@Consolidated as varchar)+' at :'+convert(varchar,getdate(),109)
	RAISERROR (@Msg, 0, 1) WITH NOWAIT
 End

