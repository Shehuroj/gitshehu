DROP DATABASE School_DB;

CREATE DATABASE School_DB;

CREATE TABLE Student_table (
Stud_id INTEGER PRIMARY KEY,
First_Name Varchar(50) Not Null,
Last_Name Varchar(50) Not Null,
DOB Date Not Null,
City Varchar(50) Not Null,
State Varchar(50) Not Null,
Instr_id Varchar(6) Not Null,
Phone Varchar(10) Not Null,
Gender Varchar(1) Not Null	
);

CREATE TABLE Instructor_table (
Instr_id Varchar(6) Not Null,
First_Name Varchar(50) Not Null,
Last_Name Varchar(50) Not Null,
Course_id Varchar(6) Not Null,
);

CREATE TABLE Course_table (
Course_id Varchar(6) PRIMARY KEY,
Course_name Varchar(20) Not Null,
Course_credit INTEGER Not Null,
Class_size INTEGER Not Null
);

CREATE TABLE Student_leadership (
Stud_exec_id INTEGER PRIMARY KEY,
First_Name Varchar(50) Not Null,
Last_Name Varchar(50) Not Null,
Stud_id INTEGER Not Null,
Title Varchar(50) Not Null
);

CREATE TABLE Grade_table (
Letter_grade Varchar(1) PRIMARY KEY,
Score INTEGER Not Null,
);

CREATE TABLE Student_grade (
Stud_id INTEGER PRIMARY KEY,
Letter_grade Varchar(1) Not Null,
Course_id Varchar(6) Not Null,
Instr_id Varchar(6) Not Null,
);

-- RELATIONSHIP THROUGH FOREIGN KEYS
-- 1. INSTRUCTOR TABLE
ALTER TABLE Instructor_table
ADD CONSTRAINT FK_INSTRUCTOR_TABLE FOREIGN KEY (Course_id)
REFERENCES COURSE_TABLE (Course_id);

-- 2. STUDENT TABLE 
-- ADD PRIMARY KEY TO INSTRUCTOR TABLE
ALTER TABLE Instructor_table
ADD CONSTRAINT PK_INSTRUCTOR_TABLE PRIMARY KEY(Instr_id);

ALTER TABLE Student_table
ADD CONSTRAINT FK_STUDENT_TABLE FOREIGN KEY (Instr_id)
REFERENCES Instructor_table (Instr_id);

-- 3. STUDENT LEADERSHIP TABLE 
ALTER TABLE Student_leadership
ADD CONSTRAINT FK_Student_leadership_table FOREIGN KEY(Stud_id)
REFERENCES STUDENT_TABLE(Stud_id);

-- 4. STUDENT GRADE TABLE 
ALTER TABLE Student_grade
ADD CONSTRAINT FK_Student_grade_table FOREIGN KEY(Letter_Grade)
REFERENCES GRADE_TABLE(Letter_Grade);

-- 5. STUDENT GRADE TABLE
ALTER TABLE Student_grade
ADD CONSTRAINT FK_Student_grade_table1 FOREIGN KEY(Course_id)
REFERENCES COURSE_TABLE(Course_id);

-- 6. STUDENT GRADE TABLE
ALTER TABLE Student_grade
ADD CONSTRAINT FK_Student_grade_table2 FOREIGN KEY(Instr_id)
REFERENCES INSTRUCTOR_TABLE(Instr_id);

-- CHANGE INTEGER TO VARCHAR(20)
ALTER TABLE Grade_table
ALTER COLUMN SCORE VARCHAR(20) NOT NULL;

-- INSERTING DATA
INSERT INTO Grade_table (Letter_grade, Score)
VALUES ('A', '90 - 100'),('B', '85 - 89'),('C', '80 - 84'),('D', '70 - 79'),('E', '60 - 69'),('F', '0 - 59');
 
 UPDATE Grade_table 
 SET Score = 'VARCHAR(20)'

 DELETE FROM Grade_table
 WHERE Letter_grade IN ('A', 'B', 'C', 'D', 'E', 'F');  
