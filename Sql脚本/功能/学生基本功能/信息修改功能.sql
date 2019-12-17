USE MSCSC
go

--学生修改密码
Alter PROC SetPasswd
    @StuNo NVARCHAR(12),    --学号
    @OldPW VARCHAR(32),    --旧密码
    @NewPW VARCHAR(32)     --新密码
AS
BEGIN
    DECLARE @Msg NVARCHAR(10)
    DECLARE @TruePW VARCHAR(32)
    SELECT @TruePW = 密码 FROM 登陆表 WHERE 学号 = @StuNo
    --先比较旧密码是否正确，再进行修改
    SELECT HashBytes('MD5',@OldPW),@TruePW
    IF @TruePW = HashBytes('MD5',@OldPW)
    BEGIN
        UPDATE 登陆表 SET 密码 = HashBytes('MD5',@NewPW) WHERE 学号 = @StuNo
        SET @Msg = '密码修改成功'
    END
    ELSE
    BEGIN
        SET @Msg = '修改失败，密码错误'
    END
    SELECT @MSG '系统通知'
END

go

--学生修改电话号码
Create PROC SetTelnum
    @StuNo NVARCHAR(10),    --学号
    @Telnum NVARCHAR(12)    --电话号码
AS
BEGIN
    DECLARE @Msg NVARCHAR(10)
    UPDATE 学生 SET 电话号码 = @Telnum WHERE 学号 = @StuNo
    SET @Msg = '修改成功'
    SELECT @MSG '返回信息'
END

