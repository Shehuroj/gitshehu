-- DML Commands (Data Manipulation Language) used to manipulate objects in our table
--1. INSERT
-- Inserting records into PERSONS Table Specifying Column
INSERT INTO anothertable(ID, FNAME, LNAME)
VALUES(1, 'ADE', 'OLA'),
(2, 'JIDE', 'KHADIJAH'),
(3, 'DEJI', 'SHEHU');

-- Inserting records into PERSONS Table Without Specifying Column
INSERT INTO NewTable(ID, FNAME, DOB)
VALUES(1, 'Kola', '06/19/2020'),
(2, 'SHADE', '08/27/1988'),
(3, 'LAOLU', '11/06/1991');

--2. UPDATE
-- UPDATING RECORDS IN NewTable WITHOUT FILTER(WHERE)
UPDATE NewTable
SET FNAME = 'SHOLA';

-- UPDATING RECORDS IN NewTable WITH FILTER WHERE
UPDATE NewTable
SET FNAME = 'LANRE'
WHERE ID = 1;

--3. DELETE
-- DELETING RECORDS IN NewTable WITH FILTER WHERE
DELETE FROM NewTable
WHERE ID = 2;

--4. SELECT
-- SELECT ALL RECORDS FROM A TABLE WITHOUT COLUMN NAME
SELECT * FROM NewTable

-- SELECT ALL RECORDS FROM A TABLE WITH COLUMN NAME
SELECT ID, FNAME
FROM NewTable;

SELECT ID, FNAME, DOB
FROM NewTable
WHERE ID >2;