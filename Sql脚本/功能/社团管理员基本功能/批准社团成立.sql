USE MSCSC
GO

CREATE PROC PermitCom
@ComName NVARCHAR(10)
AS
BEGIN
    DECLARE @Msg NVARCHAR(20)
    --首先检查是否存在该待审核社团
    DECLARE @Count INT
    SELECT @Count = COUNT(*) FROM 待审核社团 WHERE 社团名称 = @ComName AND 是否通过 = 'False'
    --如果存在该待审核社团且未审核通过
    IF @Count !=0
    BEGIN
        DECLARE @ComCreaterNo NVARCHAR(10) 
        DECLARE @ComInfo NVARCHAR(1000)
        SELECT @ComCreaterNo = 社团创始人学号,@ComInfo = 社团简介 FROM 待审核社团 WHERE 社团名称 = @ComName AND 是否通过 = 'False'
        UPDATE 待审核社团 SET 是否通过 = 'True' WHERE 社团名称 = @ComName AND 是否通过 = 'False'
        --插入到社团表--触发添加社团InsertCom触发器
        INSERT INTO 社团(社团名称,社团创始人学号,社团简介,成立日期,当前人数)
        VALUES (@ComName,@ComCreaterNo,@ComInfo,GETDATE(),1)
        --返回信息
        SET @Msg = '社团添加成功'
    END
    ELSE 
    BEGIN
        SET @Msg = '社团添加失败，未查询该社团或该社团已通过'
    END
    SELECT @Msg '系统信息'
END