--1527. Patients With a Condition
SELECT patient_id, patient_name, conditions
FROM Patients
WHERE CONCAT(' ', conditions, ' ') REGEXP ' DIAB1[0-9]* ';
