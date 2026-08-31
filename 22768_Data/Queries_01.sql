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
--INTO [QC_Data_DB].[dbo].[QC_Comparison_22768]      -- New table gets cretated to store the results of the comparison
FROM [QC_Data_DB].[dbo].[22768 Raw Data] t1
INNER JOIN [QC_Data_DB].[dbo].[AHRI_Location_22768] t2
    ON t1.Record_Time = t2.Record_Time_22768
   AND t1.Status = t2.Status_22768
   AND TRY_CAST(LEFT(CAST(t2.Map_ID AS VARCHAR(20)), LEN(CAST(t1.Participant_ID AS VARCHAR(20)))) AS INT) = t1.Participant_ID
WHERE t1.Participant_ID IS NOT NULL
ORDER BY t1.Participant_ID;



select *
FROM [QC_Data_DB].[dbo].[22768 Raw Data]
WHERE Participant_ID = 59836
select *
from  [QC_Data_DB].[dbo].[AHRI_Location_22768]
where  LEFT(CAST(Map_ID AS VARCHAR(20)), 5) = 59836







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


SELECT 
    L.*,
    r.*
FROM [QC_Data_DB].[dbo].[AHRI_Location_22768] L
LEFT JOIN [QC_Data_DB].[dbo].[QC_Comparison_22768] r
    ON r.Participant_ID = L.IINTID
ORDER BY L.Map_ID;




SELECT *
    --r.Participant_ID,
    ---r.Record_Time,
    --r.Map_ID,
   -- r.NUM5_Check,
    --L.NUM5_22768
FROM [QC_Data_DB].[dbo].[QC_Comparison_22768] 
WHERE Participant_ID = 43742


select *
FROM [QC_Data_DB].[dbo].[AHRI_Location_22768] 
WHERE LEFT(CAST(Map_ID AS VARCHAR(20)), 5) = 43742
ORDER BY Map_ID;






WITH Comparison AS
(
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Map_ID
               ORDER BY Record_Time DESC
           ) AS rn
    FROM [QC_Data_DB].[dbo].[QC_Comparison_22768]
    WHERE Participant_ID = 43742
)
SELECT 
   -- L.
    *
    --,
    --r.Participant_ID,
    --r.Record_Time,
   --r.NUM5_Check
FROM [QC_Data_DB].[dbo].[AHRI_Location_22768] 
where LEFT(CAST(Map_ID AS VARCHAR(20)), 5) = 43742




WITH Comparison AS
(
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Map_ID
               ORDER BY Record_Time DESC
           ) AS rn
    FROM [QC_Data_DB].[dbo].[QC_Comparison_22768]
    WHERE Participant_ID = 43742
)
SELECT 
    L.*,
    r.Participant_ID,
    r.Record_Time,
    r.NUM5_Check
FROM [QC_Data_DB].[dbo].[AHRI_Location_22768] L
LEFT JOIN Comparison r
    ON LEFT(CAST(L.Map_ID AS VARCHAR(20)), 5) = 43742
    AND r.rn = 1
ORDER BY L.Map_ID;




SELECT 
    R.*,
    r.Participant_ID,
    r.Record_Time,
    r.NUM5_Check
FROM [QC_Data_DB].[dbo].[AHRI_Location_22768] L
INNER JOIN [QC_Data_DB].[dbo].[QC_Comparison_22768] r
    ON LEFT(CAST(L.Map_ID AS VARCHAR(20)), 5) = 43742
   -- AND r.rn = 1
ORDER BY L.Map_ID;
\








SELECT
    L.*,
    R.Participant_ID,
    R.Record_Time,
    R.SAQ1_Check,
    R.SAQ2_Check,
    R.FFT3_Check,
    R.SAQ4_Check,
    R.NUM5_Check,
    R.MAQ6_1_Check,
    R.MAQ6_2_Check,
    R.MAQ6_3_Check,
    R.MAQ6_4_Check,
    R.SAQ8_Check,
    R.Status_Check
