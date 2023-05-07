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

-- thêm 5 bản ghi trong bảng address
insert into address (id, address) values
(1, 'HN'), (2,'HCM'), (3, 'QN'), (4, 'HP'), (5, 'DN');

-- thêm 5 bản ghi trong course
insert into course (name, description) values
('Tiếng Anh', 'cơ bản'),
('Tiếng trung', 'cơ bản'),
('tiếng nga', 'cơ bản'),
('tiếng nhật', 'cơ bản'),
('tiếng hàn','cơ bản');

-- thêm 5 bản ghi trong classes
insert into classes (name, language, description) values 
('TA1', 'Tiếng Anh', 'cú pháp'),
('TT1', 'tiếng trung', 'cú pháp'),
('TNGA1','tiêng nga','cú pháp'),
('TNH1','tiêng nhật','cú pháp'),
('THAN1','tiêng hàn','cú pháp');

-- thêm 10 bản ghi trong student
insert into students (fullname, address_id, age, phone, classes_id) values
('Nguyen Van Anh', 1, 18, '111', 1),
('Dang Van Anh', 1, 19, '222', 1),
('Nguyen Van Bich', 2, 18, '333', 2),
('Nguyen Thi Chinh', 2, 20, '444', 2),
('Hoang Nga', 3, 20, '555', 3),
('Hoang Dang Quang', 3, 20, '666', 3),
('Ngo Thanh Tra', 4, 20, '777', 4),
('Tong Thanh Thu', 4, 20, '888', 4),
('My Tam Tu', 5, 20, '999', 5),
('Anh Hoang', 5, 19, '121', 5);

-- thêm 15 bản ghi trong point 
insert into point (course_id, student_id, point) values
(1, 1, 70), (1, 2, 70), (1, 3, 65), (1, 4, 50), (1, 5, 78.8),
(2, 6, 70), (2, 7, 70), (2, 8, 65), (2, 9, 50), (2, 10, 78.8),
(3, 1, 70), (3, 2, 70), (3, 3, 65), (3, 4, 50.5), (3, 5, 78.8);

-- query
select * from students
where fullname like 'nguyễn%';

select * from students 
where fullname like '%Anh';

select * from students
where age >= 18 and age <= 25;

select * from students 
where id = 12 or id = 13;

-- truy vấn

-- số lượng học viên tại các lớp
select classes.name, count(students.id) as 'số học viên'
from students 
inner join classes on students.classes_id = classes.id
group by classes.name;

-- số học viên tại các tỉnh
select address.address, count(students.id) as 'số học viên'
from students
inner join address on students.address_id = address.id
group by address.address;

-- tạo view tính điểm trung bình
create view avg_point as
select course.name, avg(point.point) as avgpoint
from point
inner join course on course.id = point.course_id
group by course.name;

-- hiện điêm trung bình
select * from avg_point;

-- hiện điểm trung bình lớn nhất
select avg_point.name, max(avg_point.avgpoint) as comehere
from avg_point
group by avg_point.name
order by comehere desc
limit 1;