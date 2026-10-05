USE hospital_management_system;

CREATE USER 'admin_polyclinic'@'localhost' IDENTIFIED BY 'SecureAdminPass123!';
CREATE USER 'doctor_role'@'localhost' IDENTIFIED BY 'DoctorAccess456!';
CREATE USER 'patient_admin'@'localhost' IDENTIFIED BY 'PatientAdmin789!';


GRANT ALL PRIVILEGES ON polyclinic_db.* TO 'admin_polyclinic'@'localhost';
-- Full privileges for administrator --

GRANT SELECT, INSERT, UPDATE ON polyclinic_db.appointment TO 'doctor_role'@'localhost';
GRANT SELECT, INSERT ON polyclinic_db.prescription TO 'doctor_role'@'localhost';
GRANT SELECT ON polyclinic_db.patient TO 'doctor_role'@'localhost';
GRANT SELECT ON polyclinic_db.doctor TO 'doctor_role'@'localhost';
GRANT SELECT ON polyclinic_db.polyclinic TO 'doctor_role'@'localhost';
-- Doctor privileges (limited access)-- 

GRANT SELECT, INSERT, UPDATE, DELETE ON polyclinic_db.patient TO 'patient_admin'@'localhost';
GRANT SELECT, INSERT, UPDATE ON polyclinic_db.appointment TO 'patient_admin'@'localhost';
GRANT SELECT ON polyclinic_db.doctor TO 'patient_admin'@'localhost';
GRANT SELECT ON polyclinic_db.polyclinic TO 'patient_admin'@'localhost';
-- Patient administrator privileges --