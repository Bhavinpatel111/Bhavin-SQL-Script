Use Connection

Select * from clientgroup where ClientID=845

--Update clientgroup Set ClientGroupId=8 where ClientID=845

Select * from SiteControl.dbo.CategoryCode where ClientID=845

--Update SiteControl.dbo.CategoryCode Set IsFull=1 where Category='twine'

Select * from vwDBParameters where activesql like '%sql07%'
--81

Select * from ClientAppParameters where DatabaseParameterID=81
--8

Select * from CategoryAppParameters where CategoryCodeID in (4617)

--Update CategoryAppParameters Set DatabaseParameterID=169 where CategoryCodeID in (4617) and DatabaseParameterID=155


--169

Select * from FRRetMkt where clientid=845

Select IsActiveClient,MasterCategoryCodeID50,* from clientprofile where clientid=845

--Update clientprofile Set IsActiveClient=1 where clientid=845

Select * from FlashReport.dbo.ClientValues where clientid=845

Select * from FlashReport.dbo.DeletedClientValues where clientid=845

--Insert Into ClientValues ([ClientID],[Company],[HTML],[FSI],[NOFSIRS],[FSIPPT],[Detail],[DetailPPT],[XLSzip],[XLSattach],[PPTzip],[PPTattach],[ExcelInstructions],[Sendername],[SenderReturnAddress],[EmailSubject],[CompanyContact],[CompanyContactPhone],[CompanyContactEmail],[Signature],[CRSImageReportNameDetail],[ShowCRSImageReportDetail],[CRSImageReportNameFSI],[ShowCRSImageReportFSI],[PPTNameDetail],[PPTNameFSI],[XLSName],[EmailBodyRS],[EmailBody],[PPTBodyRS],[PPTBody],[PPTFSIBodyRS],[PPTFSIBody],[Adview2],[Active],[Locked],[LastEditedBY],[LastEditedOn],[ExcludedTradeClasses],[ExcludeAdvertiserMarket],[LogoName],[SignatureLogoFileName],[EmailBodyMW],[EmailSubjectMW])
Select [ClientID],[Company],[HTML],[FSI],[NOFSIRS],[FSIPPT],[Detail],[DetailPPT],[XLSzip],[XLSattach],[PPTzip],[PPTattach],[ExcelInstructions],[Sendername],[SenderReturnAddress],[EmailSubject],[CompanyContact],[CompanyContactPhone],[CompanyContactEmail],[Signature],[CRSImageReportNameDetail],[ShowCRSImageReportDetail],[CRSImageReportNameFSI],[ShowCRSImageReportFSI],[PPTNameDetail],[PPTNameFSI],[XLSName],[EmailBodyRS],[EmailBody],[PPTBodyRS],[PPTBody],[PPTFSIBodyRS],[PPTFSIBody],[Adview2],[Active],[Locked],'markh' as [LastEditedBY],getdate() as [LastEditedOn],[ExcludedTradeClasses],[ExcludeAdvertiserMarket],[LogoName],'SignatureLogo.jpg' as [SignatureLogoFileName],NULL as [EmailBodyMW],NULL as [EmailSubjectMW] from FlashReport.dbo.deletedclientvalues where clientid=845

Select * from FlashReport.dbo.ClientDeliverables where clientid=845

Select * from FlashReport.dbo.DeletedClientDeliverables where clientid=845

Select * from sitecontrol.dbo.categorycode where clientid=845

Select * from clientprofile where clientid=845

--Update clientprofile set isActiveClient=1 where clientid=845

--Insert Into ClientProfile ([ClientID],[ClientName],[SubscriptionEndDate],[ProcessingPriority],[LimitToRegisteredEmails],[FiscalYear],[ClientCode],[TermsPage],[Trusted],[IsPopupBlocked],[StartPage],[Licenses],[SendUserName],[MasterCategoryCodeId],[TOUPage],[FAQPage],[IsActiveClient],[ClientFolder],[RolloutToAllUsers],[RevenueBand],[ClientIndustryType],[ClientWeight],[CSRepresentative],[Comments],[LastUpdatedOn],[LastUpdatedBy],[RequiredFields],[DisplayHPAnnouncement],[ClientHomeTitle],[ContactEmailAddress],[ContactName],[ContactPhone],[TermsText],[FV40],[MasterCategoryCodeID50],[ScoreCardChartTabText],[APName],[APContact],[APEmailAddress],[IsCanadaClient],[IsInternal],[ClientType],[ClientOrigin],[CreatedOn])
Select [ClientID],[ClientName],[SubscriptionEndDate],[ProcessingPriority],[LimitToRegisteredEmails],[FiscalYear],[ClientCode],[TermsPage],[Trusted],[IsPopupBlocked],[StartPage],[Licenses],[SendUserName],[MasterCategoryCodeId],[TOUPage],[FAQPage],[IsActiveClient],[ClientFolder],[RolloutToAllUsers],[RevenueBand],[ClientIndustryType],[ClientWeight],[CSRepresentative],[Comments],[LastUpdatedOn],[LastUpdatedBy],[RequiredFields],[DisplayHPAnnouncement],[ClientHomeTitle],[ContactEmailAddress],[ContactName],[ContactPhone],[TermsText],[FV40],[MasterCategoryCodeID50],[ScoreCardChartTabText],[APName],[APContact],[APEmailAddress],[IsCanadaClient],[IsInternal],[ClientType],[ClientOrigin],[CreatedOn] from archivesub.dbo.clientprofile where clientid=845

Select * from clientcontrol where clientid=845

