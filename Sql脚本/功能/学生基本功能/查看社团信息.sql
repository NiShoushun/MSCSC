--学生查看特定社团信息功能
use MSCSC
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


--学生查看所有社团信息功能
Create Proc ViewAllComInfo
@ComID nvarchar(10)
AS 
BEGIN
    SELECT 社团ID,社团名称,成立日期,当前人数 from 社团 Where 社团ID = @ComID
END


GO

--学生查看自己的信息
CREATE PROC ShowSelfInfo
@StuNO NVARCHAR(10)
AS 
BEGIN
    --选择学生信息
    SELECT * FROM 学生
    --选择所加入社团信息
    SELECT 社团.社团ID,社团.社团ID ,社团成员.成员ID FROM 社团 ,社团成员 
    WHERE 社团成员.学号 = @StuNo 
    AND 社团成员.社团ID = 社团.社团ID
END

