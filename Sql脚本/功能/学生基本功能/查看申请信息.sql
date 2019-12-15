--学生查看申请加入社团信息

Create Proc ShowACInfo
@StuNo nvarchar(10)
AS 
BEGIN
    SELECT * from 待审核社团成员 
    WHERE 学号 = @StuNo
END

GO

--学生查看申请创建社团信息
Create Proc ShowCC
@StuNo nvarchar(10)
AS 
BEGIN
    SELECT * from 待审核社团 WHERE 社团创始人学号 = @StuNo
END 