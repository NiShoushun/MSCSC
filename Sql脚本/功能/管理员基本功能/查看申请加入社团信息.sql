USE MSCSC
GO

ALTER PROC ShowApprovalStu
    @AdminNO NVARCHAR(12),
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
        SELECT 学生.学号 AS '申请人学号', 学生.姓名 AS '申请人姓名', 申请时间, 加入说明
        From 待审核社团成员, 学生
        WHERE 学生.学号 != @AdminNo AND 是否通过 = 'True'
            AND 社团名称 = @ComName
            AND 学生.学号 = 待审核社团成员.学号
    END
    ELSE
    BEGIN
        SET @Msg = '您没有权限查看该信息'
        SELECT @Msg '系统通知'
    END
END
GO

ALTER PROC ShowUnApprovalStu
    @AdminNO NVARCHAR(12),
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
        SELECT 学生.学号, 学生.姓名, 申请时间, 加入说明
        From 学生, 待审核社团成员
        WHERE 学生.学号 != @AdminNo AND 是否通过 = 'False'
            AND 社团名称 = @ComName
            AND 学生.学号 = 待审核社团成员.学号
    END
    ELSE
    BEGIN
        SET @Msg = '您没有权限查看该信息'
        SELECT @Msg '系统通知'
    END
END
GO