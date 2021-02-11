--#1
--Find the names of the employees who are living in Minneapolis (Zip code 55414 or 55455).

SELECT E.EmpName
FROM ProjectDB.Employee E
WHERE E.HomeZipCode = 55414 
    OR E.HomeZipCode = 55455;

--#2
--Find the names of the projects that are currently managed by any manager
SELECT DISTINCT P.ProjName
FROM ProjectDB.ProjectManager PM, ProjectDB.Project P
WHERE PM.ProjId = P.ProjId 
    AND PM.MgrId IS NOT NULL;

--#3
--For each project, display its name as well as the number of employees who are currently
--working on it except for a project without any employees.
SELECT P.ProjName, COUNT(EP.EmpId)
FROM ProjectDB.Project P, ProjectDB.EmpProject EP
WHERE P.ProjId = EP.ProjId
GROUP BY P.ProjName;

--#4
--Find the name(s) of the university/universities that graduated the maximum number of
--distinct managers.
--SELECT U.UnivName
--FROM ProjectDB.University U
--WHERE U.UnivID 
    --IN (SELECT G.UnivId
        --FROM ProjectDB.Graduate G
        --WHERE G.EmpId 
            --IN (SELECT PM.EmpId, MAX(SELECT COUNT(M))))

--#5
--For each employee, say E, display the name of E, the department name of E, and the
--graduation year of E.
SELECT E.EmpName, D.DeptName, G.GradYear
FROM ProjectDB.Employee E, ProjectDB.Department D, ProjectDB.Graduate G
WHERE E.DeptId = D.DeptId 
    AND E.EmpId = G.EmpId;

--#6
--Display the name of the project that has the maximum number of different employees
--who worked/”are working” on it. If more than one project qualify, display all the qualified
--projects. (Hint: refer to EmpProject only and not ProjectManager).
--SELECT P.ProjName
--FROM ProjectDB.Project P
--WHERE ProjId = (SELECT MAX(EP.EmpId)
--                FROM ProjectDB.EmpProject EP);