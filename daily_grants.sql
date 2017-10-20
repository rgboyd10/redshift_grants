--generates all of the grant scripts for regular execution in Amazon Redshift.
begin transaction;
select
'grant ',
case when sel = 'true' then 'select' else '' end as sel,
case when sel = 'true' and ins = 'true' then ',' else '' end as comma,
case when ins = 'true' then 'insert' else '' end as ins,
case when ins = 'true' and upd = 'true' then ',' else '' end as comma,
case when upd = 'true' then 'update' else '' end as upd,
case when upd = 'true' and del = 'true' then ',' else '' end as comma,
case when del = 'true' then 'delete' else '' end as del,
case when del = 'true' and ref = 'true' then ',' else '' end as comma,
case when ref = 'true' then 'references' else '' end as ref,
' on ' || schemaname || '.' || tablename || ' to ' || usename || ';'
from rsft_admin.v_get_tbl_priv_by_user
order by usename;
end transaction;