/*DELETE FROM Grade_table
 WHERE Letter_grade = 'A' and 'B' and 'C' and 'D'and 'E' and 'F';
 */
 ALTER TABLE Grade_table
 DROP CONSTRAINT [PK__Grade_ta__E23A3833EAB44F14];

ALTER TABLE Course_table
ALTER COLUMN Course_name VARCHAR(50) NOT NULL;

ALTER TABLE Course_table
ALTER COLUMN Course_id VARCHAR(10) NOT NULL;

ALTER TABLE Student_grade
Drop Constraint FK_Student_grade_table;

ALTER TABLE Student_grade
Drop Constraint FK_Student_grade_table1;

ALTER TABLE Student_grade
Drop Constraint FK_Student_grade_table2;

ALTER TABLE Instructor_table
Drop Constraint FK_INSTRUCTOR_TABLE;

ALTER TABLE Student_leadership
Drop Constraint FK_Student_leadership_table;


DELETE FROM Course_table 
WHERE Course_id IN ('Soc101', 'Math102', 'His304', 'Soc401', 'Phi400'); 

ALTER TABLE Course_table
ALTER COLUMN Course_id VARCHAR(10); 

ALTER TABLE Course_table
DROP CONSTRAINT [PK__Course_t__37E309C3E359C6AB];

INSERT INTO Course_table (Course_id, Course_name, Course_credit, Class_size)
VALUES ('Soc101', 'Fundamentals of Scociology', 3, 30),
('Math102', 'Elementary Calculus', 3, 25),
('His304', 'Intermediate US History', 3, 15),
('Soc401', 'Advanced Sociology', 3, 40),
('Phi400', 'Advanced Physiology', 3, 20); 

ALTER TABLE Instructor_table
DROP CONSTRAINT [PK_INSTRUCTOR_TABLE]; 

ALTER TABLE STUDENT_TABLE
DROP CONSTRAINT [PK__Student___09AFA909E605569C];

ALTER TABLE Instructor_table
ALTER COLUMN Instr_id VARCHAR(10) NOT NULL;

INSERT INTO Instructor_table (Instr_id,First_Name,Last_Name,Course_id)
VALUES ('In10001', 'Adeleye', 'Adewuyi', 'Math102'),
('In10002', 'Martin', 'Gold', 'Phi400'),
('In10003','Fatiu', 'Ahmad', 'Soc101'),
('In10004', 'Bharath', 'Mandadi', 'His304'),
('In10005', 'Eric', 'Forson', 'Soc401');

DELETE FROM Instructor_table 
WHERE Instr_id IN ('In10001', 'In10002', 'In10003', 'In10004', 'In10005'); 

ALTER TABLE Instructor_table
ALTER COLUMN Course_id VARCHAR(10); 

ALTER TABLE Instructor_table
ALTER COLUMN Instr_id VARCHAR(10);

ALTER TABLE Instructor_table
DROP CONSTRAINT [PK_INSTRUCTOR_TABLE];

