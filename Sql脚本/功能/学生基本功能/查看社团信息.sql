--学生查看社团信息功能
use MSCSA
go

Create Proc ViewComInfo
@ComID nvarchar(10)
AS 
BEGIN
    SELECT 社团ID,社团名称,成立日期,当前人数 from 社团 Where 社团ID = @ComID
    SELECT 社团简介 from 社团 Where 社团ID = @ComID
    SELECT 学生.学号,姓名,成员ID,电话号码,权限,加入时间 from 社团成员,学生 
    Where 社团ID = @ComID AND 学生.学号 = 社团成员.学号
END

go

Create Proc ViewAllComInfo
@ComID nvarchar(10)
AS 
BEGIN
    SELECT 社团ID,社团名称,成立日期,当前人数 from 社团 Where 社团ID = @ComID
END
