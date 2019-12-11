USE MSCSC
GO

--输入学号+社团ID 判断权限是否为‘admin’ ,返回bit
CREATE FUNCTION IsAdmin(@StuNo NVARCHAR(10),@ComID NVARCHAR(10))
RETURNS BIT
AS
BEGIN
    DECLARE @IsAdmin BIT
    DECLARE @Count INT
    SELECT @Count = COUNT(*) FROM 社团成员 WHERE 学号 = @StuNo AND 社团ID = @ComID AND 权限 = 'admin'
    IF @Count = 0
    SET @IsAdmin = 0
    ELSE
    SET @IsAdmin = 1
    RETURN @IsAdmin
END


