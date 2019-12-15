verifyUser '2016010002' ,'123456' --NO
GO
setPasswd '2016010002' ,'123456','123456' --NO
GO
setTelNum '2016010002','18724787072'
GO
ShowSelfInfo '2016010002'
--社团创建申请
GO
ApplyToCreateCom '2016010002','书法社','书法练习' --YES
GO
ApplyToCreateCom '2016010002','书法社','书法练习' --重复申请 拒绝 --YES
GO
ApplyToCreateCom '2016010015','剑道社','剑道练习' --YES
GO
ApplyToCreateCom '2017040025','影视鉴赏社','鉴赏影视作品' --YES
GO
ApplyToCreateCom '2015040025','游戏社','游戏攻略组' --学号不存在，申请失败--YES
GO
--社团管理员操作
ShowUnApprovalCom --YES
GO
PermitCom '书法社' --YES
GO
PermitCom '书法社' --重复社团添加失败--YES
GO
PermitCom '剑道社' --YES
GO
PermitCom '影视鉴赏社' --YES
GO
PermitCom '游戏社' --社团不存在，添加失败 --YES 
GO
ShowApprovalCom --YES
GO
ShowCom --YES
GO
--学生操作
ViewAllComInfo --YES
GO
ViewComInfo 0 --YES
GO
ViewComInfo 1 --YES
GO
viewComInfo 2 --YES
GO





