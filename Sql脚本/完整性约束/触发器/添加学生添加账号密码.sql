USE MSCSC
GO
--添加学生时为每个学生创建初始密码“123456” ,MD5加密
CREATE TRIGGER InsertStu
ON 学生
AFTER INSERT
AS
BEGIN
    DECLARE @StuNo NVARCHAR(12)
    SELECT @StuNO = 学号 FROM INSERTED 
    --自动添加默认密码值
    INSERT INTO 登陆表 (学号) VALUES(@StuNO)
END

go