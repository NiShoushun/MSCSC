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
ViewComInfo '书法社' --YES
GO
ViewComInfo '剑道社' --YES
GO
viewComInfo '影视鉴赏社' --YES
GO
ShowSelfInfo '2016010021'  --YES
GO
ApplyjoinCom '2016010002','剑道社','想成为剑士' --YES
GO
ApplyjoinCom '2016010021','剑道社','想成为剑士1' --已经申请过，错误提示--YES
GO
verifyUser '2016010002' ,'18724787072' --YES
GO
setPasswd '2016010002' ,'123456','18724787072' --NO
GO
setTelNum '2016010002','18724787072' --YES
GO
ShowSelfInfo '2016010002' --YES
GO
ShowUnApprovalStu '2016010015','剑道社' --YES
GO
ApplyjoinCom '2017040025','剑道社','想成为剑士' --YES
GO
PermitStu '2016010015','2017040025','剑道社' --YES
GO
ShowACInfo '2016010021'
GO
SHowCC '2016010015'
GO
ShowApprovalStu '2016010015','剑道社' --YES
GO
QuitCom '2016010002','剑道社','太累' --YES
GO
KAdmin '2016010015','剑道社'
GO
AsAdmin '2016010015','剑道社'
GO
ShowOutMem '2016010015','剑道社'
GO
DelCom '影视鉴赏社'

GO


APPLYtoCreateCom '2016010002','舞蹈社' ,'跳舞'

ShowCC '2016010002'

PermitCom '舞蹈社'
ApplyjoinCom '2018010003','舞蹈社','想跳舞'
ShowUnApprovalStu '2016010002','舞蹈社'

permitStu '2016010002','2018010003','学习社'
Kadmin '2016010002' ,'舞蹈社'
ViewCominfo '舞蹈社'
Asadmin '2016010002' ,'舞蹈社'
QuitCOm '2018010003','舞蹈社','跳累了'
ShowOutMem '2016010002','舞蹈社'