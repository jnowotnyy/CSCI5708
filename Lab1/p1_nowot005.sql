drop schema ProjectDB cascade;
create schema if not exists ProjectDB;

set search_path to 'ProjectDB';

create table if not exists University (
UnivId NUMERIC,
UnivName VARCHAR(40),
constraint pk_University PRIMARY KEY (UnivId)
);

create table if not exists Department (
DeptId NUMERIC,
DeptName VARCHAR(40),
constraint pk_Department PRIMARY KEY (DeptId)
);

create table if not exists Employee (
EmpId NUMERIC,
EmpName VARCHAR(40),
DeptId NUMERIC,
HomeZipCode NUMERIC,
constraint pk_Employee PRIMARY KEY (EmpId),
constraint fk_Department FOREIGN KEY (DeptId) REFERENCES Department(DeptId)
);

create table if not exists Project (
ProjId NUMERIC,
ProjName VARCHAR(40),
constraint pk_Project PRIMARY KEY (ProjId)
);

create table if not exists Graduate (
EmpId NUMERIC,
UnivId NUMERIC,
GradYear NUMERIC,
constraint pk_Graduate PRIMARY KEY (EmpId),
constraint fk_Employee FOREIGN KEY (EmpId) REFERENCES Employee(EmpId),
constraint fk_University FOREIGN KEY (UnivId) REFERENCES University(UnivId)
);

create table if not exists EmpProject (
EmpId NUMERIC,
ProjId NUMERIC,
constraint pk_EmpProject PRIMARY KEY (EmpId, ProjId),
constraint fk_Employee FOREIGN KEY (EmpId) REFERENCES Employee(EmpId),
constraint fk_Project FOREIGN KEY (ProjId) REFERENCES Project(ProjId)
)

create table if not exists ProjectManager (
ProjId NUMERIC,
MgrId NUMERIC,
constraint pk_ProjectManager PRIMARY KEY (ProjId, MgrId),
constraint fk_Project FOREIGN KEY (ProjId) REFERENCES Project(ProjId),
constraint fk_Manager FOREIGN KEY (MgrId) REFERENCES Employee(EmpId)
)