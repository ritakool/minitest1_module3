create database minitest1_module3;
use minitest1_module3;

create table `Address` (
id int not null, 
address varchar (255),
primary key(id));

create table `Classes` (
id int not null auto_increment,
name varchar (10),
language varchar (255),
description varchar(255),
primary key (id));

create table `Students` (
id int not null auto_increment primary key,
fullname varchar (255),
address_id int,
foreign key (address_id) references Address(id),
age int,
phone int unique,
classes_id int,
foreign key (classes_id) references Classes(id)
);

create table Course (
id int not null auto_increment primary key,
name varchar(255),
description varchar (255)
);

create table Point (
id int not null auto_increment primary key,
course_id int,
foreign key (course_id) references Course(id),
student_id int,
foreign key (student_id) references Students(id),
point float
);
alter table students
modify phone varchar(13);