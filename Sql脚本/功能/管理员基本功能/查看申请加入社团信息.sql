USE MSCSC
GO

CREATE PROC ShowApprovalStu
@AdminNO NVARCHAR(12),
@ComName NVARCHAR(20)
AS
BEGIN
    SELECT * From 待审核社团成员 WHERE 学号 != @AdminNo AND 是否通过 = 'True'
END
GO

CREATE PROC ShowUnApprovalStu
@AdminNO NVARCHAR(12),
@ComName NVARCHAR(20)
AS
BEGIN
    SELECT * From 待审核社团成员 WHERE 学号 != @AdminNo AND 是否通过 = 'False'
END