--Insert Into clientcontrol ([ClientID],[ZipFile],[ControlSubscriptionPage],[MaxAllowedPPT],[TotalNumberPPT],[MaxFullSizeImagesSinglePPT],[MaxIntermediateImagesSinglePPT],[MaxThumbnailsImagesSinglePPT],[MaximumAllowedPDTRecords],[MaximumAllowedCWMRecords],[PPTQueryPage],[PreventCWMQueries],[AllowPPTProductImage],[ClientRecSet],[Subscription],[AllowSummaryView],[PDTExcelDownload],[MaxAllowedSumPDTRecords],[TotalXLSSumPDTRecords],[TotalXLSPDTRecords],[AllowSavePDTOnSite],[AllowProductImageView],[AllowAdvanceQuery],[AllowGuidedTour],[AllowHelp],[ClientCWMMainDatabase],[ExcelColumnHeaderColor],[MaxProductThumbnailImageSinglePPT],[MaxProductImageSinglePPT],[RowColor],[ShareSavedQuery],[allowfreezpan],[allowfilterlink],[MaxFileSizeEmail],[MaxFileSizeLink],[TotalXLSCWMRecords],[ShareSavedReport],[ShareSavedSummary],[RemoveZip],[HTMLEmail],[AllowPage5TextSearch],[AdlertRepSec],[RtlFilterLink],[PDTDisplayControl],[AllowSaveCWMOnSite],[HyperlinksInReports],[DTDDataLinks],[DTDNonDataLinks],[FilePrefix],[AllowPageResultsView],[AllowImageOptions],[MaxFilterRecords],[AdvertiserTradeClass],[AllowAdComparisonOption],[AllowAdResult2],[AllowEmailAdLevel],[AllowEmailPDTLevel],[AllowEmailQueryPage],[CWMExcelDownload],[PPTAdLevel],[PPTPDTlevel],[PPTSubscription],[QueryPageExcelDownload],[AllowPPTEmail],[MaximumAllowedXLSSumRecords],[MaxSingleFileXlsRecordsEmail],[MaxSingleFileXlsRecordsDownload],[AllowBatchPrint],[MaximumBatchPrintImages],[TotalBatchPrintImages],[MaximumAllowedBatchPrintImages],[HyperlinksOptionDefault],[AllowPDFReport],[MaximumPDFReportImages],[TotalPDFReportImages],[MaximumAllowedPDFReportImages],[AllowWeightedSummary],[WeightedDisplayName],[AllowEventSummary],[CustomEventSec1Title],[CustomEventSec2Title],[QueryParametersInXLS],[EnableMultipassUpdate],[ADReportsSubscriptions],[AllowAdCalendar],[CustomPeriodCompare],[SubscriptionHeaderMessage],[QueryPageAsASPVersion],[LiveSup],[AllowUserReportTemplates],[AllowSummarySubTotals],[AllowTOUIcon],[AllowDBFIcon],[AllowFAQIcon],[MaxAllowedADRecordsXLS],[TotalADRecordsXLS],[DetailQueryLimit],[AllowTrendTotals],[EnableUniqueProductFeatureCondition],[RequestToContact],[TourVersionID],[TourTypeID],[AllowAdSummaryView],[AllowOneClickSummary],[AllowExportLargeData],[AllowCustomDB],[AllowAdTypePageSummarizeBy],[AllowMultiTimePeriodSummary],[TotalXLSAdPageRecords],[MaximumAllowedAdPageRecords],[PowerOneReport],[AllowPivotSummary],[DefaultQueryPageType],[AllowImgMetaDataDownload],[AllowNewDataCustomPeriod],[AllowCustomReport],[CustomReportTabSeq],[ClientCWMMainDatabase50],[AllowAdPivotSummary],[AllowPivotGraph],[AllowScoreCardChart],[MaximumAllowedXLSCWMSumRecords],[TotalXLSSumCWMRecords],[EnableDBBasedDBR],[DisableBrandAllSelection],[EnableChannelMonitor],[AllowGraphInSub],[AllowProductImageInExcel],[AllowGroupByInExcelReports],[MaxUsers],[SpotfireTabHeader],[AllowFullSizePageImageInSub],[MaxAllowedScorecardChart],[IsNonAlphaId],[AllowReportWizard],[AllowEventOnAQP],[AllowShareScoreCardChart],[AllowFRSpaceReportChart],[ChartColorPalette],[AllowPagePivotSummary],[AllowPageSummaryView],[AllowPageCalendar],[MaximumAllowedXLSPageSumRecords],[TotalXLSSumPageRecords],[AllowSavePageOnSite],[AllowEmailPageLevel],[MaximumAllowedPageRecords],[TotalXLSPageRecords],[AllowPPTPageLevel],[PageExcelDownload],[Allow360View],[Allow360ViewTrend],[AllowLargestImage],[DisableAllFVFunctions],[AllowPDTCalendar],[PriorityAdCheck],[DDLogin],[DDToken],[DDWatchFolder],[DDMerchantList],[AllowDashboardPV],[DashboardPVLabel],[AllowDashboardChartRefresh],[AllowUserRoleChange],[DefaultExpandMoreOption],[DefaultResultPageTab],[DefaultMultiSelectOn],[DDUserName],[AllowPVSearch],[DisplayPdtIDInPPT],[ApplyNewPwdRules],[DisplayCustomFRSpaceControlChart],[POSTitle])
Select [ClientID],[ZipFile],[ControlSubscriptionPage],[MaxAllowedPPT],[TotalNumberPPT],[MaxFullSizeImagesSinglePPT],[MaxIntermediateImagesSinglePPT],[MaxThumbnailsImagesSinglePPT],[MaximumAllowedPDTRecords],[MaximumAllowedCWMRecords],[PPTQueryPage],[PreventCWMQueries],[AllowPPTProductImage],[ClientRecSet],[Subscription],[AllowSummaryView],[PDTExcelDownload],[MaxAllowedSumPDTRecords],[TotalXLSSumPDTRecords],[TotalXLSPDTRecords],[AllowSavePDTOnSite],[AllowProductImageView],[AllowAdvanceQuery],[AllowGuidedTour],[AllowHelp],[ClientCWMMainDatabase],[ExcelColumnHeaderColor],[MaxProductThumbnailImageSinglePPT],[MaxProductImageSinglePPT],[RowColor],[ShareSavedQuery],[allowfreezpan],[allowfilterlink],[MaxFileSizeEmail],[MaxFileSizeLink],[TotalXLSCWMRecords],[ShareSavedReport],[ShareSavedSummary],[RemoveZip],[HTMLEmail],[AllowPage5TextSearch],[AdlertRepSec],[RtlFilterLink],[PDTDisplayControl],[AllowSaveCWMOnSite],[HyperlinksInReports],[DTDDataLinks],[DTDNonDataLinks],[FilePrefix],[AllowPageResultsView],[AllowImageOptions],[MaxFilterRecords],[AdvertiserTradeClass],[AllowAdComparisonOption],[AllowAdResult2],[AllowEmailAdLevel],[AllowEmailPDTLevel],[AllowEmailQueryPage],[CWMExcelDownload],[PPTAdLevel],[PPTPDTlevel],[PPTSubscription],[QueryPageExcelDownload],[AllowPPTEmail],[MaximumAllowedXLSSumRecords],[MaxSingleFileXlsRecordsEmail],[MaxSingleFileXlsRecordsDownload],[AllowBatchPrint],[MaximumBatchPrintImages],[TotalBatchPrintImages],[MaximumAllowedBatchPrintImages],[HyperlinksOptionDefault],[AllowPDFReport],[MaximumPDFReportImages],[TotalPDFReportImages],[MaximumAllowedPDFReportImages],[AllowWeightedSummary],[WeightedDisplayName],[AllowEventSummary],[CustomEventSec1Title],[CustomEventSec2Title],[QueryParametersInXLS],[EnableMultipassUpdate],[ADReportsSubscriptions],[AllowAdCalendar],[CustomPeriodCompare],[SubscriptionHeaderMessage],[QueryPageAsASPVersion],[LiveSup],[AllowUserReportTemplates],[AllowSummarySubTotals],[AllowTOUIcon],[AllowDBFIcon],[AllowFAQIcon],[MaxAllowedADRecordsXLS],[TotalADRecordsXLS],[DetailQueryLimit],[AllowTrendTotals],[EnableUniqueProductFeatureCondition],[RequestToContact],[TourVersionID],[TourTypeID],[AllowAdSummaryView],[AllowOneClickSummary],[AllowExportLargeData],[AllowCustomDB],[AllowAdTypePageSummarizeBy],[AllowMultiTimePeriodSummary],[TotalXLSAdPageRecords],[MaximumAllowedAdPageRecords],[PowerOneReport],[AllowPivotSummary],[DefaultQueryPageType],[AllowImgMetaDataDownload],[AllowNewDataCustomPeriod],[AllowCustomReport],[CustomReportTabSeq],[ClientCWMMainDatabase50],[AllowAdPivotSummary],[AllowPivotGraph],[AllowScoreCardChart],[MaximumAllowedXLSCWMSumRecords],[TotalXLSSumCWMRecords],[EnableDBBasedDBR],[DisableBrandAllSelection],[EnableChannelMonitor],[AllowGraphInSub],[AllowProductImageInExcel],[AllowGroupByInExcelReports],[MaxUsers],[SpotfireTabHeader],[AllowFullSizePageImageInSub],[MaxAllowedScorecardChart],[IsNonAlphaId],[AllowReportWizard],[AllowEventOnAQP],[AllowShareScoreCardChart],[AllowFRSpaceReportChart],[ChartColorPalette],[AllowPagePivotSummary],[AllowPageSummaryView],[AllowPageCalendar],[MaximumAllowedXLSPageSumRecords],[TotalXLSSumPageRecords],[AllowSavePageOnSite],[AllowEmailPageLevel],[MaximumAllowedPageRecords],[TotalXLSPageRecords],[AllowPPTPageLevel],[PageExcelDownload],[Allow360View],[Allow360ViewTrend],[AllowLargestImage],[DisableAllFVFunctions],[AllowPDTCalendar],[PriorityAdCheck],[DDLogin],[DDToken],[DDWatchFolder],[DDMerchantList],[AllowDashboardPV],[DashboardPVLabel],[AllowDashboardChartRefresh],[AllowUserRoleChange],[DefaultExpandMoreOption],[DefaultResultPageTab],[DefaultMultiSelectOn],[DDUserName],[AllowPVSearch],[DisplayPdtIDInPPT],[ApplyNewPwdRules],[DisplayCustomFRSpaceControlChart],[POSTitle] from archivesub.dbo.clientcontrol where clientid=845

Select * from ClientHomePage where clientid=845

