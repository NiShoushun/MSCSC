--学生退出社团功能
use MSCSC
go

Create Proc QuitCom
@StuNo nvarchar(12),
@ComName nvarchar(20)
AS 
BEGIN
    --返回信息
    Declare @Msg nvarchar(20)
    Declare @Count int
    Select COUNT(*) from 社团成员 Where 学号 = @StuNo AND 社团名称 = @ComName
    --如果该学号已在该社团中
    IF @Count > 0
    BEGIN
        Set @Msg = '退出社团['+@ComName+']成功'
        --从社团成员中删除该记录--触发退会成员触发器
        delete from 社团成员 Where 学号 = @StuNo AND 社团名称 = @ComName
    END
    --如果该学号不在该社团中
    ELSE
    BEGIN
        Set @Msg = '退出失败，尚未加入该社团' 
    END
    Select @Msg '系统通知'
END