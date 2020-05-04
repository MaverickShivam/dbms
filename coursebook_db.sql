create database labo;
use labo;
create table student(
regno varchar(15) primary key,
name varchar(20),
major varchar(20),
bdate date
);
CREATE TABLE course(
     courseno INT,
     cname VARCHAR(20),
     dept VARCHAR(20),
     PRIMARY KEY (courseno) 
     );
CREATE TABLE enroll(
     regno VARCHAR(15),
     courseno INT,
     sem INT(3),
     marks INT(4),
     PRIMARY KEY (regno,courseno),
    FOREIGN KEY (regno) REFERENCES student (regno),
     FOREIGN KEY (courseno) REFERENCES course (courseno) );
     
CREATE TABLE text(
     book_isbn INT(5),
     book_title VARCHAR(20),
     publisher VARCHAR(20),
     author VARCHAR(20),
     PRIMARY KEY (book_isbn) );
CREATE TABLE book_adoption(
     courseno INT,
     sem INT(3),
     book_isbn INT(5),
     PRIMARY KEY (courseno,book_isbn),
     FOREIGN KEY (courseno) REFERENCES course (courseno),
     FOREIGN KEY (book_isbn) REFERENCES text(book_isbn) );
     select * from book_adoption;
INSERT INTO student (regno,name,major,bdate) VALUES
     ('1pe11cs002','b','sr','19930924'),
     ('1pe11cs003','c','sr','19931127'),
     ('1pe11cs004','d','sr','19930413'),
     ('1pe11cs005','e','jr','19940824');

INSERT INTO course VALUES (111,'OS','CSE'),
     (112,'EC','CSE'),
     (113,'SS','ISE'),
     (114,'DBMS','CSE'),
     (115,'SIGNALS','ECE');

INSERT INTO text(book_isbn,book_title,publisher,author) VALUES 
     (10,'DATABASE SYSTEMS','PEARSON','SCHIELD'),
     (900,'OPERATING SYS','PEARSON','LELAND'),
     (901,'CIRCUITS','HALL INDIA','BOB'),
     (902,'SYSTEM SOFTWARE','PETERSON','JACOB'),
     (903,'SCHEDULING','PEARSON','PATIL'),
     (904,'DATABASE SYSTEMS','PEARSON','JACOB'),
     (905,'DATABASE MANAGER','PEARSON','BOB'),
     (906,'SIGNALS','HALL INDIA','SUMIT');
INSERT INTO enroll (regno,courseno,sem,marks) VALUES 

     ('1pe11cs002',114,5,100),
     ('1pe11cs003',113,5,100),
     ('1pe11cs004',111,5,100),
     ('1pe11cs005',112,3,100);
INSERT INTO book_adoption (courseno,sem,book_isbn) VALUES
(111,5,900),
(111,5,903),
(111,5,904),
(112,3,901),
(113,3,10),
(114,5,905),
(113,5,902),
(115,3,906);


/* Q1 Produce a list of text books
(include Course #, Book-ISBN, Book-title) 
in the alphabetical order for courses offered by
the 'CS' department that use more than two books
*/
select c.courseno,b.book_isbn,t.book_title
from course c,book_adoption b,text t
where c.courseno =b.courseno and b.book_isbn =t.book_isbn
and c.courseno in (
select  c.courseno from book_adoption b,course c 
where c.courseno = b.courseno and dept = 'CSE' 
group by courseno 
having
count(book_isbn)>2)
order by book_title;

/* Q 5.	List any department that has all its 
adopted books published by a specific publisher.
*/

select distinct dept from course c ,book_adoption b
where c.courseno = b.courseno 
and b.courseno in(
select b.courseno from book_adoption b,text t
where b.book_isbn = t.book_isbn
and publisher="PEARSON"
);
