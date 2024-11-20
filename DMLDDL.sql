create database SchoolG20
go
use SchoolG20
go

create table faculty
(
Faculty_ID int identity(101,1) primary key,
FacultyName varchar(20),
City varchar(20) not null,
Mobile numeric(10) not null unique,
Mailid varchar(30) unique
)

create table Subjects
(
Sub_id int primary key,
SubName varchar(20),
Weightage smallint
)
go

sp_rename faculty , Faculty

create table Students
(
Rollno int identity(1,1) primary key,
StudName varchar(20) not null,
StudyingInClass int)



create table StudentMarks
(
Rollno int foreign key references Students(Rollno),
Subid int foreign key references Subjects(Sub_id),
MarksAchieved int,
constraint chkMarks  check (MarksAchieved<=100)
 )

 sp_help faculty
 sp_help studentmarks

 insert into faculty values('Rajesh','Mumbai',1234567890,'raj@gamil.com')
 insert into faculty values('Ramesh','Pune',1234567880,'ram@gamil.com')

 insert into faculty values ('Gauri','Pune',1234242444,'gauri@yahoo.com'),('Seema','Pune',1234242434,'seema@yahoo.com'),
 ('Reema','Pune',1334242434,'reema@yahoo.com')

  insert into faculty values('Simran','Mumbai',3234567890,null)
 insert into faculty values('Asit','Mumbai',null,null)



 select * from faculty

 exec sp_columns students
 sp_help students

 insert into Students values ('Jack',10), ('Jim',10), ('
 Smith',10), ('Kenny',10), ('Jacky',10) 

 select * from Students

 sp_help subjects

 insert into Subjects values (1,'Maths',100),(2,'Chemistry',100),(3,'Physics',100),(4,'Statistics',100)

 select * from Subjects


 insert into StudentMarks values (1,1,60), (2,1,69),(3,1,70),(4,1,65),(5,1,70)

 select * from StudentMarks
 select * from Subjects
 select * from Students
 select * from faculty



 ---create a duplicate table for student
select * into StudentDuplicates from  Students

select * from StudentDuplicates

----create a duplicate table for student, don't copy all data
select * into StudentDummy from  Students
where rollno in (1,2,3)

select * from StudentDummy
----create a duplicate table for student, don't copy the data
select * into StudentDummyWithNoData from  Students
where 1=2

select * from StudentDummyWithNoData

select * from Students

update Students
set StudName='Smita'
where Rollno=3

update Students
set StudName='Harish',StudyingInClass=11
where StudName like 'Jack'

delete from StudentDuplicates
where Rollno=1

sp_rename 'Subjects.SubName','SubjectName','COLUMN'

 sp_help Subjects
 



