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

create table if not exists Category (
CategoryId CHAR(50),
Name CHAR(50),
constraint pk_Category primary key (CategoryId)
);

--Relations

create table if not exists Registers (
StudentEmail CHAR(20),
CourseId CHAR(20),
Semester CHAR(20),
constraint pk_Registers primary key (StudentEmail, CourseId),
constraint fk_Student foreign key (StudentEmail) references Student(StudentEmail),
constraint fk_Course foreign key (CourseId) references Course(CourseId)
);

create table if not exists Teaches (
ProfEmail CHAR(20),
Courseid CHAR(20),
constraint pk_Teaches primary key (Courseid),
constraint fk_Professor foreign key (ProfEmail) references Professor(ProfEmail),
constraint fk_Course foreign key (CourseId) references Course(CourseId)
);


create table if not exists Classifies (
CourseId CHAR(20),
CategoryId CHAR(20),
Name CHAR(50),
constraint pk_Classifies primary key (CourseId, CategoryId),
constraint fk_Course foreign key (CourseId) references Course(CategoryId),
constraint fk_Category foreign key (CategoryId) references Category(CategoryId)
);

create table if not exists Categorizes (
SuperCategoryId CHAR(20),
SubCategoryId CHAR(20),
constraint pk_Classifies primary key (SuperCategoryId, SubCategoryId),
constraint fk_SuperCategory foreign key (SuperCategoryId) references Category(CategoryId),
constraint fk_SubCategory foreign key (SubCategoryId) references Category(CategoryId)
);
