--Entities
--Student(_sid, name, gpa)
--Course(_cid, name, department)

--Relations
--Registers(_sid, _cid, _semester)


-- 1. Find the name of students who take a course with cid = CSci 5708 in Spring 2021.

SELECT S.name 
FROM Student S, Registers R
WHERE S.sid = R.sid
	AND R.cid = "CSci 5708";

--2. Find the student id(s) who have taken all courses within the Computer Science department.

SELECT R.sid
FROM Registers R
WHERE R.cid = (
		SELECT C.cid,
		FROM Courses C,
		WHERE C.department = "Computer Science");


--3. Find the name of the student who has the highest gpa.

SELECT S.name
FROM Student S
HAVING MAX(S.gpa);

--4. Find the student id(s) who have taken the same course in exactly two different semesters.
--For example, Alice takes CSci 5708 in Fall 2020 and Spring 2021 while Bob takes CSci
--5708 in Spring 2020, Fall 2020, and Spring 2021. You should return Alice as the answer

SELECT R.sid
FROM Registers R
HAVING COUNT(R.semester)=2
GROUP BY R.cid;


--5. Find the combination of student id(s) who have taken the same exact courses.
-- Each combination of student i is d(s) must only appear once. For example, Bob 
--and Alice take CSci 5708 and 4707 while Tom takes CSci 5708 only. Only either Bob and Alice or Alice and Bob, but not both, must be returned

SELECT DISTINCT R1.sid, R2.sid
FROM Registers R1, Registers R2
WHERE R1.sid <> R2.sid
	AND R1.cid = (SELECT R1.cid FROM R1) UNION (SELECT R2.cid FROM R2)