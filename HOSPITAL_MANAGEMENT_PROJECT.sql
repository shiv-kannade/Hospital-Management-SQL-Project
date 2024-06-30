CREATE DATABASE HMS ;

USE HMS ;


--> CREATE PATIENT TABLE 

CREATE TABLE PATIENT (PatientID VARCHAR(20) PRIMARY KEY , Fname VARCHAR(100) , Lname VARCHAR(100) ,Contact VARCHAR(15) NOT NULL UNIQUE ,AGE INT );

INSERT INTO PATIENT 
VALUES ('P0001','John','Doe','123-456-7890',35) ,('P0002','Jane','Smith','987-654-3210',25);

INSERT INTO PATIENT 
VALUES ('P0003','Michael','Johnson','555-555-5555',62) ,('P0004','David','Lee','111-222-3333',33),
       ('P0005','Sarah','Brown','444-555-6666',21), ('P0006','John','Doe','777-888-9999',28),
	   ('P0007','Jane','Smith','333-222-1111',30), ('P0008','Michael','Johnson','666-777-8888',41),
	   ('P0009','David','Lee','999-888-7777',41) , ('P0010','Sarah','Brown','222-333-4444',60)
	  
SELECT * FROM PATIENT ;


---> CREATE DOCTOR TABLE 

CREATE TABLE DOCTOR (DOCTORID VARCHAR(20) PRIMARY KEY , D_Fname VARCHAR(40) , D_Lname VARCHAR(50) ,
Speciality VARCHAR(100) NOT NULL ,ContactEmail VARCHAR(100) NOT NULL UNIQUE ) ;


INSERT INTO DOCTOR VALUES
('D0001','Dr. John','Doe','General Physician','john.doe@example.com'),
('D0002','Dr. Jane','Smith','Pediatrician','jane.smith@example.com'),
('D0003','Dr. Michael','Johnson','Cardiologist','michael.j@example.com') ;

SELECT * FROM DOCTOR ;

---> CREATE TABLE APPOIMENT

CREATE TABLE APPOIMENT(AppointmentID VARCHAR(20) PRIMARY KEY , PatientID VARCHAR(20) FOREIGN KEY REFERENCES PATIENT(PATIENTID) ,   
DOCTORID VARCHAR(20) FOREIGN KEY REFERENCES  DOCTOR(DOCTORID),Date DATETIME  , EndTime DATETIME , Status VARCHAR(50) ) ;

INSERT INTO APPOIMENT VALUES
('A0001','P0001','D0001','11/7/23 10:00','11/7/23 11:15','Scheduled'),
('A0002','P0002','D0002','11/8/23 11:00','11/8/23 12:06','Completed'),
('A0003','P0003','D0003','11/9/23 12:00','11/9/23 1:21','Cancelled'),
('A0004','P0002','D0001','11/10/23 13:00','11/10/23 14:17','Scheduled'),
('A0005','P0005','D0002','11/11/23 14:00','11/11/23 15:45','Completed'),
('A0006','P0006','D0003','11/12/23 15:00','11/12/23 16:15','Cancelled'),
('A0007','P0007','D0001','11/13/23 16:00','11/13/23 17:09','Scheduled'),
('A0008','P0008','D0002','11/14/23 17:00','11/14/23 18:29','Completed'),
('A0009','P0004','D0003','11/15/23 18:00','11/15/23 19:11','Cancelled'),
('A0010','P0010','D0001','11/16/23 19:00','11/16/23 20:05','Scheduled') ;

SELECT * FROM APPOIMENT ;


---> CREATE TABLE PATIENT ATTEND APPOINT 

CREATE TABLE PATIENT_ATTEND (PatientID VARCHAR(20) FOREIGN KEY REFERENCES PATIENT(PATIENTID) , AppointmentID VARCHAR(20) FOREIGN KEY  REFERENCES APPOIMENT(AppointmentID)) ;

