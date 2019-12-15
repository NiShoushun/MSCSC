USE MSCSC
GO
--退出社团时将退出信息插入到退会成员表，且删除申请加入社团记录
CREATE TRIGGER DelComMember
ON 社团成员
AFTER DELETE
AS
BEGIN
    DECLARE @StuNo NVARCHAR(12)
    DECLARE @ComName NVARCHAR(20)
    DECLARE @TelNum NVARCHAR(12)
    
    SELECT @StuNO = 学号,@ComName = 社团名称 FROM DELETED 
    SELECT @TelNum = 电话号码 FROM 学生 WHERE 学号 = @StuNo
    DELETE FROM 待审核社团成员 WHERE @StuNO = 学号 AND @ComName = 社团名称
    --将删除信息插入到退会成员表
    INSERT INTO 退会成员 (学号,社团名称,退出时间,联系方式) VALUES(@StuNO,@ComName,GETDATE(),@TelNum)
    DECLARE @Count INT--社团当前人数
    --统计社团当前人数
    SELECT @Count =  当前人数 FROM 社团 WHERE 社团名称 = @ComName
    --当前人数-1 更新到社团记录中
    UPDATE 社团 SET 当前人数 = (@Count - 1) WHERE 社团名称 = @ComName
END
GO