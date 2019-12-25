use MSCSC
go

--用户输入学号+密码，将密码MD5处理后，查询是否有该记录
USE [MSCSC]
GO

--用户输入学号+密码，将密码MD5处理后，查询是否有该记录
CREATE PROC [dbo].[VerifyUser]
@StuInfo NVARCHAR(12),
@Password VARCHAR(100)
AS
BEGIN
    DECLARE @Result BIT
    SELECT @Result = COUNT(*) from 登陆表 
    Where 密码 = HASHBYTES('MD5',@Password) AND 学号 = @StuInfo
    SELECT @Result AS '验证结果'
END
GO


    
