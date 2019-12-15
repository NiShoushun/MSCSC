USE MSCSC
GO

CREATE PROC KAdmin
@StuNO NVARCHAR(10),
@ComName NVARCHAR(20)
AS
BEGIN
    DECLARE @Msg NVARCHAR(20)
    DECLARE @Count INT
    --查询该社团成员是否存在
    SELECT @Count = COUNT(*) FROM 社团成员 
    WHERE 社团名称 = @ComName AND 学号 = @StuNo AND 权限 = 'admin'
    IF @Count = 1
    BEGIN
        UPDATE 社团成员 SET 权限 = 'mem' WHERE 学号 = @StuNo AND 社团名称 = @ComName
        SET @Msg = '已撤回管理员权限'
    END
    ELSE 
    BEGIN
        SET @Msg = '授予撤回失败，请重新检查'
    END
        Select @Msg '系统通知'
END