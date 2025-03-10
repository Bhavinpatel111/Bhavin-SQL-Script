use PEP01

Declare @vStartTime DateTime

select @vStartTime = ClientRunSet
from MT2SQL14.Connection.dbo.NightlyProcessing 
Where SQLServer = @@SERVERNAME
Order By ClientRunSet Desc OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY

Declare @vBody varchar(max), @vSubject Varchar(200)

SET @vSubject = 'Orphaned records Status for the server ' + QUOTENAME(@@SERVERNAME)
SET @vBody = ' <B>Orphaned records Status for the server : <U>' + @@SERVERNAME + '</U></B>
<Table>
<TR>
<TH>Category Code</TH>
<TH>Status</TH>
</TR>'

select @vBody = @vBody + '<TR style="text-align: Center"><TH>'+ CategoryCode + '</TH><TD style="text-align: Left">'+ SQL + '</TD></TR>'
from categorycodelog
where Details = 'Detailreports Orphaned Status'
And QueryTime >= @vStartTime
Order By CategoryCode

select @vBody = @vBody + '</Table>'

exec mt2sql14.Master.dbo.mt_proc_send_cdosysmail 
	@to='Bhavin.patel111@numerator.com',
	@subject = @vSubject,
	@BodyType = 'HTML',
	@Body = @vBody
