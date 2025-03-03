show databases;
-- ==========================
create database employee;
-- ==========================
use employee;
-- ==========================
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT FROM emp_record_table;
-- ==========================
-- Employees with rating less than 2
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING 
FROM emp_record_table 
WHERE EMP_RATING < 2;

-- Employees with rating greater than 4
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING 
FROM emp_record_table 
WHERE EMP_RATING > 4;

-- Employees with rating between 2 and 4
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING 
FROM emp_record_table 
WHERE EMP_RATING BETWEEN 2 AND 4;

-- Finance Dept concatenated name
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME 
FROM emp_record_table 
WHERE DEPT = 'Finance';

-- managers with reportee
SELECT MANAGER_ID, COUNT(*) AS Reporters 
FROM emp_record_table 
WHERE MANAGER_ID IS NOT NULL 
GROUP BY MANAGER_ID;

-- Healthcare and Finance
SELECT * FROM emp_record_table WHERE DEPT = 'Healthcare'
UNION
SELECT * FROM emp_record_table WHERE DEPT = 'Finance';

-- Group employees by Department and show Ratings
SELECT DEPT, EMP_ID, FIRST_NAME, LAST_NAME, ROLE, EMP_RATING, 
       MAX(EMP_RATING) OVER (PARTITION BY DEPT) AS Max_Rating
FROM emp_record_table;

-- Minimum and Maximum Salary by Role
SELECT ROLE, MIN(SALARY) AS Min_Salary, MAX(SALARY) AS Max_Salary 
FROM emp_record_table 
GROUP BY ROLE;

-- Rank based on exp
SELECT EMP_ID, FIRST_NAME, LAST_NAME, EXP, 
       RANK() OVER (ORDER BY EXP DESC) AS Rank_Exp
FROM emp_record_table;

-- view
CREATE VIEW High_Salary_Employees AS
SELECT * FROM emp_record_table WHERE SALARY > 6000;

-- nested query
SELECT * FROM emp_record_table 
WHERE EXP > (SELECT AVG(EXP) FROM emp_record_table WHERE EXP > 10);

-- stored procedure
DELIMITER //
CREATE PROCEDURE Get_Experienced_Employees()
BEGIN
    SELECT * FROM emp_record_table WHERE EXP > 3;
END //
DELIMITER ;
CALL Get_Experienced_Employees();

-- stored func 
DELIMITER //
CREATE FUNCTION Get_Job_Profile(exp INT) 
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN CASE 
        WHEN exp <= 2 THEN 'JUNIOR DATA SCIENTIST'
        WHEN exp BETWEEN 3 AND 5 THEN 'ASSOCIATE DATA SCIENTIST'
        WHEN exp BETWEEN 6 AND 10 THEN 'SENIOR DATA SCIENTIST'
        WHEN exp BETWEEN 11 AND 12 THEN 'LEAD DATA SCIENTIST'
        WHEN exp BETWEEN 13 AND 16 THEN 'MANAGER'
        ELSE 'UNKNOWN'
    END;
END //
DELIMITER ;
SELECT EMP_ID, FIRST_NAME, LAST_NAME, EXP, Get_Job_Profile(EXP) AS Job_Profile 
FROM data_science_team;

-- indexing
CREATE INDEX idx_first_name ON emp_record_table(FIRST_NAME);
EXPLAIN SELECT * FROM emp_record_table WHERE FIRST_NAME = 'Eric';

-- bonus calculation
SELECT EMP_ID, FIRST_NAME, SALARY, EMP_RATING, 
       (0.05 * SALARY * EMP_RATING) AS Bonus 
FROM emp_record_table;

-- salary distribution based on country and ..
SELECT CONTINENT, COUNTRY, AVG(SALARY) AS Avg_Salary 
FROM emp_record_table 
GROUP BY CONTINENT, COUNTRY;













