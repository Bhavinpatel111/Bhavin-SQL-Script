use PEP03

select * from mt2sql14.SiteControl.dbo.vw_catinfo where Category='cbiPeP'

update mt2sql14.SiteControl.dbo.categorycode set isfull = 1, cwmfull=1, ispdt=1, clientpdt=1, clientrun=1 where category = 'cbiPeP' 

exec CreateFlyerReports 'cbiPeP','masteracfv..acfvflyerreports',0

exec CreateDetailReports_acfv 'cbiPeP','',0

exec MasterSegmentation 'cbiPeP',0

exec mt_proc_Create_AdBlock 'cbiPeP', 0

IF EXISTS (SELECT * FROM MT2SQL14.SiteControl.DBO.CategoryCode WHERE Category='cbiPeP' AND IsTPR=1)
	EXECUTE [CustomstepSP_TPR_Data] 'cbiPeP', 0

exec DataSP50Int.dbo.fv_RefreshDefaultQueryTables 'cbiPeP'

update mt2sql14.sitecontrol.dbo.categorycode set FD = 1, FDTime = getdate(),isfull=0 where Category = 'cbiPeP'