INSERT INTO Student_table (Stud_id, First_Name, Last_Name, DOB, City, State, Instr_id, Phone, Gender) 
VALUES (1, 'Joseph', 'Ahene', '11/25/1980', 'Baltimore', 'Maryland', 'In10004', 4321053421, 'M'),
(2, 'Precious', 'Owusu', '09/11/1982', 'Columbia', 'Maryland', 'In10003', 4321762243, 'F'), 
(3, 'Eni', 'Edo', '01/06/1979', 'Bronx', 'New York', 'In10002', 5011053421, 'F'), 
(4, 'Felix', 'Emeka', '12/01/1984', 'Newark', 'New Jersey', 'In10005', 7011762243, 'M'), 
(5, 'Mercy', 'Johnson', '04/20/1981', 'Wilmington', 'Delaware', 'In10005', 3011053421, 'F'),
(6, 'Lilian', 'Asong', '08/19/1986', 'Owings Mills', 'Maryland', 'In10003', 4321761432, 'F'), 
(7, 'Prince', 'Williams', '06/04/1989', 'Silver Spring', 'Maryland', 'In10004', 4324432211, 'M'), 
(8, 'Grace', 'Bonnie', '05/13/1985', 'Knoxville', 'Tennessee', 'In10001', 8651762243, 'F'), 
(9, 'Leomie', 'Titus', '05/20/1986', 'Nashville', 'Tennessee', 'In10001', 8651053421, 'F'), 
(10, 'Magic', 'Johnson', '09/01/1978', 'Falls Church', 'Virginia', 'In10002', 7241762243, 'M'), 
(11, 'Henry', 'Edwards', '02/12/1983', 'Boston', 'Massachusetts', 'In10002', 9031053421, 'M'), 
(12, 'George', 'Phillips', '12/04/1980', 'San Francisco', 'California', 'In10001', 4631762241, 'M'),
(13, 'Frederick', 'Benson', '01/01/1978', 'Wilmington', 'Delaware', 'In10003', 3011222411, 'M'), 
(14, 'Christy', 'Jones', '10/10/1991', 'Frederick', 'Maryland', 'In10005', 4321764444, 'F'),
(15, 'Princess', 'Brown', '06/04/1989', 'Tulsa', 'Oklahoma', 'In10001', 4234432211, 'F'), 
(16, 'Hillary', 'Morgan', '11/13/1990', 'Tampa', 'Florida', 'In10001', 6411765432, 'F');

ALTER TABLE Student_table
ALTER COLUMN Instr_id VARCHAR(10);

-- Student Grade Table
INSERT INTO Student_grade (Stud_id, Letter_grade, Course_id)
VALUES (1,	'A', 'Soc401'),
(2,	'B', 'Phi400'),
(3,	'B', 'His304'),
(4,	'A', 'Mat102'),
(5,	'C', 'Soc101'),
(6,	'D', 'His304'),
(7,	'B', 'Phi400'),
(8,	'A', 'Mat102'),
(9,	'C', 'Soc401'),
(10, 'A', 'Mat102'),
(11, 'D', 'His304'),
(12, 'F', 'Soc101'),
(13, 'A', 'Mat102'),
(14, 'A', 'His304'),
(15, 'B', 'Mat102'),
(16, 'C', 'His304');

ALTER TABLE Student_grade
ALTER COLUMN Instr_id Varchar(6) Null;

-- Student Leadership Table
ALTER TABLE Student_leadership
ALTER COLUMN  First_Name Varchar(50) Null;

ALTER TABLE Student_leadership
ALTER COLUMN Last_Name Varchar(50) Null;

INSERT INTO Student_leadership (Stud_exec_id, Stud_id, Title)
VALUES (7, 100, 'President'),
(2, 101, 'Vice President'),
(4, 103, 'Secretary'),
(3, 104, 'Treasurer'),
(11, 105, 'Advisor'),
(16, 106, 'Organizer'); 

--A. Assuming my name is Prince Williams, Stud_id = 7
SELECT *  
FROM Student_table
WHERE Stud_id = 7;

-- B. Change Asong to Basong
UPDATE Student_table
SET Last_Name = 'Basong'
WHERE Stud_id = 6;

ALTER TABLE Student_grade
ALTER COLUMN Instr_id VARCHAR(10);

DELETE FROM Student_grade  
WHERE Stud_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16); 

INSERT INTO Student_grade (Stud_id, Letter_grade, Course_id)
VALUES (1,	'C', 'Mat102'),
(2,	'A', 'Soc401'),
(3,	'F', 'Mat102'),
(4,	'D', 'His304'),
(5,	'B', 'Soc101'),
(6,	'A', 'MAT102'),
(7,	'E', 'His304'),
(8,	'D', 'Mat102'),
(9,	'F', 'Soc401'),
(10, 'B', 'Mat102'),
(11, 'D', 'His304'),
(12, 'C', 'Soc101'),
(13, 'C', 'Mat102'),
(14, 'A', 'His304'),
(15, 'A', 'Mat102'),
(16, 'D', 'His304'); 