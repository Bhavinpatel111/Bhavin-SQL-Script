Select Distinct mcc.* INto #T 
from MasterClientCoverage.Dbo.retmktpep r
Join MasterClientCoverage..MasterClientCWMPEP mcc on mcc.Retmktid = r.Retmktid 
Join Mt2SQl14.sitecontrol.dbo.vw_catinfo c on c.clientid = mcc.clientid and mcc.categorycodeid = c.categorycodeid
Where  mcc.categorycodeid in (4770 )	-- 9423 Ops,  ## 9418 -- all remt
and mcc.mediaid = 14510004
and market = 'internet'
-- and mcc.retid in (129,25,10876743,61,10809747,14114762,14114761 ,14114763)
Order by  1, 2


Update  #T SET Clientid = 1433, categorycodeid = 9374

--Insert Into MasterClientCoverage..MasterClientCWMPEP
select * from #T 
 ------------------------------------------------

 select * from  MasterClientCoverage..MasterClientCWMPEP mcc
Where  mcc.categorycodeid in (9374 ) --and  mcc.mediaid = 14510004
and mcc.acRetmktid in ( 510722086, 530522086, 604222086, 634022086, 755922086 , 131769222086, 131769322086,131769422086)
Order by acRetmktid 

