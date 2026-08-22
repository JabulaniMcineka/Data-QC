SELECT
    t1.Participant_ID,
    t1.Record_Time,
    t2.Map_ID,
    CASE WHEN t1.SAQ1_22768 = t2.SAQ1_22768 
         OR (t1.SAQ1_22768 IS NULL AND t2.SAQ1_22768 IS NULL) 
         THEN 'MATCH' ELSE 'MISMATCH' END AS SAQ1_Check,
    CASE WHEN t1.SAQ2_22768 = t2.SAQ2_22768 
         OR (t1.SAQ2_22768 IS NULL AND t2.SAQ2_22768 IS NULL) 
         THEN 'MATCH' ELSE 'MISMATCH' END AS SAQ2_Check,
    CASE WHEN ISNULL(t1.FFT3_Code,'') = ISNULL(t2.FFT3_22768_Code,'') 
         THEN 'MATCH' ELSE 'MISMATCH' END AS FFT3_Check,
    CASE WHEN t1.SAQ4_22768 = t2.SAQ4_22768 
         OR (t1.SAQ4_22768 IS NULL AND t2.SAQ4_22768 IS NULL) 
         THEN 'MATCH' ELSE 'MISMATCH' END AS SAQ4_Check,
    CASE WHEN t1._5_NUM_Question_5_of_Survey_22768 = t2.NUM5_22768 
         OR (t1._5_NUM_Question_5_of_Survey_22768 IS NULL AND t2.NUM5_22768 IS NULL) 
         THEN 'MATCH' ELSE 'MISMATCH' END AS NUM5_Check,
    CASE WHEN t1._6_MAQ_1_Consume_alcohol = t2.MAQ6_1_22768 
         OR (t1._6_MAQ_1_Consume_alcohol IS NULL AND t2.MAQ6_1_22768 IS NULL) 
         THEN 'MATCH' ELSE 'MISMATCH' END AS MAQ6_1_Check,
    CASE WHEN t1._6_MAQ_2_Use_drugs_e_g_marijuana_wungaah = t2.MAQ6_2_22768 
         OR (t1._6_MAQ_2_Use_drugs_e_g_marijuana_wungaah IS NULL AND t2.MAQ6_2_22768 IS NULL) 
         THEN 'MATCH' ELSE 'MISMATCH' END AS MAQ6_2_Check,
    CASE WHEN t1._6_MAQ_3_Engaged_in_sexual_activity = t2.MAQ6_3_22768 
         OR (t1._6_MAQ_3_Engaged_in_sexual_activity IS NULL AND t2.MAQ6_3_22768 IS NULL) 
         THEN 'MATCH' ELSE 'MISMATCH' END AS MAQ6_3_Check,
    CASE WHEN t1._6_MAQ_4_Did_not_engage_in_any_of_the_above_activities = t2.MAQ6_4_22768 
         OR (t1._6_MAQ_4_Did_not_engage_in_any_of_the_above_activities IS NULL AND t2.MAQ6_4_22768 IS NULL) 
         THEN 'MATCH' ELSE 'MISMATCH' END AS MAQ6_4_Check,
    CASE WHEN t1.SAQ8_22768 = t2.SAQ8_22768 
         OR (t1.SAQ8_22768 IS NULL AND t2.SAQ8_22768 IS NULL) 
         THEN 'MATCH' ELSE 'MISMATCH' END AS SAQ8_Check,
    CASE WHEN t1.Status = t2.Status_22768 
         THEN 'MATCH' ELSE 'MISMATCH' END AS Status_Check
FROM [QC_Data_DB].[dbo].[22768 Raw Data] t1
INNER JOIN [QC_Data_DB].[dbo].[AHRI_Location_22768] t2
    ON t1.Record_Time = t2.Record_Time_22768
   AND t1.Status = t2.Status_22768
   AND t1.Participant_ID = 43742
   AND TRY_CAST(LEFT(CAST(t2.Map_ID AS VARCHAR(20)), LEN(CAST(t1.Participant_ID AS VARCHAR(20)))) AS INT) = 43742
WHERE t1.Participant_ID IS NOT NULL
ORDER BY t1.Participant_ID;



select *
FROM [QC_Data_DB].[dbo].[22768 Raw Data]
WHERE Participant_ID = 43742

select *
from  [QC_Data_DB].[dbo].[AHRI_Location_22768]
where  LEFT(CAST(Map_ID AS VARCHAR(20)), 5) = 43742







select NUM5_22768
from  [QC_Data_DB].[dbo].[AHRI_Location_22768]
where  LEFT(CAST(Map_ID AS VARCHAR(20)), 5) = 43742

SELECT distinct _10_SAQ_Metadata_Question_10_of_Survey_22768

FROM [QC_Data_DB].[dbo].[22768 Raw Data]
WHERE Participant_ID = 43742


SELECT distinct(Participant_ID)
select count(distinct(Participant_ID))
FROM [QC_Data_DB].[dbo].[22768 Raw Data]
--WHERE Participant_ID = 43742


select distinct(IINTID)
select count(distinct(IINTID))
from  [QC_Data_DB].[dbo].[AHRI_Location_22768]
--where  LEFT(CAST(Map_ID AS VARCHAR(20)), 5) = 43742