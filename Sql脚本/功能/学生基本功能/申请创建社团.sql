USE MSCSC

go

CREATE PROC ApplyToCreateCom
@StuNo nvarchar(10),
@ConName nvarchar(20),
@ComInfo text
AS 
BEGIN
    --返回信息
    Declare @Msg nvarchar(20)
    Declare @Count int
    Select COUNT(*) from 待审核社团 
    Where 社团创始人 = @StuNo AND 社团名称 = @ConName
    --如果之前该学号有过向该社团ID提交申请
    IF @Count > 0
    BEGIN
        Set @Msg = '已经申请过了'
        Select @Msg 返回信息
    END
    --之前未申请
    ELSE
    BEGIN
        Set @Msg = '申请提交成功' 
        --将学生申请信息插入到待审核社团成员表中
        Insert Into 待审核社团 (社团名称,社团创始人,社团简介,申请日期,是否通过)
        values (@ConName,@StuNo,@ComInfo,GETDATE(),'FALSE')
        Select @Msg 返回信息
    END
END


