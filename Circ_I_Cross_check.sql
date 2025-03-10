Use MasterACFV

select flyerid,count(1) Cnt
Into AcfvINCR..xx
from ACFVDetailReports with (NoLock)
Group by flyerid

Select A.FlyerID, A.OriginalFlyerID, B.Cnt
Into AcfvINCR..yy
from ACFVFlyerReports A 
Join AcfvINCR..xx B on A.FlyerID = B.FlyerID

Select A.*, B.MAxCnt Into AcfvINCR..ZZ from AcfvINCR..yy A
Join (Select OriginalFlyerID, Max(Cnt) MAxCnt From AcfvINCR..yy B Group by OriginalFlyerID) B
On A.OriginalFlyerID = B.OriginalFlyerID
Where A.Cnt < B.MAxCnt

Select Distinct OriginalFlyerID from AcfvINCR..ZZ 
--select * from AcfvINCR..ZZ where OriginalFlyerID = 2318419

select OriginalFlyerid, Count(FlyerID) Retailer_Mkt, Max(Cnt) Max_Cnt, Min(Cnt) Min_Cnt
Into ACFVINCR..DD
from acfvincr..yy
Group by OriginalFlyerid

Select A.OriginalFlyerid, Max(A.Retailer_Mkt) Retailer_Mkt, Max(A.Max_Cnt) Max_Cnt, Max(A.Min_Cnt) Min_Cnt, Count(Market) Origin_Mkt_Cnt
Into ACFVINCR..Final
From ACFVINCR..DD A 
Join (
Select circ_i,retailer_i,state_c,major_city_i,Market,circ_tp_c, start_dt from ACFVINCR..circular_list_s 
Union
Select circ_i,retailer_i,state_c,major_city_i,Market,circ_tp_c, start_dt from ACFVINCR..circular_list_ws
Union
Select circ_i,retailer_i,state_c,major_city_i,Market,circ_tp_c, start_dt from ACFVINCR..circular_list_S_BP
Union
Select circ_i,retailer_i,state_c,major_city_i,Market,circ_tp_c, start_dt from ACFVINCR..circular_list_ws_BP
Union
Select circ_i,retailer_i,state_c,major_city_i,Market,circ_tp_c, start_dt from ACFVINCR..circular_list_Email
) B On A.OriginalFlyerid = B.circ_i
Group by A.OriginalFlyerid

-- Duplicate entry
select * from ACFVINCR..ALL_Circ_Market A Join ACFVFlyerReports B on A.circ_i = B.OriginalFlyerID
where A.Retailer_i <> B.ACAdvertiserId


select * from ACFVINCR..DD where OriginalFlyerid Not in (Select OriginalFlyerid from ACFVINCR..Final)

--select * into TempDb..Final From mt2sql13.TempDb.dbo.Final
--select * into TempDb..Final From ACFVINCR..Final

Use MasterACFV

;With Compare As 
(select OriginalPagedetailid , category, brand, Comments3
from ACFVDetailReports
Group by OriginalPagedetailid, category, brand, Comments3
)
Select OriginalPagedetailid, Count(1) CatCnt
Into TempDB..Adc_I_Count
From Compare 
Group by OriginalPagedetailid

-- Drop table TempDB..Final_NEW 
-- Drop table TempDB..Adc_I_Count
select top 4 * from TempDB..Final_NEW 
select top 4 * from TempDB..Adc_I_Count

select B.*, A.CatCnt 
Into TempDb..MissCat
from TempDB..Adc_I_Count A
Join TempDB..Final_NEW B On B.Adc_i = A.Originalpagedetailid
Where A.CatCnt <> B.Origin_Cnt

------------------------------------------------------------------------------------
-- Cross check merchadise cat

Drop table ACFVINCR..ACFV_CatBrandProduct_Cat

select category, merchandisecategory, merchandisesubcat, segment--, manufacturer 
Into ACFVINCR..ACFV_CatBrandProduct_Cat
from ACFVINCR..ACFV_CatBrandProduct
Group by category, merchandisecategory, merchandisesubcat, segment--, manufacturer 

