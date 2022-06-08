create database sqlproject

use sqlproject

-- DDL command
-- Create command

create table student(
Name varchar(225),
City varchar(20),
Age int,
)

-- DML command
-- INSERT command

insert into student values('Anand','chennai',22)
insert into student values('Karthi','Madurai',24)
insert into student values('Akash','Covai',25)
insert into student values('sanjay','Trichy',21)
insert into student values('Bala','chennai',24)
insert into student (Name,City) values('Saran','Covai')

--SELECT command

select* from student

select * from student where City = 'chennai'

select Name from student 

select City from student 

select * from student where City = 'Covai'

select * from student where city = 'Chennai' and Age >22

select* from student

select * from student where Age >22

select * from student where City ='chennai'

select * from student where Age =20

--DELETE command

delete  from student where Name='Dinesh'

delete from student where City= 'covai'

delete from student

-- UPDATE command

update student set Age = 25 where Name = 'Saran'

update student set Age = 20 where Name = 'Sanjay'

update student set City = 'Banglore' where Name = 'Akash'

select * from student

--DDL command
--ALTER command

alter table student add RollNo int 

update student set RollNo = 200 

--TRUNCATE command

truncate table student

drop table student

select *from student

use sqlproject

create table student(
Name varchar(225) unique,
City varchar(50)  NOT NULL,
Age int  check (Age > 20),
RollNo int identity,
)


insert into student values ('Bavi','Trichy',22)
insert into student values ('Siva','Chennai',24)
insert into student values ('Rajkumar','Madurai',25)
insert into student values ('Jayaraj','Selam',23)
insert into student values ('Ravi','Covai',26)
insert into student values ('Vijay','Banglore',28)

select * from student
truncate table student

select distinct * from student

select Name as NameOfTheStudent, City as CityOfTheStudent from student

select Name as [Name Of The Student], City as [City Of The Student] from student

select Name as [Name_Of_The_Student], City as [City_Of_The_Student] from student

select * from student order by Age

select * from student order by Age DESC

select * from student order by Age ASC

select Top 3 * from student

select Top 5 * from student

select count(*) from student where Name = 'Bavi'

select Avg(Age) from student


-- STORED PROCEDURE 

select * from student

CREATE PROCEDURE test3

as
	select * from student
go;

exec test3

-- with argument
select * from student

create procedure sql_test @para varchar(255)

as
begin
	select * from student where Name = @para
end;

exec sql_test @para = 'Bavi'
create database Employee

use Employee

create table Employee(
Name varchar(255) NOT NULL unique,
City varchar(50) NOT NULL,
Age int check(Age >18),
RollNo int identity(200,1) primary key,
)

create table Fees_details(
ID varchar(255) NOT NULL, 
Fees int,
RollNo int foreign key references Employee(RollNo),
)


insert into Employee values ('Akash','Chennai', 22)
insert into Employee values ('Rajesh','Trichy', 24)
insert into Employee values ('Kannan','Covai', 26)
insert into Employee values ('Raj','Banglore', 25)
insert into Employee values ('Sri','Madurai', 23)

select * from Employee

insert into Fees_details values (1,2000,200)
insert into Fees_details values (2,4000,201)
insert into Fees_details values (3,6000,202)
insert into Fees_details values (4,8000,203)
insert into Fees_details values (5,10000,204)

select * from Fees_details

select * from Fees_details where RollNo = 200

select * from Fees_details where RollNo = 204

drop table Employee
drop table Fees_detail



-- JIONS
-- INNER JOIN

create table Employee(
Name varchar(255) NOT NULL unique,
City varchar(50) NOT NULL,
Age int check(Age >18),
RollNo int identity(200,1),
)

create table Fees_details(
Feestype varchar(255) NOT NULL, 
Fees int,
StdID int,
)


insert into Employee values ('Akash','Chennai', 22)
insert into Employee values ('Rajesh','Trichy', 24)
insert into Employee values ('Kannan','Covai', 26)
insert into Employee values ('Raj','Banglore', 25)
insert into Employee values ('Sri','Madurai', 23)



insert into Fees_details values ('1st_test',2000,200)
insert into Fees_details values ('2nd_test',4000,201)
insert into Fees_details values ('3rd_test',6000,202)


truncate table Fees_details

select * from Employee
select * from Fees_details


select Employee.Name,Employee.City,Fees_details.Feestype,Fees_details.Fees from Employee INNER JOIN Fees_details on Employee.RollNo = Fees_details.stdID

-- RIGHT JOIN 
select Employee.Name,Employee.City,Fees_details.Feestype,Fees_details.Fees from Employee RIGHT JOIN Fees_details on Employee.RollNo = Fees_details.stdID


-- LEFT JOIN 

select Employee.Name,Employee.City,Fees_details.Feestype,Fees_details.Fees from Employee LEFT JOIN Fees_details on Employee.RollNo = Fees_details.stdID

-- FULL JOIN 

select Employee.Name,Employee.City,Fees_details.Feestype,Fees_details.Fees from Employee OUTER JOIN Fees_details on Employee.RollNo = Fees_details.stdID