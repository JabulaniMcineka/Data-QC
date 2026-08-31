UPDATE [QC_Data_DB].[dbo].[22768 Raw Data]
SET SAQ4_22768 = 
    CASE 
        WHEN JSON_VALUE(_4_SAQ_Metadata_Question_4_of_Survey_22768, '$.answer_id') IS NOT NULL 
            THEN CAST(JSON_VALUE(_4_SAQ_Metadata_Question_4_of_Survey_22768, '$.answer_id') AS INT)
        ELSE NULL
    END,
    SAQ7_22768 = 
    CASE 
        WHEN JSON_VALUE(_7_SAQ_Metadata_Question_7_of_Survey_22768, '$.answer_id') IS NOT NULL 
            THEN CAST(JSON_VALUE(_7_SAQ_Metadata_Question_7_of_Survey_22768, '$.answer_id') AS INT)
        ELSE NULL
    END;


SAQ7_22768

SAQ4_22768


ALTER TABLE [QC_Data_DB].[dbo].[22768 Raw Data]
ADD SAQ7_22768 INT, SAQ4_22768 INT;







UPDATE [QC_Data_DB].[dbo].[22768 Raw Data]
SET SAQ9_22768 = 
    CASE 
        WHEN JSON_VALUE(_9_SAQ_Metadata_Question_9_of_Survey_22768, '$.answer_id') IS NOT NULL 
            THEN CAST(JSON_VALUE(_9_SAQ_Metadata_Question_9_of_Survey_22768, '$.answer_id') AS INT)
        ELSE NULL
    END;





ALTER TABLE [QC_Data_DB].[dbo].[22768 Raw Data]
ADD SAQ10_22768 INT;

UPDATE [QC_Data_DB].[dbo].[22768 Raw Data]
SET SAQ10_22768 = 
    CASE 
        WHEN JSON_VALUE(_10_SAQ_Metadata_Question_10_of_Survey_22768, '$.answer_id') IS NOT NULL 
            THEN CAST(JSON_VALUE(_10_SAQ_Metadata_Question_10_of_Survey_22768, '$.answer_id') AS INT)
        ELSE NULL
    END;








EXEC sp_rename '[QC_Data_DB].[dbo].[22768 Raw Data].MAQ_6_Clean', 'MAQ6_1_22768', 'COLUMN';

-- guessing this is the intended target — confirm before running:
EXEC sp_rename '[QC_Data_DB].[dbo].[22768 Raw Data].Clean_SAQ_Question_1', 'SAQ1_22768', 'COLUMN';

EXEC sp_rename '[QC_Data_DB].[dbo].[22768 Raw Data].Clean_SAQ_Question_1', 'SAQ1_22768', 'COLUMN';
EXEC sp_rename '[QC_Data_DB].[dbo].[22768 Raw Data].Clean_SAQ_Question_2', 'SAQ2_22768', 'COLUMN';
EXEC sp_rename '[QC_Data_DB].[dbo].[22768 Raw Data]._8_SAQ_Clean', 'SAQ8_22768', 'COLUMN';






EXEC sp_rename 
    '[QC_Data_DB].[dbo].[22768 Raw Data].MAQ6_1_22768',
    'MAQ6_6_22768',
    'COLUMN';






ALTER TABLE [QC_Data_DB].[dbo].[AHRI_Location_22768]
ALTER COLUMN SAQ2_22768 NVARCHAR(255) NULL;

UPDATE L
SET L.SAQ2_22768 = D.SAQ2_22768
FROM [QC_Data_DB].[dbo].[AHRI_Location_22768] AS L
INNER JOIN [QC_Data_DB].[dbo].[22768_dataset_New] AS D
    ON L.Map_ID = D.Map_ID;




    ALTER TABLE [QC_Data_DB].[dbo].[AHRI_Location_22768]
DROP COLUMN SAQ2_22768;



ALTER TABLE [QC_Data_DB].[dbo].[AHRI_Location_22768]
ADD SAQ2_22768 NVARCHAR(255) NULL;



SELECT
    L.Map_ID,
    L.Record_Time_22768,
    D.Session_scheduled_Time,
    D.SAQ2_22768
FROM [QC_Data_DB].[dbo].[AHRI_Location_22768] L
INNER JOIN [QC_Data_DB].[dbo].[22768_dataset_New] D
    ON L.Map_ID = D.Map_ID
   AND L.Record_Time_22768 = D.Session_     scheduled_Time
ORDER BY L.Map_ID, L.Record_Time_22768;