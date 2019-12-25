USE MSCSC
GO

--查询所有通过审核的社团信息
Create PROC [dbo].[ShowUnApprovalCom]
AS
BEGIN
    SELECT * FROM 待审核社团 WHERE 是否通过 = 'False'
END
GO


--查询所有通过审核的社团信息
Create PROC [dbo].[ShowApprovalCom]
AS
BEGIN
    SELECT * FROM 待审核社团 WHERE 是否通过 = 'True'
END
GO


--查询所有社团信息
Create PROC ShowCom
AS
BEGIN
    SELECT * FROM 待审核社团
END
GO
