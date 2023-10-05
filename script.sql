select 
   r.date,
   s.first_name,
   s.last_name,
   s.hourly_rate,
   sh.start_time,
   sh.end_time,
   ((hour(timediff(sh.end_time,sh.start_time))*60)+(minute(timediff(sh.end_time,sh.start_time))))/60 as hours_in_shift,
   ((hour(timediff(sh.end_time,sh.start_time))*60)+(minute(timediff(sh.end_time,sh.start_time))))/60*s.hourly_rate as staff_cost
from Rota r
left join Staff s on r.staff_id = s.staff_id
left join Shift sh on r.shift_id = sh.shift_id