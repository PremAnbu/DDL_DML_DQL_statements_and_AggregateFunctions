
CREATE TABLE ContactDetails (
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    PhoneNo BIGINT PRIMARY KEY,
    Email NVARCHAR(100),
    Address NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(50),
    Zip INT
);
select * from ContactDetails;
select FirstName from ContactDetails;
--=============================================
create database payroll_service;
use payroll_service;

create table Employee_payroll(empId int primary key identity(1,1),
empName varchar(30) not null,empSalary decimal,empStartDate date);
select * from Employee_payroll;

insert into Employee_payroll values('Anbu',49800,'2009-10-04');

select * from Employee_payroll where empName='Kumar'; 
select * from Employee_payroll where empStartDate >=('2016-05-21') And empStartDate<=GETDATE();

Alter table Employee_payroll add empGender varchar(6);

update EMployee_payroll set empGender='female' where empName in ('poonkodi');
update Employee_payroll set empName='Poonkodi' where empName = 'Kumar';

select * from Employee_payroll;

select empGender,sum(empSalary)as sumOfEachGenderSal from EMployee_payroll group by empGender;
select empGender,Avg(empSalary)as AvgOfEachGenderSal from EMployee_payroll group by empGender;
select empGender,min(empSalary)as MinOfEachGenderSal from EMployee_payroll group by empGender;
select empGender,max(empSalary)as MaxOfEachGenderSal from EMployee_payroll group by empGender;
select empGender,count(empSalary)as CountOfEachGenderSal from EMployee_payroll group by empGender;

create table EmployeePayroll (empId int primary key identity(1,1),
empName varchar(30) not null,empContact Bigint,empSalary decimal,empStartDate date);

insert into EmployeePayroll (empId,empName,empContact,empSalary,empStartDate)
select empId,empName,Null as NewColumn,empSalary,empStartDate from Employee_payroll;

drop table Employeepayroll;
select * from Employeepayroll;

use AddressBook;
select * from Address;

--=================================
create table department(deptId int primary key,deptName varchar,deptLoc varchar);

create table emp(empId int primary key,firstName varchar,lastName varchar,deptId int
foreign key references dept(deptId));

insert into dept values(101,'sales','tamilnadu');
insert into emp values(1001,'prem','kumar',101);
select * from dept;