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

create table if not exists Graduate_Student (
GraduateEmail CHAR(20),
Year CHAR(10),
constraint pk_Graduate primary key (GraduateEmail),
constraint fk_Graduate foreign key (GraduateEmail) references Student(StudentEmail)
);

create table if not exists Undergraduate_Student (
UndergradEmail CHAR(20),
Research_area CHAR(10),
constraint pk_Undergraduate primary key (UndergradEmail),
constraint fk_Undergraduate foreign key (UndergradEmail) references Student(StudentEmail)
);

create table if not exists Project (
ProjectId CHAR(20),
ProjectName CHAR(50),
ProfEmail CHAR(50),
constraint pk_Project primary key (ProjectId, ProfEmail),
constraint fk_Professor foreign key (ProfEmail) references Professor(ProfEmail) on delete cascade
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

create table if not exists Advises (
Research_area CHAR(10),
ProfEmail CHAR(20),
GraduateEmail CHAR(20),
constraint pk_Advises primary key (GraduateEmail),
constraint fk_Graduate foreign key (GraduateEmail) references Graduate_Student(GraduateEmail),
constraint fk_Professor foreign key (ProfEmail) references Professor(ProfEmail) 
);

create table if not exists Works_On (
GraduateEmail CHAR(20),
ProjectId CHAR(20),
ProfEmail CHAR(50),
constraint pk_Works_On primary key (GraduateEmail, ProjectId, ProfEmail),
constraint fk_Graduate foreign key (GraduateEmail) references Graduate_Student(GraduateEmail),
constraint fk_Project foreign key (ProjectId) references Project(ProjectId),
constraint fk_ProfEmail foreign key (ProfEmail) references Professor(ProfEmail)
);