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
    --将待审核社团中所有社团创始人为被删除学生的人且未通过审核的学生记录清除掉
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
    --使用内置函数HashBytes将MD5处理后的‘123456’插入到登陆表中
    INSERT INTO 登录表 (学号,密码) VALUES(@StuNO,HashBytes('MD5','123456'))
END