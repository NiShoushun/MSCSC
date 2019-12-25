USE MSCSC
GO
--删除社团时将退会成员表，成员表中有关该社团记录一并删除
CREATE TRIGGER [dbo].[DeleteCom]
ON [dbo].[社团]
AFTER DELETE
AS
BEGIN
    DECLARE @ComName NVARCHAR(20)
    
    SELECT @ComName = 社团名称 FROM DELETED 
    DELETE FROM 待审核社团成员 WHERE 社团名称 = @ComName
    DELETE FROM 社团成员 WHERE 社团名称 = @ComName
    DELETE FROM 退会成员 WHERE 社团名称 = @ComName
END
GO
