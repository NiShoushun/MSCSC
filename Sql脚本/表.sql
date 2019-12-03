use MSCSA
go

create table 学生
(
	学号 nvarchar(10) not NULL,
	姓名 nvarchar(10) not NULL, 
	年龄 int not NULL,
	性别 nvarchar(2) not NULL,
	院系 nvarchar(20) not NULL,
	年级 int not NULL,
	电话号码 nvarchar(12)
)

create table 社团
(
	社团ID nvarchar(10) not NULL,
	社团名称 nvarchar(20) not NULL,
	社团创始人 nvarchar(10) not NULL,
	社团简介 text,
	成立日期 datetime not NULL,
	当前人数 int not NULL,
	最大人数 int not NULL,
)

create table 待审核社团
(
	社团名称 nvarchar(20) not NULL,
	社团创始人 nvarchar(10) not NULL,
	社团简介 text,
	申请日期 datetime not NULL,
	是否通过 bit
)

--insert into 待审核社团 values('1','1','简介',getDate(),1)
--select convert(char(10),申请日期,120) from 待审核社团
--delete from 待审核社团

create table 社团成员
(
	学号 nvarchar(10) not NULL,
	社团ID nvarchar(10) not NULL,
	成员ID nvarchar(10) not NULL,
	加入时间 datetime not NUll,
	权限 nvarchar(5) not NULL
)

create table 退会成员
(
	学号 nvarchar(10) not NULL,
	社团ID nvarchar(10) not NULL,
	退出时间 datetime not NUll,
	联系方式 text
)

create table 登陆表
(
	学号 nvarchar(10) not NULL,
	密码 nvarchar(32) not NULL
)

create table 待审核社团成员
(
	学号 nvarchar(10) not NULL,
	社团ID nvarchar(10) not NULL,
	申请时间 datetime not NUll,
	是否通过 bit not NULL
)

alter table 待审核社团成员 add 是否通过 bit not NULL

go