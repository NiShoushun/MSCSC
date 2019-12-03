use 学生管理系统

--创建数据库
create database MSCSA
on primary(
	Name = MSCSA_DATA,
	FILEName = 'E:\Microsoft SQL Server\DATA\MSCSA.mdf',
	SIZE = 8MB,
	MAXSIZE = 20MB,
	FILEGrowth = 10%
),
(
	NAME = MSCSA_DATA_2,
	FILENAME = 'E:\Microsoft SQL Server\DATA\MSCSA2.ndf',
	SIZE = 5MB,
	maxsize = 10MB,
	FILEGrowth = 10%
)
LOG on
(
	Name = 学生管理系统_LOG,
	FILENAME = 'E:\Microsoft SQL Server\LOG\MSCSA.ldf',
	SIZE = 8mb,
	MAXSIZE = 20MB,
	FILEGROWTH = 5%
)



