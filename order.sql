create table customer
(
    cust_no number(20),
    cname varchar2(20),
    city varchar2(20),
    primary key(cust_no)
);
create table orders
(
    order_no number(20),
    odate date,
    cust_no number(20),
    order_amount number(10,2),
    primary key(order_no),
    foreign key(cust_no) references customer(cust_no)
);
create table item
(
    item_no number(20),
    price number(10,2),
    primary key(item_no)
);
create table order_item
(
    order_no number(20),
    item_no number(20),
    qty number(10),
    foreign key(item_no) references item(item_no),
    foreign key(order_no) references orders(order_no)
);
create table warehouse
(
    warehouse_no number(20),
    city varchar2(20),
    primary key(warehouse_no)
);
create table shipment
(
    order_no number(20),
    warehouse_no number(20),
    sdate date,
    foreign key(order_no) references orders(order_no),
    foreign key(warehouse_no) references warehouse(warehouse_no)
);

drop table customer;
drop table orders;
drop table item;
drop table order_item;
drop table warehouse;
drop table shipment;
insert into customer values(&custno,'&cname','&city');
insert into orders values(&orderno,'&date',&custno,&amount);
insert into item values(&itemno,&price);

insert into order_item values(&orderno,&itemno,&qty);
insert into order_item values(&orderno,&itemno,&qty);
insert into order_item values(&orderno,&itemno,&qty);
insert into order_item values(&orderno,&itemno,&qty);
insert into order_item values(&orderno,&itemno,&qty);

insert into warehouse values(&warehouseno,'&city');
insert into warehouse values(&warehouseno,'&city');
insert into warehouse values(&warehouseno,'&city');
insert into warehouse values(&warehouseno,'&city');
insert into warehouse values(&warehouseno,'&city');

insert into shipment values(&orderno,&warehouseno,'&date');
insert into shipment values(&orderno,&warehouseno,'&date');
insert into shipment values(&orderno,&warehouseno,'&date');
insert into shipment values(&orderno,&warehouseno,'&date');
insert into shipment values(&orderno,&warehouseno,'&date');

select * from customer;
select * from orders;
select * from item;
select * from order_item;
select * from warehouse;
select * from shipment;

select cu.cname from customer cu join orders o on cu.cust_no= o.cust_no and ;