Select D.OriginalPagedetailid
Into ACFVINCR..InCorrect_Merc
from ACFVDetailReports D
Join ACFVINCR..ACFV_CatBrandProduct_Cat A ON D.category = A.category
Where ( A.merchandisecategory <> D.merchandisecategory
	OR A.merchandisesubcat <> D.merchandisesubcat
	OR A.segment <> D.ACSegment
)

select distinct * INto Tempdb..Test from ACFVINCR..InCorrect_Merc

-- select OriginalPagedetailid INto #T from mt2sql13.Tempdb.dbo.Test

------------------------------------------------------------------------------------
Drop table ACFVINCR..ALL_Circ_Market
Select Distinct * Into ACFVINCR..ALL_Circ_Market
From (
Select circ_i,Market, retailer_i from ACFVINCR..circular_list_s 
Union
Select circ_i,Market, retailer_i from ACFVINCR..circular_list_ws
Union
Select circ_i,Market, retailer_i from ACFVINCR..circular_list_S_BP
Union
Select circ_i,Market, retailer_i from ACFVINCR..circular_list_ws_BP
Union
Select circ_i,Market, retailer_i from ACFVINCR..circular_list_Email
) A

Drop table ACFVINCR..acfvincr_EXtraMarket

Select A.OriginalFlyerid, A.Market, A.Media, A.FlyerID
Into ACFVINCR..acfvincr_EXtraMarket
from Masteracfv..acfvflyerReports A
Left Join  ACFVINCR..ALL_Circ_Market B on A.OriginalFlyerid = B.Circ_i and A.market = Replace(Replace(B.market,'Internet, US','Internet'),'Email, US','Email')
Where B.market is null

select Distinct * from ACFVINCR..acfvincr_EXtraMarket
--###################################################################################################
-- Media cross verify
-----------------------------------------------------------------------------------------------------

select F.originalflyerid
Into Acfvincr..IncorrectMedia
From MasterACFV..ACFVDetailReports D
Join MasterACFV..ACFVFlyerReports F ON D.flyerid = F.FlyerID
Where D.mediaid <> F.mediaId
Or D.tradeclassid <> F.tradeclassid

--###################################################################################################
---------------------------------------------------------------------------------------------------
/*
-- Check 
Select flyerid, OriginalFlyerID ,Count(1) Cnt
Into ACFVINCR..Check_Missing
from MasterACFV..ACFVDetailReports 
Where flyerid in (
select FlyerId From MasterACFV..ACFVFlyerReports Where OriginalFlyerID in (Select Distinct OriginalFlyerID from AcfvINCR..ZZ )
)
Group by flyerid, OriginalFlyerID

select Distinct OriginalFlyerID, Cnt from ACFVINCR..Check_Missing order by OriginalFlyerID
select * from ACFVINCR..Check_Missing order by OriginalFlyerID,Cnt

-- check2
Drop Table #T 
select ACAdCompBrandId, category, flyerid
Into #T 
from MasterACFV..ACFVDetailReports
Where flyerid  in ( select FlyerId From MasterACFV..ACFVFlyerReports Where OriginalFlyerID = 2318419)

Select ACAdCompBrandId, category,  Count(Distinct flyerid) cnt ----ROW_NUMBER() over(partition by ACAdCompBrandId, category order by ACAdCompBrandId, category) Cnt
 from #T
group by ACAdCompBrandId, category
having count(1) = 1 

-----------------------------------
 select FlyerId From MasterACFV..ACFVFlyerReports Where OriginalFlyerID = 2318419

 select ACAdCompBrandId,category,categoryid, accategoryid, Brand into #T from MasterACFV..ACFVDetailReports where Flyerid =  4178958  order by 1 desc
 select distinct * from #T	-- New

 select ACAdCompBrandId,category into #TT from MasterACFV..ACFVDetailReports where Flyerid =  4178960 order by 1 desc
 select distinct * from #TT	 -- old 

select * from #T a Left join #TT b on a.ACAdCompBrandId = b.ACAdCompBrandId and a.category = b.category
Where b.ACAdCompBrandId is null 

select * from #T where accategoryid = 1373
*/