--Insert Into ClientHomePage ([ClientID],[ClientLogo],[TourPage],[TermsPage],[HomePageContent],[EnableTermsLink],[EnableGuidedTourLink],[EnableQuickTips],[EnableDatabaseFieldsLink],[EnablePrivacyPolicyLink],[EnableContactUsLink],[TableWidth],[EnableFAQLink],[ClientLineImage],[CustomMessage],[CustomLinkText],[CustomLinkURL],[AllLinkColor],[CustomLinkPlacementID],[EnableMyProfile],[EnableReportingLimit],[ClientBrandingLogo],[MyFVReportContactInfo])
Select [ClientID],[ClientLogo],[TourPage],[TermsPage],[HomePageContent],[EnableTermsLink],[EnableGuidedTourLink],[EnableQuickTips],[EnableDatabaseFieldsLink],[EnablePrivacyPolicyLink],[EnableContactUsLink],[TableWidth],[EnableFAQLink],[ClientLineImage],[CustomMessage],[CustomLinkText],[CustomLinkURL],[AllLinkColor],[CustomLinkPlacementID],[EnableMyProfile],[EnableReportingLimit],[ClientBrandingLogo],[MyFVReportContactInfo] from archivesub.dbo.ClientHomePage where clientid=845

Select * from AllowedDomains where clientid=845

--Insert Into AllowedDomains
Select * from archivesub.dbo.AllowedDomains where clientid=845

Select * from archivesub.dbo.categorycode where clientid=845

Select * from categorycode where clientid=845

--SET IDENTITY_INSERT categorycode ON
--Insert Into categorycode ([ID],[ClientID],[Category],[ClientServer],[IsPDT],[ClientPDT],[IsFSI],[IsAdlert],[IsMaster],[CWMFull],[SourceCWM],[ExceptionCWMFullSourceCode],[IsFull],[FullSourceCode],[PartialSourceCode],[Index_Type],[MasterIndex],[IsConcat],[CatOnly],[BUMfr],[BUPT],[BUPTG],[BUPTSG],[BUDt],[BURn],[BUST],[BUSTG],[BUSTSG],[IsWeekOf],[IsEvent],[IsTheme],[IsPublication],[ProcessOrder],[Run],[ClientRun],[Error],[PartialRunDate],[FullRunDate],[ClientFullRundate],[ClientPartialRundate],[CWMFullRunDate],[CWMPartialRunDate],[ClientCWMFullRunDate],[ClientCWMPartialRunDate],[IsOD],[IsNORUnit],[IsOffer],[BuPC],[mt2aClientServer],[ShowEntryBrand],[ShowEntryTaggedCompany],[ShowAdType],[ShowWeight],[IsDAA],[IsIntegerID],[IsEmail],[BUCh],[IsSSD],[incrAdRun],[IsCT],[FV60],[FVVer],[ClientBuildVer],[customstep],[IsCLD],[FD],[FDTime],[IsShared],[FVCCType],[DBCreatedOn])
--Select Distinct [ID],[ClientID],[Category],[ClientServer],[IsPDT],[ClientPDT],[IsFSI],[IsAdlert],[IsMaster],[CWMFull],[SourceCWM],[ExceptionCWMFullSourceCode],[IsFull],[FullSourceCode],[PartialSourceCode],[Index_Type],[MasterIndex],[IsConcat],[CatOnly],[BUMfr],[BUPT],[BUPTG],[BUPTSG],[BUDt],[BURn],[BUST],[BUSTG],[BUSTSG],[IsWeekOf],[IsEvent],[IsTheme],[IsPublication],[ProcessOrder],[Run],[ClientRun],[Error],[PartialRunDate],[FullRunDate],[ClientFullRundate],[ClientPartialRundate],[CWMFullRunDate],[CWMPartialRunDate],[ClientCWMFullRunDate],[ClientCWMPartialRunDate],[IsOD],[IsNORUnit],[IsOffer],[BuPC],[mt2aClientServer],[ShowEntryBrand],[ShowEntryTaggedCompany],[ShowAdType],[ShowWeight],[IsDAA],[IsIntegerID],[IsEmail],[BUCh],[IsSSD],[incrAdRun],[IsCT],[FV60],[FVVer],[ClientBuildVer],[customstep],[IsCLD],[FD],[FDTime],[IsShared],[FVCCType],[DBCreatedOn] from archivesub.dbo.categorycode where clientid=845 and ID=4617
--SET IDENTITY_INSERT categorycode OFF

--Insert Into TableNames ([MasterTableName],[ClientTableName],[TableID],[CategoryCodeID])
Select Distinct [MasterTableName],[ClientTableName],[TableID],[CategoryCodeID] from archivesub.dbo.tablenames where categorycodeid in (4617) order by tableid

Select * from tablenames where categorycodeid in (4617)

Select * from archivesub.dbo.ClientBrandException where categorycodeid in (4617)

Select * from ClientBrandException where categorycodeid in (4617)

--SET IDENTITY_INSERT MerchandiseCategoryTemplates ON
--Insert Into MerchandiseCategoryTemplates ([MCTemplateID],[TemplateName])
--Select Distinct [MCTemplateID],[TemplateName] from archivesub.dbo.MerchandiseCategoryTemplates where MCTemplateID in (3323)
--SET IDENTITY_INSERT MerchandiseCategoryTemplates OFF

Select * from MerchandiseCategoryTemplates where MCTemplateID in (3323)

--Insert Into MerchandiseCategoryControl ([MCTemplateID],[CategoryCodeID])
Select Distinct [MCTemplateID],[CategoryCodeID] from archivesub.dbo.MerchandiseCategoryControl where categorycodeid in (4617)

Select * from MerchandiseCategoryControl where categorycodeid in (4617)

--Insert Into MerchandiseCategoryTemplatesDetail ([MCTemplateID],[MerchandiseCategory],[MerchandiseSubCat],[Category],[RealCategory],[Set],[Exclude],[startdt],[enddt],[EntryStartDate],[EntryEndDate])
Select Distinct [MCTemplateID],[MerchandiseCategory],[MerchandiseSubCat],[Category],[RealCategory],[Set],[Exclude],[startdt],[enddt],[EntryStartDate],[EntryEndDate] from archivesub.dbo.MerchandiseCategoryTemplatesDetail where MCTemplateID in (3323)

Select * from MerchandiseCategoryTemplatesDetail where MCTemplateID in (3323)

--SET IDENTITY_INSERT QueryViewTemplates ON
--Insert Into QueryViewTemplates ([QueryTemplateID],[TemplateName])
--Select Distinct [QueryTemplateID],[TemplateName] from archivesub.dbo.QueryViewTemplates where QueryTemplateID in (4059)
--SET IDENTITY_INSERT QueryViewTemplates OFF

Select * from QueryViewTemplates where QueryTemplateID in (4059)

--Insert Into QueryViewControl ([ClientID],[CategoryCodeID],[QueryTemplateID])
Select Distinct [ClientID],[CategoryCodeID],[QueryTemplateID] from archivesub.dbo.QueryViewControl where categorycodeid in (4617)

Select * from QueryViewControl where categorycodeid in (4617)

--Insert Into QueryViewTemplatesDetail ([QueryTemplateID],[FieldId],[DisplaySeq],[DisplayName],[SelectionPage],[HelpMeSelect],[SortTableOrder],[SortSeq],[SortType],[NumericTableSeq],[ComparisionSeq],[ConditionSeq],[BasedOnLinkSeq],[ExpressionSeq],[AdvConditionSeq],[AdvQPDisplaySeq],[IsPage])
Select Distinct [QueryTemplateID],[FieldId],[DisplaySeq],[DisplayName],[SelectionPage],[HelpMeSelect],[SortTableOrder],[SortSeq],[SortType],[NumericTableSeq],[ComparisionSeq],[ConditionSeq],[BasedOnLinkSeq],[ExpressionSeq],[AdvConditionSeq],[AdvQPDisplaySeq],[IsPage] from archivesub.dbo.QueryViewTemplatesDetail where QueryTemplateID in (4059)

Select * from QueryViewTemplatesDetail where QueryTemplateID in (4059)

--SET IDENTITY_INSERT ReportFormatTemplates ON
--Insert Into ReportFormatTemplates ([RptTemplateID],[TemplateName])
--Select Distinct [RptTemplateID],[TemplateName] from archivesub.dbo.ReportFormatTemplates where [RptTemplateID] in (7114,7115)
--SET IDENTITY_INSERT ReportFormatTemplates OFF

Select * from ReportFormatTemplates where [RptTemplateID] in (7114,7115)

