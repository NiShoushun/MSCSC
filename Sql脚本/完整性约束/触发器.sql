--删除学生时同时删除所有表中有关该学生记录
CREATE TRIGGER [dbo].[DelStu]
ON [dbo].[学生]
instead of DELETE
AS
BEGIN
    DECLARE @StuNo NVARCHAR(10)
    SELECT @StuNO = 学号 FROM DELETED
    DELETE FROM 待审核社团成员 WHERE 学号 = @StuNo
    DELETE FROM 社团成员 WHERE 学号 = @StuNo
    DELETE FROM 退会成员 WHERE 学号 = @StuNo
    DELETE FROM 登陆表 WHERE 学号 = @StuNo
    DELETE FROM 待审核社团 WHERE 社团创始人 = @StuNo AND 是否通过 = 'FALSE'
	DELETE FROM 学生 WHERE 学号 = @StuNO
END

go

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

--退出社团时将退出信息插入到退会成员表中
CREATE TRIGGER DelComMember
ON 社团成员
AFTER DELETE
AS
BEGIN
    DECLARE @StuNo NVARCHAR(12)
    DECLARE @ComName NVARCHAR(20)
    DECLARE @TelNum NVARCHAR(12)
    
    SELECT @StuNO = 学号,@ComName = 社团名称 FROM DELETED 
    SELECT @TelNum = 电话号码 FROM 学生 WHERE 学号 = @StuNo
    --将删除信息插入到退会成员表
    INSERT INTO 退会成员 (学号,社团名称,退出时间,联系方式) VALUES(@StuNO,@ComName,GETDATE(),@TelNum)
    DECLARE @Count INT--社团当前人数
    --统计社团当前人数
    SELECT @Count =  当前人数 FROM 社团 WHERE 社团名称 = @ComName
    --当前人数-1 更新到社团记录中
    UPDATE 社团 SET 当前人数 = (@Count - 1) WHERE 社团名称 = @ComName
END
GO

--创建社团插入到社团表时同时指定创建人为社团成员且为社团管理员
CREATE TRIGGER InsertCom
ON 社团
AFTER INSERT
AS
BEGIN
    DECLARE @StuNo NVARCHAR(12)
    DECLARE @ComName NVARCHAR(20)
    SELECT @StuNo = 社团创始人学号,@ComName = 社团名称 FROM INSERTED
    INSERT INTO 社团成员(学号,社团名称,加入时间,权限)
    VALUES(@StuNO ,@ComName,GETDATE(),'admin')
END




