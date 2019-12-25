USE MSCSC
GO

CREATE PROC [dbo].[DelCom]
@ComName NVARCHAR(10)
AS
BEGIN
    DECLARE @Msg NVARCHAR(20)
    --首先检查是否存在该待审核社团
    DECLARE @Count INT
    SELECT @Count = COUNT(*) FROM 社团 WHERE 社团名称 = @ComName
    --如果存在该待审核社团且未审核通过
    IF @Count !=0
    BEGIN
        --删除该社团并触发删除社团触发器
        DELETE from 社团 where 社团名称 = @ComName
        --返回信息
        SET @Msg = '社团删除成功'
    END
    ELSE 
    BEGIN
        SET @Msg = '社团删除失败，未查询该社团'
    END
    SELECT @Msg '系统信息'
END
GO
