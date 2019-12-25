use MSCSC
go

--申请加入社团功能
CREATE Proc  [dbo].[ApplyJoinCom]
@StuNo nvarchar(12),
@ComName nvarchar(20),
@加入说明 text
AS 
BEGIN
    --返回信息
    Declare @Msg nvarchar(20)
    Declare @Count int
    Select @Count = COUNT(*) from 待审核社团成员 
    Where 学号 = @StuNo AND 社团名称 = @ComName
    --如果之前该学号有过向该社团ID提交申请
    IF @Count > 0
    BEGIN
        Set @Msg = '已经申请过了'
    END
    --之前未申请
    ELSE
    BEGIN
        Set @Msg = '申请提交成功' 
        --将学生申请信息插入到待审核社团成员表中
        Insert Into 待审核社团成员 (学号,社团名称,申请时间,是否通过,加入说明)
        values (@StuNo,@ComName,GETDATE(),'FALSE',@加入说明)
    END
    Select @Msg 返回信息
END
GO



