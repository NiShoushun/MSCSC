USE MSCSC
GO
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