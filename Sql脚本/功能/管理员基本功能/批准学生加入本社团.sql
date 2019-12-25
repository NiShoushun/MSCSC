USE MSCSC
GO

--批准学生加入社团
CREATE Proc [dbo].[PermitStu] 
@AdminNo NVARCHAR(12),
@StuNo NVARCHAR(12),
@ComName NVARCHAR(20)
As 
BEGIN
    DECLARE @IsAdm BIT
    DECLARE @Msg NVARCHAR(20)
    --获取该操作者在该社团的权限
    SET @IsAdm = dbo.IsAdmin(@AdminNo,@ComName)
    --如果是管理员权限
    IF @IsAdm = 1
    BEGIN
        --先检查学生是否申请加入该社团且未通过
        DECLARE @IsExist INT
        SELECT @IsExist = COUNT(*) FROM 待审核社团成员 
        WHERE 学号 = @StuNo AND 社团名称 = @ComName AND 是否通过 = 'False'
        IF @IsExist = 1
        BEGIN
            --首先将待审核社团成员通过标志设为'True'
            UPDATE 待审核社团成员 SET 是否通过 = 'True' 
            WHERE 学号 = @StuNo AND 社团名称 = @ComName
            --以当前人数作为成员ID
            DECLARE @Count INT
            SELECT @Count = COUNT(*) FROM 社团成员 WHERE 社团名称 = @ComName
            INSERT INTO 社团成员 (学号,社团名称,加入时间,权限)
            VALUES(@StuNo,@ComName,GETDATE(),'mem')
            SET @Msg = '添加成功'
        END
        ELSE
        BEGIN
            SET @Msg = '添加失败，该学生未申请加入本社团'
        END
    END
    --非管理员操作
    ELSE
    BEGIN
        SET @Msg = '请以管理员权限进行操作'
    END
    SELECT @Msg '系统通知'
END
GO


