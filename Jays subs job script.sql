USE [msdb]
GO

/****** Object:  Job [PEP - Subscription - Reset Time]    Script Date: 7/18/2022 10:24:21 AM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 7/18/2022 10:24:21 AM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'PEP - Subscription - Reset Time', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'NUMERATOR\bhavin.patel-adm', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Reset Time]    Script Date: 7/18/2022 10:24:21 AM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Reset Time', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'declare @CurrentDayNum int
set @CurrentDayNum = datepart(dw, getdate())

declare @DefaultTime time

if @CurrentDayNum in (1, 7) --Sunday and Saturday
	set @DefaultTime= ''07:00:00.0000000''
else
	set  @DefaultTime =''06:00:00.0000000''
	
Update Subscription.[dbo].[ScheduleSubsProcessTime]
set ProcessTime=@DefaultTime
where processDay = @CurrentDayNum
and ProcessTime <> @DefaultTime', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20220718, 
		@active_end_date=99991231, 
		@active_start_time=160000, 
		@active_end_time=235959, 
		@schedule_uid=N'c927df8b-991e-4d46-9d62-4a7889b19590'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO




USE [msdb]
GO

/****** Object:  Job [PEP - Subscription - Nightly Load Completion Check]    Script Date: 7/18/2022 10:24:07 AM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 7/18/2022 10:24:07 AM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'PEP - Subscription - Nightly Load Completion Check', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'NUMERATOR\bhavin.patel-adm', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Subscription Start Status]    Script Date: 7/18/2022 10:24:08 AM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subscription Start Status', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'declare @CurrentDayNum int
declare @CurrentTime as time
declare @ProcessTime as time

set @CurrentDayNum = datepart(dw, getdate())

Select @ProcessTime = ProcessTime from Subscription.[dbo].[ScheduleSubsProcessTime]
where ProcessDay = @CurrentDayNum

set @CurrentTime = cast(GETDATE() as time) 

If @CurrentTime > @ProcessTime
	begin
		Print ''Send Started, no need to change''
		return
	end
Else
	Begin
		--All FV (not Adlert) servers that are not DEV
		If exists(select * from Connection.dbo.vwSubscriptionReady
						where type = ''FV''
						and sqlserver not like ''%dev%''
						and Subscriptionready = 1
						and databasename IN (''SQL13'',''SQL06'',''PEP01'',''PEP00'',''SQL03'',''SQL16'',''SQL17''))
		begin			
			--Processing completed, and not pass current set time, update to current time
			Update Subscription.[dbo].[ScheduleSubsProcessTime] set ProcessTime=@CurrentTime where processDay = @CurrentDayNum
			
			 Exec Master.dbo.mt_proc_send_cdosysmail 
					@to=''Bhavin.patel111@numerator.com;vikas.kantawala@numerator.com;pratik.makwana@numerator.com'',
		 		    @subject=''Subscription - Start time Updated'',
				    @BodyType = ''HTML'',
				    @Body = ''Subscription - Start time Updated''
				
		end

	End
', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20220719, 
		@active_end_date=99991231, 
		@active_start_time=10000, 
		@active_end_time=70000, 
		@schedule_uid=N'c8bdb3bd-03f9-4248-a445-b70fea693896'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO


