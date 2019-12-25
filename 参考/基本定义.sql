--�����ܱ�
use meituan
go
create table allperson
(
--�û�id�Զ�����
id int identity primary key,
name varchar(50) not null,
--�Ա����checkԼ��
sex varchar(50) check(sex in ('��','Ů')),
--�������Լ��
age int check(age>10 and age<100),
profession varchar(50) check(profession in ('���','�˿�','����')),
phone varchar(11) not null,
address varchar(50) not null
)

--�����ֱ�
create table �˿�
(
id int primary key,
name varchar(50) not null,
phone varchar(50),
address varchar(50)
)

create table ���
(
id int primary key,
name varchar(50) not null,
phone varchar(50),
address varchar(50)
)

create table �ܶ���
(
id int primary key,
client_id int foreign key references �˿�(id),
server_id int foreign key references ���(id),
qishou_id int null,
order_time datetime,
food_name varchar(50),
food_num int,
sum_price int check (sum_price >=0)
)

create table С����
(
id int primary key,
name varchar(50) not null,
phone varchar(50),
menu_id int foreign key references �ܶ���(id),
server_id int foreign key references ���(id), 
)

alter table ���� drop constraint menu_id

create table �˵�
(
id int primary key,
server_id int foreign key references ���(id),
name varchar(50) not null,
price int check(price > 0),
number int check(number >= 0) 
)


alter table ����
add food_name varchar(50),food_num int,sum_price int check (sum_price >=0)

--����������ͼ

create view qi_order(order_id,qishou_name,client_name,client_phnoe,client_address,server_name,server_address)
as
select �ܶ���.id,С����.name,�˿�.name,�˿�.phone,�˿�.address,���.name,���.address
from �ܶ���,С����,�˿�,���
where  �˿�.id = �ܶ���.client_id and ���.id = �ܶ���.server_id and  �ܶ���.qishou_id = С����.id

drop view qi_order