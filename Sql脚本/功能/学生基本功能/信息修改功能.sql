USE MSCSC
go

--学生修改密码
CREATE PROC SetPasswd
    @StuNo NVARCHAR(10),    --学号
    @OldPW NVARCHAR(32),    --旧密码
    @NewPW NVARCHAR(32)     --新密码
AS
BEGIN
    DECLARE @TruePW NVARCHAR(32),@Msg NVARCHAR(10)
    SELECT @TruePW = 密码
    FROM 登录表
    WHERE 学号 = @StuNo
    --先比较旧密码是否正确，再进行修改
    IF @TruePW = @OldPW
    BEGIN
        UPDATE 登录表 SET 密码 = HashBytes('MD5',@NewPW) WHERE 学号 = @StuNo
        SET @Msg = '密码修改成功'
        SELECT @MSG '返回信息'
    END
    ELSE
    BEGIN
        SET @Msg = '密码错误，修改失败'
        SELECT @MSG '返回信息'
    END
END

go

--学生修改电话号码
CREATE PROC SetTelnum
    @StuNo NVARCHAR(10),    --学号
    @Telnum NVARCHAR(12)    --电话号码
AS
BEGIN
    DECLARE @Msg NVARCHAR(10)
    UPDATE 登录表 SET 电话号码 = @Telnum WHERE 学号 = @StuNo
    SET @Msg = '修改成功'
    SELECT @MSG '返回信息'
END

