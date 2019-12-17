CREATE PROC ShowOutMem
@AdminNo NVARCHAR(12),
@ComName NVARCHAR(20)
AS
BEGIN
    DECLARE @IsAdm BIT
    DECLARE @Msg NVARCHAR(20)
    --获取该操作者在该社团的权限
    SET @IsAdm = dbo.IsAdmin(@AdminNo,@ComName)
    --如果是管理员权限
    IF @IsAdm = 1
    BEGIN
         SELECT * From 退会成员 WHERE 社团名称 = @ComName
    END
    ELSE
    BEGIN
        SET @Msg = '您没有权限查看该信息'
        SELECT @Msg '系统通知'
    END
END