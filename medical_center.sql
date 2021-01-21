-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE offices
(
  id SERIAL PRIMARY KEY,
  office_name TEXT NOT NULL,
  office_address TEXT NOT NULL,
  phone TEXT UNIQUE NOT NULL,
);


CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  dr_name TEXT NOT NULL,
  office_id INT REFERENCES office(id)
);


CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  disease_name TEXT UNIQUE NOT NULL,
  description TEXT NOT NULL
);


CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  patient_name TEXT UNIQUE NOT NULL,
  doctor_id INT REFERENCES doctors(id)
  disease_id INT REFERENCES disease(id)
);