--创建总表
use meituan
go
create table allperson
(
--用户id自动生成
id int identity primary key,
name varchar(50) not null,
--性别添加check约束
sex varchar(50) check(sex in ('男','女')),
--年龄添加约束
age int check(age>10 and age<100),
profession varchar(50) check(profession in ('店家','顾客','骑手')),
phone varchar(11) not null,
address varchar(50) not null
)

--创建分表
create table 顾客
(
id int primary key,
name varchar(50) not null,
phone varchar(50),
address varchar(50)
)

create table 店家
(
id int primary key,
name varchar(50) not null,
phone varchar(50),
address varchar(50)
)

create table 总订单
(
id int primary key,
client_id int foreign key references 顾客(id),
server_id int foreign key references 店家(id),
qishou_id int null,
order_time datetime,
food_name varchar(50),
food_num int,
sum_price int check (sum_price >=0)
)

create table 小骑手
(
id int primary key,
name varchar(50) not null,
phone varchar(50),
menu_id int foreign key references 总订单(id),
server_id int foreign key references 店家(id), 
)

alter table 骑手 drop constraint menu_id

create table 菜单
(
id int primary key,
server_id int foreign key references 店家(id),
name varchar(50) not null,
price int check(price > 0),
number int check(number >= 0) 
)


alter table 订单
add food_name varchar(50),food_num int,sum_price int check (sum_price >=0)

--创建骑手视图

create view qi_order(order_id,qishou_name,client_name,client_phnoe,client_address,server_name,server_address)
as
select 总订单.id,小骑手.name,顾客.name,顾客.phone,顾客.address,店家.name,店家.address
from 总订单,小骑手,顾客,店家
where  顾客.id = 总订单.client_id and 店家.id = 总订单.server_id and  总订单.qishou_id = 小骑手.id

drop view qi_order