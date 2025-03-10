/*	Drop table If Exists ACFVINCRCWM..ProcesscodeOffer
	Select * Into ACFVINCRCWM..ProcesscodeOffer from MasterACFV..CategoryCodeRunFlag 
	Update ACFVINCRCWM..ProcesscodeOffer SET Codestatus = 0 
--  Update ACFVINCRCWM..ProcesscodeOffer SET Codestatus = 2 where datacounts > 20000000
*/
use SQL13

Declare @vCategory varchar(20), @vSQL Varchar(Max)

While Exists(Select * from ACFVINCRCWM..ProcesscodeOffer Where Codestatus = 0 )
Begin
	Select @vCategory = Category from ACFVINCRCWM..ProcesscodeOffer
	Where Codestatus = 0 
	Order by DataCounts OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY

	Update ACFVINCRCWM..ProcesscodeOffer SET Codestatus = 2 Where Category = @vCategory

	SET @vSQL = '
					IF OBJECT_ID(''ACFVINCRCWM..'+@vCategory+'_Offer'') is not Null 
						Drop Table ACFVINCRCWM..'+@vCategory+'_Offer

					Select A.Pagedetailid, A.AcMultiOfferFlag
					Into ACFVINCRCWM..'+@vCategory+'_Offer
					From MasterACFV..ACFVDetailReports A With (NoLock)
					Join '+@vCategory+'DetailReports B With (NoLock)
					On A.Pagedetailid = B.Pagedetailid

					Alter Table ACFVINCRCWM..'+@vCategory+'_Offer ADD Constraint PK_'+@vCategory+'_Offer Primary Key Clustered(Pagedetailid)
				'
	EXEC (@vSQL)

	SET @vSQL = '
		While Exists (Select top 1 * from ACFVINCRCWM..'+@vCategory+'_Offer With (Nolock))
			Begin
				If OBJECT_ID(''TempDB..#T'')is not null 
					Drop table #T 
				Select top 100000 * Into #T from ACFVINCRCWM..'+@vCategory+'_Offer With (Nolock)

				Update A
					Set A.AcMultiOfferFlag = B.AcMultiOfferFlag
				From '+@vCategory+'detailReports A
				Join #T B on A.pagedetailid = B.pagedetailid

				Delete A
				From ACFVINCRCWM..'+@vCategory+'_Offer A
				Join #T B on A.pagedetailid = B.pagedetailid
			End
			'
	Exec (@vSQL)

	Update ACFVINCRCWM..ProcesscodeOffer SET Codestatus = 1 Where Category = @vCategory

END
