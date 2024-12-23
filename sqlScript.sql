USE [master]
GO
/****** Object:  Database [AdMe]    Script Date: 05.12.2024 21:40:21 ******/
CREATE DATABASE [AdMe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdMe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdMe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdMe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdMe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AdMe] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdMe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdMe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdMe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdMe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdMe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdMe] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdMe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdMe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdMe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdMe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdMe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdMe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdMe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdMe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdMe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdMe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdMe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdMe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdMe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdMe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdMe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdMe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdMe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdMe] SET RECOVERY FULL 
GO
ALTER DATABASE [AdMe] SET  MULTI_USER 
GO
ALTER DATABASE [AdMe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdMe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdMe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdMe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdMe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AdMe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AdMe', N'ON'
GO
ALTER DATABASE [AdMe] SET QUERY_STORE = ON
GO
ALTER DATABASE [AdMe] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AdMe]
GO
/****** Object:  Table [dbo].[Analytics]    Script Date: 05.12.2024 21:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analytics](
	[AnalyticsID] [int] IDENTITY(1,1) NOT NULL,
	[CampaignID] [int] NOT NULL,
	[Clicks] [int] NOT NULL,
	[Conversions] [int] NOT NULL,
	[Sales] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AnalyticsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaigns]    Script Date: 05.12.2024 21:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaigns](
	[CampaignID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Goals] [nvarchar](max) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Budget] [decimal](18, 2) NOT NULL,
	[ResponsiblePersonId] [int] NULL,
 CONSTRAINT [PK__Campaign__3F5E8D7913FFE9ED] PRIMARY KEY CLUSTERED 
(
	[CampaignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 05.12.2024 21:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ContactInfo] [nvarchar](255) NULL,
	[History] [nvarchar](max) NULL,
	[Preferences] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 05.12.2024 21:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[ExpenseID] [int] IDENTITY(1,1) NOT NULL,
	[CampaignID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExpenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 05.12.2024 21:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[CampaignType] [nvarchar](50) NOT NULL,
	[RequestDate] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resources]    Script Date: 05.12.2024 21:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resources](
	[ResourceID] [int] IDENTITY(1,1) NOT NULL,
	[CampaignID] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[AccessRights] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ResourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05.12.2024 21:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Campaigns] ON 

INSERT [dbo].[Campaigns] ([CampaignID], [ClientID], [Title], [Goals], [StartDate], [EndDate], [Budget], [ResponsiblePersonId]) VALUES (6, 1, N'gsfde', N'1', CAST(N'2024-11-21T00:00:00.000' AS DateTime), CAST(N'2024-11-26T00:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Campaigns] ([CampaignID], [ClientID], [Title], [Goals], [StartDate], [EndDate], [Budget], [ResponsiblePersonId]) VALUES (7, 1, N'выф', N'213', CAST(N'2024-12-09T00:00:00.000' AS DateTime), CAST(N'2024-12-05T00:00:00.000' AS DateTime), CAST(123.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Campaigns] ([CampaignID], [ClientID], [Title], [Goals], [StartDate], [EndDate], [Budget], [ResponsiblePersonId]) VALUES (8, 1, N'ывф', N'12', CAST(N'2024-12-05T00:00:00.000' AS DateTime), CAST(N'2024-12-18T00:00:00.000' AS DateTime), CAST(123.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Campaigns] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientID], [Name], [ContactInfo], [History], [Preferences]) VALUES (1, N'asd', N'sad', NULL, N'SMM')
INSERT [dbo].[Clients] ([ClientID], [Name], [ContactInfo], [History], [Preferences]) VALUES (2, N'Булат', N'748911894', NULL, N'Онлайн')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Requests] ON 

INSERT [dbo].[Requests] ([RequestID], [ClientID], [CampaignType], [RequestDate], [Status]) VALUES (1, 1, N'1', CAST(N'2024-12-05T18:37:31.833' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[Requests] OFF
GO
SET IDENTITY_INSERT [dbo].[Resources] ON 

INSERT [dbo].[Resources] ([ResourceID], [CampaignID], [Type], [Content], [AccessRights]) VALUES (3, 6, N'3213', N'213', N'1234354')
INSERT [dbo].[Resources] ([ResourceID], [CampaignID], [Type], [Content], [AccessRights]) VALUES (4, 7, N'Ad', N'1234', N'432')
SET IDENTITY_INSERT [dbo].[Resources] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role]) VALUES (1, N'admin', N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4C5F0838B]    Script Date: 05.12.2024 21:40:21 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Analytics] ADD  DEFAULT ((0)) FOR [Clicks]
GO
ALTER TABLE [dbo].[Analytics] ADD  DEFAULT ((0)) FOR [Conversions]
GO
ALTER TABLE [dbo].[Analytics] ADD  DEFAULT ((0)) FOR [Sales]
GO
ALTER TABLE [dbo].[Analytics] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Expenses] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Requests] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[Analytics]  WITH CHECK ADD  CONSTRAINT [FK__Analytics__Campa__4AB81AF0] FOREIGN KEY([CampaignID])
REFERENCES [dbo].[Campaigns] ([CampaignID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Analytics] CHECK CONSTRAINT [FK__Analytics__Campa__4AB81AF0]
GO
ALTER TABLE [dbo].[Campaigns]  WITH CHECK ADD  CONSTRAINT [FK__Campaigns__Clien__398D8EEE] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Campaigns] CHECK CONSTRAINT [FK__Campaigns__Clien__398D8EEE]
GO
ALTER TABLE [dbo].[Campaigns]  WITH CHECK ADD  CONSTRAINT [FK_Campaigns_Users] FOREIGN KEY([ResponsiblePersonId])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Campaigns] CHECK CONSTRAINT [FK_Campaigns_Users]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK__Expenses__Campai__440B1D61] FOREIGN KEY([CampaignID])
REFERENCES [dbo].[Campaigns] ([CampaignID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK__Expenses__Campai__440B1D61]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Resources]  WITH CHECK ADD  CONSTRAINT [FK__Resources__Campa__403A8C7D] FOREIGN KEY([CampaignID])
REFERENCES [dbo].[Campaigns] ([CampaignID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Resources] CHECK CONSTRAINT [FK__Resources__Campa__403A8C7D]
GO
USE [master]
GO
ALTER DATABASE [AdMe] SET  READ_WRITE 
GO
