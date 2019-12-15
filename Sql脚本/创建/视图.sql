USE MSCSC
GO

--创建社团成员信息视图
Create VIEW  View_ComMembers
AS 
    SELECT 学生.学号,姓名,社团成员.社团名称,电话号码,权限,院系,性别,年级,加入时间 from 社团,社团成员,学生 
    Where 社团成员.社团名称 = 社团.社团名称 AND 学生.学号 = 社团成员.学号
go
