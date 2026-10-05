USE hospital_management_system;


SELECT name_surname, phone_no FROM patient;
-- Show only patient names and telephone numbers --

SELECT * FROM patient LIMIT 10;
-- List the top 10 patients --

SELECT * FROM doctor WHERE id = 5;
-- Find a specific doctor by ID = 5 --

SELECT * FROM patient ORDER BY name_surname;
-- Order from the patient with the most recent date of birth to the oldest --

SELECT 
    a.id AS appointment_id,
    a.date_time AS appointment_date,
    d.name_surname AS doctor_name,
    pc.polyclinic_name AS poliyclinic
FROM appointment a
JOIN doctor d ON a.doctor_id = d.id
JOIN polyclinic pc ON d.polyclinic_id = pc.id
WHERE a.patient_id = 10
ORDER BY a.date_time;
--  See all appointment information for a patient_id = 10 --


SELECT doctor_id, date_time FROM appointment where patient_id = 10; 

SELECT 
    a.id AS appointment_id,
    a.date_time AS appointment_date,
    d.name_surname AS doctor_name,
    pc.polyclinic_name AS polyclinic
FROM appointment a
JOIN doctor d ON a.doctor_id = d.id
JOIN polyclinic pc ON d.polyclinic_id = pc.id
JOIN patient p ON a.patient_id = p.id
WHERE p.name_surname LIKE '%Ahmet%'
ORDER BY a.date_time;
-- List Appointments by Patient Name = Ahmet --

SELECT 
    d.id AS doctor_id,
    d.name_surname AS doctor_name,
    d.phone_no AS doctor_phone,
    p.id AS poliyclinic_id,
    p.polyclinic_name AS poliyclinic_adi
FROM doctor d
JOIN polyclinic p ON d.polyclinic_id = p.id
WHERE p.id = 2
ORDER BY d.name_surname;
    
    -- Listing doctors, doctors' phone number and polyclinic's name with polyclinic_id = 2 --
    
SELECT 
    a.id AS appointment_id,
    a.date_time AS appointment_date_time,
    p.id AS patient_id,
    p.name_surname AS patient_name,
    p.birth_date AS patient_birth_date,
    p.phone_no AS patient_phone,
    d.name_surname AS doctor_name,
    pc.polyclinic_name AS poliyclinic_name
FROM appointment a
JOIN patient p ON a.patient_id = p.id
JOIN doctor d ON a.doctor_id = d.id
JOIN polyclinic pc ON d.polyclinic_id = pc.id
WHERE a.doctor_id = 4 AND DATE(a.date_time) = '2025-05-28'
ORDER BY a.date_time;
    -- Appointment and patient information of the doctor with doctor_id = 4 on '2025-05-28' --
    
    
SELECT 
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) < 18 THEN '0-17'
        WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 18 AND 30 THEN '18-30'
        WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 31 AND 45 THEN '31-45'
        WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS patient_count
FROM patient
GROUP BY age_group
ORDER BY age_group;
    -- Distribution of patients according to age groups -- 
    
SELECT pc.polyclinic_name, COUNT(DISTINCT a.patient_id) AS patient_count
FROM polyclinic pc
JOIN doctor d ON pc.id = d.polyclinic_id
JOIN appointment a ON d.id = a.doctor_id
GROUP BY pc.id, pc.polyclinic_name
ORDER BY patient_count DESC;
    -- Number of patients in each polyclinic --
    
    SELECT DISTINCT
    p.id AS patient_id,
    p.name_surname AS patient_name,
    p.birth_date AS birth_date,
    p.phone_no AS phone
FROM patient p
JOIN appointment a ON p.id = a.patient_id
JOIN doctor d ON a.doctor_id = d.id
WHERE d.polyclinic_id = 1
ORDER BY p.name_surname;
    -- List information of patients with polyclinic_id = 1 --
   
   
SELECT 
    a.id AS appointment_id,
    TIME(a.date_time) AS appointment_time,
    p.id AS patient_id,
    p.name_surname AS patient_name,
    p.birth_date AS patient_birth_date,
    p.phone_no AS patient_phone,
    d.id AS doctor_id,
    d.name_surname AS doctor_name,
    pc.polyclinic_name AS polyclinic_name
FROM appointment a
JOIN patient p ON a.patient_id = p.id
JOIN doctor d ON a.doctor_id = d.id
JOIN polyclinic pc ON d.polyclinic_id = pc.id
WHERE TIME(a.date_time) = '14:00:00'
ORDER BY a.date_time;
    
    -- List doctor and patient information for appointments at 14:00:00 --


