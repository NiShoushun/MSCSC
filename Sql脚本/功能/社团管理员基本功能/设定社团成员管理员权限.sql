USE MSCSC
GO

CREATE PROC CAdmin
@StuNO NVARCHAR(10),
@ComID NVARCHAR(10)
AS
BEGIN
    DECLARE @Msg NVARCHAR(20)
    DECLARE @Count INT
    --查询该社团成员是否存在
    SELECT @Count = COUNT(*) FROM 社团成员 
    WHERE 社团ID = @ComID AND 学号 = @StuNo AND 权限 != 'admin'
    IF @Count = 1
    BEGIN
        DECLARE @AdCount INT
        SELECT @AdCount = COUNT(*) FROM 社团成员 
        WHERE 社团ID = @ComID AND 权限 = 'admin'
        --如果该社团不存在管理员
        IF @AdCount = 0
        BEGIN
            UPDATE 社团成员 SET 权限 = 'admin' WHERE 学号 = @StuNo AND 社团ID = @ComID
            SET @Msg = '已授予管理员权限'
            Select @Msg '系统通知'
        END
        ELSE
        BEGIN
            SET @Msg = '授予权限失败，该社团已存在管理员'
            Select @Msg '系统通知'
        END
    END
    ELSE 
    BEGIN
        SET @Msg = '授予权限失败，请重新检查'
        Select @Msg '系统通知'
    END
END