-- AGGREGATE FUNCTION (Use to perform calculation on values or set us of values and return a single value)
-- 1. SUM
/*
SELECT SUM(1 + 1);

-- SUMMING VALUES IN OUR DATABASE
-- GETTING TOTAL SUM VALUES WITHOUT OTHER COLUMN(S)
-- 2. AVERAGE
-- 3. SUM
*/
SELECT ROUND(TRUNCATE(MOD(2500, 20), -1), 2);

SELECT DATEDIFF(week, '2005-12-31', '2006-01-01'); 
SELECT DATEDIFF(hour, '2005-12-31', '2006-01-01');
SELECT CAST('2007-05-08 12:35:30' AS smalldatetime);