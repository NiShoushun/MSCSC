use meituan 
go

--定义触发器，每次新加入一条记录就进行身份验证，若属于店家，便将相关信息插入到店家的表中
create trigger be_server
on allperson
after insert
as
if (select profession from allperson )in('店家')
begin
   insert into 店家(id,name,phone,address)
   select id,name,phone,address
   from AllPerson
end


--查询具体店家的菜品
create procedure check_snack
(
@servername varchar(50)
)
as 
begin
   declare @name varchar(50)
   set @name = @servername
   select 菜单.*
   from 菜单,店家
   where 店家.id = 菜单.server_id
   and 店家.name= @name
end

drop procedure check_snack

--查询所有店家的名称
create procedure check_server
as
begin
select *
from 店家
end 

--删除语句
drop procedure check_server


--订购菜品
if(exists (select * from sys.objects where name = 'buy_food'))
   drop procedure buy_food
go
create procedure buy_food
(
   @f_name varchar(50),
   @f_number int
)
as
declare
   @name varchar(50),
   @number int
   set @name = @f_name
   set @number = @f_number 
  
begin
  update 菜单 set number = number-@number
  where name = @name
end


--购买菜品生成订单
if exists (select * from sys.triggers where name = 'create_order')
  drop trigger create_order
go
create trigger create_order  
on 菜单
after update
as
  if UPDATE(number)
  --declare @food_name varchar(50),
         -- @server_id int,
         -- @id int,
         -- @old_num int,
         -- @new_num int,
          --@food_num int,
         -- @food_price int,
         -- @price int
  --select @server_id = server_id from inserted
  --select @food_name = name from inserted
  --select @old_num = number from deleted
  --select @new_num = number from inserted
 -- set @food_num = @old_num - @new_num
  --select @food_price = price from inserted
  --set @price = @food_price * @food_num 
begin
--定义游标，对更新前后的表数据进行读取
  declare old_cursor scroll cursor for select number from deleted
  open old_cursor
  declare @old_num_cur int,@server_id_cur int ,@food_name_cur varchar(50),@new_num_cur int,@price_cur int
  fetch last from old_cursor into @old_num_cur
  declare new_cursor scroll cursor for select server_id,name,number,price from inserted
  open new_cursor
  fetch last from new_cursor into @server_id_cur,@food_name_cur,@new_num_cur,@price_cur
  declare 
          @food_name varchar(50),
          @server_id int,
          @id int,
          @food_num int,
          @price int
   
     set @server_id = @server_id_cur
     set @food_name = @food_name_cur
     set @food_num = @old_num_cur - @new_num_cur
     set @price = @price_cur * @food_num
     select @id = count(*)+2 from 总订单
--将从游标中读取的数据插入到总订单中
  insert into [meituan].[dbo].[总订单] 
  values(@id,2,@server_id,null,GETDATE(),@food_name,@food_num,@price)
   close old_cursor
   close new_cursor
   deallocate old_cursor
   deallocate new_cursor
end


--查看全部订单
if(exists (select * from sys.objects where name = 'check_order'))
   drop procedure check_order
go
create procedure check_order
as
begin
  select * from 总订单
end


--查询所有菜品的名称
create procedure search_allfood
as
begin
select *
from 菜单
end

drop procedure search_allfood
--添加菜品
insert 菜单(server_id,name,price,number)
values(2,'酸辣土豆丝',15,20)

insert 菜单(server_id,name,price,number)
values(2,'铁锅炖',45,20)

insert 菜单(server_id,name,price,number)
values(2,'大盘鸡',40,20)

insert 菜单(server_id,name,price,number)
values(3,'麻辣小锅',23,20)


--添加菜品存储过程
if(exists (select * from sys.objects where name = 'insert_food'))
   drop procedure insert_food
go
create procedure insert_food
(
   @s_id int,
   @f_name varchar(50),
   @f_price int,
   @f_number int
)
as
declare
   @count_id int,
   @max_id int,
   @id int,
   @server_id int,
   @name varchar(50),
   @price int,
   @number int
   set @server_id = @s_id
   set @name = @f_name
   set @price = @f_price
   set @number = @f_number 
   select @count_id = COUNT(1) from 菜单
   select @max_id =max(id) from 菜单
   if(@max_id > @count_id) 
     set @id = @max_id + 1
   else 
     set @id = @count_id + 1
  
begin
  insert into 菜单(id,server_id,name,price,number) 
  values(@id,@server_id,@name,@price,@number)
end


--删除菜品存储过程
if(exists (select * from sys.objects where name = 'delete_food'))
   drop procedure delete_food
go

create procedure delete_food
(
   @f_name varchar(50)
)
as
declare
    @name varchar(50)
    set @name = @f_name
begin
    delete from 菜单 where name = @name
end

--更新菜品
if(exists (select * from sys.objects where name = 'update_food'))
   drop procedure update_food
go

create procedure update_food
(
   @f_name varchar(50),
   @f_price int,
   @f_number int
)
as
declare
    @name varchar(50),
    @price int,
    @number int
    set @name = @f_name
    set @price = @f_price
    set @number = @f_number
begin
    update 菜单 set price = @price,number = @number
    where name = @name
end

--未接单的查询

if(exists (select * from sys.objects where name = 'check_no'))
   drop procedure check_no
go

create procedure check_no
as
begin
  select 一号.id,一号.food_name,顾客.name,顾客.address,店家.name,店家.address
  from 总订单 一号,顾客,店家
  where  顾客.id = 一号.client_id and 店家.id = 一号.server_id and  一号.qishou_id is null
  --exists (select * from 总订单 二号 where 一号.id = 二号.id and 二号.qishou_id is null)
  
end

--接单
if(exists (select * from sys.objects where name = 'accept_order'))
   drop procedure accept_order
go

create procedure accept_order
(
  @order_id int,
  @qishou_id int
)
as
begin
declare 
   @id int,
   @qi_id int
   set @id = @order_id
   set @qi_id = @qishou_id
  update 总订单
  set qishou_id = @qi_id where id = @id
end


--查看自己的订单
if(exists (select * from sys.objects where name = 'check_self_order'))
   drop procedure check_self_order
go

create procedure check_self_order
( @id varchar(50))
as
begin 
declare
   @self_id  varchar(50)
   set @self_id = @id
   select *
   from qi_order
   where qishou_name = @self_id
end