USE MSCSC
GO

--默认密码值 为 ：MD5(123456)
CREATE DEFAULT 默认密码
AS HashBytes('MD5','123456')
GO
--将默认密码绑定到登陆表密码中
sp_bindefault '默认密码','登陆表.密码'

--添加社团人数检查
ALter Table 社团 ADD CONSTRAINT Check_Num CHECK (
    当前人数 <= 最大人数 
    AND  最大人数 > 0
    AND 当前人数 >= 0
)


