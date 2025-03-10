-- ## Map user
Create user [NUMERATOR\hemapreethyc.d-adm] From Login [NUMERATOR\hemapreethyc.d-adm] 

-- ## Assign Role
Exec sp_addrolemember 'DB_DataReader', 'NUMERATOR\hemapreethyc.d-adm'

--use tpr
SELECT l.name, sp.state_desc, sp.permission_name, sp.class_desc, sp.major_id, sp.minor_id, e.name
FROM sys.server_permissions AS sp
  JOIN sys.server_principals AS l
    ON sp.grantee_principal_id = l.principal_id
  LEFT JOIN sys.endpoints AS e
    ON sp.major_id = e.endpoint_id
 WHERE l.name like  '%public';

  ----------------------
 use TPR

SELECT sp.state_desc, sp.permission_name, SCHEMA_NAME(o.schema_id) AS 'Schema', o.name
FROM sys.database_permissions sp
  LEFT JOIN sys.all_objects o
    ON sp.major_id = o.object_id
  JOIN sys.database_principals u
    ON sp.grantee_principal_id = u.principal_id
WHERE u.name = 'db_Datareader'
  AND o.name IS NOT NULL
ORDER BY o.name

