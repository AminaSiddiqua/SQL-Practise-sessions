use fsda_ineuron; 
CREATE TABLE IF NOT EXISTS AM_STUDENT (
student_id int AUTO_INCREMENT PRIMARY KEY,
student_name varchar(40),
course_id int,
duration int
);




CREATE TABLE AM_Persons (PersonID int NOT NULL PRIMARY KEY,
LastName varchar(255) NOT NULL, FirstName varchar(255),
ReportsTo int, Title varchar(255));

insert into Persons 
values (1,'Jha','Anand',8,'Data Analyst'),
       (8,'M','Sangeetha',10,'Manager.'),
       (2,'Chaturvedi','Ishan',8,'Data Scientist'),
       (10,'Shekhar','Srinu',123,'Tech Lead'),
       (4,'MESHRAM','VINEET',10,'Consultant'),
       (123,'Goel','Neha',134,'Manager'),
       (20,'kumar','sathish', 18,'Data Engineer'),
       (18,'GUPTA','ANKITA',10,'Business Architect'),
       (7, 'Yadav', 'Abhishek', 10, 'Data Analyst'),
       (134,'Dixit','Nitesh',27,'VP'),
       (27,'Bandekar','Kalpana',32,'CEO');
       
       select * from Persons;

--- list of employees who reports to the same manager
SELECT distinct p1.PersonID as emp_id, 
CONCAT(p1.FirstName, ' ', p1.LastName) AS empfullName,p2.ReportsTo as manager_id
FROM AM_Persons AS p1, AM_Persons p2
WHERE p1.PersonID <> p2.PersonID
AND p1.ReportsTo = p2.ReportsTo
order by emp_id,empfullName,manager_id;

-- list of all the reportee/manager and the number of employees directly reporting to them

SELECT DISTINCT P2.ReportsTo as Manager_id,
count(DISTINCT P1.PersonID) as Total_Emp_Reporting
from AM_Persons AS P1, AM_Persons P2
WHERE P1.PersonID <> P2.PersonID
AND P1.ReportsTo = P2.ReportsTo
Group by 1
order by 1;

---- list of all the employee and their managers incharge---
--- use inner join if we would like to see employee reporting to manager--
--- there might be some who dont report to anyone like CEO so how to filter those results, using left outer join--
SELECT CONCAT(b.LastName, ',' , b.FirstName) AS ReportingTo,
CONCAT(a.FirstName, ' ', a.LastName) AS Manager
From AM_Persons b
INNER JOIN AM_Persons a on a.PersonID = b.ReportsTo
ORDER BY Manager;

SELECT CONCAT(b.LastName, ',' , b.FirstName) AS ReportingTo,
CONCAT(a.FirstName, ' ', a.LastName) AS Manager
From AM_Persons b
LEFT OUTER JOIN AM_Persons a on a.PersonID = b.ReportsTo
ORDER BY Manager;

----
SELECT CONCAT(a.FirstName, ' ', a.LastName) AS Manager,
count(a.PersonID) as TOT_Reportee
FROM AM_Persons b
LEFT OUTER JOIN AM_Persons a on a.PersonID = b.ReportsTo
Group by 1
order by 2;


--- using Having with Group by---
SELECT CONCAT(a.FirstName, ' ', a.LastName) AS Manager,
count(a.PersonID) as TOT_Reportee
FROM AM_Persons b
LEFT OUTER JOIN AM_Persons a on a.PersonID = b.ReportsTo
Group by 1
having TOT_REPORTEE >=2
order by 2;






