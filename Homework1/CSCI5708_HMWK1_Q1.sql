drop schema registration cascade;
create schema if not exists registration;

set search_path to 'registration';

--Entities
create table if not exists Student (
Email CHAR(20),
Name CHAR(50),
GPA REAL,
constraint pk_Student primary key (Email)
);

create table if not exists Semester (
id CHAR(20),
Name CHAR(20),
constraint pk_Taken primary key (id)
);

create table if not exists Course (
id CHAR(20),
Name CHAR(50),
Credits INTEGER,
constraint pk_Course primary key (id)
);

create table if not exists Professor (
Email CHAR(20),
Name CHAR(50),
constraint pk_Professor primary key (Email)
);

--Relations

create table if not exists Registers (
Email CHAR(20),
id CHAR(20),
Course_id CHAR(20),
constraint pk_Registers primary key (Email, id, Course_id),
constraint fk_Student foreign key (Email) references Student,
constraint fk_Course foreign key (id) references Course,
constraint fk_Taken foreign key (Course_id) references Taken
);

create table if not exists Teaches (
Email CHAR(20),
id CHAR(20),
constraint pk_Registers primary key (id),
constraint fk_Professor foreign key (Email) references Professor(Email) on delete cascade, --key constraint cascade if professor removed?
constraint fk_Course foreign key (id) references Course
);
