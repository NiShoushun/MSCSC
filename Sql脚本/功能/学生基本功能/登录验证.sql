use MSCSC
go

--用户输入学号+密码，将密码MD5处理后，查询是否有该记录
CREATE PROC VerifyUser
@StuInfo NVARCHAR(12),
@Password NVARCHAR(40)
AS
BEGIN
    SELECT COUNT(*) FROM 登陆表 
    WHERE 学号 = @StuInfo AND 密码 = HashBytes('MD5',@Password) 
END
    
