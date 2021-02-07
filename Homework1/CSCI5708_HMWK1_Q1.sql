drop schema registration cascade;
create schema if not exists registration;

set search_path to 'registration';

--Entities
create table if not exists Student (
StudentEmail CHAR(20),
Name CHAR(50),
GPA REAL,
constraint pk_Student primary key (StudentEmail)
);

create table if not exists Semester (
SemId CHAR(20),
Name CHAR(20),
constraint pk_Taken primary key (SemId)
);

create table if not exists Course (
CourseId CHAR(20),
Name CHAR(50),
Credits INTEGER,
constraint pk_Course primary key (CourseId)
);

create table if not exists Professor (
ProfEmail CHAR(20),
Name CHAR(50),
constraint pk_Professor primary key (ProfEmail)
);

--Relations

create table if not exists Registers (
StudentEmail CHAR(20),
CourseId CHAR(20),
SemId CHAR(20),
constraint pk_Registers primary key (StudentEmail, SemId, CourseId),
constraint fk_Student foreign key (StudentEmail) references Student(StudentEmail),
constraint fk_Course foreign key (CourseId) references Course(CourseId),
constraint fk_Semester foreign key (SemId) references Semester(SemId)
);

create table if not exists Teaches (
ProfEmail CHAR(20),
Courseid CHAR(20),
constraint pk_Teaches primary key (Courseid),
constraint fk_Professor foreign key (ProfEmail) references Professor(ProfEmail),
constraint fk_Course foreign key (CourseId) references Course(CourseId)
);
