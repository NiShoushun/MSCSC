use MSCSC

CREATE TABLE [dbo].[学生](
	[学号] [nvarchar](12) NOT NULL,
	[姓名] [nvarchar](10) NOT NULL,
	[年龄] [int] NOT NULL,
	[性别] [nvarchar](2) NOT NULL,
	[院系] [nvarchar](20) NOT NULL,
	[年级] [int] NOT NULL,
	[电话号码] [nvarchar](12) NULL
) ON [PRIMARY]


CREATE TABLE [dbo].[社团](
	[社团名称] [nvarchar](20) NOT NULL,
	[社团创始人学号] [nvarchar](12) NOT NULL,
	[社团简介] [text] NULL,
	[成立日期] [datetime] NOT NULL,
	[当前人数] [int] NOT NULL,
	[最大人数] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


CREATE TABLE [dbo].[待审核社团](
	[社团名称] [nvarchar](20) NOT NULL,
	[社团创始人学号] [nvarchar](12) NOT NULL,
	[社团简介] [text] NULL,
	[申请日期] [datetime] NOT NULL,
	[是否通过] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


CREATE TABLE [dbo].[社团成员](
	[学号] [nvarchar](12) NOT NULL,
	[社团名称] [nvarchar](20) NOT NULL,
	[加入时间] [datetime] NOT NULL,
	[权限] [nvarchar](5) NOT NULL
) ON [PRIMARY]


CREATE TABLE [dbo].[退会成员](
	[学号] [nvarchar](12) NOT NULL,
	[社团名称] [nvarchar](20) NOT NULL,
	[退出时间] [datetime] NOT NULL,
	[联系方式] [text] NULL,
	退出说明 [text] NULL,
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


CREATE TABLE [dbo].[待审核社团成员](
	[学号] [nvarchar](12) NOT NULL,
	[社团名称] [nvarchar](20) NOT NULL,
	[申请时间] [datetime] NOT NULL,
	[是否通过] [bit] NOT NULL,
	[加入说明] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


CREATE TABLE [dbo].[登陆表](
	[学号] [nvarchar](12) NOT NULL,
	[密码] [varchar](40) NOT NULL
) ON [PRIMARY]