--Insert Into ReportFormatControl ([ClientID],[CategoryCodeID],[RptTemplateID],[IsPDTTemplate],[AlternateColors],[FreezePane],[FreezePaneFieldID],[FreezeHeader])
Select Distinct [ClientID],[CategoryCodeID],[RptTemplateID],[IsPDTTemplate],[AlternateColors],[FreezePane],[FreezePaneFieldID],[FreezeHeader] from archivesub.dbo.ReportFormatControl where categorycodeid in (4617)

Select * from ReportFormatControl where categorycodeid in (4617)

--Insert Into ReportFormatTemplatesDetail ([RptTemplateID],[FieldID],[DisplaySeq],[DisplayName],[Filter],[Link],[AdsDisplaySeq],[IsPage])
Select Distinct [RptTemplateID],[FieldID],[DisplaySeq],[DisplayName],[Filter],[Link],[AdsDisplaySeq],[IsPage] from archivesub.dbo.ReportFormatTemplatesDetail where [RptTemplateID] in (7114,7115)

Select * from ReportFormatTemplatesDetail where [RptTemplateID] in (7114,7115)

Use Subscription

SET IDENTITY_INSERT ClientDatabases ON
Insert Into ClientDatabases ([ClientID],[YourWeb],[ClientCode],[AllSequence],[AllRow],[AllBold],[AllColor],[AllFont],[AllFontSize],[AllBackGround],[HomePageLink],[CategoryCodeID],[RowId],[Status])
Select Distinct [ClientID],[YourWeb],[ClientCode],[AllSequence],[AllRow],[AllBold],[AllColor],[AllFont],[AllFontSize],[AllBackGround],[HomePageLink],[CategoryCodeID],[RowId],0 as [Status] from archivesub.dbo.ClientDatabases where categorycodeid in (4617)
SET IDENTITY_INSERT ClientDatabases OFF

Select * from ClientDatabases where categorycodeid in (4617)

--Insert Into ClientExceptionalCatCode ([ClientID],[IsSummaryOnly],[IsPageViewEnabled],[AllowProductImageView],[AllowBDMReport],[CategoryCodeId],[AllowFSISummary],[AllowOneClickSummary],[IsWebElementDB],[MCAPFeatures],[DisableBrandAllSelection],[DisableThumbnailAndAdjView],[AllowDefineCustUpdt],[IsNonAlphaId])
Select Distinct [ClientID],[IsSummaryOnly],[IsPageViewEnabled],[AllowProductImageView],[AllowBDMReport],[CategoryCodeId],[AllowFSISummary],[AllowOneClickSummary],[IsWebElementDB],[MCAPFeatures],[DisableBrandAllSelection],[DisableThumbnailAndAdjView],[AllowDefineCustUpdt],[IsNonAlphaId] from archivesub.dbo.ClientExceptionalCatCode where categorycodeid in (4617)

Select * from ClientExceptionalCatCode where categorycodeid in (4617)

--Insert Into CategoryFieldValueGroupForVisualization ([ClientId],[CategoryCodeId],[FieldId],[FieldGroupName],[FieldValueId])
Select Distinct [ClientId],[CategoryCodeId],[FieldId],[FieldGroupName],[FieldValueId] from archivesub.dbo.CategoryFieldValueGroupForVisualization where categorycodeid in (4617)

Select * from CategoryFieldValueGroupForVisualization where categorycodeid in (4617)

--User Restore Start--

Select * from UserProfile where UserRefID in (Select UserRefId from  UserControl where clientid=845)

--SET IDENTITY_INSERT UserProfile ON
--Insert Into UserProfile ([UserRefID],[UserName],[Type],[FirstName],[LastName],[DefaultEmailAddress],[UserFax],[UserPhone],[Vendor],[SiteAccess],[ProcessingPriority],[LastAccessed],[IsPopupBlocked],[Terms],[Trusted],[Title],[DateCreated],[DateSigned],[TipList],[Office],[Department],[Region],[Division],[LastTraining],[GUID],[LinkID],[Comments],[FRAccess],[LastUpdatedOn],[LastUpdatedBy],[SiteAccessStart],[FRAccessStart],[TitleGroups],[SystemComments],[IsImageOnlyUser],[FVMonitorUser],[RoleID],[FV40],[TermsAccepted],[DDLogin],[DDToken],[DDPassword],[DDCanLogin],[CanadaFRAccess],[LastPwdChanged],[Password],[Salt],[EncryptionType],[ACUserId],[UsageType])
--Select [UserRefID],[UserName],[Type],[FirstName],[LastName],[DefaultEmailAddress],[UserFax],[UserPhone],[Vendor],[SiteAccess],[ProcessingPriority],[LastAccessed],[IsPopupBlocked],[Terms],[Trusted],[Title],[DateCreated],[DateSigned],[TipList],[Office],[Department],[Region],[Division],[LastTraining],[GUID],[LinkID],[Comments],[FRAccess],[LastUpdatedOn],[LastUpdatedBy],[SiteAccessStart],[FRAccessStart],[TitleGroups],[SystemComments],[IsImageOnlyUser],[FVMonitorUser],[RoleID],[FV40],[TermsAccepted],[DDLogin],[DDToken],[DDPassword],[DDCanLogin],[CanadaFRAccess],[LastPwdChanged],[Password],[Salt],[EncryptionType],[ACUserId],[UsageType] from archivesub.dbo.UserProfile where UserRefID in (Select UserRefId from archivesub.dbo.UserControl where clientid=845)
--SET IDENTITY_INSERT UserProfile OFF

Select * from UserControl where clientid=845

