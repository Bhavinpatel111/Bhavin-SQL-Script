
select * from Mt2sql14.SiteControl.dbo.MasterFields where FieldId = 274
select * from Mt2sql14.SiteControl.dbo.MasterFields where FieldName like '%ACUPCCode%'

 select qtd.FieldId, qtd.DisplayName, qtd.DisplaySeq, c.ClientName, c.ClientServer
 from Mt2sql14.SiteControl.dbo.QueryViewTemplatesDetail qtd
 JOin Mt2sql14.SiteControl.dbo.QueryViewTemplates qt on qt.QueryTemplateID = qtd.QueryTemplateID
 JOin Mt2sql14.SiteControl.dbo.QueryViewControl qv on qv.QueryTemplateID = qt.QueryTemplateID
 JOin Mt2sql14.SiteControl.dbo.vw_catinfo c on c.CategoryCodeID = qv.CategoryCodeID and qv.ClientID = c.ClientID
 where qtd.FieldId = 274 and FVCCType in (2,4,6)
 --where qtd.DisplayName like 'Coupon%' and FVCCType in (2,4,6)

select * from Mt2sql14.SiteControl.dbo.QueryViewTemplatesDetail where FieldId = 274 

select rtd.FieldID, rtd.DisplayName, rtd.DisplaySeq , c.ClientName, c.ClientServer 
from Mt2sql14.SiteControl.dbo.ReportFormatTemplatesDetail rtd
Join Mt2sql14.SiteControl.dbo.ReportFormatTemplates rt on rt.RptTemplateID = rtd.RptTemplateID
Join Mt2sql14.SiteControl.dbo.ReportformatControl rc on rc.RptTemplateID = rt.RptTemplateID
Join Mt2sql14.SiteControl.dbo.vw_catInfo c on c.CategoryCodeId = rc.CategoryCodeID and rc.ClientID = c.ClientID
where rtd.FieldId = 274 and FVCCType in (2,4,6)
--where rtd.DisplayName like 'Coupon%' and FVCCType in (2,4,6)

select * from Mt2sql14.SiteControl.dbo.ReportFormatTemplatesDetail where FieldId = 274 

select * from Mt2sql14.SiteControl.dbo.tbl_lookup_ac where CategoryValue = 'width'

use SQL06

select t.name, c.name, c.column_id, t.create_date
from sys.tables t
Join sys.columns c on c.object_id = t.object_id
Where c.name = 'width'

select o.* from sys.all_sql_modules d
JOin sys.objects o on o.object_id = d.object_id
where definition like '%width%'


select i.name, ic.column_id, c.name, ic.is_included_column
from sys.sysobjects o 
	Join sys.indexes i On i.object_id = o.id
	Join sys.index_columns ic on ic.index_id = i.index_id and ic.object_id = o.id
	Join sys.columns c on c.object_id = o.id and c.column_id = ic.column_id
where c.name = 'width'
Order by i.index_id, ic.is_included_column, ic.index_column_id

------------------------------------------------------------------------------------------------------------------

Declare @vTableFields varchar(max), @vNSQL Nvarchar(max), @category varchar(50) = 'nstpep', @vSQL varchar(max)

	-- ## Get table fields
	SET @vNSQL = 'select @vTableFields = Isnull(@vTableFields,'''') + c.name + '','' from MasterACFV.sys.tables t
				Join MasterACFV.sys.columns c on t.object_id = c.object_id
				Where t.name = ''ACFVDetailReports''
				Order by c.column_id
			'
	Execute sp_executesql @vNSQL, N'@vTableFields varchar(max) OUTPUT', @vTableFields OUTPUT

	SET @vTableFields = LEFT(@vTableFields, LEN(@vTableFields)-1)
SET @vNSQL = 'select @vTableFields = Isnull(@vTableFields,'''') + c.name + '','' from sys.tables t
				Join sys.columns c on t.object_id = c.object_id
				Where t.name = ''' + @category + 'DetailReports''
				Order by c.column_id
			'
Execute sp_executesql @vNSQL, N'@vTableFields varchar(max) OUTPUT', @vTableFields OUTPUT

SET @vTableFields = LEFT(@vTableFields, LEN(@vTableFields)-1)

--Print @vTableFields

	Set @vSQL='Insert into '+@Category+'DetailReports (' + @vTableFields + ')
		Select ' + @vTableFields + '
		from tempdb..'+@Category+'DetailGamingSubscription'
		
		print LEN(@vSQL)
		Print @vSQL

	-- ## Get table fields
	SET @vNSQL = '
				If OBJECT_ID(''tempdb..#MasterFields'') is not null 
					Drop Table #MasterFields

				select c.name Into #MasterFields
				from MasterACFV.sys.tables t
				Join MasterACFV.sys.columns c on t.object_id = c.object_id
				Where t.name = ''ACFVDetailReports''

				If OBJECT_ID(''tempdb..#CategoryCodeFields'') is not null 
					Drop Table #CategoryCodeFields

				select c.name Into #CategoryCodeFields
				from sys.tables t
				Join sys.columns c on t.object_id = c.object_id
				Where t.name = ''' + @category + 'DetailReports''

				select @vTableFields = Isnull(@vTableFields,'''') + M.name + '',''
				from #MasterFields M
				Join #CategoryCodeFields C on M.Name = C.Name
				Order by M.Name
			'
	Execute sp_executesql @vNSQL, N'@vTableFields varchar(max) OUTPUT', @vTableFields OUTPUT

	SET @vTableFields = LEFT(@vTableFields, LEN(@vTableFields)-1)
