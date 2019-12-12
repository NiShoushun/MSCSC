USE MSCSC
GO

--默认密码值 为 ：MD5(123456)
CREATE DEFAULT 默认密码
AS HashBytes('MD5','123456')
GO
--将默认密码绑定到登陆表密码中
sp_bindefault '默认密码','登陆表.密码'
GO

CREATE DEFAULT 默认社团最大人数
AS 50
GO
sp_bindefault '默认社团最大人数','社团.最大人数'
GO

--添加社团人数检查
ALter Table 社团 ADD CONSTRAINT Check_Num CHECK (
    当前人数 <= 最大人数 
    AND  最大人数 > 0
    AND 当前人数 >= 0
)

--检查社团成员权限类型
ALTER TABLE 社团成员 WITH CHECK
ADD CONSTRAINT 权限类型约束
CHECK (权限 in ('admin','mem'))