--Insert Into UserControl ([UserID],[UserRefID],[ClientID],[DefaultAsp],[Subscription],[PDTExcelDownload],[ZipFile],[ControlSubscriptionPage],[MaxAllowedPPT],[TotalNumberPPT],[MaxFullSizeImagesSinglePPT],[MaxIntermediateImagesSinglePPT],[MaxThumbnailsImagesSinglePPT],[MaximumAllowedPDTRecords],[MaximumAllowedCWMRecords],[PPTQueryPage],[PreventCWMQueries],[AllowPPTProductImage],[ClientRecSet],[AllowSummaryView],[MaxAllowedSumPDTRecords],[TotalXLSSumPDTRecords],[TotalXLSPDTRecords],[AllowSavePDTOnSite],[AllowProductImageView],[AllowAdvanceQuery],[AllowGuidedTour],[AllowHelp],[MaxProductThumbnailImageSinglePPT],[MaxProductImageSinglePPT],[MaxFileSizeEmail],[MaxFileSizeLink],[EnableSaveDialogue],[ShareSavedQuery],[allowfreezpan],[allowfilterlink],[TotalXLSCWMRecords],[ShareSavedReport],[ShareSavedSummary],[RemoveZip],[useropt_freezheader],[useropt_freezpan],[useropt_freezpanfield],[useropt_showfilterarrow],[useropt_showfilterlink],[useropt_alternetcolor],[AllowPage5TextSearch],[RtlFilterLink],[PDTDisplayControl],[AllowSaveCWMOnSite],[HyperlinksInReports],[DTDDataLinks],[DTDNonDataLinks],[AllowPageResultsView],[AllowImageOptions],[AllowAdComparisonOption],[AllowAdResult2],[AllowEmailAdLevel],[AllowEmailPDTLevel],[AllowEmailQueryPage],[CWMExcelDownload],[PPTAdLevel],[PPTPDTlevel],[PPTSubscription],[QueryPageExcelDownload],[AllowPPTEmail],[MaximumAllowedXLSSumRecords],[MaxSingleFileXlsRecordsEmail],[MaxSingleFileXlsRecordsDownload],[AllowBatchPrint],[MaximumBatchPrintImages],[TotalBatchPrintImages],[MaximumAllowedBatchPrintImages],[HyperlinksOptionDefault],[AllowPDFReport],[MaximumPDFReportImages],[TotalPDFReportImages],[MaximumAllowedPDFReportImages],[AllowWeightedSummary],[WeightedDisplayName],[AllowEventSummary],[CustomEventSec1Title],[CustomEventSec2Title],[AllowPPTProductImageInfo],[QueryParametersInXLS],[EnableMultipassUpdate],[ADReportsSubscriptions],[AllowAdCalendar],[CustomPeriodCompare],[SubscriptionHeaderMessage],[QueryPageAsASPVersion],[LiveSup],[ProfileCheck],[AllowUserReportTemplates],[AllowSummarySubTotals],[AllowTOUIcon],[AllowDBFIcon],[AllowFAQIcon],[MaxAllowedADRecordsXLS],[TotalADRecordsXLS],[DetailQueryLimit],[AllowTrendTotals],[EnableUniqueProductFeatureCondition],[AllowAdSummaryView],[AllowErrorReport],[AllowExpressionBuilder],[AllowOneClickSummary],[AllowNumericDataPointSummary],[AllowExportLargeData],[AllowCustomDB],[AllowAdTypePageSummarizeBy],[AllowMultiTimePeriodSummary],[TotalXLSAdPageRecords],[MaximumAllowedAdPageRecords],[PowerOneReport],[AllowPivotSummary],[DefaultQueryPageType],[AllowImgMetaDataDownload],[AllowNewDataCustomPeriod],[AllowAdPivotSummary],[AllowPivotGraph],[AllowScoreCardChart],[MaximumAllowedXLSCWMSumRecords],[TotalXLSSumCWMRecords],[EnableDBBasedDBR],[EnableChannelMonitor],[AllowGraphInSub],[AllowProductImageInExcel],[AllowGroupByInExcelReports],[AllowFullSizePageImageInSub],[MaxAllowedScorecardChart],[AllowDefineCustUpdt],[AllowReportWizard],[AllowEventOnAQP],[AllowShareScoreCardChart],[AllowFRSpaceReportChart],[AllowPagePivotSummary],[AllowPageSummaryView],[AllowPageCalendar],[MaximumAllowedXLSPageSumRecords],[TotalXLSSumPageRecords],[AllowSavePageOnSite],[AllowEmailPageLevel],[MaximumAllowedPageRecords],[TotalXLSPageRecords],[AllowPPTPageLevel],[PageExcelDownload],[Allow360View],[Allow360ViewTrend],[AllowLargestImage],[AllowPDTCalendar],[PriorityAdCheck],[AllowDashboardChartRefresh],[AllowUserRoleChange],[DefaultExpandMoreOption],[DefaultResultPageTab],[DefaultMultiSelectOn],[AllowDashboardPV],[AllowPVSearch],[DisplayPdtIDInPPT],[POSTitle])
Select [UserID],[UserRefID],[ClientID],[DefaultAsp],[Subscription],[PDTExcelDownload],[ZipFile],[ControlSubscriptionPage],[MaxAllowedPPT],[TotalNumberPPT],[MaxFullSizeImagesSinglePPT],[MaxIntermediateImagesSinglePPT],[MaxThumbnailsImagesSinglePPT],[MaximumAllowedPDTRecords],[MaximumAllowedCWMRecords],[PPTQueryPage],[PreventCWMQueries],[AllowPPTProductImage],[ClientRecSet],[AllowSummaryView],[MaxAllowedSumPDTRecords],[TotalXLSSumPDTRecords],[TotalXLSPDTRecords],[AllowSavePDTOnSite],[AllowProductImageView],[AllowAdvanceQuery],[AllowGuidedTour],[AllowHelp],[MaxProductThumbnailImageSinglePPT],[MaxProductImageSinglePPT],[MaxFileSizeEmail],[MaxFileSizeLink],[EnableSaveDialogue],[ShareSavedQuery],[allowfreezpan],[allowfilterlink],[TotalXLSCWMRecords],[ShareSavedReport],[ShareSavedSummary],[RemoveZip],[useropt_freezheader],[useropt_freezpan],[useropt_freezpanfield],[useropt_showfilterarrow],[useropt_showfilterlink],[useropt_alternetcolor],[AllowPage5TextSearch],[RtlFilterLink],[PDTDisplayControl],[AllowSaveCWMOnSite],[HyperlinksInReports],[DTDDataLinks],[DTDNonDataLinks],[AllowPageResultsView],[AllowImageOptions],[AllowAdComparisonOption],[AllowAdResult2],[AllowEmailAdLevel],[AllowEmailPDTLevel],[AllowEmailQueryPage],[CWMExcelDownload],[PPTAdLevel],[PPTPDTlevel],[PPTSubscription],[QueryPageExcelDownload],[AllowPPTEmail],[MaximumAllowedXLSSumRecords],[MaxSingleFileXlsRecordsEmail],[MaxSingleFileXlsRecordsDownload],[AllowBatchPrint],[MaximumBatchPrintImages],[TotalBatchPrintImages],[MaximumAllowedBatchPrintImages],[HyperlinksOptionDefault],[AllowPDFReport],[MaximumPDFReportImages],[TotalPDFReportImages],[MaximumAllowedPDFReportImages],[AllowWeightedSummary],[WeightedDisplayName],[AllowEventSummary],[CustomEventSec1Title],[CustomEventSec2Title],[AllowPPTProductImageInfo],[QueryParametersInXLS],[EnableMultipassUpdate],[ADReportsSubscriptions],[AllowAdCalendar],[CustomPeriodCompare],[SubscriptionHeaderMessage],[QueryPageAsASPVersion],[LiveSup],[ProfileCheck],[AllowUserReportTemplates],[AllowSummarySubTotals],[AllowTOUIcon],[AllowDBFIcon],[AllowFAQIcon],[MaxAllowedADRecordsXLS],[TotalADRecordsXLS],[DetailQueryLimit],[AllowTrendTotals],[EnableUniqueProductFeatureCondition],[AllowAdSummaryView],[AllowErrorReport],[AllowExpressionBuilder],[AllowOneClickSummary],[AllowNumericDataPointSummary],[AllowExportLargeData],[AllowCustomDB],[AllowAdTypePageSummarizeBy],[AllowMultiTimePeriodSummary],[TotalXLSAdPageRecords],[MaximumAllowedAdPageRecords],[PowerOneReport],[AllowPivotSummary],[DefaultQueryPageType],[AllowImgMetaDataDownload],[AllowNewDataCustomPeriod],[AllowAdPivotSummary],[AllowPivotGraph],[AllowScoreCardChart],[MaximumAllowedXLSCWMSumRecords],[TotalXLSSumCWMRecords],[EnableDBBasedDBR],[EnableChannelMonitor],[AllowGraphInSub],[AllowProductImageInExcel],[AllowGroupByInExcelReports],[AllowFullSizePageImageInSub],[MaxAllowedScorecardChart],[AllowDefineCustUpdt],[AllowReportWizard],[AllowEventOnAQP],[AllowShareScoreCardChart],[AllowFRSpaceReportChart],[AllowPagePivotSummary],[AllowPageSummaryView],[AllowPageCalendar],[MaximumAllowedXLSPageSumRecords],[TotalXLSSumPageRecords],[AllowSavePageOnSite],[AllowEmailPageLevel],[MaximumAllowedPageRecords],[TotalXLSPageRecords],[AllowPPTPageLevel],[PageExcelDownload],[Allow360View],[Allow360ViewTrend],[AllowLargestImage],[AllowPDTCalendar],[PriorityAdCheck],[AllowDashboardChartRefresh],[AllowUserRoleChange],[DefaultExpandMoreOption],[DefaultResultPageTab],[DefaultMultiSelectOn],[AllowDashboardPV],[AllowPVSearch],[DisplayPdtIDInPPT],[POSTitle] from archivesub.dbo.UserControl where clientid=845 

Select * from FRUserControl where ClientID=845

--Insert Into FRUserControl ([ClientID],[UserID],[UserRefID])
Select [ClientID],[UserID],[UserRefID] from archivesub.dbo.FRUserControl where ClientID=845 

Select * from vwUser where clientid=845 and [type]=2 and defaultemailaddress in (Select DefaultEmailAddress from MKTUsers) and SiteAccess=2

--Update vwUser Set SiteAccess=1 where clientid=845 and [type]=2 and defaultemailaddress in (Select DefaultEmailAddress from MKTUsers) and SiteAccess=2

Select * from vwUser where clientid=845 and [type]=1 and SiteAccess=2 and DefaultEmailAddress in ('astarr@totalwine.com','rxu@totalwine.com','erosenfeld@totalwine.com','twmbeerteam@totalwine.com','jbennett@totalwine.com','edusen@totalwine.com','dsilversmith@totalwine.com','gmaniar@totalwine.com','jdefuria@totalwine.com','jodonovan@totalwine.com','spiritsbuyingteam@totalwine.com','dzacharkiw@totalwine.com','lbaran@totalwine.com','oogunkoya@totalwine.com','ehaffey@totalwine.com','jbarthuly@totalwine.com','Esiegel@totalwine.com','ttrone@totalwine.com','ggiammittorio@totalwine.com','mewilliams@totalwine.com','dlavnik@totalwine.com','aweber@totalwine.com','gdovolos@totalwine.com','jrubin@totalwine.com','kknight@totalwine.com','marks@totalwine.com','tsmith@totalwine.com','rtvede@totalwine.com','teamwine@totalwine.com','CWilliamson@totalwine.com')
order by DefaultEmailAddress

