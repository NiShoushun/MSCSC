use MSCSA

CREATE TABLE [dbo].[ѧ��](
	[ѧ��] [nvarchar](10) NOT NULL,
	[����] [nvarchar](10) NOT NULL,
	[����] [int] NOT NULL,
	[�Ա�] [nvarchar](2) NOT NULL,
	[Ժϵ] [nvarchar](20) NOT NULL,
	[�꼶] [int] NOT NULL,
	[�绰����] [nvarchar](12) NULL
) ON [PRIMARY]


CREATE TABLE [dbo].[����](
	[����ID] [nvarchar](10) NOT NULL,
	[��������] [nvarchar](20) NOT NULL,
	[���Ŵ�ʼ��] [nvarchar](10) NOT NULL,
	[���ż��] [text] NULL,
	[��������] [datetime] NOT NULL,
	[��ǰ����] [int] NOT NULL,
	[�������] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


CREATE TABLE [dbo].[���������](
	[��������] [nvarchar](20) NOT NULL,
	[���Ŵ�ʼ��] [nvarchar](10) NOT NULL,
	[���ż��] [text] NULL,
	[��������] [datetime] NOT NULL,
	[�Ƿ�ͨ��] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

--insert into ��������� values('1','1','���',getDate(),1)
--select convert(char(10),��������,120) from ���������
--delete from ���������


CREATE TABLE [dbo].[���ų�Ա](
	[ѧ��] [nvarchar](10) NOT NULL,
	[����ID] [nvarchar](10) NOT NULL,
	[��ԱID] [nvarchar](10) NOT NULL,
	[����ʱ��] [datetime] NOT NULL,
	[Ȩ��] [nvarchar](5) NOT NULL
) ON [PRIMARY]


CREATE TABLE [dbo].[�˻��Ա](
	[ѧ��] [nvarchar](10) NOT NULL,
	[����ID] [nvarchar](10) NOT NULL,
	[�˳�ʱ��] [datetime] NOT NULL,
	[��ϵ��ʽ] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


CREATE TABLE [dbo].[��������ų�Ա](
	[ѧ��] [nvarchar](10) NOT NULL,
	[����ID] [nvarchar](10) NOT NULL,
	[����ʱ��] [datetime] NOT NULL,
	[�Ƿ�ͨ��] [bit] NOT NULL,
	[����˵��] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


CREATE TABLE [dbo].[��½��](
	[ѧ��] [nvarchar](10) NOT NULL,
	[����] [nvarchar](32) NOT NULL
) ON [PRIMARY]