FROM [QC_Data_DB].[dbo].[AHRI_Location_22768] L
LEFT JOIN [QC_Data_DB].[dbo].[QC_Comparison_22768] R
    ON L.Map_ID = R.Map_ID
    AND L.Record_Time_22768 = R.Record_Time
    AND R.Participant_ID = 43742
WHERE LEFT(CAST(L.Map_ID AS VARCHAR(20)), 5) = '43742'
ORDER BY L.Map_ID, L.Record_Time_22768;



SELECT
    L.*,
    R.Participant_ID,
    R.Record_Time,
    R.SAQ1_Check,
    R.SAQ2_Check,
    R.FFT3_Check,
    R.SAQ4_Check,
    R.NUM5_Check,
    R.MAQ6_1_Check,
    R.MAQ6_2_Check,
    R.MAQ6_3_Check,
    R.MAQ6_4_Check,
    R.SAQ8_Check,
    R.Status_Check
FROM [QC_Data_DB].[dbo].[AHRI_Location_22768] L
LEFT JOIN [QC_Data_DB].[dbo].[QC_Comparison_22768] R
    ON L.Map_ID = R.Map_ID
    AND L.Record_Time_22768 = R.Record_Time
    AND R.Participant_ID = LEFT(CAST(L.Map_ID AS VARCHAR(20)), 5)
ORDER BY 
    L.Map_ID,
    L.Record_Time_22768;





    select count(*) from [QC_Data_DB].[dbo].[AHRI_Location_22768]




    SELECT
    L.Map_ID,
    L.Record_Time_22768,
    COUNT(*) AS MatchingRows
FROM [QC_Data_DB].[dbo].[AHRI_Location_22768] L
LEFT JOIN [QC_Data_DB].[dbo].[QC_Comparison_22768] R
    ON L.Map_ID = R.Map_ID
    AND L.Record_Time_22768 = R.Record_Time
    AND R.Participant_ID = LEFT(CAST(L.Map_ID AS VARCHAR(20)), 5)
GROUP BY
    L.Map_ID,
    L.Record_Time_22768
HAVING COUNT(*) > 1
ORDER BY
    MatchingRows DESC;




    SELECT *
FROM [QC_Data_DB].[dbo].[QC_Comparison_22768]
WHERE Map_ID = 5983682146
  AND Record_Time = '2025-05-05 05:36:10.361000+02:00';







  WITH Comparison AS
(
    SELECT DISTINCT
        Participant_ID,
        Record_Time,
        Map_ID,
        SAQ1_Check,
        SAQ2_Check,
        FFT3_Check,
        SAQ4_Check,
        NUM5_Check,
        MAQ6_1_Check,
        MAQ6_2_Check,
        MAQ6_3_Check,
        MAQ6_4_Check,
        SAQ8_Check,
        Status_Check
    FROM [QC_Data_DB].[dbo].[QC_Comparison_22768]
)
SELECT
    L.*,
    R.Participant_ID,
    R.Record_Time,
    R.SAQ1_Check,
    R.SAQ2_Check,
    R.FFT3_Check,
    R.SAQ4_Check,
    R.NUM5_Check,
    R.MAQ6_1_Check,
    R.MAQ6_2_Check,
    R.MAQ6_3_Check,
    R.MAQ6_4_Check,
    R.SAQ8_Check,
    R.Status_Check
FROM [QC_Data_DB].[dbo].[AHRI_Location_22768] L
LEFT JOIN Comparison R
    ON L.Map_ID = R.Map_ID
    AND L.Record_Time_22768 = R.Record_Time
    AND R.Participant_ID = LEFT(CAST(L.Map_ID AS VARCHAR(20)), 5)
ORDER BY
    L.Map_ID,
    L.Record_Time_22768;


    

UPDATE L
SET L.SAQ2_22768 = D.SAQ2_22768
FROM [QC_Data_DB].[dbo].[AHRI_Location_22768] L
INNER JOIN (
    SELECT
        Map_ID,
        MAX(SAQ2_22768) AS SAQ2_22768
    FROM [QC_Data_DB].[dbo].[22768_dataset_New]
    GROUP BY Map_ID
) D
    ON L.Map_ID = D.Map_ID;