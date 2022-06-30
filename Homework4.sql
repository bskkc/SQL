--Basak CAVUSDAG 201711014
--Find the average salary paid to the employees working in each project together with the project name.
SELECT ProjName, AVG(Salary)
FROM Employee, Projects
WHERE ProjCode=projID
GROUP BY ProjName


--For each project, count the number of employees who are paid less than the average salary of that project.
SELECT ProjName, COUNT(ID)
FROM Employee, Projects AS tbl1
WHERE ProjCode = projID and Salary<(SELECT AVG(Salary)  
         FROM Employee, Projects AS tbl2
         WHERE ProjCode=projID AND
         tbl1.projID = tbl2.projID)
GROUP BY ProjName


--Find the name of the projects which have no employees assigned.
SELECT ProjName
FROM Employee, Projects  
WHERE ProjCode=projID
AND ID IS NULL


--Determine if there is any project with a budget less than the total salary paid to its employees. If yes, find the name of the project and its budget.
SELECT ProjName, Budget
FROM Employee, Projects AS tbl1
WHERE ProjCode=projID AND Budget<(SELECT SUM(Salary)
         FROM Employee AS tbl2
         WHERE tbl1.ProjCode=tbl2.ProjCode
         GROUP BY ProjCode)


--The management wants to know which projects have been finished. Add an attribute to Projects table names status to show the current state of the project (Use SQL)
ALTER TABLE Projects ADD Status varchar(10);