INSERT INTO PATIENT_ATTEND VALUES
('P0001' ,'A0001') ,
('P0002' ,'A0002') ,
('P0003' ,'A0003') ,
('P0004' ,'A0004') ,
('P0005' ,'A0005') ,
('P0006' ,'A0006') ,
('P0007' ,'A0007') ,
('P0008' ,'A0008') ,
('P0009' ,'A0009') ,
('P0010' ,'A0010') ,
('P0001' ,'A0004') ,
('P0002' ,'A0005') ,
('P0003' ,'A0006') ;

SELECT * FROM PATIENT_ATTEND ;

----> CREATE MEDICAL HISTORY TABLE 

CREATE TABLE MEDICAL_HISTORY(HistoryID VARCHAR(20) PRIMARY KEY , PatientID VARCHAR(20) FOREIGN KEY REFERENCES PATIENT(PatientID) ,
 Date DATETIME , Condition VARCHAR(100) , Surgeries VARCHAR(100) , Medication VARCHAR(100) );

 INSERT INTO MEDICAL_HISTORY VALUES
 ('H0001','P0001','11/1/23 8:00','Hypertension','Appendectomy','Lisinopril'),
 ('H0002','P0002','11/2/23 9:00','Diabetes','None','Metformin'),
 ('H0003','P0003','11/3/23 10:00','Asthma','Tonsillectomy','Albuterol'),
 ('H0004','P0004','11/4/23 11:00','Migraine','Appendectomy','Ibuprofen'),
 ('H0005','P0005','11/5/23 12:00','Diabetes','None','Insulin'),
 ('H0006','P0006','11/6/23 13:00','Asthma','Tonsillectomy','Albuterol'),
 ('H0007','P0007','11/7/23 14:00','Hypertension','Appendectomy','Lisinopril'),
 ('H0008','P0008','11/8/23 15:00','Diabetes','None','Metformin'),
 ('H0009','P0009','11/9/23 16:00','Asthma','Tonsillectomy','Albuterol'),
 ('H0010','P0010','11/10/23 17:00','Migraine','Appendectomy','Ibuprofen');

 SELECT * FROM MEDICAL_HISTORY ;


 ---> CREATE PATIENT_FILL_HISTORY TABLE 

 CREATE TABLE PATIENT_FILL_HISTORY(PatientID VARCHAR(20) FOREIGN KEY REFERENCES PATIENT(PatientID),
 HistoryID VARCHAR(20) FOREIGN KEY REFERENCES MEDICAL_HISTORY(HistoryID),DateFilled DATETIME)

 INSERT INTO PATIENT_FILL_HISTORY VALUES 
 ('P0001','H0001','11/4/23 8:30'),
 ('P0002','H0002','11/5/23 9:45'),
 ('P0003','H0003','11/6/23 10:30'),
 ('P0004','H0004','11/7/23 11:15'),
 ('P0005','H0005','11/8/23 12:45'),
 ('P0006','H0006','11/9/23 13:30'),
 ('P0007','H0007','11/10/23 14:15'),
 ('P0008','H0008','11/11/23 15:45'),
 ('P0009','H0009','11/12/23 16:30'),
 ('P0010','H0010','11/13/23 17:15');

 SELECT * FROM PATIENT_FILL_HISTORY ;

 ---> CREATE TABLE MEDICATION_COST
 CREATE TABLE MEDICATION_COST(Medication VARCHAR(100),Cost_in$ INT);

 INSERT INTO MEDICATION_COST VALUES 
 ('Lisinopril',10),
 ('Metformin',15),
 ('Albuterol',12),
 ('Ibuprofen',8),
 ('Insulin',20);


 SELECT * FROM MEDICATION_COST ;

---> ALL TABLE DETAILS 

