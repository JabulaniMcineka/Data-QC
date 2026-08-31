

select *
from  [QC_Data_DB].[dbo].[25235_dataset]


select * from
    [QC_Data_DB].[dbo].[25235 Raw Data]



where  LEFT(CAST(column2 AS VARCHAR(20)), 5) = 47968



select a.column2,b.participant_id
from  [QC_Data_DB].[dbo].[25235_dataset] a
left join [QC_Data_DB].[dbo].[25235 Raw Data] b
on LEFT(CAST(a.column2 AS VARCHAR(20)), 5)= b.participant_id  



delete from [QC_Data_DB].[dbo].[25235 Raw Data] 
where participant_id  not in (59466, 46522, 45557)

