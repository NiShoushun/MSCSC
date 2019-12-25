use meituan 
go

--���崥������ÿ���¼���һ����¼�ͽ��������֤�������ڵ�ң��㽫�����Ϣ���뵽��ҵı���
create trigger be_server
on allperson
after insert
as
if (select profession from allperson )in('���')
begin
   insert into ���(id,name,phone,address)
   select id,name,phone,address
   from AllPerson
end


--��ѯ�����ҵĲ�Ʒ
create procedure check_snack
(
@servername varchar(50)
)
as 
begin
   declare @name varchar(50)
   set @name = @servername
   select �˵�.*
   from �˵�,���
   where ���.id = �˵�.server_id
   and ���.name= @name
end

drop procedure check_snack

--��ѯ���е�ҵ�����
create procedure check_server
as
begin
select *
from ���
end 

--ɾ�����
drop procedure check_server


--������Ʒ
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
  update �˵� set number = number-@number
  where name = @name
end


--�����Ʒ���ɶ���
if exists (select * from sys.triggers where name = 'create_order')
  drop trigger create_order
go
create trigger create_order  
on �˵�
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
--�����α꣬�Ը���ǰ��ı����ݽ��ж�ȡ
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
     select @id = count(*)+2 from �ܶ���
--�����α��ж�ȡ�����ݲ��뵽�ܶ�����
  insert into [meituan].[dbo].[�ܶ���] 
  values(@id,2,@server_id,null,GETDATE(),@food_name,@food_num,@price)
   close old_cursor
   close new_cursor
   deallocate old_cursor
   deallocate new_cursor
end


--�鿴ȫ������
if(exists (select * from sys.objects where name = 'check_order'))
   drop procedure check_order
go
create procedure check_order
as
begin
  select * from �ܶ���
end


--��ѯ���в�Ʒ������
create procedure search_allfood
as
begin
select *
from �˵�
end

drop procedure search_allfood
--��Ӳ�Ʒ
insert �˵�(server_id,name,price,number)
values(2,'��������˿',15,20)

insert �˵�(server_id,name,price,number)
values(2,'������',45,20)

insert �˵�(server_id,name,price,number)
values(2,'���̼�',40,20)

insert �˵�(server_id,name,price,number)
values(3,'����С��',23,20)


--��Ӳ�Ʒ�洢����
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
   select @count_id = COUNT(1) from �˵�
   select @max_id =max(id) from �˵�
   if(@max_id > @count_id) 
     set @id = @max_id + 1
   else 
     set @id = @count_id + 1
  
begin
  insert into �˵�(id,server_id,name,price,number) 
  values(@id,@server_id,@name,@price,@number)
end


--ɾ����Ʒ�洢����
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
    delete from �˵� where name = @name
end

--���²�Ʒ
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
    update �˵� set price = @price,number = @number
    where name = @name
end

--δ�ӵ��Ĳ�ѯ

if(exists (select * from sys.objects where name = 'check_no'))
   drop procedure check_no
go

create procedure check_no
as
begin
  select һ��.id,һ��.food_name,�˿�.name,�˿�.address,���.name,���.address
  from �ܶ��� һ��,�˿�,���
  where  �˿�.id = һ��.client_id and ���.id = һ��.server_id and  һ��.qishou_id is null
  --exists (select * from �ܶ��� ���� where һ��.id = ����.id and ����.qishou_id is null)
  
end

--�ӵ�
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
  update �ܶ���
  set qishou_id = @qi_id where id = @id
end


--�鿴�Լ��Ķ���
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