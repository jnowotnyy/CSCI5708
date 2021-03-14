--1.Employee with Id 2 has moved to an address in 55414. Please update this in the database
--and select that employee after the update to ensure that the corresponding tuple has
--been updated.
UPDATE ProjectDB.Employee
SET HomeZipCode = 55414
WHERE EmpId = 2;

SELECT *
FROM ProjectDB.Employee E
WHERE E.EmpId = 2;

--2. Just as a practical joke, increment the graduation year of every graduate who graduated
--before 2002 by three.

UPDATE ProjectDB.Graduate
SET GradYear = GradYear + 3
WHERE GradYear < 2002;

--3. Just another practical joke, decrement the graduation year of every graduate who lives in
--55414 by two.

UPDATE ProjectDB.Graduate
SET GradYear = GradYear - 2
WHERE EmpId IN (
	SELECT E.EmpId
	FROM ProjectDB.Employee E
	WHERE E.HomeZipCode = 55414);

--4. For some reasons, the database owner wants to get rid of everything related to the
--project with Id 2. Please delete all the tuples related to Project 2 (as if that project has
--never existed before).

DELETE FROM ProjectDB.Project P WHERE P.ProjId = 2; --Not sure if this is correct but seems right
