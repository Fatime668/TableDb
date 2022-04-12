create database TableDb
use TableDb
create table Workers(
Id int primary key identity,
[Name] nvarchar(20) not null,
Surname nvarchar(20) not null,
Salary smallmoney not null,
Position_Id int foreign key references Positions(Id)
)
create table Positions(
Id int primary key identity,
PoisitionName nvarchar(20) not null
)
create table Branches(
Id int primary key identity,
BranchName nvarchar(50) not null
)
create table Products(
Id int primary key identity,
ProductName nvarchar(50) not null,
[Purchase Price] float not null,
[Sale Price] float not null
)
create table Sales(
Id int primary key identity,
[Date] datetime not null,
Product_Id int foreign key references Products(Id),
Worker_Id int foreign key references Workers(Id),
Branch_Id int foreign key references Branches(Id)
)


insert into Products
values('Green Tea',5.50,7.99),('Black Tea',6.05,10.29),('Coffee',6.65,10.99)
select * from Products

insert into Branches
values('Azadliq'),('Nerimanov'),('Genclik')

insert into Positions
values('Seller'),('Cashier')


insert into Workers(Name,Surname,Salary,Position_Id)
values('Ehmed','Ehmedov',450,1),('Zeyneb','Aliyeva',500,1),
('Aylin','Hesenova',600,2)

--Birinci sorgu
select Workers.Name,Products.ProductName,
Branches.BranchName,Products.[Purchase Price],
Products.[Sale Price] from Sales
inner join Workers
on Sales.Worker_Id = Worker_Id
inner join Products
on Sales.Product_Id = Product_Id
inner join Branches
on Sales.Branch_Id = Branch_Id

--Ikinci sorgu
select Sum([Sale Price]) as Total from Products 



