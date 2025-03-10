---- ###On MT2SQL13
 Drop table Tempdb..Test
 select originalpagedetailid Into Acfvincr..Test from masteracfv..ACFVDetailReports with (nolock)
 select Distinct originalpagedetailid Into Tempdb..Test from Acfvincr..Test

---------------------------------------------------------------------------------------------------------
 
--  select originalpagedetailid, CoreOfferType, CoreOffer Into ACFVINCRCWM..Adc_update from robin.Tempdb.dbo.Adc_update

select B.pagedetailid, A.CoreOfferType, A.CoreOffer --A.AdCost, A.min_qty, A.AcAdOfferValue1, A.OtherDiscountD2, A.ACCouponFlag
Into ACFVINCRCWM..Adc_update_pagedetailid
from ACFVINCRCWM..Adc_update A
Join MasterACFV..ACFVDetailReports B on B.OriginalPagedetailid = A.OriginalPagedetailid

-- ###For second day data delete
 --Delete a from Mt2sql13.ACFVINCRCWM.Dbo.Adc_update_pagedetailid a
 --Join ACFVINCR..TempACFVDetailReports b on b.pagedetailid = a.pagedetailid
 
 --Delete a from Mt2sql13.ACFVINCRCWM.Dbo.Adc_Loop a
 --Join ACFVINCR..TempACFVDetailReports b on b.pagedetailid = a.pagedetailid
 
select * Into ACFVINCRCWM..Adc_Loop from Mt2sql13.ACFVINCRCWM.Dbo.Adc_update_pagedetailid Where 1=2

Alter table ACFVINCRCWM..Adc_Loop add constraint PK_Adc_update_pagedetailid
primary key clustered (pagedetailid)

Insert Into ACFVINCRCWM..Adc_Loop select * from Mt2sql13.ACFVINCRCWM.Dbo.Adc_update_pagedetailid

-- ## backup
--BACKUP DATABASE ACFVINCRCWM
--TO URL = N'https://promodatabasebackup.blob.core.windows.net/backups/MT2SQL13/ACFVINCRCWM.bak' 
--WITH CREDENTIAL = 'Credpromodatabasebackup', INIT, COMPRESSION, NOUNLOAD, FORMAT, SKIP, STATS = 1;

---------------------------------------------------------------------------------------------------------
-- update on all server

--USE [master]
--RESTORE DATABASE [ACFVINCRCWM]
-- FROM  DISK = N'\\MT2BU1\ClientBU\ACFVINCRCWM.bak'
--  WITH  FILE = 2,  MOVE N'ACFVINCRCWM' TO N'D:\SQLDATA\ACFVINCRCWM.mdf', 
--   MOVE N'ACFVINCRCWM_log' TO N'D:\SQLDATA\ACFVINCRCWM_log.ldf',  NOUNLOAD,  STATS = 5
--   , Replace
--GO

--RESTORE DATABASE ACFVINCRCWM 
--FROM URL = N'https://promodatabasebackup.blob.core.windows.net/backups/MT2SQL13/ACFVINCRCWM.bak'
--WITH CREDENTIAL = 'Credpromodatabasebackup', 
--MOVE N'ACFVINCRCWM' To N'D:\SQLDATA\ACFVINCRCWM.mdf', 
--MOVE N'ACFVINCRCWM_Log' To N'D:\SQLDATA\ACFVINCRCWM.ldf',
--Recovery, Replace

Use MasterACFV

-- Select count(1) from ACFVINCRCWM..Adc_Loop With (Nolock)

While Exists (Select top 1 * from ACFVINCRCWM..Adc_Loop With (Nolock))
Begin
	If OBJECT_ID('TempDb..#T')is not null 
		Drop table #T 
	Select top 100000 * Into #T from ACFVINCRCWM..Adc_Loop With (Nolock)

	Update A
		SET A.OfferDes = B.CoreOffer, A.Comments2 = B.CoreOfferType
	From AcfvdetailReports A
	Join #T B on A.pagedetailid = B.pagedetailid

	--select A.Promotions, A.OriginalPagedetailid, A.CoreOfferType, A.Comments2, B.*
	--From AcfvdetailReports A
	--Join #T B on A.pagedetailid = B.pagedetailid

	Delete A
	From ACFVINCRCWM..Adc_Loop A
	Join #T B on A.pagedetailid = B.pagedetailid
End
