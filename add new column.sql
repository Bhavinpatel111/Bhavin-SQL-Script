use SQL13
-- saleenddt
-- sp_Whoisactive
select '
if not exists(select * from sys.columns where object_id = Object_id('''+name+''') and name = ''Illustrated'')
	Alter table ' +Name  + ' Add  Illustrated varchar(20)
if not exists(select * from sys.columns where object_id = Object_id('''+name+''') and name = ''SaleStDt'')
	Alter table ' +Name  + ' Add  SaleStDt Date Null
if not exists(select * from sys.columns where object_id = Object_id('''+name+''') and name = ''SaleEndDt'')
	Alter table ' +Name  + ' Add  SaleEndDt Date Null
if not exists(select * from sys.columns where object_id = Object_id('''+name+''') and name = ''Spend'')
	Alter table ' +Name  + ' Add  Spend varchar(20)
if not exists(select * from sys.columns where object_id = Object_id('''+name+''') and name = ''Unitdiscountprice'')
	Alter table ' +Name  + ' Add  Unitdiscountprice varchar(20)
if not exists(select * from sys.columns where object_id = Object_id('''+name+''') and name = ''OrderValue'')
	Alter table ' +Name  + ' Add  OrderValue int null
if not exists(select * from sys.columns where object_id = Object_id('''+name+''') and name = ''AdDist'')
	Alter table ' +Name  + ' Add  AdDist Date Null
if not exists(select * from sys.columns where object_id = Object_id('''+name+''') and name = ''AdDistId'')
	Alter table ' +Name  + ' Add  AdDistId varchar(20)
if not exists(select * from sys.columns where object_id = Object_id('''+name+''') and name = ''AdSize'')
	Alter table ' +Name  + ' Add  AdSize varchar(20)
if not exists(select * from sys.columns where object_id = Object_id('''+name+''') and name = ''DistDt'')
	Alter table ' +Name  + ' Add  DistDt varchar(20)
'  
, 'select Top 1 Illustrated,SaleStDt,SaleEndDt,Spend,Unitdiscountprice,DistDt,OrderValue,AdDist,AdDistId,AdSize from ' +NAme
from sys.tables 
where( name like '%detailreports' OR name like '%detailreports_Or%')
and name not like 'FRDATA%'
and name   not like '%export%'
order by create_Date desc