--Update vwUser Set SiteAccess=1 where clientid=845 and [type]=1 and SiteAccess=2 and DefaultEmailAddress in ('astarr@totalwine.com','rxu@totalwine.com','erosenfeld@totalwine.com','twmbeerteam@totalwine.com','jbennett@totalwine.com','edusen@totalwine.com','dsilversmith@totalwine.com','gmaniar@totalwine.com','jdefuria@totalwine.com','jodonovan@totalwine.com','spiritsbuyingteam@totalwine.com','dzacharkiw@totalwine.com','lbaran@totalwine.com','oogunkoya@totalwine.com','ehaffey@totalwine.com','jbarthuly@totalwine.com','Esiegel@totalwine.com','ttrone@totalwine.com','ggiammittorio@totalwine.com','mewilliams@totalwine.com','dlavnik@totalwine.com','aweber@totalwine.com','gdovolos@totalwine.com','jrubin@totalwine.com','kknight@totalwine.com','marks@totalwine.com','tsmith@totalwine.com','rtvede@totalwine.com','teamwine@totalwine.com','CWilliamson@totalwine.com')


Select * from vwUser where clientid=845 and [type]=1 and SiteAccess=2 and DefaultEmailAddress in ('jbram@totalwine.com') and userid=2413124


--Update vwUser Set SiteAccess=1 where clientid=845 and [type]=1 and SiteAccess=2 and DefaultEmailAddress in ('jbram@totalwine.com') and userid=2413124



--User Restore End--

SET IDENTITY_INSERT SavedQueries ON
Insert Into SavedQueries ([QueryID],[QueryName],[LastUpdated],[RightHeader],[CenterHeader],[LeftHeader],[RightFooter],[CenterFooter],[LeftFooter],[TabName],[CWMOnly],[SavedQueryType],[NumberQueryPasses],[LastExecuted],[SavedBy],[DisplayOption],[TemplateID],[DdrQuery],[CategoryCodeId],[UserID],[IsPageQuery],[AdvanceQuery],[NewDataCustomPeriod],[NewDataCustomPeriodUnit])
Select Distinct [QueryID],[QueryName],[LastUpdated],[RightHeader],[CenterHeader],[LeftHeader],[RightFooter],[CenterFooter],[LeftFooter],[TabName],[CWMOnly],[SavedQueryType],[NumberQueryPasses],[LastExecuted],[SavedBy],[DisplayOption],[TemplateID],[DdrQuery],[CategoryCodeId],[UserID],[IsPageQuery],[AdvanceQuery],[NewDataCustomPeriod],[NewDataCustomPeriodUnit] from archivesub.dbo.SavedQueries where categorycodeid in (4617)
SET IDENTITY_INSERT SavedQueries OFF

Select * from SavedQueries where categorycodeid in (4617)

--Insert Into SavedQueriesDetail ([QueryID],[SessionIDName],[SessionIDValue],[SequenceNo])
Select Distinct [QueryID],[SessionIDName],[SessionIDValue],[SequenceNo] from archivesub.dbo.SavedQueriesDetail where QueryID in (Select QueryID from archivesub.dbo.SavedQueries where categorycodeid in (4617))

Select * from SavedQueriesDetail where QueryID in (Select QueryID from SavedQueries where categorycodeid in (4617))

--SET IDENTITY_INSERT Subscription ON
--Insert Into Subscription ([SubscriptionID],[SubscriptionName],[DateTimeSaved],[DataType],[SingleSavedQuery],[DateTimeExecuted],[CategoryCodeId],[UserID],[IsPageQuery])
--Select Distinct [SubscriptionID],[SubscriptionName],[DateTimeSaved],[DataType],[SingleSavedQuery],[DateTimeExecuted],[CategoryCodeId],[UserID],[IsPageQuery] from archivesub.dbo.subscription where categorycodeid in (4617)
--SET IDENTITY_INSERT Subscription OFF

Select CategoryCodeID,* from Subscription where categorycodeid in (4617)

--Insert Into SubscriptionSavedQuery ([SubscriptionID],[SQID])
Select Distinct [SubscriptionID],[SQID] from archivesub.dbo.SubscriptionSavedQuery where SubscriptionId in (Select SubscriptionID from archivesub.dbo.Subscription where categorycodeid in (4617))

Select * from SubscriptionSavedQuery where SubscriptionId in (Select SubscriptionID from Subscription where categorycodeid in (4617))

--Insert Into SubscriptionEmail ([SubscriptionID],[EmailAddresses])
Select Distinct [SubscriptionID],[EmailAddresses] from archivesub.dbo.SubscriptionEmail where SubscriptionId in (Select SubscriptionID from archivesub.dbo.Subscription where categorycodeid in (4617))

Select * from SubscriptionEmail where SubscriptionId in (Select SubscriptionID from Subscription where categorycodeid in (4617))

--Insert Into SubscriptionEmailGroups ([SubscriptionID],[EmailGroupName],[EmailAddresses])
Select Distinct [SubscriptionID],[EmailGroupName],[EmailAddresses] from archivesub.dbo.SubscriptionEmailGroups where SubscriptionId in (Select SubscriptionID from archivesub.dbo.Subscription where categorycodeid in (4617))

Select * from SubscriptionEmailGroups where SubscriptionId in (Select SubscriptionID from Subscription where categorycodeid in (4617))