SELECT * FROM PATIENT ;
SELECT * FROM DOCTOR ;
SELECT * FROM APPOIMENT ;
SELECT * FROM PATIENT_ATTEND ;
SELECT * FROM MEDICAL_HISTORY ;
 SELECT * FROM PATIENT_FILL_HISTORY ;
  SELECT * FROM MEDICATION_COST ;


---Q1) Find the names of patients who have COMPLETED appointments OR scheduled  by Dr. John Doe.

SELECT FNAME , LNAME , STATUS 
FROM PATIENT
INNER JOIN APPOIMENT 
ON PATIENT.PatientID = APPOIMENT.PatientID 
WHERE STATUS IN('Scheduled','Completed') AND DOCTORID = (SELECT DOCTORID FROM DOCTOR WHERE D_FNAME = 'DR. JOHN' AND D_LNAME = 'DOE');


---Q2) Calculate the average age of all patients.

SELECT AVG(AGE) AVG_AGE FROM PATIENT ;


--Q3) Find the names of patients along with their appointment details and the corresponding doctor's name.

SELECT AppointmentID , CONCAT(FNAME, ' '  ,LNAME)  AS PATIENT_NAME  , CONCAT(D_FNAME ,' ' ,D_LNAME ) AS DOCTOR_NAME , DATE ,ENDTIME , STATUS 
FROM APPOIMENT 
INNER JOIN PATIENT 
ON APPOIMENT.PATIENTID = PATIENT.PATIENTID 
INNER JOIN DOCTOR
ON APPOIMENT.DOCTORID = DOCTOR.DOCTORID ;

--Q4) Find the patients who have a medical history of diabetes and their next appointment is scheduled within the next 7 days(TODAYS DATE 2023-11-05)

SELECT FNAME , LNAME , CONDITION , MEDICAL_HISTORY.DATE , APPOIMENT.DATE  
FROM APPOIMENT
INNER JOIN MEDICAL_HISTORY 
ON APPOIMENT.PATIENTID = MEDICAL_HISTORY.PatientID
INNER JOIN PATIENT 
ON APPOIMENT.PATIENTID = PATIENT.PATIENTID 
WHERE MEDICAL_HISTORY.DATE + 7 <= APPOIMENT.DATE  AND CONDITION = 'Diabetes';


-->Q5) Find patients who have multiple appointments scheduled.

WITH CTE AS (
SELECT PATIENTID , COUNT(AppointmentID) AS TOTAL_APPOIMENT FROM APPOIMENT
 GROUP BY PATIENTID
 HAVING COUNT(AppointmentID) > 1 )
 SELECT PATIENT.PatientID , FNAME , LNAME , TOTAL_APPOIMENT 
 FROM PATIENT 
 INNER JOIN CTE
 ON PATIENT.PATIENTID = CTE.PATIENTID ;

 -->Q6) Calculate the average duration of appointments for each doctor

 WITH CTE AS(
 SELECT DOCTORID , AVG(DATEDIFF( MINUTE , DATE , ENDTIME )) AS AVG_DURATION  
  FROM APPOIMENT 
  GROUP BY DOCTORID)
  SELECT  DOCTOR.DOCTORID D_FNAME , D_LNAME , AVG_DURATION
    FROM DOCTOR 
	INNER JOIN CTE
	ON DOCTOR.DOCTORID = CTE.DOCTORID;


---> Q7 Find Patients with Most Appointments

