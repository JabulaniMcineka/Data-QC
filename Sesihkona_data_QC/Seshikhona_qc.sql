select * from [QC_Data_DB].[dbo].[Stata Dataset]
where UserId = 59466

select top 10* from [QC_Data_DB].[dbo].[Troubleshooting dataset]
where ethica_user_id = 59466






SELECT
    t1.IIntID,
    t1.redcap_repeat_instance,
    t1.UserId,
    t1.trb_date,
    t2.Date_and_Time,

    CASE WHEN t1.trb_type_code = t2.Type_code
              OR (t1.trb_type_code IS NULL AND t2.Type_code IS NULL)
         THEN 'MATCH' ELSE 'MISMATCH' END AS trb_type_code_Check,

    CASE WHEN t1.trb_virtual_type_code = t2.call_code
              OR (t1.trb_virtual_type_code IS NULL AND t2.call_code IS NULL)
         THEN 'MATCH' ELSE 'MISMATCH' END AS trb_virtual_type_code_Check,

    CASE WHEN t1.trb_phone_code = t2.Phone_code
              OR (t1.trb_phone_code IS NULL AND t2.Phone_code IS NULL)
         THEN 'MATCH' ELSE 'MISMATCH' END AS trb_phone_code_Check,

    CASE WHEN t1.trb_deleted_code = t2.deleted_code
              OR (t1.trb_deleted_code IS NULL AND t2.deleted_code IS NULL)
         THEN 'MATCH' ELSE 'MISMATCH' END AS trb_deleted_code_Check,

    CASE WHEN t1.trb_appdata_code = t2.Background_data_code
              OR (t1.trb_appdata_code IS NULL AND t2.Background_data_code IS NULL)
         THEN 'MATCH' ELSE 'MISMATCH' END AS trb_appdata_code_Check,

    CASE WHEN t1.trb_locations_code = t2.Locations_code
              OR (t1.trb_locations_code IS NULL AND t2.Locations_code IS NULL)
         THEN 'MATCH' ELSE 'MISMATCH' END AS trb_locations_code_Check,

    CASE WHEN t1.trb_batteryopt_code = t2.Check_Battery_code
              OR (t1.trb_batteryopt_code IS NULL AND t2.Check_Battery_code IS NULL)
         THEN 'MATCH' ELSE 'MISMATCH' END AS trb_batteryopt_code_Check

FROM [QC_Data_DB].[dbo].[Stata Dataset] t1

INNER JOIN [QC_Data_DB].[dbo].[Troubleshooting dataset] t2
    ON t1.UserId = t2.Ethica_User_ID
   AND CAST(t1.trb_date AS DATE) = CAST(t2.Date_and_Time AS DATE)

WHERE t1.UserId IS NOT NULL

ORDER BY
    t1.UserId,
    t1.redcap_repeat_instance;
