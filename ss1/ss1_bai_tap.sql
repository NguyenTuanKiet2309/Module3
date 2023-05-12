create database if not exists ss1;

create table class(
id int primary key,
`name` varchar(50)
);

create table teacher( 
id int primary key,
`name` varchar(50),
age int,
country varchar(50)
);

select * from class;
select * from teacher;