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

create table if not exists Category (
id CHAR(50),
Name CHAR(50),
constraint pk_Category primary key (id)
);

--Relations

create table if not exists Registers (
Email CHAR(20),
id CHAR(20),
Semester CHAR(20),
constraint pk_Registers primary key (Email, id),
constraint fk_Student foreign key (Email) references Student,
constraint fk_Course foreign key (id) references Course
);

create table if not exists Teaches (
Email CHAR(20),
id CHAR(20),
constraint pk_Registers primary key (id),
constraint fk_Professor foreign key (Email) references Professor(Email) on delete cascade, --key constraint cascade if professor removed?
constraint fk_Course foreign key (id) references Course
);

create table if not exists Classifies(
Course_id CHAR(20),
Category_id CHAR(20),
Name CHAR(50),
constraint pk_Classifies primary key (Course_id, Category_id),
constraint fk_Course foreign key (Course_id) references Course(id),
constraint fk_Category foreign key (Category_id) references Category(id)
);

create table if not exists Categorizes (
SuperCategory_id CHAR(20),
SubCategory_id CHAR(20),
constraint pk_Classifies primary key (SuperCategory_id, SubCategory_id),
constraint fk_SuperCategory foreign key (SuperCategory_id) references Category(id),
constraint fk_SubCategory foreign key (SubCategory_id) references Category(id)
);
