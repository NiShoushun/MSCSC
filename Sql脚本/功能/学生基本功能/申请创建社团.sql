USE MSCSC
go
--申请加入社团
CREATE PROC ApplyToCreateCom
@StuNo nvarchar(12),
@ConName nvarchar(20),
@ComInfo text
AS 
BEGIN
    --返回信息
    Declare @Msg nvarchar(20)
    Declare @StuExist bit
    SELECT @StuExist = COUNT(*) FROM 学生 WHERE 学号 = @StuNO
    --先检查学生是否存在
    IF @StuExist = 'True'
    BEGIN
        Declare @Count int
        Select COUNT(*) from 待审核社团 
        Where 社团创始人学号 = @StuNo AND 社团名称 = @ConName
        --如果之前该学号有过向该社团ID提交申请
        IF @Count > 0
        BEGIN
            Set @Msg = '已经申请过了'
            Select @Msg '系统通知'
        END
        --之前未申请
        ELSE
        BEGIN
            --检查社团是否已存在
            DECLARE @ComExist BIT
            Select @ComExist = COUNT(*) from 社团 
            Where 社团名称 = @ConName
            IF @ComExist = 'True'
            BEGIN
                Set @Msg = '申请提交失败，社团已存在'
            END
            ELSE
            BEGIN
                Set @Msg = '申请提交成功' 
                --将学生申请信息插入到待审核社团成员表中
                Insert Into 待审核社团 (社团名称,社团创始人学号,社团简介,申请日期,是否通过)
                values (@ConName,@StuNo,@ComInfo,GETDATE(),'FALSE')
            END
        END
    END
    ELSE
    BEGIN
        Set @Msg = '申请提交失败,学生不存在' 
    END
    Select @Msg '系统通知'
END


