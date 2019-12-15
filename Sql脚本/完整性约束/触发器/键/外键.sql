--外键设置
----其它表的学号与学生表学号相关联，为外键
alter table 待审核社团成员 add constraint FK_待审核社团成员学号  FOREIGN KEY (学号) REFERENCES 学生(学号)
alter table 社团成员 add constraint FK_社团成员学号  FOREIGN KEY (学号) REFERENCES 学生(学号)
alter table 退会成员 add constraint FK_退会成员学号  FOREIGN KEY (学号) REFERENCES 学生(学号)
Alter table 待审核社团 add CONSTRAINT FK_社团创始人学号 FOREIGN Key(社团创始人学号) REFERENCES 学生(学号)
Alter table 登陆表 add CONSTRAINT FK_登录学号 FOREIGN Key(学号) REFERENCES 学生(学号)