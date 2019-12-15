--学生查看特定社团信息功能
use MSCSC
go

Create Proc ViewComInfo
@ComName nvarchar(20)
AS 
BEGIN
    SELECT 社团名称,成立日期,当前人数 from 社团 Where 社团名称 = @ComName
    SELECT 社团简介 from 社团 Where 社团名称 = @ComName
    Select * from viewAllmembers Where 社团名称 = @ComName
END
go

--学生查看所有社团信息功能
Create Proc ViewAllComInfo
AS 
BEGIN
    SELECT 社团名称,成立日期,当前人数 from 社团 
END


GO

--学生查看自己的信息
CREATE PROC ShowSelfInfo
@StuNO NVARCHAR(12)
AS 
BEGIN
    --选择学生信息
    SELECT * FROM 学生 WHERE 学号 = @StuNO
    --选择所加入社团信息
    SELECT * FROM View_ComMembers WHERE 学号 = @StuNO
END