WITH CTE AS (
SELECT PATIENTID , COUNT(AppointmentID) AS TOTAL_APPOIMENT FROM APPOIMENT
 GROUP BY PATIENTID)
 SELECT TOP 1 PATIENT.PatientID , FNAME , LNAME , TOTAL_APPOIMENT 
 FROM PATIENT 
 INNER JOIN CTE
 ON PATIENT.PATIENTID = CTE.PATIENTID
 ORDER BY TOTAL_APPOIMENT DESC;


 --->Q8) Calculate the total cost of medication for each patient.

 WITH CTE AS (
 SELECT PATIENTID  ,  SUM(COST_IN$) AS TOTAL_MEDICATION_COST_IN_$ 
 FROM MEDICAL_HISTORY
 INNER JOIN MEDICATION_COST
 ON MEDICAL_HISTORY.MEDICATION = MEDICATION_COST.Medication 
 GROUP BY PATIENTID)
 SELECT CTE.PATIENTID , FNAME , LNAME ,TOTAL_MEDICATION_COST_IN_$ 
 FROM PATIENT 
 INNER JOIN CTE
 ON PATIENT.PATIENTID = CTE.PATIENTID ;


 --->Q9) Create a stored procedure to get the total number of appointments for a given patient.


 CREATE PROCEDURE PRE1
 AS 
 BEGIN 

WITH CTE AS (
SELECT PATIENTID , COUNT(AppointmentID) AS TOTAL_APPOIMENT FROM APPOIMENT
 GROUP BY PATIENTID) 
 SELECT  PATIENT.PatientID , FNAME , LNAME , TOTAL_APPOIMENT 
 FROM PATIENT 
 INNER JOIN CTE
 ON PATIENT.PATIENTID = CTE.PATIENTID ;
END ;


 PRE1 ;



 ---> Q10) Create a stored procedure named CalculatePatientBill that calculates the total bill for a patient based on their
 --------- medical history and medication costs. The procedure should take the PatientID as a parameter and calculate the total cost 
 ----     by summing up the medication costs and applying a charge of $50 for each surgery in the patient's medical history. If the patient has
 ----     no medical history, the procedure should still return a basic charge of $50.


 CREATE PROCEDURE CalculatePatientBill 
 AS 
 BEGIN 
   
WITH CTE AS
  (SELECT PATIENTID  ,  SUM(COST_IN$) AS TOTAL_MEDICATION_COST_IN_$ 
 FROM MEDICAL_HISTORY
 INNER JOIN MEDICATION_COST
 ON MEDICAL_HISTORY.MEDICATION = MEDICATION_COST.Medication 
 GROUP BY PATIENTID),
  CTE2 AS
 (SELECT PATIENTID , CASE WHEN COUNT(SURGERIES)> 0 THEN COUNT(SURGERIES)*50 ELSE 0 END AS TOTAL_SURGERIES_COST_IN_$ 
 FROM MEDICAL_HISTORY
 WHERE SURGERIES <> 'NONE'
 GROUP BY PATIENTID)

 SELECT CTE.PATIENTID ,FNAME , LNAME ,  TOTAL_MEDICATION_COST_IN_$ ,CASE WHEN TOTAL_SURGERIES_COST_IN_$ IS NOT NULL THEN TOTAL_SURGERIES_COST_IN_$ ELSE 0 END AS SURGERY_COST   ,
 TOTAL_MEDICATION_COST_IN_$+CASE WHEN TOTAL_SURGERIES_COST_IN_$ IS NOT NULL THEN TOTAL_SURGERIES_COST_IN_$ ELSE 0 END+50 AS TOTAL_BILL 
 FROM CTE
  LEFT JOIN CTE2
 ON CTE.PATIENTID = CTE2.PATIENTID 
 INNER JOIN PATIENT
 ON CTE.PATIENTID = PATIENT.PATIENTID ; 
 END ;

 
 EXEC CalculatePatientBill 



---> Q11) Create a trigger to update the appointment status to 'Completed' when the appointment date has passed.

CREATE TRIGGER trg_appointment_status
ON APPOIMENT
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the status to 'Completed' for appointments where the EndTime has passed
    UPDATE APPOIMENT
    SET Status = 'Completed'
    WHERE EndTime < GETDATE() AND Status <> 'Completed';
END;


UPDATE APPOIMENT SET ENDTIME = '2023-11-10 14:20:00.000'
WHERE APPOINTMENTID = 'A0004';

SELECT * FROM APPOIMENT ;

