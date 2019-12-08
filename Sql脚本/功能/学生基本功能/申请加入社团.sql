--申请加入社团功能

use MSCSA
go

Create Proc  ApplyJoinCommunity
@ComID nvarchar(10),@StuNo nvarchar(10),@加入说明 text
AS 
BEGIN
    --返回信息
    Declare @Msg nvarchar(20)
    Declare @Count int
    Select COUNT(*) from 待审核社团成员 
    Where 学号 = @StuNo AND 社团ID = @ComID AND 是否通过 = 'FALSE'
    --如果之前该学号有过向该社团ID提交申请
    IF @Count > 0
    BEGIN
        Set @Msg = '已经申请过了'
        Select @Msg 返回信息
    END
    --之前未申请
    ELSE
    BEGIN
        Set @Msg = '申请提交成功' 
        --将学生申请信息插入到待审核社团成员表中
        Insert Into 待审核社团成员 (学号,社团ID,申请时间,是否通过,加入说明)
        values (@StuNo,@ComID,GETDATE(),'FALSE',@加入说明)
        Select @Msg 返回信息
    END
END



