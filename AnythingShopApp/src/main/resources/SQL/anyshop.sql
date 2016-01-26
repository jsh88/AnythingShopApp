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

drop table orders;

select * from product;

create table orders(
  ono number not null,
  id varchar2(30) constraint order_mem_fk references member(id) on delete cascade,
  pno number constraint order_product_fk references product(pno) on delete cascade not null, 
  auth char(1) not null,
  quantity number not null,
  memo varchar2(100),
  name varchar2(15) not null,
  rname varchar2(15) not null,
  addr varchar2(150) not null,
  raddr varchar2(150) not null,
  phone varchar2(20) not null,
  rphone varchar2(20) not null,
  pway varchar2(20) not null,
  odate date default sysdate not null,
  adate date default null,
  receipt number default null,
  rstate char(1) default 0 not null,
  state char(1) default 0 not null,
  pstate char(1) default 0 not null,
  constraint order_pk primary key(ono, id, pno)
);

select * from orders;
insert into orders
values(1487154870, 'test', 5, 1, 4, '82보내삼', '장성호', '이준범', '보낸다주소', '받는다주소', '010-4444-3333', '010-9049-0359', '무통장입금', '2015/12/30', null, null, 0, 0, 1);
insert into orders
values(1487154870, 'test', 4, 1, 2, '82보내삼', '장성호', '이준범', '보낸다주소', '주소당주소', '010-4444-3333', '010-9049-0359', '무통장입금', '2015/12/30', null, null, 0, 0, 1);
insert into orders
values(1487154870, 'test', 3, 1, 6, '82보내삼', '장성호', '이준범', '보낸다주소', '받는다주소', '010-4444-3333', '010-9049-0359', '무통장입금', '2015/12/30', null, null, 0, 0, 1);
insert into orders
values(1487154867, 'test', 5, 1, 4, '82보내삼', '장성호', '이준범', '보낸다주소', '받는다주소', '010-4444-3333', '010-9049-0359', '무통장입금', '2015/12/30', null, null, 0, 0, 1);
insert into orders
values(1487154867, 'test', 4, 1, 2, '82보내삼', '장성호', '이준범', '보낸다주소', '받는다주소', '010-4444-3333', '010-9049-0359', '무통장입금', '2015/12/30', null, null, 0, 0, 1);
insert into orders
values(1487154867, 'test', 3, 1, 6, '82보내삼', '장성호', '이준범', '보낸다주소', '받는다주소', '010-4444-3333', '010-9049-0359', '무통장입금', '2015/12/30', null, null, 0, 0, 1);
insert into orders
values(1487154869, 'none', 5, 0, 3, '82보내삼', '이준범', '이준범', '보낸다주소', '받는다주소2', '010-4444-3333', '010-4444-4444', '무통장입금', '2016/1/4', '2016/1/6', null, 0, 1, 1);
insert into orders
values(1487154869, 'none', 4, 0, 5, '82보내삼', '이준범', '이준범', '보낸다주소', '받는다주소2', '010-4444-3333', '010-4444-4444', '무통장입금', '2016/1/4', '2016/1/6', null, 0, 1, 1);
insert into orders
values(1487154868, 'none', 3, 0, 7, '82보내삼', '이준범', '이준범', '보낸다주소', '받는다주소3', '010-4444-3333', '010-4444-4444', '무통장입금', '2016/1/3', null, null, 0, 0, 1);
insert into orders
values(1487154868, 'none', 4, 0, 2, '82보내삼', '이준범', '이준범', '보낸다주소', '받는다주소3', '010-4444-3333', '010-4444-4444', '무통장입금', '2016/1/3', null, null, 0, 0, 1);

commit;

drop sequence orders_seq;

create sequence orders_seq
  start with 1487154871
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