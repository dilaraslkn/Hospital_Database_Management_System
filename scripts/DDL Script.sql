CREATE DATABASE hospital_management_system;
USE hospital_management_system;


CREATE TABLE polyclinic (
id INT Not Null PRIMARY KEY,
polyclinic_name varchar(100) Not Null
);

CREATE TABLE doctor (
id INT Not Null PRIMARY KEY,
name_surname varchar(100) Not Null,
polyclinic_id INT Not Null,
phone_no varchar(100) Not Null,
FOREIGN KEY(polyclinic_id) references polyclinic(id) ON DELETE restrict ON UPDATE restrict
);

CREATE TABLE patient (
id INT Not Null PRIMARY KEY,
name_surname varchar(100) Not Null,
birth_date date Not Null,
phone_no varchar(100) Not Null
);

CREATE TABLE appointment (
id INT Not Null PRIMARY KEY,
doctor_id INT Not Null,
patient_id INT Not Null,
date_time datetime Not Null,
FOREIGN KEY(doctor_id) references doctor(id) ON DELETE cascade ON UPDATE cascade,
FOREIGN KEY(patient_id) references patient(id) ON DELETE cascade ON UPDATE cascade
);

CREATE TABLE prescription (
id INT Not Null PRIMARY KEY,
patient_id INT Not Null,
doctor_id INT Not Null,
date date Not Null,
FOREIGN KEY(patient_id) references patient(id) ON DELETE cascade ON UPDATE cascade,
FOREIGN KEY(doctor_id) references doctor(id) ON DELETE cascade ON UPDATE cascade
);

