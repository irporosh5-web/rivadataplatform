select 
a.attendance_id,
ds.student_key,
dc.class_id,
db.batch_id,
dd.date_key,
a.attendance_status,
try_cast(a.joined_at AS timestamp) as joined_at,
a.remarks,
case
when a.attendance_status = 'Present' then 1
when a.attendance_status = 'Absent' then 0
end as attendance_count,
case
when a.attendance_status = 'Present' then 1
else 0
end as present_flag, 
case
when a.attendance_status = 'Absent' then 1
else 0
end as absent_flag, 
case
when a.attendance_status = 'Late' then 1
else 0
end as   
late_flag
from rivadataplatform.landing.attendance a

left join rivadataplatform.dataproducts.dim_student ds 
on a.student_id = ds.student_id

left join rivadataplatform.landing.classes dc 
on a.class_id = dc.class_id

left join rivadataplatform.landing.batches db 
on dc.batch_id = db.batch_id

left join rivadataplatform.dataproducts.dim_date dd 
on dc.class_date = dd.date
