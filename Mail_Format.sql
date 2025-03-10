
		Declare @VMessage Nvarchar(max)
		Set @VMessage = ' Error in executing MasterACFV.dbo.AC_FV_Create_DetailReports.
		<table>
		<tr><th>Step Name : </th><td>' + @StepName +'</td></tr>
		<tr><th>Error Number : </th><td>' + Convert(varchar(20), ERROR_NUMBER()) +'</td></tr>
		<tr><th>Error : </th><td>'+ ERROR_MESSAGE() +'</td></tr>
		</table>'

		Exec Master.dbo.mt_proc_send_cdosysmail 
			@to='Bhavin.patel111@numerator.com;vikas.kantawala@numerator.com;pratik.makwana@numerator.com',
			@subject='PEP Process Step Failed',
			@BodyType = 'HTML',
			@Body = @VMessage
