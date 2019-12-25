USE MSCSC
GO
--加入社团时将社团当前人数+1
CREATE TRIGGER [dbo].[InsertComMember]
ON [dbo].[社团成员]
AFTER DELETE
AS
BEGIN
    DECLARE @ComName NVARCHAR(20)
    SELECT @ComName = 社团名称 FROM DELETED 
    --将删除信息插入到退会成员表
    DECLARE @Count INT--社团当前人数
    --统计社团当前人数
    SELECT @Count =  当前人数 FROM 社团 WHERE 社团名称 = @ComName
    --当前人数-1 更新到社团记录中
    UPDATE 社团 SET 当前人数 = (@Count + 1) WHERE 社团名称 = @ComName
END
GO
