use MSCSA

create table ѧ��
(
	ѧ�� nvarchar(10) not NULL,
	���� nvarchar(10) not NULL, 
	���� int not NULL,
	�Ա� nvarchar(2) not NULL,
	Ժϵ nvarchar(20) not NULL,
	�꼶 int not NULL,
	�绰���� nvarchar(12)
)

create table ����
(
	����ID nvarchar(10) not NULL,
	�������� nvarchar(20) not NULL,
	���Ŵ�ʼ�� nvarchar(10) not NULL,
	���ż�� text,
	�������� datetime not NULL,
	��ǰ���� int not NULL,
	������� int not NULL,
	�Ƿ�ͨ����� bit not NULL
)

create table ���ų�Ա
(
	ѧ�� nvarchar(10) not NULL,
	����ID nvarchar(10) not NULL,
	��ԱID nvarchar(10) not NULL,
	����ʱ�� datetime not NUll,
	Ȩ�� nvarchar(5) not NULL
)

create table �˻��Ա
(
	ѧ�� nvarchar(10) not NULL,
	����ID nvarchar(10) not NULL,
	�˳�ʱ�� datetime not NUll,
	��ϵ��ʽ text
)

create table ��½��
(
	ѧ�� nvarchar(10) not NULL,
	���� nvarchar(32) not NULL
)

create table ��������ų�Ա
(
	ѧ�� nvarchar(10) not NULL,
	����ID nvarchar(10) not NULL,
	����ʱ�� datetime not NUll,
)

