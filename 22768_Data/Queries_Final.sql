SELECT
    t1.Participant_ID,
    t1.Record_Time,
    t2.Map_ID,
    CASE WHEN t1.SAQ1_22768 = t2.SAQ1_22768 
         OR (t1.SAQ1_22768 IS NULL AND t2.SAQ1_22768 IS NULL) 
         THEN 'MATCH' ELSE 'MISMATCH' END AS SAQ1_Check,
    CASE WHEN ISNULL(t1.FFT3_Code,'') = ISNULL(t2.FFT3_22768_Code,'') 
         THEN 'MATCH' ELSE 'MISMATCH' END AS FFT3_Check,
    CASE WHEN t1.SAQ4_22768 = t2.SAQ4_22768 
         OR (t1.SAQ4_22768 IS NULL AND t2.SAQ4_22768 IS NULL) 
         THEN 'MATCH' ELSE 'MISMATCH' END AS SAQ4_Check,
    CASE WHEN t1._5_NUM_Question_5_of_Survey_22768 = t2.NUM5_22768 
         OR (t1._5_NUM_Question_5_of_Survey_22768 IS NULL AND t2.NUM5_22768 IS NULL) 
         THEN 'MATCH' ELSE 'MISMATCH' END AS NUM5_Check
FROM [QC_Data_DB].[dbo].[22768 Raw Data] t1
INNER JOIN [QC_Data_DB].[dbo].[AHRI_Location_22768] t2
    ON t1.Record_Time = t2.Record_Time_22768
   AND t1.Status = t2.Status_22768
   AND t1.Participant_ID = 43742
   AND TRY_CAST(LEFT(CAST(t2.Map_ID AS VARCHAR(20)), LEN(CAST(t1.Participant_ID AS VARCHAR(20)))) AS INT) = t1.Participant_ID
WHERE t1.Participant_ID IS NOT NULL
ORDER BY t1.Participant_ID;



select *
FROM [QC_Data_DB].[dbo].[22768 Raw Data]
WHERE Participant_ID = 43742

select *
from  [QC_Data_DB].[dbo].[AHRI_Location_22768]
where  LEFT(CAST(Map_ID AS VARCHAR(20)), 5) = 43742