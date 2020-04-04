create table branchn( branch_name varchar2(20), branch_city varchar2(10), assets number(12,2), primary key(branch_name) );
create table account( acc_no number(4), branch_name varchar2(10), balance number(12,2),primary key(acc_no), foreign key(branch_name) references branchn(branch_name) );
create table depositor(customer_name varchar2(10),acc_no number(4),primary key(customer_name), foreign key(acc_no) references account(acc_no));
create table customer( customer_name varchar2(10), customer_street varchar2(10), customer_city varchar2(10),foreign key(customer_name) references depositor(customer_name) );
create table loan( loan_number number(4), branch_name varchar2(10), amount number(12,2),primary key(loan_number),foreign key(branch_name) references branchn(branch_name)  );
create table borrower(customer_name varchar2(10), loan_number number(4), foreign key(customer_name)references depositor(customer_name), foreign key(loan_number)references loan(loan_number) );

drop table branch;

insert into branchn values('SBI PD NAGAR','BANGALORE',200000);
insert into branchn values('SBI RAJAJI NAGAR','BANGALORE',500000);
insert into branchn values('SBI JAYANAGAR','BANGALORE',660000);
insert into branchn values('SBI VIJAY NAGAR','BANGALORE',870000);
insert into branchn values('SBI HOSAKEREHALLI','BANGALORE',550000);

select * from branchn;

alter table account modify branch_name varchar2(20);
alter table account modify acc_no number(10);

insert into account values(1234602,'SBI HOSAKEREHALLI',5000);
insert into account values(1234603,'SBI VIJAY NAGAR',5000);
insert into account values(1234604,'SBI JAYANAGAR',5000);
insert into account values(1234605,'SBI RAJAJI NAGAR',10000);
insert into account values(1234503,'SBI VIJAY NAGAR',40000);
insert into account values(1234504,'SBI PD NAGAR',4000);

select * from account;

alter table depositor modify customer_name varchar2(20);
alter table depositor modify acc_no number(10);

insert into depositor values('KEZAR', 1234604);
insert into depositor values('LAL KRISHNA',1234603);
insert into depositor values('RAHUL', 1234602);
insert into depositor values('LALLU', 1234504);
insert into depositor values('FAIZAL', 1234605);
insert into depositor values('RAJEEV',1234503);

alter table customer modify customer_street varchar2(20);

insert into customer values('KEZAR', 'M G ROAD', 'BANGALORE');
insert into customer values('LAL KRISHNA', 'ST MKS ROAD', 'BANGALORE');
insert into customer values('RAHUL', 'AUGSTEN ROAD', 'BANGALORE');
insert into customer values('LALLU', 'V S ROAD', 'BANGALORE');
insert into customer values('FAIZAL', 'RESEDENCY ROAD', 'BANGALORE');
insert into customer values('RAJEEV', 'DICKNSN ROAD', 'BANGALORE');

alter table loan modify branch_name varchar2(20);

insert into loan values(10011, 'SBI JAYANAGAR', 10000);
insert into loan values(10012, 'SBI VIJAY NAGAR', 5000);
insert into loan values(10013, 'SBI HOSAKEREHALLI', 20000);
insert into loan values(10014, 'SBI PD NAGAR',15000);
insert into loan values(10015, 'SBI RAJAJI NAGAR', 25000);

alter table borrower modify loan_number number(6);
alter table borrower modify customer_name varchar2(20);

insert into borrower values('KEZAR', 10011);
insert into borrower values('LAL KRISHNA', 10012);
insert into borrower values('RAHUL', 10013);
insert into borrower values('LALLU', 10014);
insert into borrower values('LAL KRISHNA', 10015);

select * from branchn;
select * from account;
select * from depositor;
select * from customer;
select * from loan;
select * from borrower;
