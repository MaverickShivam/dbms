CREATE TABLE FLIGHTS
(    FLNO INTEGER PRIMARY KEY,
  FFROM VARCHAR(15) NOT NULL,
  TTO VARCHAR(15) NOT NULL,
  DISTANCE INTEGER,
  DEPARTS TIMESTAMP,
  ARRIVES TIMESTAMP, 
  PRICE NUMBER(10,2)
);

CREATE TABLE AIRCRAFT
 (AID INTEGER PRIMARY KEY,
  ANAME VARCHAR(10),
  CRUISINGRANGE INTEGER);
  
 CREATE TABLE EMPLOYEES
  (EID INTEGER PRIMARY KEY,
  ENAME VARCHAR(15),
  SALARY NUMBER(10,2)
  );
  
  CREATE TABLE CERTIFIED
  (
  EID INTEGER NOT NULL,
  AID INTEGER NOT NULL,
  PRIMARY KEY (EID, AID),
  FOREIGN KEY (EID) REFERENCES EMPLOYEES (EID),
  FOREIGN KEY (AID) REFERENCES AIRCRAFT (AID)
  );
insert into aircraft values(101,'747',3000);
insert into aircraft values(102,'Boeing',900);

insert into aircraft values(103,'647',800);
 insert into aircraft values(104,'Dreamliner',10000);
 insert into aircraft values(105,'Boeing',3500);
 insert into aircraft values(106,'707',1500);
 insert into aircraft values(107,'Dream', 120000);
insert into employees values(701,'A',50000);

insert into employees values(702,'B',100000);
 insert into employees values(703,'C',150000);
 insert into employees values(704,'D',90000);
insert into employees values(705,'E',40000);
 insert into employees values(706,'F',60000);
insert into employees values(707,'G',90000);
insert into certified values(701,101);

 insert into certified values(701,102);
insert into certified values(701,106);
insert into certified values(701,105);
insert into certified values(702,104);
 insert into certified values(703,104);
insert into certified values(704,104);


 insert into certified values(702,107);



 insert into certified values(703,107);
insert into certified values(704,107);
 insert into certified values(702,101);
insert into certified values(703,105);
 insert into certified values(704,105);
 insert into certified values(705,103);
 alter session set nls_timestamp_format = 'RR/MM/DD HH24:MI:SSXFF';

Session altered.
alter session set nls_date_language ='ENGLISH';

Session altered.
insert into flights values(101,'Bangalore','Delhi',2500,TIMESTAMP '2005-05-13 07:15:31',TIMESTAMP '2005-05-13 17:15:31',5000);
insert into flights values(102,'Bangalore','Lucknow',3000,TIMESTAMP '2005-05-13 07:15:31',TIMESTAMP '2005-05-13 11:15:31',6000);
 insert into flights values(103,'Lucknow','Delhi',500,TIMESTAMP '2005-05-13 12:15:31',TIMESTAMP ' 2005-05-13 17:15:31',3000);
 insert into flights values(107,'Bangalore','Frankfurt',8000,TIMESTAMP '2005-05-13  07:15:31',TIMESTAMP '2005-05-13 22:15:31',60000);
 insert into flights values(104,'Bangalore','Frankfurt',8500,TIMESTAMP '2005-05-13 07:15:31',TIMESTAMP '2005-05-13 23:15:31',75000);
 insert into flights values(105,'Kolkata','Delhi',3400,TIMESTAMP '2005-05-13 07:15:31',TIMESTAMP  '2005-05-13 09:15:31',7000);
