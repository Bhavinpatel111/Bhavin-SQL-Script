use SQL06

Declare @vCategory varchar(15), @vSQL varchar(max)

-- ## Create temporary table 
If OBJECT_ID('TempDb..MisMatchCategoryList') is Not Null
	Drop Table TempDb..MisMatchCategoryList

Select Convert(varchar(15), Null) CategoryCode, a.MerchandiseCategoryID MerchandiseCategoryID_Rnm, a.MerchandiseSubCatID MerchandiseSubCatID_Rnm, a.CategoryID CategoryID_Rnm,
		a.MerchandiseCategoryID MerchandiseCategoryID_Ori, a.MerchandiseSubCatID MerchandiseSubCatID_Ori, a.CategoryID CategoryID_Ori
Into TempDb..MisMatchCategoryList
From MasterAcfv.Dbo.ACFVDetailReports a With (Nolock)
Where 1 = 2 

Declare Cur_CategoryCode Cursor For 
	Select Category From MasterACFV..CategoryCodeRunFlag With (NoLock) --where Category = 'bariPEP'

Open Cur_CategoryCode
Fetch Next From Cur_CategoryCode Into @vCategory
While @@FETCH_STATUS = 0 
Begin
	SET @vSQL = '
				If OBJECT_ID(''TempDb..#Renamed'') is Not Null
					Drop Table #Renamed
				Select a.PageDetailID, a.MerchandiseCategoryID, a.MerchandiseSubCatID, a.CategoryID
				Into #Renamed
				From Dbo.' + @vCategory + 'DetailReports a

				--Create NonClustered Index IDX_' + @vCategory + 'DetailReports_PageDetailID on Dbo.' + @vCategory + 'DetailReports(PageDetailID)

				If OBJECT_ID(''TempDb..#Original'') is Not Null
					Drop Table #Original
				Select b.PageDetailID, b.MerchandiseCategoryID, b.MerchandiseSubCatID, b.CategoryID
				Into #Original
				From Dbo.' + @vCategory + 'DetailReports a
				Join MasterAcfv.Dbo.ACFVDetailReports b On a.PageDetailID = b.PageDetailID

				If OBJECT_ID(''TempDb..#T'') is Not Null
					Drop Table #T

				Select a.PageDetailID, a.MerchandiseCategoryID MerchandiseCategoryID_Rnm, a.MerchandiseSubCatID MerchandiseSubCatID_Rnm, a.CategoryID CategoryID_Rnm,
					b.MerchandiseCategoryID MerchandiseCategoryID_Ori, b.MerchandiseSubCatID MerchandiseSubCatID_Ori, b.CategoryID CategoryID_Ori
				Into #T
				From #Renamed A Join #Original B on A.PageDetailID = B.pagedetailid
				Where A.MerchandiseCategoryID <> B.MerchandiseCategoryID
				Or A.MerchandiseSubCatID <> B.MerchandiseSubCatID
				Or A.CategoryID <> B.CategoryID
				
				Insert Into TempDb..MisMatchCategoryList 
				Select Distinct ''' + @vCategory + ''' CategoryCode, MerchandiseCategoryID_Rnm, MerchandiseSubCatID_Rnm, CategoryID_Rnm,
					MerchandiseCategoryID_Ori, MerchandiseSubCatID_Ori, CategoryID_Ori from #T
				'
	exec (@vSQL)
	
	Fetch Next From Cur_CategoryCode Into @vCategory
End
Close Cur_CategoryCode
Deallocate Cur_CategoryCode

-- ### Send Mail
If OBJECT_ID('TempDb..MisMatchCategoryListMail') is Not Null
	Drop Table TempDb..MisMatchCategoryListMail

Select ClientName, HomePageLink [DataBaseName], ClientServer,
		mc. MerchandiseCategory MerchandiseCategory_Original, msc.MerchandiseSubCat MerchandiseSubCat_Original, ct.Category Category_Original,
		Rmc.MerchandiseCategory MerchandiseCategory_Renamed, Rmsc.MerchandiseSubCat MerchandiseSubCat_Renamed, Rct.Category Category_Renamed,
		Convert(Varchar(200), Null) [Final_Remark],
		Case When c.customstep = 1 Then 'Yes' Else 'No' End as [Custom Applied],
		Case When(select Count(1) from mt2sql14.sitecontrol.dbo.[vw_MasterSegmentation] where category = c.Category) > 0 Then 'Yes' Else 'No' End as [Segment Applied],
		Case When IMC.MerchandiseCategory <> mc.MerchandiseCategory Then Case When IMC.MerchandiseCategory = Rmc.MerchandiseCategory Then 'MerchandiseCategory Renaming' Else 'Other' End Else '' End As MerchandiseCategory_Remark,
		Case When IMC.MerchandiseSubCat <> msc.MerchandiseSubCat Then Case When IMC.MerchandiseSubCat = Rmsc.MerchandiseSubCat Then 'MerchandiseSubCat Renaming' Else 'Other' End Else '' End As MerchandiseSubCat_Remark,
		Case When IMC.RealCategory <> Rct.Category Then Case When IMC.Category = Rct.Category Then 'Category Renaming' Else 'Other' End Else '' End As Category_Remark,
		MerchandiseCategory_Custom = IsNull((Select 'Yes' From MT2SQL14.SiteControl.dbo.vw_MasterCustomStep csm Where csm.Category = c.Category and csm.clientid = c.clientid and csm.FieldName = 'MerchandiseCategory'), ' '),
		MerchandiseSubCat_Custom = IsNull((Select 'Yes' From MT2SQL14.SiteControl.dbo.vw_MasterCustomStep csm Where csm.Category = c.Category and csm.clientid = c.clientid and csm.FieldName = 'MerchandiseSubCat'), ' '),
		Category_Custom = IsNull((Select 'Yes' From MT2SQL14.SiteControl.dbo.vw_MasterCustomStep csm Where csm.Category = c.Category and csm.clientid = c.clientid and csm.FieldName = 'Category'), ' '),
		MerchandiseCategory_Segment = IsNull((Select 'Yes' From MT2SQL14.SiteControl.dbo.vw_MasterSegmentation csm Where csm.Category = c.Category and csm.clientid = c.clientid and csm.FieldName = 'MerchandiseCategory'), ' '),
		MerchandiseSubCat_Segment = IsNull((Select 'Yes' From MT2SQL14.SiteControl.dbo.vw_MasterSegmentation csm Where csm.Category = c.Category and csm.clientid = c.clientid and csm.FieldName = 'MerchandiseSubCat'), ' '),
		Category_Segment = IsNull((Select 'Yes' From MT2SQL14.SiteControl.dbo.vw_MasterSegmentation csm Where csm.Category = c.Category and csm.clientid = c.clientid and csm.FieldName = 'Category'), ' ')
Into TempDb..MisMatchCategoryListMail
From TempDb..MisMatchCategoryList a 
Join MT2SQL14.Sitecontrol.Dbo.vw_catInfo c on a.CategoryCode = c.Category
Join IDDB.Dbo.MerchandiseCategory mc on mc.MerchandiseCategoryID = a.MerchandiseCategoryID_Ori
Join IDDB.Dbo.MerchandiseSubCat msc on msc.MerchandiseSubCatID = a.MerchandiseSubCatID_Ori
Join IDDB.Dbo.Category ct on ct.CategoryID = a.CategoryID_Ori
Join IDDB.Dbo.MerchandiseCategory Rmc on Rmc.MerchandiseCategoryID = a.MerchandiseCategoryID_Rnm
Join IDDB.Dbo.MerchandiseSubCat Rmsc on Rmsc.MerchandiseSubCatID = a.MerchandiseSubCatID_Rnm
Join IDDB.Dbo.Category Rct on Rct.CategoryID = a.CategoryID_Rnm
JOIN MT2SQL14.SiteControl.dbo.vw_MerchandiseCategory IMC on IMC.CategoryCodeId = C.CategoryCodeId And IMC.RealCategory = CT.Category

-- ### Concate remarks
Update TempDb..MisMatchCategoryListMail
Set Final_Remark =	Case When MerchandiseCategory_Remark = 'MerchandiseCategory Renaming' Then ' #MerchandiseCategory Renaming'
						Else Case When MerchandiseCategory_Custom = 'Yes' Then ' #Custom Applied on MerchandiseCategory' 
								Else Case When MerchandiseCategory_Segment = 'Yes' Then ' #Segment Applied on MerchandiseCategory'
									Else Case When MerchandiseCategory_Remark <> '' AND MerchandiseCategory_Custom <> '' AND MerchandiseCategory_Segment <> '' Then '#Error' Else '' End
								End
						End
					End +
					Case When MerchandiseSubCat_Remark = 'MerchandiseSubCat Renaming' Then ' #MerchandiseSubCat Renaming'
						Else Case When MerchandiseSubCat_Custom = 'Yes' Then ' #Custom Applied on MerchandiseSubCat' 
								Else Case When MerchandiseSubCat_Segment = 'Yes' Then ' #Segment Applied on MerchandiseSubCat '
									Else Case When MerchandiseCategory_Remark <> '' AND MerchandiseCategory_Custom <> '' AND MerchandiseCategory_Segment <> '' Then '#Error' Else '' End
								End
						End
					End +
					Case When Category_Remark = 'Category Renaming' Then ' #Category Renaming'
						Else Case When Category_Custom = 'Yes' Then ' #Custom Applied on Category' 
								Else Case When Category_Segment = 'Yes' Then ' #Segment Applied on Category'
									Else Case When MerchandiseCategory_Remark <> '' AND MerchandiseCategory_Custom <> '' AND MerchandiseCategory_Segment <> '' Then '#Error' Else '' End
								End
						End
					End 

Exec master.dbo.sp_ProcExportData
		@recipients='Bhavin.patel111@numerator.com',
		@subject= 'Segmentation or Custom update mismatch detail report',
		@message='Mismatch compare based on MerchandiseCategoryID, MerchandiseSubCatID, CategoryID',
		@Query = 'Select * from TempDb.Dbo.MisMatchCategoryListMail',
		@exporttype='csv',
		@tabname='Category mismatch details'
