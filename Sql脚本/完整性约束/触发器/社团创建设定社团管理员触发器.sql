USE MSCSC
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