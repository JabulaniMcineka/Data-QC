SELECT
    t1.Participant_ID,
    t1.Record_Time,
    t2.IIntID,
    t2.Map_ID,

    CASE 
        WHEN t1._1_MAQ_1_Work = t2.maq_1
          OR (t1._1_MAQ_1_Work IS NULL AND t2.maq_1 IS NULL)
        THEN 'MATCH' ELSE 'MISMATCH'
    END AS MAQ1_Check,

    CASE 
        WHEN t1._1_MAQ_2_School = t2.maq_2
          OR (t1._1_MAQ_2_School IS NULL AND t2.maq_2 IS NULL)
        THEN 'MATCH' ELSE 'MISMATCH'
    END AS MAQ2_Check,

    CASE 
        WHEN t1._1_MAQ_3_Market_Shops = t2.maq_3
          OR (t1._1_MAQ_3_Market_Shops IS NULL AND t2.maq_3 IS NULL)
        THEN 'MATCH' ELSE 'MISMATCH'
    END AS MAQ3_Check,

    CASE 
        WHEN t1._1_MAQ_4_Town = t2.maq_4
          OR (t1._1_MAQ_4_Town IS NULL AND t2.maq_4 IS NULL)
        THEN 'MATCH' ELSE 'MISMATCH'
    END AS MAQ4_Check,

    CASE 
        WHEN t1._1_MAQ_5_Church = t2.maq_5
          OR (t1._1_MAQ_5_Church IS NULL AND t2.maq_5 IS NULL)
        THEN 'MATCH' ELSE 'MISMATCH'
    END AS MAQ5_Check,

    CASE 
        WHEN t1._1_MAQ_6_Bar_Drinking_venue = t2.maq_6
          OR (t1._1_MAQ_6_Bar_Drinking_venue IS NULL AND t2.maq_6 IS NULL)
        THEN 'MATCH' ELSE 'MISMATCH'
    END AS MAQ6_Check,

    CASE 
        WHEN t1._1_MAQ_7_Social_event_funeral_wedding_sporting = t2.maq_7
          OR (t1._1_MAQ_7_Social_event_funeral_wedding_sporting IS NULL AND t2.maq_7 IS NULL)
        THEN 'MATCH' ELSE 'MISMATCH'
    END AS MAQ7_Check,

    CASE 
        WHEN t1._1_MAQ_8_Clinic_Hospital_Doctor = t2.maq_8
          OR (t1._1_MAQ_8_Clinic_Hospital_Doctor IS NULL AND t2.maq_8 IS NULL)
        THEN 'MATCH' ELSE 'MISMATCH'
    END AS MAQ8_Check,

    CASE 
        WHEN t1._1_MAQ_9_Visit_your_partner = t2.maq_9
          OR (t1._1_MAQ_9_Visit_your_partner IS NULL AND t2.maq_9 IS NULL)
        THEN 'MATCH' ELSE 'MISMATCH'
    END AS MAQ9_Check,

    CASE 
        WHEN t1._1_MAQ_10_Visit_another_family_member = t2.maq_10
          OR (t1._1_MAQ_10_Visit_another_family_member IS NULL AND t2.maq_10 IS NULL)
        THEN 'MATCH' ELSE 'MISMATCH'
    END AS MAQ10_Check,

    CASE 
        WHEN t1._1_MAQ_11_Visit_a_friend = t2.maq_11
          OR (t1._1_MAQ_11_Visit_a_friend IS NULL AND t2.maq_11 IS NULL)
        THEN 'MATCH' ELSE 'MISMATCH'
    END AS MAQ11_Check,

    CASE 
        WHEN t1._1_MAQ_12_Travel_out_of_town = t2.maq_12
          OR (t1._1_MAQ_12_Travel_out_of_town IS NULL AND t2.maq_12 IS NULL)
        THEN 'MATCH' ELSE 'MISMATCH'
    END AS MAQ12_Check,

    CASE 
        WHEN t1._1_MAQ_13_Other = t2.maq_13
          OR (t1._1_MAQ_13_Other IS NULL AND t2.maq_13 IS NULL)
        THEN 'MATCH' ELSE 'MISMATCH'
    END AS MAQ13_Check

FROM [QC_Data_DB].[dbo].[Activity_all_responses] t1

INNER JOIN [QC_Data_DB].[dbo].[Activity_Space_Dataset] t2
    ON t1.Record_Time = t2.Record_Time
       AND t1.Participant_ID = 47894

select top 2*
FROM [QC_Data_DB].[dbo].[Activity_Space_Dataset]
WHERE Map_ID = 704547894

select top 2*
from [QC_Data_DB].[dbo].[Activity_all_responses]
where  LEFT(CAST(Participant_ID AS VARCHAR(20)), 5) = 47894





select * 
    FROM [QC_Data_DB].[dbo].[Activity_Space_Dataset]
    where participant_id = 45557




select *
from  [QC_Data_DB].[dbo].[25235_dataset]
where  LEFT(CAST(Map_ID AS VARCHAR(20)), 5) = 45557






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













    SELECT
    IIntID,
    Map_ID,
    maq_1,
    maq_2,
    maq_3,
    maq_4,
    maq_5,
    maq_6,
    maq_7,
    maq_8,
    maq_9,
    maq_10,
    maq_11,
    maq_12,
    maq_13,
    record_time,
    sur_status
FROM [QC_Data_DB].[dbo].[Activity_Space_Dataset]
WHERE Map_ID = 704547894
order by record_time





SELECT
    Participant_ID,
    Participant_Label,
    Session_Scheduled_Time,
    _1_MAQ_1_Work,
    _1_MAQ_2_School,
    _1_MAQ_3_Market_Shops,
    _1_MAQ_4_Town,
    _1_MAQ_5_Church,
    _1_MAQ_6_Bar_Drinking_venue,
    _1_MAQ_7_Social_event_funeral_wedding_sporting,
    _1_MAQ_8_Clinic_Hospital_Doctor,
    _1_MAQ_9_Visit_your_partner,
    _1_MAQ_10_Visit_another_family_member,
    _1_MAQ_11_Visit_a_friend,
    _1_MAQ_12_Travel_out_of_town,
    _1_MAQ_13_Other,
    Record_Time,
    Status
from [QC_Data_DB].[dbo].[Activity_all_responses]
where  LEFT(CAST(Participant_ID AS VARCHAR(20)), 5) = 47894
order by record_time