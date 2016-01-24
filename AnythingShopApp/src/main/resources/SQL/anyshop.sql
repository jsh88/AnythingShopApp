create table member(
  id varchar2(30) constraint mem_pk primary key,
  pw varchar2(30) not null,
  name varchar2(15) not null,
  addr varchar2(150) not null,
  email varchar2(100) not null,
  phone varchar2(20) not null,
  jdate date not null,
  ldate date default sysdate not null
);

create table product(
  pno number constraint goods_pk primary key,
  name varchar2(100) not null,
  category varchar2(100) default '기타' not null,
  explan varchar2(1000) not null,
  price number not null,
  maker varchar2(300) not null,
  quantity number not null,
  sdate date default sysdate not null,
  image varchar2(255) not null,
  dimage varchar2(255) default null
);

create sequence product_seq
  start with 1
  increment by 1;

create table orders(
  ono number not null,
  id varchar2(30) constraint order_mem_fk references member(id) on delete cascade,
  pno number constraint order_product_fk references product(pno) on delete cascade not null, 
  auth char(1) not null,
  quantity number not null,
  name varchar2(15) not null,
  addr varchar2(150) not null,
  phone varchar2(20) not null,
  odate date default sysdate not null,
  adate date default null,
  state char(1) default 0 not null,
  constraint order_pk primary key(ono, id, pno)
);

create sequence orders_seq
  start with 1
  increment by 1;

create table log(
  ono number,
  id varchar2(30),
  gno number,  
  quantity number,
  auth char(1),
  price number,
  rname varchar2(15),
  raddr varchar2(150),
  rphone varchar2(20),
  odate date,
  adate date,
  state char(1)
);