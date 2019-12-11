USE MSCSC
GO

Create Proc PermitStu 
@StuNo NVARCHAR(10),
@ComID NVARCHAR(10)
As 
BEGIN
    DECLARE @IsAdmin BIT
    DECLARE @Msg NVARCHAR(10)
    SET @IsAdmin = IsAdmin(@StuNo,@ComID)
    
    

END