--Insert Into SubscriptionFormatting ([SubscriptionID],[FormattingOption#],[TabFileName],[EmailSubject],[EmailBody],[ShowRecipients],[ExcelTemplate],[Macro],[SendReportsAll],[SendReportsUser],[RightHeader],[CenterHeader],[LeftHeader],[RightFooter],[CenterFooter],[LeftFooter],[TabName],[ZipFile],[SaveClientRecSet],[PDTFilterLinks],[SummaryDrillLinks],[sendExcelLink],[sendPPTLink],[SendProductImage],[PageTemplate],[ProductImageTempalte],[DeleteDuplicate],[HyperlinksInReports],[SendAdListExcel],[AdPPTTemplate],[EventId],[SummaryDtdRecordSet],[QueryParametersInXLS],[PDFReport],[IncludeProductImage],[GroupDetailReportBy],[IncludeGraph],[IncludeFullSizePageImage],[CalendarBy],[CalendarBasedOn],[IncludePageCounts],[ProductInfo],[IncludeProductPageImage])
Select Distinct [SubscriptionID],[FormattingOption#],[TabFileName],[EmailSubject],[EmailBody],[ShowRecipients],[ExcelTemplate],[Macro],[SendReportsAll],[SendReportsUser],[RightHeader],[CenterHeader],[LeftHeader],[RightFooter],[CenterFooter],[LeftFooter],[TabName],[ZipFile],[SaveClientRecSet],[PDTFilterLinks],[SummaryDrillLinks],[sendExcelLink],[sendPPTLink],[SendProductImage],[PageTemplate],[ProductImageTempalte],[DeleteDuplicate],[HyperlinksInReports],[SendAdListExcel],[AdPPTTemplate],[EventId],[SummaryDtdRecordSet],[QueryParametersInXLS],[PDFReport],[IncludeProductImage],[GroupDetailReportBy],[IncludeGraph],[IncludeFullSizePageImage],[CalendarBy],[CalendarBasedOn],[IncludePageCounts],[ProductInfo],[IncludeProductPageImage] from archivesub.dbo.SubscriptionFormatting where SubscriptionId in (Select SubscriptionID from archivesub.dbo.Subscription where categorycodeid in (4617))

Select * from SubscriptionFormatting where SubscriptionId in (Select SubscriptionID from Subscription where categorycodeid in (4617))

--Insert Into SubscriptionSchedule ([SubscriptionID],[StartDate],[EndDate],[Interval],[TimePeriod])
Select Distinct [SubscriptionID],[StartDate],[EndDate],[Interval],[TimePeriod] from archivesub.dbo.SubscriptionSchedule where SubscriptionId in (Select SubscriptionID from archivesub.dbo.Subscription where categorycodeid in (4617))

Select * from SubscriptionSchedule where SubscriptionId in (Select SubscriptionID from Subscription where categorycodeid in (4617))

--Insert Into SubscriptionSummaryTemplate ([subscriptionid],[TemplateID],[ReportLevel])
Select Distinct [subscriptionid],[TemplateID],[ReportLevel] from archivesub.dbo.SubscriptionSummaryTemplate where SubscriptionId in (Select SubscriptionID from archivesub.dbo.Subscription where categorycodeid in (4617))

Select * from SubscriptionSummaryTemplate where SubscriptionId in (Select SubscriptionID from Subscription where categorycodeid in (4617))

--SET IDENTITY_INSERT UserSavedSummaryFormats ON
--Insert Into UserSavedSummaryFormats ([TemplateID],[Type],[ReportTemplateName],[SummaryTableFormatId],[SummaryDisplayOption],[ShowLinksOn],[TopX],[DisplayOnQuery],[RightHeader],[CenterHeader],[LeftHeader],[RightFooter],[CenterFooter],[LeftFooter],[TabName],[DisplayOnQuery1],[displayon],[IsWeighted],[EventFormatTypeId],[CategoryCodeId],[UserID],[AllSummarySubTotals],[CreatedDate],[IncludeDependentCols],[IsStandard],[TemplateSel],[TemplateText],[TemplateType],[isPreDefined])
--Select Distinct [TemplateID],[Type],[ReportTemplateName],[SummaryTableFormatId],[SummaryDisplayOption],[ShowLinksOn],[TopX],[DisplayOnQuery],[RightHeader],[CenterHeader],[LeftHeader],[RightFooter],[CenterFooter],[LeftFooter],[TabName],[DisplayOnQuery1],[displayon],[IsWeighted],[EventFormatTypeId],[CategoryCodeId],[UserID],[AllSummarySubTotals],[CreatedDate],[IncludeDependentCols],[IsStandard],[TemplateSel],[TemplateText],[TemplateType],[isPreDefined] from archivesub.dbo.UserSavedSummaryFormats where categorycodeid in (4617)
--SET IDENTITY_INSERT UserSavedSummaryFormats OFF

Select * from UserSavedSummaryFormats where categorycodeid in (4617)

--Insert Into UserSavedSummaryFormatDetails ([TemplateID],[ParamName],[ParamValue])
Select Distinct [TemplateID],[ParamName],[ParamValue] from archivesub.dbo.UserSavedSummaryFormatDetails where TemplateID in (Select TemplateID from archivesub.dbo.UserSavedSummaryFormats where categorycodeid in (4617))

Select * from UserSavedSummaryFormatDetails where TemplateID in (Select TemplateID from UserSavedSummaryFormats where categorycodeid in (4617))

--SET IDENTITY_INSERT UserSavedEventFormats ON
--Insert Into UserSavedEventFormats ([EventFormatId],[EventName],[Type],[CreatedDate],[EventCombination],[EventExistingWithin],[CategoryCodeId],[UserID],[IsStandard])
--Select Distinct [EventFormatId],[EventName],[Type],[CreatedDate],[EventCombination],[EventExistingWithin],[CategoryCodeId],[UserID],[IsStandard] from archivesub.dbo.UserSavedEventFormats where categorycodeid in (4617)
--SET IDENTITY_INSERT UserSavedEventFormats OFF

Select * from UserSavedEventFormats where categorycodeid in (4617)

--SET IDENTITY_INSERT UserSavedTemplate ON
--Insert Into UserSavedTemplate ([TemplateId],[ClientId],[TemplateName],[TemplateType],[ShareFlag],[DisplayFlag],[CategoryCodeId],[UserID],[CreatedDate])
--Select Distinct [TemplateId],[ClientId],[TemplateName],[TemplateType],[ShareFlag],[DisplayFlag],[CategoryCodeId],[UserID],[CreatedDate] from archivesub.dbo.UserSavedTemplate where categorycodeid in (4617)
--SET IDENTITY_INSERT UserSavedTemplate OFF

Select * from UserSavedTemplate where categorycodeid in (4617)

--Insert Into UserSavedTemplateDetail ([TemplateId],[FieldName],[FieldValue])
Select Distinct [TemplateId],[FieldName],[FieldValue] from archivesub.dbo.UserSavedTemplateDetail where TemplateId in (Select TemplateId from archivesub.dbo.UserSavedTemplate where categorycodeid in (4617))

Select * from UserSavedTemplateDetail where TemplateId in (Select TemplateId from UserSavedTemplate where categorycodeid in (4617))



--SET IDENTITY_INSERT mastercustomdataupdategroup ON
--Insert Into mastercustomdataupdategroup ([CustomDataUpdateGroupId],[FieldId],[DisplaySeq],[ClientId],[CategoryCodeId],[CreateDt],[IsFull],[HasExpansion],[IsDependentField],[LastExecutedOn],[RebuildIndex],[UnassignedRecText])
--Select [CustomDataUpdateGroupId],[FieldId],[DisplaySeq],[ClientId],[CategoryCodeId],[CreateDt],[IsFull],[HasExpansion],[IsDependentField],[LastExecutedOn],[RebuildIndex],[UnassignedRecText] from archivesub.dbo.mastercustomdataupdategroup where categorycodeid in (4617)
--SET IDENTITY_INSERT mastercustomdataupdategroup OFF

Select * from mastercustomdataupdategroup where categorycodeid in (4617)

--SET IDENTITY_INSERT SavedCustomDataUpdates ON
--Insert Into SavedCustomDataUpdates ([CustomDataUpdateId],[UpdateValue],[SequenceNo],[ActiveFlag],[ClientId],[CategoryCodeId],[UserId],[CreateDt],[CustomDataUpdateGroupId],[ControlValueFlag])
--Select [CustomDataUpdateId],[UpdateValue],[SequenceNo],[ActiveFlag],[ClientId],[CategoryCodeId],[UserId],[CreateDt],[CustomDataUpdateGroupId],[ControlValueFlag] from mt2stg0.subscriptionmerged.dbo.SavedCustomDataUpdates where CustomDataUpdateGroupId in (1378,1383)
--SET IDENTITY_INSERT SavedCustomDataUpdates OFF

Select * from SavedCustomDataUpdates where CustomDataUpdateGroupId in (1378,1383)

--Insert Into SavedCustomDataUpdatesDetail ([CustomDataUpdateId],[SessionIdName],[SessionIdValue])
Select [CustomDataUpdateId],[SessionIdName],[SessionIdValue] from mt2stg0.subscriptionmerged.dbo.SavedCustomDataUpdatesDetail  where CustomDataUpdateId in (20142,20143,20144,20145,20146,20147,20153,20154,20155,20156,20157,20158,20159,20160,20161,20162,20163,20164,20165,20167,20168,20169,20170,20171,20172,20173,20175,20176,20177,20178,20179,20180,20181,20182,20183,20184,20185,20186,20197,20198,20199,20200,20201,20202,20203,20204,20205,20206,20207,20208,20209,20210,20211,20213,20214,20215,20216,20217,20218,20219,20220,20221,20222,20223,20224,20225,20226,20227,20229,20230,20231,20232,20233,20234,20235,20236,20237,20238,20239,20240,20241,20242,20243,20244,20245,20246,20247,20249,20250,20251,20252,20253,20254,20255,20256,20257,20258,20259,20260,20261,20262,20264,20265,20266,20267,20268,20269,20270,20271,20272,20273,20274,20275,20276,20277,20278,20279,20280,20281,20282,20283,20284,20285,20286,20287,20288,20289,20290,20291,20292,20293,20294,20295,20296,20297,20298,20299,20300,20301,20302,20303,20304,20305,20306,20307,20308,20309,20310,20311,20312,20313,20368,20369,20370,20371,20372,20374,20375,20382,20383,20384,20385,20386,20391,20392,20393,20394,20396,20424,20425,20426,20427,20428,20429,20430,20431,20432,20433,20434,20435,20436,20437,20438,20439,20440,20441,20442,20443,20444,20445,20446,20447,20448,20449,20450,20451,20452,20453,20454,20455,20456,20457,20458,20459,20460,20461,20462,20463,20464,20465,20466,20467,20468,20469,20470,20471,20472,20473,20474,20475,20476,20477,20478,20479,20480,20481,20482,20483,20484,20485,20486,20487,20488,20489,20490,20491,20492,20493,20494,20495,20496,20497,20498,20499,20500,20501,20502,20503,20504,20505,20506,20507,20508,20510,20520,20521)

Select * from SavedCustomDataUpdatesDetail where CustomDataUpdateId in (20142,20143,20144,20145,20146,20147,20153,20154,20155,20156,20157,20158,20159,20160,20161,20162,20163,20164,20165,20167,20168,20169,20170,20171,20172,20173,20175,20176,20177,20178,20179,20180,20181,20182,20183,20184,20185,20186,20197,20198,20199,20200,20201,20202,20203,20204,20205,20206,20207,20208,20209,20210,20211,20213,20214,20215,20216,20217,20218,20219,20220,20221,20222,20223,20224,20225,20226,20227,20229,20230,20231,20232,20233,20234,20235,20236,20237,20238,20239,20240,20241,20242,20243,20244,20245,20246,20247,20249,20250,20251,20252,20253,20254,20255,20256,20257,20258,20259,20260,20261,20262,20264,20265,20266,20267,20268,20269,20270,20271,20272,20273,20274,20275,20276,20277,20278,20279,20280,20281,20282,20283,20284,20285,20286,20287,20288,20289,20290,20291,20292,20293,20294,20295,20296,20297,20298,20299,20300,20301,20302,20303,20304,20305,20306,20307,20308,20309,20310,20311,20312,20313,20368,20369,20370,20371,20372,20374,20375,20382,20383,20384,20385,20386,20391,20392,20393,20394,20396,20424,20425,20426,20427,20428,20429,20430,20431,20432,20433,20434,20435,20436,20437,20438,20439,20440,20441,20442,20443,20444,20445,20446,20447,20448,20449,20450,20451,20452,20453,20454,20455,20456,20457,20458,20459,20460,20461,20462,20463,20464,20465,20466,20467,20468,20469,20470,20471,20472,20473,20474,20475,20476,20477,20478,20479,20480,20481,20482,20483,20484,20485,20486,20487,20488,20489,20490,20491,20492,20493,20494,20495,20496,20497,20498,20499,20500,20501,20502,20503,20504,20505,20506,20507,20508,20510,20520,20521)

Use Connection



Select * from CategoryAppParameters where categorycodeid in (4617) and ParamName='DataDatabase'

Select * from sitecontrol.dbo.cubecategory where categorycodeid in (4617)

--Update sitecontrol.dbo.cubecategory set EndDt=null where categorycodeid in (4617)

--Update sitecontrol.dbo.categorycode Set IsPDT=1,ClientPDT=1,IsFull=1,CWMFull=1,ClientRun=1 where category='fhpca'

--to be done once code processsed

--Insert Into PendingSubscriptions ([SubscriptionID],[DeliveryDate],[OnHold])
Select Distinct [SubscriptionID],[DeliveryDate],[OnHold] from archivesub.dbo.PendingSubscriptions where SubscriptionId in (Select SubscriptionID from archivesub.dbo.Subscription where categorycodeid in (4617)) 
and DeliveryDate >= getdate()-1
order by DeliveryDate 

Select * from Subscription.dbo.PendingSubscriptions where SubscriptionId in (Select SubscriptionID from Subscription.dbo.Subscription where categorycodeid in (4617))

--to be done once code processsed

--Insert Into CategoryDefaultQuery ([ClientId],[CategoryCodeId],[QueryId])
Select Distinct [ClientId],[CategoryCodeId],[QueryId] from archivesub.dbo.CategoryDefaultQuery where categorycodeid in (4617)

Select * from Subscription.dbo.CategoryDefaultQuery where categorycodeid in (4617)

SET IDENTITY_INSERT DashboardReport ON
Insert Into DashboardReport ([ReportId],[ClientId],[RoleId],[Seq],[Title],[CategoryCodeId],[QueryId],[ReportType],[SummaryTemplateId],[ConfigurableFields],[UpdateDtTm],[IsProcessing],[DateRefreshDtTm],[HTMLReportPath],[ExcelReportPath],[QueryResultCount],[SummaryResultCount])
Select Distinct [ReportId],[ClientId],[RoleId],[Seq],[Title],[CategoryCodeId],[QueryId],[ReportType],[SummaryTemplateId],[ConfigurableFields],[UpdateDtTm],[IsProcessing],[DateRefreshDtTm],[HTMLReportPath],[ExcelReportPath],[QueryResultCount],[SummaryResultCount] from archivesub.dbo.DashboardReport where categorycodeid in (4617)
SET IDENTITY_INSERT DashboardReport OFF

Select * from Subscription.dbo.DashboardReport where categorycodeid in (4617)

--SET IDENTITY_INSERT DashboardChart ON
--Insert Into DashboardChart ([ChartId],[ClientId],[Title],[Section],[Seq],[CategoryCodeId],[QueryId],[SummaryTemplateId],[ChartType],[UpdateDtTm],[IsProcessing],[DateRefreshDtTm],[ChartDataFilePath],[RoleId],[ExcelReportPath],[QueryResultCount],[SummaryResultCount])
--Select Distinct [ChartId],[ClientId],[Title],[Section],[Seq],[CategoryCodeId],[QueryId],[SummaryTemplateId],[ChartType],[UpdateDtTm],[IsProcessing],[DateRefreshDtTm],[ChartDataFilePath],[RoleId],[ExcelReportPath],[QueryResultCount],[SummaryResultCount] from archivesub.dbo.DashboardChart where categorycodeid in (4617)
--SET IDENTITY_INSERT DashboardChart OFF

Select * from Subscription.dbo.DashboardChart where categorycodeid in (4617)


Select * from FlashReport.dbo.clientdeliverables where clientid=91 order by Seq


Select * from SiteControl.dbo.ClientDeliverables_Dreyers where categorycodeid in (4617)


--Insert Into MasterClientCWM
Select * from MT2SQL14.archivesub.dbo.MasterClientCWM where categorycodeid in (4617)

Select * from MT2SQL00.MasterClientCoverage.dbo.MasterClientCWM where categorycodeid in (4617)


Select * from MT2SQL00.MasterClientCoverage.dbo.MasterClientCWMPEP where categorycodeid in (4617)


--Insert Into ClientCWMChanges
Select * from MT2SQL14.archivesub.dbo.ClientCWMChanges where categorycodeid in (4617)

Select * from MT2SQL00.MasterClientCoverage.dbo.ClientCWMChanges where categorycodeid in (4617)


--Insert Into ClientCWMChanges
Select * from MT2SQL14.archivesub.dbo.ClientCWMException where categorycodeid in (4617)

Select * from MT2SQL00.MasterClientCoverage.dbo.ClientCWMException where categorycodeid in (4617)

--Record Set
Select isEmail,isTheme,isEvent,* from  MT2SQL14.sitecontrol.dbo.categorycode where ID = 4617

--Update MT2SQL14.sitecontrol.dbo.categorycode Set ClientServer='MT2SQL01' where ID = 4617


Use ClientRecordset

--SET IDENTITY_INSERT recordset ON
--Insert Into recordset ([ReportID],[ReportDownloadDT],[ClientID],[TotalNoOfRecords],[SavedAs],[Type],[FirstDisplayPage],[CompareAdMode],[CWMOnly],[LastAccessedDt],[CategoryCodeId],[UserID],[IsTempRecordset])
--Select distinct [ReportID],[ReportDownloadDT],[ClientID],[TotalNoOfRecords],[SavedAs],[Type],[FirstDisplayPage],[CompareAdMode],[CWMOnly],[LastAccessedDt],[CategoryCodeId],[UserID],[IsTempRecordset] from ArchiveCRS.dbo.recordset where categorycodeid in (4617)
--SET IDENTITY_INSERT recordset OFF

Select * from recordset where categorycodeid in (4617) 

--Insert Into RecordSetDetail ([ReportID],[PageDetailID])
Select Distinct [ReportID],[PageDetailID] from ArchiveCRS.dbo.RecordSetDetail where ReportID in (Select ReportID from ArchiveCRS.dbo.recordset where categorycodeid in (4617))

Select * from RecordSetDetail where ReportID in (Select ReportID from recordset where categorycodeid in (4617))


--Record Set

