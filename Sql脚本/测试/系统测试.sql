GO
--登陆验证
verifyUser '2016030001' ,'123456'
GO
--修改密码
setPasswd '2016030001' ,'123456','18724787072'
GO
verifyUser '2016030001' ,'18724787072'
GO
ShowSelfInfo '2016030001'
GO
--学生申请创建社团
ApplyToCreateCom '2016030001','学习社','一起学习吧'
GO
--学生查看创建社团申请信息
ShowCC '2016030001'
GO
--社团管理员批准成立 
PermitCom '学习社'
GO
--学生申请加入社团
ApplyjoinCom '2017040025','学习社','想学习'
GO
--学生查看申请加入社团记录
ShowACInfo '2017040025'
GO
--管理员查看申请加入社团记录
ShowUnApprovalStu '2016030001','学习社'
GO
ShowUnApprovalStu '2016010015','剑道社'
GO
--管理员批准学生加入社团
permitStu '2016030001','2017040025','学习社'
GO
--学生查看自己信息
ShowSelfInfo '2017040025'
GO
--显示特定社团信息
ViewComInfo '学习社'
GO
--显示所有社团信息
viewAllComInfo 
GO
--社团管理员撤销管理员权限
KAdmin '2016030001','学习社'
GO
ViewComInfo '学习社'
GO
--社团管理员设定管理员权限
AsAdmin '2016030001','学习社'
GO
--学生退出社团
QuitCom '2017040025','学习社','太累'
GO
--显示社团退出人员信息
ShowOutMem '2016010015','剑道社'
GO
DelCom '学习社'
GO








