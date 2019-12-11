--删除学生时同时删除所有表中有关该学生记录
CREATE TRIGGER DelStu
ON 学生
After DELETE
AS
BEGIN
    DECLARE @StuNo NVARCHAR(10)
    SELECT @StuNO = 学号 FROM DELETED
    DELETE FROM 待审核社团成员 WHERE 学号 = @StuNo
    DELETE FROM 社团成员 WHERE 学号 = @StuNo
    DELETE FROM 退会成员 WHERE 学号 = @StuNo
    DELETE FROM 登陆表 WHERE 学号 = @StuNo
    --将待审核社团中所有社团创始人为被删除学生的人且未通过审核的社团申请记录清除掉
    DELETE FROM 待审核社团 WHERE 社团创始人 = @StuNo AND 是否通过 = 'FALSE'
END

go

--添加学生时为每个学生创建初始密码“123456” ,MD5加密
CREATE TRIGGER AddStu
ON 学生
AFTER INSERT
AS
BEGIN
    DECLARE @StuNo NVARCHAR(10)
    SELECT @StuNO = 学号 FROM DELETED 
    --自动添加默认密码值
    INSERT INTO 登录表 (学号) VALUES(@StuNO)
END

go

--退出社团时将退出信息插入到退会成员表中
CREATE TRIGGER DelMember
ON 社团成员
AFTER DELETE
AS
BEGIN
    DECLARE @StuNo NVARCHAR(10)
    DECLARE @ComID NVARCHAR(10)
    DECLARE @TelNum NVARCHAR(12)
    
    SELECT @StuNO = 学号,@ComID = 社团ID FROM DELETED 
    SELECT @TelNum = 电话号码 FROM 学生 WHERE 学号 = @StuNo
    --将删除信息插入到退会成员表
    INSERT INTO 退会成员 (学号,社团ID,退出时间,联系方式) VALUES(@StuNO,@ComID,GETDATE(),@TelNum)

    DECLARE @Count INT--社团当前人数
    --统计社团当前人数
    SELECT @Count =  当前人数 FROM 社团 WHERE 社团ID = @ComID
    --当前人数-1 更新到社团记录中
    UPDATE 社团 SET 当前人数 = (@Count - 1) WHERE 社团ID = @ComID
END






