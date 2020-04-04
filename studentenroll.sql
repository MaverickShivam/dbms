create table student(
    regno int not null,
    sname varchar2(100) not null,
    major varchar2(100) not null,
    bday date,
    primary key(regno)
);

create table course(
    course_id int not null,
    course_name varchar2(100) not null,
    dept varchar2(100) not null,
    primary key(course_id)
);


create table enrolled(
    regno int,
    course_id int,
    sem int not null,
    marks int not null,
    foreign key(regno) references student(regno) on delete cascade,
    foreign key (course_id) references course(course_id) on delete cascade
);

create table text(
    isbn int not null,
    book_title varchar2(100) not null,
    publisher varchar2(100) not null,
    author varchar2(100) not null,
    primary key(isbn)
);

create table adoption(
    course_id int,
    isbn int,
    sem int not null,
    foreign key (course_id) references course(course_id) on delete cascade,
    foreign key (isbn) references text(isbn) on delete cascade
);
    

insert into student values(1,'Sumanth K V','CSE','02-JAN-84');
insert into student values(2,'Sachin','CSE','12-OCT-85');
insert into student values(3,'Virat kohli','ECE','23-SEP-82');
insert into student values(4,'Dhoni','EEE','21-FEB-84');
insert into student values(5,'Rohith','ECE','07-OCT-79');

insert into course values(11, 'dcs', 'cse');
insert into course values(12, 'ada', 'cse');
insert into course values(13, 'cn', 'ece');
insert into course values(14, 'td', 'mech');
insert into course values(15, 'mup', 'ece');

insert into text values(7722, 'vb', 'phi', 'holzner');
insert into text values(1144, 'ds', 'sapna', 'nandgopal');
insert into text values(4400, 'c', 'phi', 'balaguru');
insert into text values(5566, 'cn', 'phi', 'tenenbaum');
insert into text values(3388, 'mp', 'tata', 'brey');

insert into adoption values(11, 7722, 3);
insert into adoption values(12, 7722, 4);
insert into adoption values(11, 4400, 5);
insert into adoption values(11, 5566, 8);
insert into adoption values(15, 3388, 4);
insert into adoption values(14, 5566, 4);
insert into adoption values(14, 3388, 7);

insert into enrolled values(1, 12, 5, 76);
insert into enrolled values(1, 11, 3, 90);
insert into enrolled values(2, 13, 6, 55);
insert into enrolled values(3, 12, 5, 75);
insert into enrolled values(5, 14, 5, 75);
