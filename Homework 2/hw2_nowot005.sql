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

