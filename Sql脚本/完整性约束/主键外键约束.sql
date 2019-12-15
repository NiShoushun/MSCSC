use MSCSC

--主键设置
----学号设为学生表主键
alter table 学生 add constraint PK_学号 PRIMARY KEY(学号)
----学号，成员ID设为社团成员表主键
alter table 社团成员 add CONSTRAINT PK_社团成员 PRIMARY KEY(学号,社团名称)
----学号，社团名称设为待审核社团成员表主键
alter table 待审核社团成员 add CONSTRAINT PK_待审核社团成员 PRIMARY KEY(学号,社团名称)
----社团名称设为社团表主键
alter table 社团 add CONSTRAINT PK_社团 PRIMARY KEY(社团名称)
----社团名设为待审核社团表主键
alter table 待审核社团 add CONSTRAINT PK_待审核社团 PRIMARY KEY(社团名称)
alter table 登陆表 add CONSTRAINT PK_登录表 PRIMARY KEY(学号)


--外键设置
----其它表的学号与学生表学号相关联，为外键
alter table 待审核社团成员 add constraint FK_待审核社团成员学号  FOREIGN KEY (学号) REFERENCES 学生(学号)
alter table 社团成员 add constraint FK_社团成员学号  FOREIGN KEY (学号) REFERENCES 学生(学号)
alter table 退会成员 add constraint FK_退会成员学号  FOREIGN KEY (学号) REFERENCES 学生(学号)
Alter table 待审核社团 add CONSTRAINT FK_社团创始人学号 FOREIGN Key(社团创始人学号) REFERENCES 学生(学号)
Alter table 登陆表 add CONSTRAINT FK_登录学号 FOREIGN Key(学号) REFERENCES 学生(学号)
