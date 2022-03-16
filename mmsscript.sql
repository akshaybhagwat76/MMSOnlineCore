USE [master]
GO
/****** Object:  Database [MMS_Web]    Script Date: 16-03-2022 13:21:37 ******/
CREATE DATABASE [MMS_Web]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MMS_Web', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SURENDRA\MSSQL\DATA\MMS_Web.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MMS_Web_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SURENDRA\MSSQL\DATA\MMS_Web_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MMS_Web] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MMS_Web].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MMS_Web] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MMS_Web] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MMS_Web] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MMS_Web] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MMS_Web] SET ARITHABORT OFF 
GO
ALTER DATABASE [MMS_Web] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MMS_Web] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MMS_Web] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MMS_Web] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MMS_Web] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MMS_Web] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MMS_Web] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MMS_Web] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MMS_Web] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MMS_Web] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MMS_Web] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MMS_Web] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MMS_Web] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MMS_Web] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MMS_Web] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MMS_Web] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MMS_Web] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MMS_Web] SET RECOVERY FULL 
GO
ALTER DATABASE [MMS_Web] SET  MULTI_USER 
GO
ALTER DATABASE [MMS_Web] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MMS_Web] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MMS_Web] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MMS_Web] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MMS_Web] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MMS_Web] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MMS_Web] SET QUERY_STORE = OFF
GO
USE [MMS_Web]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountID] [nchar](6) NULL,
	[Representative] [varchar](100) NULL,
	[Include_Transportation] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Representative]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Representative](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [varchar](15) NULL,
	[Name] [varchar](100) NULL,
	[Email] [varchar](320) NULL,
	[OfficePhone] [varchar](32) NULL,
	[CellPhone] [varchar](32) NULL,
	[Image_URL] [varchar](150) NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_Detail]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Detail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountID] [nchar](6) NULL,
	[TicketNumber] [nchar](8) NULL,
	[DetailID] [int] NULL,
	[Gross] [int] NULL,
	[Tare] [int] NULL,
	[Net] [int] NULL,
	[UnitCost] [money] NULL,
	[TotalCost] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_Header]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Header](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountID] [nchar](6) NULL,
	[TicketNumber] [nchar](8) NULL,
	[OrderNumber] [nchar](11) NULL,
	[TicketDate] [date] NULL,
	[PaymentTerms] [varchar](50) NULL,
	[SupplierTicket] [varchar](100) NULL,
	[CarrierTicket] [varchar](100) NULL,
	[TruckDescription] [varchar](100) NULL,
	[Status] [varchar](50) NULL,
	[PaymentReceiptURL] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_OtherPictures]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_OtherPictures](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountID] [nchar](6) NULL,
	[TicketNumber] [nchar](8) NULL,
	[PictureID] [varchar](50) NULL,
	[Thumbnail_URL] [varchar](150) NULL,
	[FullRes_URL] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_ReceivedPaperword]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_ReceivedPaperword](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountID] [nchar](6) NULL,
	[TicketNumber] [nchar](8) NULL,
	[PictureID] [varchar](50) NULL,
	[Thumbnail_URL] [varchar](150) NULL,
	[FullRes_URL] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_ScalePictures]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_ScalePictures](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountID] [nchar](6) NULL,
	[TicketNumber] [nchar](8) NULL,
	[PictureID] [varchar](50) NULL,
	[Thumbnail_URL] [varchar](150) NULL,
	[FullRes_URL] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransectionSetting]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransectionSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NULL,
	[CommodityID] [int] NULL,
	[Notes] [nvarchar](1000) NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_TransectionSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transportation_Commodities]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportation_Commodities](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountID] [nchar](6) NULL,
	[LocationID] [int] NULL,
	[CommodityID] [int] NULL,
	[Commodity_Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transportation_Locations]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportation_Locations](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountID] [nchar](6) NULL,
	[LocationID] [int] NULL,
	[LocationName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAudit]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAudit](
	[AuditId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[SessionId] [varchar](50) NULL,
	[IpAddress] [varchar](50) NULL,
	[PageAccessed] [varchar](500) NULL,
	[LoggedInAt] [varchar](50) NULL,
	[LoggedOutAt] [varchar](50) NULL,
	[LoginStatus] [varchar](1) NULL,
	[ControllerName] [varchar](50) NULL,
	[ActionName] [varchar](50) NULL,
	[UrlReferrer] [varchar](500) NULL,
	[Area] [varchar](50) NULL,
	[RoleId] [uniqueidentifier] NULL,
	[LangId] [varchar](2) NULL,
	[IsFirstLogin] [varchar](2) NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[EmailAddress] [varchar](320) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[PasswordHash] [binary](64) NULL,
	[Salt] [nvarchar](36) NULL,
	[Password_Version] [int] NULL,
	[Account_Disabled] [bit] NULL,
	[AccountID] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [AccountID], [Representative], [Include_Transportation]) VALUES (1, N'MX1000', N'Anthony J. Selby', 1)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Representative] ON 

INSERT [dbo].[Representative] ([ID], [AccountId], [Name], [Email], [OfficePhone], [CellPhone], [Image_URL], [Notes]) VALUES (1, N'MX1000', N'Anthony J. Selby', N'anthony.selby+supplier@gmail.com', N'(260) 232 3000', N'(260) 232 3015', N'http://www.metalx.net/images/f63e2cd7-398c-4464-9475-858498a0f78f.png', N'Anthony is a AR at Metalx dealing with metal')
SET IDENTITY_INSERT [dbo].[Representative] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction_Detail] ON 

INSERT [dbo].[Transaction_Detail] ([Id], [AccountID], [TicketNumber], [DetailID], [Gross], [Tare], [Net], [UnitCost], [TotalCost]) VALUES (1, N'MX1000', N'01232123', 1, 2001, 1, 2000, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Transaction_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction_Header] ON 

INSERT [dbo].[Transaction_Header] ([Id], [AccountID], [TicketNumber], [OrderNumber], [TicketDate], [PaymentTerms], [SupplierTicket], [CarrierTicket], [TruckDescription], [Status], [PaymentReceiptURL]) VALUES (1, N'MX1000', N'01232123', N'PO 0123232 ', CAST(N'2021-06-02' AS Date), N'15 Days', N'No Paperwork', N'XS1999', N'Small Truck Carrier', N'Paid', N'https://www.invoicesimple.com/wp-content/uploads/2018/05/InvoiceSimple-PDF-Template.pdf')
SET IDENTITY_INSERT [dbo].[Transaction_Header] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction_OtherPictures] ON 

INSERT [dbo].[Transaction_OtherPictures] ([Id], [AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (6, N'MX1000', N'01232123', N'2', N'https://thumbs.dreamstime.com/z/tip-truck-vector-tip-truck-vehicle-transport-vector-107204183.jpg', N'https://thumbs.dreamstime.com/z/tip-truck-vector-tip-truck-vehicle-transport-vector-107204183.jpg')
SET IDENTITY_INSERT [dbo].[Transaction_OtherPictures] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction_ReceivedPaperword] ON 

INSERT [dbo].[Transaction_ReceivedPaperword] ([Id], [AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (1, N'MX1000', N'01232123', N'1', N'https://thumbs.dreamstime.com/z/nature-forest-trees-growing-to-upward-to-sun-wallpaper-42907586.jpg', N'https://thumbs.dreamstime.com/z/nature-forest-trees-growing-to-upward-to-sun-wallpaper-42907586.jpg')
INSERT [dbo].[Transaction_ReceivedPaperword] ([Id], [AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (2, N'MX1000', N'01232123', N'2', N'https://thumbs.dreamstime.com/z/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg', N'https://thumbs.dreamstime.com/z/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg')
INSERT [dbo].[Transaction_ReceivedPaperword] ([Id], [AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (3, N'MX1000', N'01232123', N'3', N'https://thumbs.dreamstime.com/z/beautiful-rain-forest-21199829.jpg', N'https://thumbs.dreamstime.com/z/beautiful-rain-forest-21199829.jpg')
INSERT [dbo].[Transaction_ReceivedPaperword] ([Id], [AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (4, N'MX1000', N'01232123', N'4', N'https://thumbs.dreamstime.com/z/beautiful-landscape-flowing-water-17075673.jpg', N'https://thumbs.dreamstime.com/z/beautiful-landscape-flowing-water-17075673.jpg')
INSERT [dbo].[Transaction_ReceivedPaperword] ([Id], [AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (5, N'MX1000', N'01232123', N'5', N'https://thumbs.dreamstime.com/z/lake-landscape-29322283.jpg', N'https://thumbs.dreamstime.com/z/lake-landscape-29322283.jpg')
SET IDENTITY_INSERT [dbo].[Transaction_ReceivedPaperword] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction_ScalePictures] ON 

INSERT [dbo].[Transaction_ScalePictures] ([Id], [AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (1, N'MX1000', N'01232123', N'1', N'https://thumbs.dreamstime.com/z/wheels-2655503.jpg', N'https://thumbs.dreamstime.com/z/wheels-2655503.jpg')
INSERT [dbo].[Transaction_ScalePictures] ([Id], [AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (2, N'MX1000', N'01232123', N'2', N'https://thumbs.dreamstime.com/z/wheels-2655446.jpg', N'https://thumbs.dreamstime.com/z/wheels-2655446.jpg')
INSERT [dbo].[Transaction_ScalePictures] ([Id], [AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (3, N'MX1000', N'01232123', N'3', N'https://thumbs.dreamstime.com/z/wheels-2655429.jpg', N'https://thumbs.dreamstime.com/z/wheels-2655429.jpg')
INSERT [dbo].[Transaction_ScalePictures] ([Id], [AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (4, N'MX1000', N'01232123', N'4', N'https://thumbs.dreamstime.com/z/circuit-board-2040418.jpg', N'https://thumbs.dreamstime.com/z/circuit-board-2040418.jpg')
INSERT [dbo].[Transaction_ScalePictures] ([Id], [AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (5, N'MX1000', N'01232123', N'5', N'https://thumbs.dreamstime.com/z/digital-background-2655284.jpg', N'https://thumbs.dreamstime.com/z/digital-background-2655284.jpg')
SET IDENTITY_INSERT [dbo].[Transaction_ScalePictures] OFF
GO
SET IDENTITY_INSERT [dbo].[TransectionSetting] ON 

INSERT [dbo].[TransectionSetting] ([Id], [LocationID], [CommodityID], [Notes], [CreatedBy], [CreatedOn]) VALUES (1, 1, 1, N'Test by surendra singh', N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', CAST(N'2022-03-07T13:27:40.077' AS DateTime))
INSERT [dbo].[TransectionSetting] ([Id], [LocationID], [CommodityID], [Notes], [CreatedBy], [CreatedOn]) VALUES (2, 1, 1, N'test', N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', CAST(N'2022-03-10T14:35:55.460' AS DateTime))
INSERT [dbo].[TransectionSetting] ([Id], [LocationID], [CommodityID], [Notes], [CreatedBy], [CreatedOn]) VALUES (3, 1, 1, N'asdad asdfdf', N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', CAST(N'2022-03-10T14:44:53.200' AS DateTime))
INSERT [dbo].[TransectionSetting] ([Id], [LocationID], [CommodityID], [Notes], [CreatedBy], [CreatedOn]) VALUES (4, 1, 1, N'test', N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', CAST(N'2022-03-11T02:15:47.733' AS DateTime))
INSERT [dbo].[TransectionSetting] ([Id], [LocationID], [CommodityID], [Notes], [CreatedBy], [CreatedOn]) VALUES (5, 1, 0, N'tata asdsa', N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', CAST(N'2022-03-11T07:41:16.247' AS DateTime))
INSERT [dbo].[TransectionSetting] ([Id], [LocationID], [CommodityID], [Notes], [CreatedBy], [CreatedOn]) VALUES (6, 1, 0, N'taaa asdas asdsd asd ', N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', CAST(N'2022-03-11T07:42:04.100' AS DateTime))
SET IDENTITY_INSERT [dbo].[TransectionSetting] OFF
GO
SET IDENTITY_INSERT [dbo].[Transportation_Commodities] ON 

INSERT [dbo].[Transportation_Commodities] ([Id], [AccountID], [LocationID], [CommodityID], [Commodity_Name]) VALUES (1, N'MX1000', 1, 1, N'Sheet Iron')
INSERT [dbo].[Transportation_Commodities] ([Id], [AccountID], [LocationID], [CommodityID], [Commodity_Name]) VALUES (2, N'MX1000', 1, 2, N'Maintenace Scrap')
SET IDENTITY_INSERT [dbo].[Transportation_Commodities] OFF
GO
SET IDENTITY_INSERT [dbo].[Transportation_Locations] ON 

INSERT [dbo].[Transportation_Locations] ([Id], [AccountID], [LocationID], [LocationName]) VALUES (1, N'MX1000', 1, N'Main Location')
SET IDENTITY_INSERT [dbo].[Transportation_Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAudit] ON 

INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (1, NULL, N'90cdd26f-4acf-777d-24a3-9ef3da0e0e0a', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-10T14:42:02.447' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (2, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'f2cd9db4-cf93-12d8-80e2-3be3d348f2cf', N'::1', N'', N'2022-03-10 20:12:31', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-10T14:42:31.057' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (3, NULL, N'aa091fd7-6dcd-e1d5-ab9c-1f1171a6ef3d', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:42:31.103' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (4, NULL, N'aa091fd7-6dcd-e1d5-ab9c-1f1171a6ef3d', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:42:31.120' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (5, NULL, N'722c1e52-d3c1-714c-0434-b0ed8b258142', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:42:31.360' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (6, NULL, N'722c1e52-d3c1-714c-0434-b0ed8b258142', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:42:31.377' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (7, NULL, N'7e1e07b8-3ae2-60d0-78b7-64db7c513fab', N'::1', N'/admin/auditlog', NULL, NULL, N'A', N'AuditLog', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:42:33.050' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (8, NULL, N'053e630d-bad2-8008-4df1-8918f75650cc', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:42:33.233' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (9, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'd34ce164-a316-a8c0-cb33-90579bcce823', N'::1', N'', NULL, N'2022-03-10 20:14:37', NULL, N'Account', N'Logout', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-10T14:44:37.137' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (10, NULL, N'a590929a-f8fc-f578-aa5e-67f496fc9494', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/auditlog', NULL, NULL, N'1', N'', CAST(N'2022-03-10T14:44:37.223' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (11, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'8e850458-9899-b0e5-cfa6-44d361f6baaf', N'::1', N'', N'2022-03-10 20:14:42', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-10T14:44:42.927' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (12, NULL, N'd051dc8f-2c99-a42b-0e84-0cb225a806a5', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:44:42.957' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (13, NULL, N'd051dc8f-2c99-a42b-0e84-0cb225a806a5', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:44:42.973' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (14, NULL, N'00608ec2-7562-51da-1c19-4a2adf23b84d', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:44:43.117' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (15, NULL, N'00608ec2-7562-51da-1c19-4a2adf23b84d', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:44:43.140' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (16, NULL, N'762a9f2e-31f5-78fc-f4b9-73d540a98505', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:44:45.510' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (17, NULL, N'762a9f2e-31f5-78fc-f4b9-73d540a98505', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:44:45.527' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (18, NULL, N'c68caa15-7036-a515-6278-ae9fa700de31', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-10T14:44:45.760' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (19, NULL, N'fb10b515-ba53-d93d-36aa-b2c40b726591', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-10T14:44:45.760' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (20, NULL, N'5f523e6c-b29e-017f-61d1-bb05eb8bd012', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:44:53.140' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (21, NULL, N'5f523e6c-b29e-017f-61d1-bb05eb8bd012', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:44:53.157' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (22, NULL, N'296d13a2-6cfc-ddec-a356-5cd4c2b74d60', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-10T14:44:53.343' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (23, NULL, N'980759a8-67dd-f475-92be-b598ca412b65', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-10T14:44:53.343' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (24, NULL, N'1a9feeaf-a8fe-a509-3ff6-3d0b475099d4', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:44:55.143' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (25, NULL, N'1a9feeaf-a8fe-a509-3ff6-3d0b475099d4', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:44:55.157' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (26, NULL, N'1b86cfa0-f03d-b7d6-9872-f7ebcb4cc7c8', N'::1', N'/admin/auditlog', NULL, NULL, N'A', N'AuditLog', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:44:56.700' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (27, NULL, N'467a8d9e-a82c-82cf-f2d3-0ed745a29ab3', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:44:56.853' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (28, NULL, N'7f8b7607-63e9-3850-71f3-e6c49e3cc153', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:45:13.890' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (29, NULL, N'31a284d0-511c-4865-99cc-01cfef1b5d92', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-10T14:46:23.513' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (30, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'f1b678e6-ab10-aa86-8d5e-1f8346be94bd', N'::1', N'', N'2022-03-10 14:46:29', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-10T14:46:29.967' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (31, NULL, N'cc3a0859-2289-5fb6-d865-d536c8e96069', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:46:30.020' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (32, NULL, N'cc3a0859-2289-5fb6-d865-d536c8e96069', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:46:30.040' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (33, NULL, N'aca709ea-7f20-a2f8-7549-695a9b9aa053', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:46:30.430' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (34, NULL, N'aca709ea-7f20-a2f8-7549-695a9b9aa053', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:46:30.453' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (35, NULL, N'5f51399c-896f-2d71-05fe-b9df6de52631', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:46:32.430' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (36, NULL, N'5f51399c-896f-2d71-05fe-b9df6de52631', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:46:32.450' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (37, NULL, N'3eac8eb8-dfa0-d95c-2f16-c1ef845bd674', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transection/detail?ticketNo=01232123', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:46:35.550' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (38, NULL, N'3eac8eb8-dfa0-d95c-2f16-c1ef845bd674', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transection/detail?ticketNo=01232123', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:46:35.567' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (39, NULL, N'01588cd4-d627-1e06-9221-6d802a8b4252', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-10T14:46:35.790' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (40, NULL, N'63d79530-4d42-38ae-b8d7-95f17e8ee44c', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-10T14:46:35.790' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (41, NULL, N'c04bd089-7012-be06-8638-d8ee681fbf93', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:46:37.063' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (42, NULL, N'c04bd089-7012-be06-8638-d8ee681fbf93', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:46:37.080' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (43, NULL, N'c32971e4-e0ba-de15-e214-77708f529ea2', N'::1', N'/admin/auditlog', NULL, NULL, N'A', N'AuditLog', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:46:39.443' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (44, NULL, N'e5685b00-45f6-5c7d-2e14-be6d6c11efbc', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:46:39.590' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (45, NULL, N'22f9a3af-d6f4-35fb-d989-3c29d986da50', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:46:45.383' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (46, NULL, N'5218b703-d7ec-0e27-d676-ef6558bdc35c', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:47:04.183' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (47, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'f14ad3d4-8776-2815-ad4c-a46905a53aa4', N'::1', N'', NULL, N'2022-03-10 14:47:12', NULL, N'Account', N'Logout', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-10T14:47:12.227' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (48, NULL, N'cb51cae1-b377-8268-070b-cb8c05d0f99a', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/auditlog', NULL, NULL, N'1', N'', CAST(N'2022-03-10T14:47:12.307' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (49, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'8d14e15e-be2e-ad25-6500-d563e338624a', N'::1', N'', N'2022-03-10 14:47:18', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-10T14:47:18.657' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (50, NULL, N'779d902c-3759-6387-2c73-aa2038fec6f3', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:47:18.690' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (51, NULL, N'779d902c-3759-6387-2c73-aa2038fec6f3', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:47:18.707' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (52, NULL, N'82d0eb96-d73e-0033-7e54-49a50bec1475', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:47:18.827' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (53, NULL, N'82d0eb96-d73e-0033-7e54-49a50bec1475', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:47:18.850' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (54, NULL, N'fc7b9d19-eac1-e78a-acfb-5a99387c0bda', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:47:20.970' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (55, NULL, N'fc7b9d19-eac1-e78a-acfb-5a99387c0bda', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:47:20.983' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (56, NULL, N'0b668a2a-fcfc-413f-3e49-e73a30ed6ed2', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-10T14:47:21.107' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (57, NULL, N'0288e6a6-58e4-0c7c-3e3d-e2a2bc7a63ab', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-10T14:47:21.130' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (58, NULL, N'2428840e-45fb-c6d1-69c5-7ead758a7af0', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:47:22.650' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (59, NULL, N'2428840e-45fb-c6d1-69c5-7ead758a7af0', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:47:22.667' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (60, NULL, N'16da6ff1-3879-5379-2d3d-1bcb8645e089', N'::1', N'/admin/auditlog', NULL, NULL, N'A', N'AuditLog', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:47:24.340' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (61, NULL, N'57c1f5d4-e9b6-48f7-5330-b2c8f2f59db9', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T14:47:24.463' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (62, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'2c76ebe8-f7ba-d102-826e-2533acc534ec', N'::1', N'', N'2022-03-10 15:11:18', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-10T15:11:18.380' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (63, NULL, N'98e6c810-d171-6838-8e13-0a82767b1ffe', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin%2Fauditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:11:18.413' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (64, NULL, N'98e6c810-d171-6838-8e13-0a82767b1ffe', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin%2Fauditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:11:18.427' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (65, NULL, N'2f14d44a-b221-897e-4de7-c49602fa6648', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:11:18.593' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (66, NULL, N'2f14d44a-b221-897e-4de7-c49602fa6648', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:11:18.617' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (67, NULL, N'39ff1961-a9d1-3a11-24db-d284009bcec2', N'::1', N'/admin/auditlog', NULL, NULL, N'A', N'AuditLog', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:11:21.370' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (68, NULL, N'7c6585de-fb65-f125-ce09-a590d2fad97b', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:11:21.513' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (69, NULL, N'6d7ac9c9-6d54-8cdc-189f-b62fdc5ab5e3', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:19:31.780' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (70, NULL, N'82412e84-0b00-8b91-3564-be758292ba8b', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:20:51.997' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (71, NULL, N'82412e84-0b00-8b91-3564-be758292ba8b', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:20:52.010' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (72, NULL, N'651689cb-f06a-9501-da0a-e41d4a605b15', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:20:53.920' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (73, NULL, N'651689cb-f06a-9501-da0a-e41d4a605b15', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:20:53.937' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (74, NULL, N'676f9544-0112-8849-5937-9ade22803e99', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-10T15:20:54.113' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (75, NULL, N'8fdb15ec-5255-96f3-f8a2-0ba8a113ae22', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-10T15:20:54.113' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (76, NULL, N'a4b9be60-701c-aadb-41ba-d7d5c2feab6b', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:21:21.450' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (77, NULL, N'a4b9be60-701c-aadb-41ba-d7d5c2feab6b', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:21:21.463' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (78, NULL, N'846c4c44-3542-d0af-e7b1-17d6441512b2', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:21:21.810' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (79, NULL, N'846c4c44-3542-d0af-e7b1-17d6441512b2', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:21:21.827' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (80, NULL, N'4388b36c-7ea4-f1d8-4cff-01bc0458c4aa', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:21:27.937' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (81, NULL, N'4388b36c-7ea4-f1d8-4cff-01bc0458c4aa', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:21:27.950' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (82, NULL, N'd8702829-e215-1f39-fc8f-884d1b24c0cb', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:21:28.100' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (83, NULL, N'd8702829-e215-1f39-fc8f-884d1b24c0cb', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-10T15:21:28.120' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (84, NULL, N'2a89ce01-ebd8-e2ea-a7b8-fec81681f691', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-11T02:10:00.793' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (85, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'f1b62bc0-3ca3-07e7-417c-57247d2dbca1', N'::1', N'', N'2022-03-11 02:11:54', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-11T02:11:54.273' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (86, NULL, N'4435adc0-3594-2aac-0e7a-8bce948b8761', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:11:54.327' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (87, NULL, N'4435adc0-3594-2aac-0e7a-8bce948b8761', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:11:54.340' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (88, NULL, N'77778bdb-b9b0-9d8c-5b50-6fb581b6df42', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:11:54.667' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (89, NULL, N'77778bdb-b9b0-9d8c-5b50-6fb581b6df42', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:11:54.683' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (90, NULL, N'7999dafe-7e53-1a76-177f-1a719eee5cce', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:12:09.760' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (91, NULL, N'7999dafe-7e53-1a76-177f-1a719eee5cce', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:12:09.780' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (92, NULL, N'2235683a-737c-ed18-be61-8711fd0a8413', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transection/detail?ticketNo=01232123', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:15:24.787' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (93, NULL, N'2235683a-737c-ed18-be61-8711fd0a8413', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transection/detail?ticketNo=01232123', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:15:24.803' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (94, NULL, N'1d2a8f3f-f6df-5bea-10c7-a66918647d03', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T02:15:25.107' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (95, NULL, N'824cd9be-bffe-5a67-2290-f4e10809ffe0', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T02:15:25.107' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (96, NULL, N'24c048c6-1abb-c298-a71d-6da10c45a40b', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:15:47.640' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (97, NULL, N'24c048c6-1abb-c298-a71d-6da10c45a40b', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:15:47.657' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (98, NULL, N'c449606b-b567-27d8-7370-812ae75d4ef1', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T02:15:47.937' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (99, NULL, N'dd361570-4a43-68f1-59d5-d9e6b6499562', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T02:15:47.937' AS DateTime))
GO
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (100, NULL, N'15de3dd6-927b-6f27-e04a-dfaabc3704b9', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:16:02.003' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (101, NULL, N'15de3dd6-927b-6f27-e04a-dfaabc3704b9', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:16:02.020' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (102, NULL, N'a271c630-5e5b-8620-f171-4e2b1824cd38', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:16:04.943' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (103, NULL, N'a271c630-5e5b-8620-f171-4e2b1824cd38', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:16:04.960' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (104, NULL, N'cfa3d681-d12c-c8c1-e5e9-10d1a76fac86', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T02:16:05.083' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (105, NULL, N'68080bb7-f29c-a4d8-3b8c-ca70ac1ec85d', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T02:16:05.083' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (106, NULL, N'a3596647-6253-9799-7986-b2b833be98fa', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:16:06.127' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (107, NULL, N'a3596647-6253-9799-7986-b2b833be98fa', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:16:06.147' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (108, NULL, N'a19ee3ec-77e2-487e-7e6d-23381151cfe7', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:16:18.973' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (109, NULL, N'a19ee3ec-77e2-487e-7e6d-23381151cfe7', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:16:18.993' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (110, NULL, N'65938ae6-702b-4408-7754-4e347874850f', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T02:16:19.147' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (111, NULL, N'6de3f80a-6aad-cb2a-58e6-2e5245e0f605', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T02:16:19.197' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (112, NULL, N'68f29ab6-c944-dd2b-8eed-d3f0ad38e093', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:16:52.160' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (113, NULL, N'68f29ab6-c944-dd2b-8eed-d3f0ad38e093', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:16:52.177' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (114, NULL, N'9d60e801-8183-1f42-5552-ce6e4e23481e', N'::1', N'/admin/auditlog', NULL, NULL, N'A', N'AuditLog', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:17:23.697' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (115, NULL, N'e7e2b370-810a-8e31-68b8-cc3108c45b75', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:17:23.903' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (116, NULL, N'f30e50a0-ed35-0740-b1b3-fcf5c8d5d414', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:17:32.007' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (117, NULL, N'a291a5ca-6aa7-9811-952b-dd18834f7180', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:17:33.113' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (118, NULL, N'9589dbc8-03a7-185d-fad1-7616595cbd76', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:17:34.170' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (119, NULL, N'47a340d4-f76a-9c2c-ea9d-76d1c7fecc41', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:19:03.600' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (120, NULL, N'47a340d4-f76a-9c2c-ea9d-76d1c7fecc41', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:19:03.617' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (121, NULL, N'8c1c67cf-7ecb-150b-1229-852317985554', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:19:03.797' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (122, NULL, N'8c1c67cf-7ecb-150b-1229-852317985554', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:19:03.813' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (123, NULL, N'afd17d76-5d00-0c06-6893-108a2abf356e', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:19:10.543' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (124, NULL, N'afd17d76-5d00-0c06-6893-108a2abf356e', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:19:10.560' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (125, NULL, N'44d3c1e2-34c5-3c94-14ac-142b725bd158', N'::1', N'/admin/auditlog', NULL, NULL, N'A', N'AuditLog', N'Index', N'https://localhost:44397/admin/transection/detail?ticketNo=01232123', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:19:29.287' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (126, NULL, N'b2884a2b-9631-f2d2-c746-ba30d71b71cb', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:19:29.477' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (127, NULL, N'6a31861d-c226-cb6e-e207-9fda092c0dc1', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:19:39.787' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (128, NULL, N'9a703894-e896-726d-d094-1e22c3e84eb8', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:21:16.063' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (129, NULL, N'9a703894-e896-726d-d094-1e22c3e84eb8', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:21:16.080' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (130, NULL, N'cf46c8a0-c4e4-a47a-91b6-bd762c7c41df', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:25:46.233' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (131, NULL, N'cf46c8a0-c4e4-a47a-91b6-bd762c7c41df', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:25:46.250' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (132, NULL, N'be661a13-9c79-e250-93ba-466eac1960a6', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:25:46.517' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (133, NULL, N'be661a13-9c79-e250-93ba-466eac1960a6', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:25:46.543' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (134, NULL, N'73ea4554-9d24-31ae-1635-cf24dee1383e', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:25:51.773' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (135, NULL, N'73ea4554-9d24-31ae-1635-cf24dee1383e', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:25:51.793' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (136, NULL, N'81cc82b2-a93a-0497-5065-b59294e15e98', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:26:39.780' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (137, NULL, N'81cc82b2-a93a-0497-5065-b59294e15e98', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:26:39.800' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (138, NULL, N'fbc1fdc0-49ca-cbbf-5cd8-bf2501070c78', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transection/detail?ticketNo=01232123', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:33:09.010' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (139, NULL, N'fbc1fdc0-49ca-cbbf-5cd8-bf2501070c78', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transection/detail?ticketNo=01232123', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:33:09.027' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (140, NULL, N'dfbb452e-c84f-1925-f13b-a8c3af7bf9b0', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:33:27.580' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (141, NULL, N'dfbb452e-c84f-1925-f13b-a8c3af7bf9b0', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:33:27.597' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (142, NULL, N'f91ff094-c5b6-66b3-58fa-a9c582d026dc', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:33:27.857' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (143, NULL, N'f91ff094-c5b6-66b3-58fa-a9c582d026dc', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:33:27.877' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (144, NULL, N'f6bf5a51-da5e-d101-ad13-41351462c305', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:33:58.280' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (145, NULL, N'f6bf5a51-da5e-d101-ad13-41351462c305', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:33:58.297' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (146, NULL, N'b1658e02-0537-5108-8be9-7a2e311da084', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T02:33:58.487' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (147, NULL, N'd097bf82-d74f-43ea-dbaf-b2e2bd443892', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T02:33:58.503' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (148, NULL, N'b83d4aba-6f13-715a-13a1-18e8740d01f6', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:34:00.823' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (149, NULL, N'b83d4aba-6f13-715a-13a1-18e8740d01f6', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:34:00.843' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (150, NULL, N'1d0680c0-f410-3823-a599-d682529e7e4e', N'::1', N'/admin/auditlog', NULL, NULL, N'A', N'AuditLog', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:34:04.667' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (151, NULL, N'130e1562-e78d-6865-0a34-5f6ae3d4794e', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:34:04.850' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (152, NULL, N'33c23d17-ac53-c25e-891c-58c3cdd3e6a2', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:38:47.450' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (153, NULL, N'33c23d17-ac53-c25e-891c-58c3cdd3e6a2', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:38:47.463' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (154, NULL, N'452ffd71-4765-f9b5-d0e4-7f8439d31d69', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:40:23.663' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (155, NULL, N'452ffd71-4765-f9b5-d0e4-7f8439d31d69', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:40:23.677' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (156, NULL, N'4df76923-7d6d-42be-61f4-831d9a149d19', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T02:40:23.857' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (157, NULL, N'eae9b747-4fe9-02ef-0dff-2e0f77f9e1cf', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T02:40:23.910' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (158, NULL, N'58d66fcc-788b-bd53-2e2d-dce915a530e9', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:40:30.257' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (159, NULL, N'58d66fcc-788b-bd53-2e2d-dce915a530e9', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:40:30.273' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (160, NULL, N'f611ccbb-4d20-f5ee-218c-84e0ab46a6f3', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:40:30.697' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (161, NULL, N'f611ccbb-4d20-f5ee-218c-84e0ab46a6f3', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:40:30.720' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (162, NULL, N'4a4f169d-ce46-992f-29d4-c4e1775d376c', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:42:54.837' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (163, NULL, N'4a4f169d-ce46-992f-29d4-c4e1775d376c', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T02:42:54.857' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (164, NULL, N'c91082e2-b615-fa8f-78e9-cd00e08edca6', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-11T04:52:38.413' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (165, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'ca1aab5e-4c74-1c7a-ceab-3bee3d77fea8', N'::1', N'', N'2022-03-11 05:20:36', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-11T05:20:36.817' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (166, NULL, N'a1e296d6-510e-a557-01e4-974c5979d230', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:20:36.870' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (167, NULL, N'a1e296d6-510e-a557-01e4-974c5979d230', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:20:36.883' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (168, NULL, N'08e22e98-2914-f862-d50d-8500853d3b22', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:20:37.193' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (169, NULL, N'08e22e98-2914-f862-d50d-8500853d3b22', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:20:37.210' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (170, NULL, N'22318283-9c63-0abb-e5cc-b9c5e0db4998', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:21:36.407' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (171, NULL, N'22318283-9c63-0abb-e5cc-b9c5e0db4998', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:21:36.420' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (172, NULL, N'89a65126-091e-fe15-9ee7-3c5cb683182c', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:21:36.743' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (173, NULL, N'c027fb04-43e7-d555-80bf-2267c092172f', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:21:36.743' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (174, NULL, N'f920cee7-8551-627b-b1e7-943df1f36462', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:22:16.950' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (175, NULL, N'f920cee7-8551-627b-b1e7-943df1f36462', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:22:16.973' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (176, NULL, N'f794d53a-0542-bad4-35c3-b62f089a3f20', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:22:18.497' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (177, NULL, N'6b43972f-27c4-1f35-965f-9c2a7cce9b10', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:22:18.497' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (178, NULL, N'd0a5c8f6-7e26-eb41-ef19-b12cfa9a3587', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:23:49.227' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (179, NULL, N'd0a5c8f6-7e26-eb41-ef19-b12cfa9a3587', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:23:49.243' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (180, NULL, N'200de005-f2e3-8469-dfcc-2f4ce0e15e45', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:23:49.407' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (181, NULL, N'26e9bcfd-aae8-8263-64f7-c4205ade2205', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:23:49.430' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (182, NULL, N'888de87c-96c1-b3d0-06d8-78c33e53f9d9', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:24:05.490' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (183, NULL, N'888de87c-96c1-b3d0-06d8-78c33e53f9d9', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:24:05.507' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (184, NULL, N'1d67c599-40c6-b7b8-eae7-2b261cdcc48a', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:24:05.660' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (185, NULL, N'467de3ad-632c-b20f-a43f-e9edcb181dd4', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:24:05.663' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (186, NULL, N'ff73c723-3b49-83ff-66d0-15e0cafd4e6b', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:26:28.407' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (187, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'66535328-2c9f-097b-05e9-e30e6b7a1f4c', N'::1', N'', N'2022-03-11 05:26:35', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-11T05:26:35.867' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (188, NULL, N'ead05587-7679-d83b-bbe0-7894aa341ea4', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:26:35.913' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (189, NULL, N'ead05587-7679-d83b-bbe0-7894aa341ea4', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:26:35.930' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (190, NULL, N'1664966e-5411-988c-211f-381e57bc30da', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:26:36.260' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (191, NULL, N'1664966e-5411-988c-211f-381e57bc30da', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:26:36.280' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (192, NULL, N'5545226f-0a00-bec0-a45a-f91dc1cc0fde', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:26:38.623' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (193, NULL, N'5545226f-0a00-bec0-a45a-f91dc1cc0fde', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:26:38.643' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (194, NULL, N'2f8496c0-03b1-856b-37ee-df8eb66da904', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:26:40.243' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (195, NULL, N'2f8496c0-03b1-856b-37ee-df8eb66da904', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:26:40.260' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (196, NULL, N'0f5bd906-09af-b80c-a2b2-5a0ee2662da6', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:26:40.487' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (197, NULL, N'b2e9c67b-4de7-3040-999e-d9bbde68c6f1', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:26:40.487' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (198, NULL, N'157be370-b9d9-62e6-8104-845ef147cbf1', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:27:08.680' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (199, NULL, N'157be370-b9d9-62e6-8104-845ef147cbf1', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:27:08.693' AS DateTime))
GO
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (200, NULL, N'5c9b5f28-a27d-a4f1-8d5c-f30f3e31858e', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:27:08.827' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (201, NULL, N'5c9b5f28-a27d-a4f1-8d5c-f30f3e31858e', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:27:08.847' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (202, NULL, N'ed3e5447-5c6a-0c7c-059e-b6b9482bbb68', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:27:52.947' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (203, NULL, N'ed3e5447-5c6a-0c7c-059e-b6b9482bbb68', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:27:52.963' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (204, NULL, N'2ee0c628-a142-fa50-3848-6674d5d338b4', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:27:54.310' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (205, NULL, N'2ee0c628-a142-fa50-3848-6674d5d338b4', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:27:54.327' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (206, NULL, N'82fefbdc-57bd-9169-3507-5cf3c72fda2f', N'::1', N'/admin/auditlog', NULL, NULL, N'A', N'AuditLog', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:27:59.797' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (207, NULL, N'e1ad5a65-cbf5-1570-f7b2-c0a9c1115ebf', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:27:59.947' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (208, NULL, N'aaff2303-460b-f333-085e-30efb8119bc2', N'::1', N'/admin/auditlog', NULL, NULL, N'A', N'AuditLog', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:29:13.877' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (209, NULL, N'2e299851-52d4-392c-7697-3ec2f9d72d2f', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:29:14.370' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (210, NULL, N'97f04386-e788-8e0a-7ab3-84d25aed84b1', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:29:17.683' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (211, NULL, N'97f04386-e788-8e0a-7ab3-84d25aed84b1', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:29:17.700' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (212, NULL, N'64937168-1c06-d305-139b-308fbe6d1809', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:29:17.990' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (213, NULL, N'64937168-1c06-d305-139b-308fbe6d1809', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:29:18.013' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (214, NULL, N'c9b978ef-7237-bb69-bba2-14e8405ef1a1', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:29:29.163' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (215, NULL, N'c9b978ef-7237-bb69-bba2-14e8405ef1a1', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:29:29.177' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (216, NULL, N'9a629634-5572-ecbe-f4a8-1d06ae9dd85b', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:29:29.480' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (217, NULL, N'9a629634-5572-ecbe-f4a8-1d06ae9dd85b', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:29:29.497' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (218, NULL, N'9a9f762f-2bea-ce08-3450-bee42b6707e4', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:29:35.637' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (219, NULL, N'9a9f762f-2bea-ce08-3450-bee42b6707e4', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:29:35.657' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (220, NULL, N'ac41833a-6a0e-407a-c013-574d1173731e', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:29:35.800' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (221, NULL, N'b33bb659-f10c-35d2-a800-6b4ef3811766', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:29:35.803' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (222, NULL, N'b68ceee7-4db1-510f-335f-beb4df69cabb', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:31:53.197' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (223, NULL, N'b68ceee7-4db1-510f-335f-beb4df69cabb', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:31:53.217' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (224, NULL, N'651eebfc-0615-430e-ba53-6e9cca431647', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:31:53.350' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (225, NULL, N'38cd4516-acf5-2960-cf34-e5cfbc2de290', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:31:53.350' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (226, NULL, N'19ff13bf-30c3-7377-278e-4788edc85c5b', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:31:56.780' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (227, NULL, N'19ff13bf-30c3-7377-278e-4788edc85c5b', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:31:56.797' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (228, NULL, N'f7ed7103-fcd5-fb03-66fc-398c25989a9e', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:32:20.423' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (229, NULL, N'f7ed7103-fcd5-fb03-66fc-398c25989a9e', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:32:20.437' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (230, NULL, N'535e020d-a26e-455b-4a05-e515b1adee47', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:32:20.630' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (231, NULL, N'535e020d-a26e-455b-4a05-e515b1adee47', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:32:20.647' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (232, NULL, N'd43751b2-fea8-d7bd-d7d6-e93cb897eb70', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:32:21.630' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (233, NULL, N'd43751b2-fea8-d7bd-d7d6-e93cb897eb70', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:32:21.647' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (234, NULL, N'990d85ed-2569-4d15-e33d-997c1cff86d3', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transection/detail?ticketNo=01232123', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:33:34.977' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (235, NULL, N'990d85ed-2569-4d15-e33d-997c1cff86d3', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transection/detail?ticketNo=01232123', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:33:34.990' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (236, NULL, N'e9beb860-82fe-b85d-6ab8-cb865ab62a73', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:33:35.143' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (237, NULL, N'33a37a5a-9715-400d-cbbd-cc16b1da6643', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T05:33:35.147' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (238, NULL, N'cc33a499-76da-84eb-41c5-192b1780e029', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:33:36.147' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (239, NULL, N'cc33a499-76da-84eb-41c5-192b1780e029', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:33:36.160' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (240, NULL, N'19922d4a-d380-dc63-82b6-762b30e6851c', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:33:36.300' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (241, NULL, N'19922d4a-d380-dc63-82b6-762b30e6851c', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:33:36.323' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (242, NULL, N'15b4bed7-6ba4-3299-4935-a14907a61c10', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:34:48.313' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (243, NULL, N'15b4bed7-6ba4-3299-4935-a14907a61c10', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:34:48.340' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (244, NULL, N'ba1ebb48-ff0c-bb33-d98c-d1117f3045f7', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:35:30.813' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (245, NULL, N'ba1ebb48-ff0c-bb33-d98c-d1117f3045f7', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:35:30.830' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (246, NULL, N'a4ae0818-5784-4105-e51b-3a99d1fb7a7a', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:35:45.007' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (247, NULL, N'a4ae0818-5784-4105-e51b-3a99d1fb7a7a', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:35:45.020' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (248, NULL, N'51edbc95-6862-0f81-b29c-b79cf0ed1afa', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:37:40.607' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (249, NULL, N'51edbc95-6862-0f81-b29c-b79cf0ed1afa', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:37:40.627' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (250, NULL, N'b03ed1b9-0b86-a128-12d8-495bda0611da', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:38:35.137' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (251, NULL, N'b03ed1b9-0b86-a128-12d8-495bda0611da', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:38:35.150' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (252, NULL, N'5cdabc41-5e60-f08f-5fff-d378988ae42d', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:38:46.317' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (253, NULL, N'5cdabc41-5e60-f08f-5fff-d378988ae42d', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:38:46.333' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (254, NULL, N'2cac73bd-5293-b4be-9730-e492b328785e', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:39:33.963' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (255, NULL, N'2cac73bd-5293-b4be-9730-e492b328785e', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:39:33.977' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (256, NULL, N'af33c840-f4be-6b76-c115-39fd218af24e', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:39:56.357' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (257, NULL, N'af33c840-f4be-6b76-c115-39fd218af24e', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:39:56.373' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (258, NULL, N'eb63aa6d-0700-f6ca-5b28-e6c7fbde0fa3', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:39:58.617' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (259, NULL, N'eb63aa6d-0700-f6ca-5b28-e6c7fbde0fa3', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:39:58.633' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (260, NULL, N'd853c113-9e2d-e840-dc10-5ce6a549009b', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:40:05.300' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (261, NULL, N'd853c113-9e2d-e840-dc10-5ce6a549009b', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:40:05.317' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (262, NULL, N'7c0d8ff2-0b53-d1c1-7e73-cdf8525e7709', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:40:29.757' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (263, NULL, N'7c0d8ff2-0b53-d1c1-7e73-cdf8525e7709', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:40:29.773' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (264, NULL, N'96e73909-0e91-548e-2910-3aaec0621637', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:40:54.223' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (265, NULL, N'96e73909-0e91-548e-2910-3aaec0621637', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:40:54.243' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (266, NULL, N'd3065988-1853-65ea-6ac8-5a0774c30f4b', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:41:24.283' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (267, NULL, N'd3065988-1853-65ea-6ac8-5a0774c30f4b', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:41:24.303' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (268, NULL, N'f24eaaed-20b2-065c-d05a-2e40d9db80cc', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:41:42.917' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (269, NULL, N'f24eaaed-20b2-065c-d05a-2e40d9db80cc', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:41:42.937' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (270, NULL, N'67a8aaa4-75dd-8149-ce63-3bca2e216e16', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:41:53.340' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (271, NULL, N'67a8aaa4-75dd-8149-ce63-3bca2e216e16', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:41:53.357' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (272, NULL, N'1c36c827-1fe7-e8e5-cbb4-d21349bcca3d', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:42:35.380' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (273, NULL, N'1c36c827-1fe7-e8e5-cbb4-d21349bcca3d', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:42:35.393' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (274, NULL, N'bda67573-d81c-4812-853d-cac1893346fd', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:42:37.097' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (275, NULL, N'bda67573-d81c-4812-853d-cac1893346fd', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:42:37.113' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (276, NULL, N'c51a5bfd-381d-f3c5-e26b-27614f980c98', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:42:48.987' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (277, NULL, N'c51a5bfd-381d-f3c5-e26b-27614f980c98', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:42:49.003' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (278, NULL, N'0e6675bc-e4e7-d24d-0311-2e7e194c8b3c', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:42:50.537' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (279, NULL, N'0e6675bc-e4e7-d24d-0311-2e7e194c8b3c', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:42:50.553' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (280, NULL, N'f0e5362f-5ed0-9a40-bf55-7c038f29daec', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:43:27.040' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (281, NULL, N'f0e5362f-5ed0-9a40-bf55-7c038f29daec', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:43:27.060' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (282, NULL, N'55a1e70d-9627-7dbd-8334-daf543f62e56', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:43:37.050' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (283, NULL, N'55a1e70d-9627-7dbd-8334-daf543f62e56', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:43:37.063' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (284, NULL, N'c149a127-af94-1cd1-16f5-5f762b9655d9', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:44:58.790' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (285, NULL, N'c149a127-af94-1cd1-16f5-5f762b9655d9', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:44:58.810' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (286, NULL, N'7a9219f7-03f2-7c1d-2677-c51cfacefeaf', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:45:15.973' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (287, NULL, N'7a9219f7-03f2-7c1d-2677-c51cfacefeaf', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:45:15.990' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (288, NULL, N'd27da3ec-a8a3-15a4-52a2-a2b35b262534', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:45:17.770' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (289, NULL, N'd27da3ec-a8a3-15a4-52a2-a2b35b262534', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:45:17.787' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (290, NULL, N'506b5507-1f9e-b196-b30d-3495f00c6048', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:45:39.477' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (291, NULL, N'506b5507-1f9e-b196-b30d-3495f00c6048', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:45:39.490' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (292, NULL, N'168859e3-0cec-2068-6136-cdb6a5e79345', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:45:41.027' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (293, NULL, N'168859e3-0cec-2068-6136-cdb6a5e79345', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:45:41.043' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (294, NULL, N'dd42148e-8efe-95b8-91e0-5503e1cf89b9', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:45:59.430' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (295, NULL, N'dd42148e-8efe-95b8-91e0-5503e1cf89b9', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:45:59.447' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (296, NULL, N'd97af955-1108-dc3b-065b-211a1575d43d', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:48:01.017' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (297, NULL, N'd97af955-1108-dc3b-065b-211a1575d43d', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:48:01.033' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (298, NULL, N'c34762f5-4ba9-bb5d-d3cb-fc894320dccb', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:48:02.570' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (299, NULL, N'c34762f5-4ba9-bb5d-d3cb-fc894320dccb', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:48:02.587' AS DateTime))
GO
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (300, NULL, N'b740f980-60c2-bbb9-2c2d-7c080d6f5186', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:48:33.520' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (301, NULL, N'b740f980-60c2-bbb9-2c2d-7c080d6f5186', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:48:33.543' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (302, NULL, N'f306c52b-2d44-4ab2-ae99-9786cf540027', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:48:34.783' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (303, NULL, N'f306c52b-2d44-4ab2-ae99-9786cf540027', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:48:34.800' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (304, NULL, N'e2252694-e667-a316-9b77-73814aab8ce9', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:48:46.370' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (305, NULL, N'e2252694-e667-a316-9b77-73814aab8ce9', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:48:46.387' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (306, NULL, N'8fbe7afa-77bb-b9b4-c232-41e912d14d94', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:49:12.750' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (307, NULL, N'8fbe7afa-77bb-b9b4-c232-41e912d14d94', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:49:12.770' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (308, NULL, N'b173127e-18be-72bc-c370-e041dc3ac698', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:51:15.793' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (309, NULL, N'b173127e-18be-72bc-c370-e041dc3ac698', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:51:15.817' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (310, NULL, N'be53da6a-e427-109d-eb5c-b96f6371f8ce', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:51:29.347' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (311, NULL, N'be53da6a-e427-109d-eb5c-b96f6371f8ce', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:51:29.363' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (312, NULL, N'5f64006f-d3bf-f132-cbf3-75dd6ff0b03d', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:52:01.330' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (313, NULL, N'5f64006f-d3bf-f132-cbf3-75dd6ff0b03d', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:52:01.347' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (314, NULL, N'9bd6cad8-0a64-3d00-dbae-be3ca47646bb', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:52:03.220' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (315, NULL, N'9bd6cad8-0a64-3d00-dbae-be3ca47646bb', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:52:03.233' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (316, NULL, N'cc9b9ab7-5ad3-e84f-7da2-405f62007202', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:52:40.183' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (317, NULL, N'cc9b9ab7-5ad3-e84f-7da2-405f62007202', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:52:40.203' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (318, NULL, N'0fe53796-fec1-6a58-4cf6-6d0145e5cddd', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:53:11.250' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (319, NULL, N'0fe53796-fec1-6a58-4cf6-6d0145e5cddd', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:53:11.270' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (320, NULL, N'2865f671-8920-f0ce-e6c2-299b3a25cfb5', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:53:12.877' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (321, NULL, N'2865f671-8920-f0ce-e6c2-299b3a25cfb5', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:53:12.893' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (322, NULL, N'873524f2-1f3e-6877-6fdc-926395b10ab3', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:53:13.407' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (323, NULL, N'873524f2-1f3e-6877-6fdc-926395b10ab3', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:53:13.423' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (324, NULL, N'024d6436-78ad-14aa-b1c2-6988d41cb7e9', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:53:13.610' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (325, NULL, N'024d6436-78ad-14aa-b1c2-6988d41cb7e9', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:53:13.623' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (326, NULL, N'cb815b36-bb90-9494-333e-a4488f84788b', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:53:13.787' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (327, NULL, N'cb815b36-bb90-9494-333e-a4488f84788b', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:53:13.807' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (328, NULL, N'9f0af7b0-a5dd-8b19-ddee-c017cc2263a1', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:53:14.220' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (329, NULL, N'9f0af7b0-a5dd-8b19-ddee-c017cc2263a1', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:53:14.237' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (330, NULL, N'9a7cac6e-0ff8-3ab4-4aa5-b45c61721f71', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:53:14.423' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (331, NULL, N'9a7cac6e-0ff8-3ab4-4aa5-b45c61721f71', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T05:53:14.447' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (332, NULL, N'a589f42d-75f8-fd8b-6846-aec4e470911c', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:03:11.353' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (333, NULL, N'a589f42d-75f8-fd8b-6846-aec4e470911c', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:03:11.373' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (334, NULL, N'f7177247-7aa9-ffcf-d35c-c392c2e0b5f5', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-11T06:03:42.867' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (335, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'8f70bc40-192f-985f-4e28-fc0acdf8d20b', N'::1', N'', N'2022-03-11 06:03:48', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-11T06:03:48.970' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (336, NULL, N'c05cac2e-dbce-ac2c-020f-694620e89b84', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:03:49.050' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (337, NULL, N'c05cac2e-dbce-ac2c-020f-694620e89b84', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:03:49.063' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (338, NULL, N'b5a55a5e-611f-aaf4-bdf7-cafe21b3437d', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:03:49.397' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (339, NULL, N'b5a55a5e-611f-aaf4-bdf7-cafe21b3437d', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:03:49.413' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (340, NULL, N'96f9f36e-a183-e2aa-b3da-53cb3ec3ac9f', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:03:51.417' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (341, NULL, N'96f9f36e-a183-e2aa-b3da-53cb3ec3ac9f', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:03:51.440' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (342, NULL, N'b256c6bf-d8cf-4389-b8f0-02e7057f8035', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:03:59.150' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (343, NULL, N'b256c6bf-d8cf-4389-b8f0-02e7057f8035', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:03:59.167' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (344, NULL, N'e8c9b3f6-63dc-2e9a-91cd-427343ac0ec3', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T06:03:59.390' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (345, NULL, N'fc78284e-cc19-6771-db9b-13613d3d1397', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T06:03:59.390' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (346, NULL, N'20c127d3-56f5-0dcd-dd22-6fc1c88853e7', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:05:47.050' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (347, NULL, N'20c127d3-56f5-0dcd-dd22-6fc1c88853e7', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:05:47.063' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (348, NULL, N'd3cc7644-44ea-f63c-a6ab-edf7b38390a7', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:06:28.517' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (349, NULL, N'd3cc7644-44ea-f63c-a6ab-edf7b38390a7', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:06:28.530' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (350, NULL, N'bb6c52ab-6f5f-9e35-d68e-7a836dfa7b6b', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:06:44.767' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (351, NULL, N'bb6c52ab-6f5f-9e35-d68e-7a836dfa7b6b', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:06:44.783' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (352, NULL, N'e10bb5d7-378b-3d35-9bdb-30d6ce91f640', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:07:06.173' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (353, NULL, N'e10bb5d7-378b-3d35-9bdb-30d6ce91f640', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:07:06.190' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (354, NULL, N'63105b8b-5247-165a-1fec-29ae474a9cd7', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:07:08.390' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (355, NULL, N'63105b8b-5247-165a-1fec-29ae474a9cd7', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:07:08.410' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (356, NULL, N'6d5ab3b0-2420-19ff-f62b-bb8e4f93e3fa', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:07:44.263' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (357, NULL, N'6d5ab3b0-2420-19ff-f62b-bb8e4f93e3fa', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:07:44.280' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (358, NULL, N'e134e741-704c-c4ca-ffae-82c67d512676', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:07:46.203' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (359, NULL, N'e134e741-704c-c4ca-ffae-82c67d512676', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:07:46.217' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (360, NULL, N'11b8c1b7-30c6-5989-4f4c-b147f6513419', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:07:54.007' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (361, NULL, N'11b8c1b7-30c6-5989-4f4c-b147f6513419', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:07:54.023' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (362, NULL, N'0f82f51e-b69a-1fdc-cc43-ce128a07f807', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:08:03.257' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (363, NULL, N'0f82f51e-b69a-1fdc-cc43-ce128a07f807', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:08:03.273' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (364, NULL, N'4844e1a6-fe04-f5ad-32fa-04c473c29c3e', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T06:08:03.417' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (365, NULL, N'a4b93175-1545-b4a3-8df8-6bf4b16078ae', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T06:08:03.417' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (366, NULL, N'b5cc3192-1ea8-43cb-061d-a6cf2d2839aa', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:08:05.693' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (367, NULL, N'b5cc3192-1ea8-43cb-061d-a6cf2d2839aa', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:08:05.710' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (368, NULL, N'2bf6a724-71ff-c433-2c5f-2b71bf9f9256', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:10:13.307' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (369, NULL, N'2bf6a724-71ff-c433-2c5f-2b71bf9f9256', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:10:13.327' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (370, NULL, N'0f79eb05-530c-3d38-503b-0dd664a23fa3', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:10:20.680' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (371, NULL, N'0f79eb05-530c-3d38-503b-0dd664a23fa3', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:10:20.697' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (372, NULL, N'09975818-6440-c5c2-5821-74377bbd04ed', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-11T06:56:14.447' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (373, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'44557d1c-a978-7333-1642-04ada53cb9ba', N'::1', N'', N'2022-03-11 06:56:21', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-11T06:56:21.987' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (374, NULL, N'70504c68-cb5f-c236-6639-35e215699818', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:56:22.040' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (375, NULL, N'70504c68-cb5f-c236-6639-35e215699818', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:56:22.053' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (376, NULL, N'f3bb0d38-5089-6124-f318-6a15b70e51ba', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:56:22.377' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (377, NULL, N'f3bb0d38-5089-6124-f318-6a15b70e51ba', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:56:22.393' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (378, NULL, N'0528571d-a995-da7d-477c-42856297cced', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:56:24.413' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (379, NULL, N'0528571d-a995-da7d-477c-42856297cced', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:56:24.430' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (380, NULL, N'287ccc2a-f3b4-5b4b-2c2c-8d1bc8da25a1', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:57:20.427' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (381, NULL, N'287ccc2a-f3b4-5b4b-2c2c-8d1bc8da25a1', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:57:20.450' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (382, NULL, N'92fdc38d-1b7c-5887-fa62-91a771b70021', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:57:53.303' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (383, NULL, N'92fdc38d-1b7c-5887-fa62-91a771b70021', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:57:53.323' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (384, NULL, N'30a8c999-803e-5d57-ef33-5652a902832d', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-11T06:59:02.143' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (385, NULL, N'c8f0cd5b-a284-afc4-0943-3496d4c11fc6', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:59:02.290' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (386, NULL, N'c8f0cd5b-a284-afc4-0943-3496d4c11fc6', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:59:02.307' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (387, NULL, N'8a569cb3-5142-eadd-2a22-d7c918d26748', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:59:02.653' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (388, NULL, N'8a569cb3-5142-eadd-2a22-d7c918d26748', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:59:02.677' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (389, NULL, N'8ae3c955-cf21-3ef0-73ea-763b10b3a018', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:59:07.110' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (390, NULL, N'8ae3c955-cf21-3ef0-73ea-763b10b3a018', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:59:07.127' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (391, NULL, N'02616457-6e89-2eb6-3b20-28f22ee13c20', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:59:11.367' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (392, NULL, N'02616457-6e89-2eb6-3b20-28f22ee13c20', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T06:59:11.383' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (393, NULL, N'615f1330-971f-5187-7398-8181f8754d7e', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:02:06.480' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (394, NULL, N'7f1530a9-d1f6-3074-9458-2f308391e8be', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:02:06.627' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (395, NULL, N'7f1530a9-d1f6-3074-9458-2f308391e8be', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:02:06.640' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (396, NULL, N'a615cbf3-6ee8-9bdd-7515-0114018dd053', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:02:06.977' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (397, NULL, N'a615cbf3-6ee8-9bdd-7515-0114018dd053', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:02:06.993' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (398, NULL, N'e189df5f-5872-bcb0-46bf-cc600ca7c585', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:02:09.423' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (399, NULL, N'e189df5f-5872-bcb0-46bf-cc600ca7c585', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:02:09.440' AS DateTime))
GO
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (400, NULL, N'76928973-f275-da4e-177e-b335c879d99f', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:02:13.737' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (401, NULL, N'76928973-f275-da4e-177e-b335c879d99f', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:02:13.753' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (402, NULL, N'64f6af8d-5469-c6c3-b05b-18f8a6bbe1b6', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:11:09.573' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (403, NULL, N'64f6af8d-5469-c6c3-b05b-18f8a6bbe1b6', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:11:09.593' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (404, NULL, N'6a4af3fa-e8ac-34e6-4f68-017e10ddd0ef', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:15:18.577' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (405, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'e51cfc0f-e342-8507-e2fc-40de9c35df7f', N'::1', N'', N'2022-03-11 07:15:28', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-11T07:15:28.940' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (406, NULL, N'4768c696-7123-6cc5-ba04-417f59e5e99a', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:15:28.977' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (407, NULL, N'4768c696-7123-6cc5-ba04-417f59e5e99a', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:15:28.990' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (408, NULL, N'059763e1-9a08-ba0e-49b9-ea1a0ffaa183', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:15:29.307' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (409, NULL, N'059763e1-9a08-ba0e-49b9-ea1a0ffaa183', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:15:29.333' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (410, NULL, N'300e5d14-a1c7-1c63-262d-cc6ac26213a6', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:15:30.983' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (411, NULL, N'300e5d14-a1c7-1c63-262d-cc6ac26213a6', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:15:31.003' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (412, NULL, N'65e2cb3a-9d1e-a3c8-c8c7-3314c05ff282', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:15:36.693' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (413, NULL, N'65e2cb3a-9d1e-a3c8-c8c7-3314c05ff282', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:15:36.710' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (414, NULL, N'61125426-d9a4-39d5-30d6-1ac7c2dd6ff7', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:19:04.207' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (415, NULL, N'61125426-d9a4-39d5-30d6-1ac7c2dd6ff7', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:19:04.223' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (416, NULL, N'264f4f36-3e37-9989-3556-7f11a537313f', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:19:04.413' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (417, NULL, N'346f9fc1-5798-c5db-10ef-ce06d4127960', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:19:04.447' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (418, NULL, N'f1568440-1fab-8ab9-cfe3-f7a5e4b2a60f', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:19:05.123' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (419, NULL, N'f1568440-1fab-8ab9-cfe3-f7a5e4b2a60f', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:19:05.140' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (420, NULL, N'f2493492-6685-dd99-b112-f6106b92b5f4', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:19:06.273' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (421, NULL, N'f2493492-6685-dd99-b112-f6106b92b5f4', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:19:06.290' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (422, NULL, N'c772a02c-1eb2-3577-ff7b-7db5151ecbbc', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:19:37.043' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (423, NULL, N'c772a02c-1eb2-3577-ff7b-7db5151ecbbc', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:19:37.060' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (424, NULL, N'142aaef2-24a2-0468-6156-58db14775cd1', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:22:06.660' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (425, NULL, N'142aaef2-24a2-0468-6156-58db14775cd1', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:22:06.677' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (426, NULL, N'e676f129-70e1-a470-0557-a040d2396e33', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:22:20.723' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (427, NULL, N'e676f129-70e1-a470-0557-a040d2396e33', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:22:20.737' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (428, NULL, N'781b62c1-038f-41ff-16d4-2237fa3cb562', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:22:35.010' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (429, NULL, N'781b62c1-038f-41ff-16d4-2237fa3cb562', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:22:35.027' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (430, NULL, N'9fb1579f-1430-f9fd-5342-94d0461fb2b1', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:28:19.260' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (431, NULL, N'9fb1579f-1430-f9fd-5342-94d0461fb2b1', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:28:19.277' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (432, NULL, N'911126ab-32d4-101b-4e37-a6f23ec2043c', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:28:23.807' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (433, NULL, N'911126ab-32d4-101b-4e37-a6f23ec2043c', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:28:23.827' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (434, NULL, N'6488bd1f-9b57-5fba-cff8-8617435a1f9c', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:28:45.043' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (435, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'95d73fc6-0272-825f-5756-7cd68463a789', N'::1', N'', N'2022-03-11 07:28:52', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-11T07:28:52.497' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (436, NULL, N'b9607f10-1a35-00eb-403e-82e7ed3af587', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:28:52.550' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (437, NULL, N'b9607f10-1a35-00eb-403e-82e7ed3af587', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:28:52.567' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (438, NULL, N'ee72f13c-75f3-48f6-ac3d-d6a1ed6d5c62', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:28:52.883' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (439, NULL, N'ee72f13c-75f3-48f6-ac3d-d6a1ed6d5c62', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:28:52.913' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (440, NULL, N'fda24606-4e1b-7a98-6a6d-3f307c9018c3', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:28:55.930' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (441, NULL, N'fda24606-4e1b-7a98-6a6d-3f307c9018c3', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:28:55.943' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (442, NULL, N'a788f3b2-23aa-2f27-998b-9de693ea3949', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:29:00.090' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (443, NULL, N'a788f3b2-23aa-2f27-998b-9de693ea3949', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:29:00.107' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (444, NULL, N'fb1e71b1-7bf8-3812-bfce-1dae6670aba8', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:29:13.410' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (445, NULL, N'fb1e71b1-7bf8-3812-bfce-1dae6670aba8', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:29:13.423' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (446, NULL, N'91ddae02-0eba-6c36-91f3-9611b1889e4b', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:30:07.073' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (447, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'07bf660e-2fbb-62e6-6d45-9e94f16d2ed4', N'::1', N'', N'2022-03-11 07:30:14', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-11T07:30:14.340' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (448, NULL, N'04ffbbc0-caf7-dc84-cfe8-1699d228faa8', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:30:14.390' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (449, NULL, N'04ffbbc0-caf7-dc84-cfe8-1699d228faa8', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:30:14.407' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (450, NULL, N'1f41f4a2-91ca-3163-732b-fd6f59ea1638', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:30:14.647' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (451, NULL, N'1f41f4a2-91ca-3163-732b-fd6f59ea1638', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:30:14.667' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (452, NULL, N'e3b17dbc-278f-fafb-fcd0-d572d1e3aa4c', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:30:16.097' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (453, NULL, N'e3b17dbc-278f-fafb-fcd0-d572d1e3aa4c', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:30:16.110' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (454, NULL, N'4a61a323-9711-1099-9f5f-7a7e7be7c1e7', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:30:20.093' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (455, NULL, N'4a61a323-9711-1099-9f5f-7a7e7be7c1e7', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:30:20.110' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (456, NULL, N'fa945efb-38f7-d3dc-8c7e-4c3d0fd2ab2d', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:30:38.060' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (457, NULL, N'fa945efb-38f7-d3dc-8c7e-4c3d0fd2ab2d', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:30:38.077' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (458, NULL, N'3039fc3a-73c6-4243-f0f2-1057efa1b666', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:30:38.293' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (459, NULL, N'a1244faa-bef9-3e1d-dcdb-a6287f0f5875', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:30:38.297' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (460, NULL, N'412d8230-daf0-c846-5ca3-af1b37930fe6', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:30:40.020' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (461, NULL, N'412d8230-daf0-c846-5ca3-af1b37930fe6', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:30:40.040' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (462, NULL, N'b7d49e8c-4495-4c7d-0806-6b72437675af', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:31:17.143' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (463, NULL, N'b7d49e8c-4495-4c7d-0806-6b72437675af', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:31:17.160' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (464, NULL, N'7f5da0b4-3d8a-4243-c8d1-038c3f4ad7b1', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:31:26.220' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (465, NULL, N'7f5da0b4-3d8a-4243-c8d1-038c3f4ad7b1', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:31:26.237' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (466, NULL, N'05b03bd5-156e-90ab-7d7d-f9270940c81e', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:35:36.853' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (467, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'78cbf578-6659-5570-6b25-7f452d5a05b5', N'::1', N'', N'2022-03-11 07:35:43', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-11T07:35:43.487' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (468, NULL, N'a55a6913-6337-2818-950c-df7d88ea343f', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:35:43.567' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (469, NULL, N'a55a6913-6337-2818-950c-df7d88ea343f', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:35:43.580' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (470, NULL, N'84900815-528f-98f2-f2b2-4c7ff5540427', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:35:43.920' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (471, NULL, N'84900815-528f-98f2-f2b2-4c7ff5540427', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:35:43.943' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (472, NULL, N'dee38a33-51be-5e7c-5af1-2ff78c843ea1', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:35:45.570' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (473, NULL, N'dee38a33-51be-5e7c-5af1-2ff78c843ea1', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:35:45.590' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (474, NULL, N'971b356b-0227-433e-c625-3f299393a498', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:35:49.863' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (475, NULL, N'971b356b-0227-433e-c625-3f299393a498', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:35:49.877' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (476, NULL, N'1955c529-759d-9656-ab5e-4ab12b4fbe51', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:35:59.777' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (477, NULL, N'1955c529-759d-9656-ab5e-4ab12b4fbe51', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:35:59.793' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (478, NULL, N'513b4628-5849-0a2d-44cc-7f462d22ba9e', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:36:14.723' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (479, NULL, N'513b4628-5849-0a2d-44cc-7f462d22ba9e', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:36:14.743' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (480, NULL, N'8e228d98-709d-82d7-fdaf-74f822e76fb5', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:36:16.933' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (481, NULL, N'8e228d98-709d-82d7-fdaf-74f822e76fb5', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:36:16.950' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (482, NULL, N'539447bd-df1d-693b-9f16-036a64d4dd5e', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative?msg=Message%20successfully%20sent.', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:36:18.107' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (483, NULL, N'539447bd-df1d-693b-9f16-036a64d4dd5e', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative?msg=Message%20successfully%20sent.', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:36:18.123' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (484, NULL, N'334b5d7f-addc-45dc-40f4-4d18472475b3', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:36:18.290' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (485, NULL, N'5c2c537f-550f-6d7f-20a1-65151d3eade1', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:36:18.330' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (486, NULL, N'623030c8-8bc9-6860-5b78-65ae2881f84a', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:36:19.267' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (487, NULL, N'623030c8-8bc9-6860-5b78-65ae2881f84a', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:36:19.283' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (488, NULL, N'8eecb2eb-fb23-0041-09e3-a7015b4cd536', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:36:56.123' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (489, NULL, N'8eecb2eb-fb23-0041-09e3-a7015b4cd536', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:36:56.137' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (490, NULL, N'92a46099-4fff-f425-5cdd-32e6fd3e75f0', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:36:56.290' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (491, NULL, N'c4c8bf52-b735-7d0a-dd2e-a2f8d15a6128', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:36:56.293' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (492, NULL, N'1630c68b-53bb-d843-1770-108f672fccc1', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:36:57.157' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (493, NULL, N'1630c68b-53bb-d843-1770-108f672fccc1', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:36:57.170' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (494, NULL, N'a7f50287-ea2a-d508-01d3-13f728691875', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:37:26.140' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (495, NULL, N'a7f50287-ea2a-d508-01d3-13f728691875', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:37:26.160' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (496, NULL, N'199e75ab-800d-8e7f-bfdb-ac5dd77d0b4e', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:40:54.477' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (497, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'10a92830-1378-c277-a41b-c432c3cf3500', N'::1', N'', N'2022-03-11 07:41:06', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-11T07:41:06.620' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (498, NULL, N'e1458643-2e17-ce1d-bf55-e294a3d7bf08', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:06.673' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (499, NULL, N'e1458643-2e17-ce1d-bf55-e294a3d7bf08', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:06.687' AS DateTime))
GO
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (500, NULL, N'68084a4c-5455-cf88-4577-ea92e75809f3', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:06.930' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (501, NULL, N'68084a4c-5455-cf88-4577-ea92e75809f3', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:06.950' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (502, NULL, N'471693eb-b69d-d18c-427f-b5a2b53e126b', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:08.827' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (503, NULL, N'471693eb-b69d-d18c-427f-b5a2b53e126b', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:08.843' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (504, NULL, N'4ca42517-3871-9b2f-6c4b-45e45357f489', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:41:09.087' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (505, NULL, N'036b654e-6cf9-51a1-2d20-e166ba5c68e1', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:41:09.123' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (506, NULL, N'113a2df8-a5ea-454e-623a-1d0c2937f621', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:16.130' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (507, NULL, N'113a2df8-a5ea-454e-623a-1d0c2937f621', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:16.147' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (508, NULL, N'8e6152cf-1977-2061-5626-a6e772988561', N'::1', N'/admin/transportation', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:41:16.290' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (509, NULL, N'9d68d164-4848-aacb-9ef2-1416b7666ec6', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:16.337' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (510, NULL, N'9d68d164-4848-aacb-9ef2-1416b7666ec6', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:16.353' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (511, NULL, N'a26417f1-da2b-f29a-e4ff-c1861d452a65', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:16.510' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (512, NULL, N'a26417f1-da2b-f29a-e4ff-c1861d452a65', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:16.523' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (513, NULL, N'3c498753-ec17-a217-699c-dc5740529fef', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:41:43.603' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (514, N'e4bbb4c8-b63f-46cb-75df-08d9fe7c66c1', N'2eccc904-e1c2-faa4-73e3-01b31684b6bb', N'::1', N'', N'2022-03-11 07:41:53', NULL, NULL, N'Account', N'Login', N'', N'identity', N'1b58f011-adb5-4c17-b59d-08d9fe7b2b77', NULL, NULL, CAST(N'2022-03-11T07:41:53.447' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (515, NULL, N'fc18e278-d41c-e57a-8b07-ab88da71e429', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:53.497' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (516, NULL, N'fc18e278-d41c-e57a-8b07-ab88da71e429', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:53.513' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (517, NULL, N'155de01d-6328-e1db-9fdf-006191278e8b', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:53.770' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (518, NULL, N'155de01d-6328-e1db-9fdf-006191278e8b', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:53.790' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (519, NULL, N'c9277186-4617-0b14-3d42-96503fd47a22', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:55.460' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (520, NULL, N'c9277186-4617-0b14-3d42-96503fd47a22', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:41:55.477' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (521, NULL, N'3d603956-7871-912e-d240-fa698daa21c1', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:41:55.763' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (522, NULL, N'0e0745e6-93b8-42ae-4556-727f55b23cab', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:41:55.763' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (523, NULL, N'dc6c25cd-6c3b-7d23-911d-45bc20e37e81', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:04.000' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (524, NULL, N'dc6c25cd-6c3b-7d23-911d-45bc20e37e81', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:04.017' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (525, NULL, N'a0530035-6c7b-4a5b-fc79-359e5df7af78', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:04.143' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (526, NULL, N'a0530035-6c7b-4a5b-fc79-359e5df7af78', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:04.163' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (527, NULL, N'013a7ef3-8e97-f9ca-c1bc-ab97d727a036', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail?msg=Transportation%20successfully%20added.', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:42:04.293' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (528, NULL, N'd7fef02c-908e-8fa4-9445-587e88108842', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail?msg=Transportation%20successfully%20added.', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:42:04.293' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (529, NULL, N'bd937c1d-e479-9661-bc71-c3307776068f', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail?msg=Transportation%20successfully%20added.', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:15.433' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (530, NULL, N'bd937c1d-e479-9661-bc71-c3307776068f', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail?msg=Transportation%20successfully%20added.', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:15.447' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (531, NULL, N'9eef837b-ae64-c76b-2d3d-5e69e43e461f', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:16.580' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (532, NULL, N'9eef837b-ae64-c76b-2d3d-5e69e43e461f', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:16.597' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (533, NULL, N'208de36a-06d6-95b1-ee8e-69c949907291', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:42:16.747' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (534, NULL, N'b1ec7125-07c9-1a8f-67eb-5a6e34d444a6', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:42:16.747' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (535, NULL, N'027655ed-257a-97a2-3676-eff94caf4069', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:19.583' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (536, NULL, N'027655ed-257a-97a2-3676-eff94caf4069', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:19.597' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (537, NULL, N'417b892c-61dc-fc7c-c967-d14e95f13abf', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:26.673' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (538, NULL, N'417b892c-61dc-fc7c-c967-d14e95f13abf', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:26.690' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (539, NULL, N'4152f4b7-bc47-7134-9c17-555dae3d56e0', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:26.843' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (540, NULL, N'4152f4b7-bc47-7134-9c17-555dae3d56e0', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:26.860' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (541, NULL, N'5b557151-6a72-8ad1-4c5c-c0d5fa06d580', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:30.260' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (542, NULL, N'5b557151-6a72-8ad1-4c5c-c0d5fa06d580', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:30.277' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (543, NULL, N'44b905ac-464e-b26a-a68a-2d15c5d74ff1', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:42:30.400' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (544, NULL, N'9fa4e08a-203a-5fef-8bbb-fd6c4b035a47', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:42:30.400' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (545, NULL, N'f837bc97-6ab0-7233-b234-dbb78a5c6153', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:30.777' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (546, NULL, N'f837bc97-6ab0-7233-b234-dbb78a5c6153', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:42:30.793' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (547, NULL, N'8507496e-2b92-573e-9c39-79de815161d9', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:43:16.013' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (548, NULL, N'8507496e-2b92-573e-9c39-79de815161d9', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:43:16.067' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (549, NULL, N'd1f5b6f0-6b45-8f8e-33c2-c985f2b332bb', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:43:16.197' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (550, NULL, N'5c83d136-aa05-3263-e201-57d2005cb62b', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-11T07:43:16.197' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (551, NULL, N'3bd2fc2e-e14d-f8f3-a587-d81048cf32f4', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:43:17.977' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (552, NULL, N'3bd2fc2e-e14d-f8f3-a587-d81048cf32f4', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:43:17.990' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (553, NULL, N'0f77d1c4-d495-db3a-a193-5bdbd9accddd', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:43:18.117' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (554, NULL, N'0f77d1c4-d495-db3a-a193-5bdbd9accddd', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:43:18.133' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (555, NULL, N'1c97202a-fff3-559b-262f-21e0290e0519', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:43:20.160' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (556, NULL, N'1c97202a-fff3-559b-262f-21e0290e0519', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-11T07:43:20.173' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (557, NULL, N'f9d1a549-2770-b400-afe1-5289f28834a2', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-12T06:20:11.320' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (558, NULL, N'56563394-441f-8beb-ed10-eba4ca3a0240', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-12T06:21:49.910' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (559, NULL, N'b21b27aa-2084-8ec0-163e-72aa2cc3820b', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-12T06:25:45.170' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (560, NULL, N'f0a6f4bc-97b2-63d5-8ddb-c6902ace6561', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-12T06:29:21.173' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (561, NULL, N'a357b3c4-cd7b-aa5f-7de0-e1ea37569026', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-12T06:31:14.643' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (562, NULL, N'15b19c9e-f218-25f0-2ea5-578cceb76647', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-12T06:31:59.480' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (563, NULL, N'65398b19-f314-7a43-7f04-ed7570f38773', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-12T06:56:30.383' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (564, NULL, N'ffd61753-a7db-40a9-3aef-63d17f788aa4', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-13T06:37:56.903' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (565, NULL, N'5e220f53-c8d1-4d5e-d052-e0abb9c9cf53', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-13T06:40:05.093' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (566, NULL, N'365b453f-214a-04d2-39fe-964ea3ebda3f', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-13T06:41:25.920' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (567, NULL, N'86a9fcfa-df86-7597-746c-e6c31d04c1fc', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T06:41:35.620' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (568, NULL, N'86a9fcfa-df86-7597-746c-e6c31d04c1fc', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T06:41:35.640' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (569, NULL, N'bfd21069-496f-91e6-3750-b204924590cf', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T06:41:38.793' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (570, NULL, N'bfd21069-496f-91e6-3750-b204924590cf', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T06:41:38.823' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (571, NULL, N'60404687-4a5e-21ae-5cbc-bc1ff7597d21', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T06:41:41.673' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (572, NULL, N'60404687-4a5e-21ae-5cbc-bc1ff7597d21', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T06:41:41.693' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (573, NULL, N'0023956f-7d5b-6228-a189-91648061b412', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-13T06:41:41.953' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (574, NULL, N'8e9d9b04-7d31-12cb-245d-e616bb6396e0', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-13T06:41:41.953' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (575, NULL, N'2503f90f-9e06-7632-15dd-4df7e1aa6332', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T06:41:43.370' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (576, NULL, N'2503f90f-9e06-7632-15dd-4df7e1aa6332', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T06:41:43.390' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (577, NULL, N'523c81f1-3c27-8cc0-5aac-b5c2b5c6a8b3', N'::1', N'/admin/auditlog', NULL, NULL, N'A', N'AuditLog', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T06:41:44.253' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (578, NULL, N'22bd605e-171b-452d-2304-fc1389ac2b12', N'::1', N'/admin/auditlog/getAuditLogs', NULL, NULL, N'A', N'AuditLog', N'getAuditLogs', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T06:41:44.403' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (579, NULL, N'21b6d8ff-2ed6-99df-8451-1a50ec252d1d', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T06:41:48.307' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (580, NULL, N'21b6d8ff-2ed6-99df-8451-1a50ec252d1d', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/auditlog', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T06:41:48.323' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (581, NULL, N'fdb5b4bc-838a-bf23-610b-30c1985ad872', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T06:41:51.523' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (582, NULL, N'fdb5b4bc-838a-bf23-610b-30c1985ad872', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T06:41:51.543' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (583, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'795e4ec0-a2d9-3f68-17de-51048a3ae329', N'::1', N'', NULL, N'2022-03-13 06:41:57', NULL, N'Account', N'Logout', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-13T06:41:57.410' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (584, NULL, N'c0a1edb7-dfa8-5dd7-4c65-9ad051122b90', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin', NULL, NULL, N'1', N'', CAST(N'2022-03-13T06:41:57.490' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (585, NULL, N'af00ad5c-603a-ce5b-2a4c-707f924d696e', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-13T07:15:40.113' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (586, NULL, N'34ad2066-5936-1e9c-0132-c911d9358137', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:15:46.150' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (587, NULL, N'34ad2066-5936-1e9c-0132-c911d9358137', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:15:46.167' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (588, NULL, N'9fc2915c-6014-2389-5aab-8fd8474a89f2', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:15:46.710' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (589, NULL, N'9fc2915c-6014-2389-5aab-8fd8474a89f2', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:15:46.737' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (590, NULL, N'73e363f2-36c6-1e10-e30a-f06087129182', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:15:49.693' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (591, NULL, N'73e363f2-36c6-1e10-e30a-f06087129182', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:15:49.710' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (592, NULL, N'93af7f78-3376-316f-e575-404775850e9a', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:17:21.580' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (593, NULL, N'93af7f78-3376-316f-e575-404775850e9a', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:17:21.597' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (594, NULL, N'e5dcbcfd-5c91-95ae-ea12-89155cb7a9e1', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:20:26.530' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (595, NULL, N'e5dcbcfd-5c91-95ae-ea12-89155cb7a9e1', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:20:26.547' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (596, NULL, N'ec338f29-5264-ad9a-1efb-be8d7ae11f1f', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:20:49.127' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (597, NULL, N'ec338f29-5264-ad9a-1efb-be8d7ae11f1f', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:20:49.143' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (598, NULL, N'0148122b-d199-c2a5-958c-a4608a268d5c', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:21:18.183' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (599, NULL, N'0148122b-d199-c2a5-958c-a4608a268d5c', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:21:18.197' AS DateTime))
GO
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (600, NULL, N'ebf4180e-a2aa-c3a4-0ab2-d62fde23ffa7', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:25:18.633' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (601, NULL, N'ebf4180e-a2aa-c3a4-0ab2-d62fde23ffa7', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:25:18.650' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (602, NULL, N'd7a2e26a-2e69-3f09-086a-41dfb5d0c631', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:25:51.963' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (603, NULL, N'd7a2e26a-2e69-3f09-086a-41dfb5d0c631', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:25:51.977' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (604, NULL, N'40700d21-c137-f42f-5244-f3a746a108e8', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:26:32.880' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (605, NULL, N'40700d21-c137-f42f-5244-f3a746a108e8', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T07:26:32.900' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (606, NULL, N'66e6e4da-3d4c-34df-f52f-01b64eb0e83c', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-13T09:39:26.733' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (607, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'0b729b17-0d93-e31b-bb7a-224ae0878312', N'::1', N'', N'2022-03-13 09:40:20', NULL, NULL, N'Account', N'Login', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-13T09:40:20.913' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (608, NULL, N'a6804b49-e739-8bb2-f05a-6411fa300ffb', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:40:20.967' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (609, NULL, N'a6804b49-e739-8bb2-f05a-6411fa300ffb', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:40:20.980' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (610, NULL, N'715b3575-c926-1a7b-0e0f-0fb420cdad95', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:40:21.313' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (611, NULL, N'715b3575-c926-1a7b-0e0f-0fb420cdad95', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:40:21.330' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (612, NULL, N'535f2830-6fc6-fcd2-5163-f19f2cc27aba', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:40:24.413' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (613, NULL, N'535f2830-6fc6-fcd2-5163-f19f2cc27aba', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:40:24.427' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (614, NULL, N'7fce61d7-adff-f3c3-6803-19ccba12a8b0', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-13T09:40:24.670' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (615, NULL, N'cae92140-c1ad-7d7c-850c-5a8f9472bb93', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-13T09:40:24.670' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (616, NULL, N'51f3ecbf-148e-5b90-ec6c-fdb380ba199a', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:40:25.463' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (617, NULL, N'51f3ecbf-148e-5b90-ec6c-fdb380ba199a', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:40:25.477' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (618, NULL, N'a64c96ee-d696-67ed-332c-23d760dc6414', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:40:26.657' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (619, NULL, N'a64c96ee-d696-67ed-332c-23d760dc6414', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:40:26.670' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (620, NULL, N'15f78992-5832-9ba0-b388-7e0058d060af', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-13T09:40:26.787' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (621, NULL, N'5e3727e2-9f36-d698-cda7-f54462e3cfdf', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-13T09:40:26.787' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (622, NULL, N'e3b2d838-abd0-fcd9-8288-41c2b33abfe7', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:40:27.850' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (623, NULL, N'e3b2d838-abd0-fcd9-8288-41c2b33abfe7', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:40:27.867' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (624, NULL, N'e0d14f48-9605-e006-89aa-2c2eeab30230', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:40:27.993' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (625, NULL, N'e0d14f48-9605-e006-89aa-2c2eeab30230', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:40:28.013' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (626, NULL, N'ef6c74f8-3ad0-cbbc-7d2e-bb0d3892a560', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:42:16.763' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (627, NULL, N'ef6c74f8-3ad0-cbbc-7d2e-bb0d3892a560', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:42:16.787' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (628, NULL, N'c7ec3f91-a4e5-02aa-c9a0-76c3fb7edf19', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:42:22.620' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (629, NULL, N'c7ec3f91-a4e5-02aa-c9a0-76c3fb7edf19', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:42:22.633' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (630, NULL, N'8f97c265-5fa2-9f52-069b-82f90d2cf3f2', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-13T09:42:22.793' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (631, NULL, N'61859e49-ab40-570d-0bad-6275325153ad', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-13T09:42:22.793' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (632, NULL, N'26b3be8c-1859-b1ac-72a3-e14432a1d446', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:42:27.580' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (633, NULL, N'26b3be8c-1859-b1ac-72a3-e14432a1d446', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:42:27.597' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (634, NULL, N'6512e350-c19c-a62d-ed59-72f4b8fb549f', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:42:27.737' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (635, NULL, N'6512e350-c19c-a62d-ed59-72f4b8fb549f', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-13T09:42:27.757' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (636, NULL, N'70205874-e1d5-3415-0ff6-f2a3b259b678', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-15T03:33:46.083' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (637, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'4bd39ad6-32e1-4728-65da-ce0bc06e5e37', N'::1', N'', N'2022-03-15 03:34:46', NULL, NULL, N'Account', N'Login', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-15T03:34:46.853' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (638, NULL, N'c9716c48-7aa0-6148-b1fe-8050a2cac7dc', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-15T03:34:48.273' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (639, NULL, N'c9716c48-7aa0-6148-b1fe-8050a2cac7dc', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-15T03:34:48.293' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (640, NULL, N'b4c365c7-9434-e039-db9b-cde07d968e10', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-15T03:34:48.660' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (641, NULL, N'b4c365c7-9434-e039-db9b-cde07d968e10', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-15T03:34:48.680' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (642, NULL, N'a0d6f449-c593-64d7-59e9-c7d487077e19', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-15T03:42:39.173' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (643, NULL, N'230e2bd8-5a96-70f4-5a86-999ea53f2e62', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-15T03:49:22.737' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (644, NULL, N'c50491d5-df8a-80fd-1f05-a4784229721d', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-15T03:56:54.820' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (645, NULL, N'158150cc-b309-b625-7893-5de0eed592c3', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-15T04:06:59.833' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (646, NULL, N'e2a38f88-3844-0d93-8877-586524b66a33', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-15T04:10:32.447' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (647, NULL, N'cf126465-797b-3880-ee47-bf7dc28a3061', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-15T04:11:23.197' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (648, NULL, N'e3ba729f-5b81-4c77-5e40-7aeb22afe7d7', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-15T04:23:20.500' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (649, NULL, N'38ea899a-f6a0-051c-8638-f4a0de21bdfe', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-15T04:32:49.860' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (650, NULL, N'55bdacf3-483a-8b3a-e355-154e554d3893', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:18:25.580' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (651, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'996dd194-6109-cd9b-3aa4-60366729b0db', N'::1', N'', N'2022-03-16 03:18:40', NULL, NULL, N'Account', N'Login', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-16T03:18:40.260' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (652, NULL, N'57ede2bd-336f-70a5-faa8-a262764a4ad6', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:18:44.333' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (653, NULL, N'57ede2bd-336f-70a5-faa8-a262764a4ad6', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:18:44.350' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (654, NULL, N'467fca2e-bcc6-b769-81bf-cb35742a1991', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:18:46.837' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (655, NULL, N'467fca2e-bcc6-b769-81bf-cb35742a1991', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:18:46.853' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (656, NULL, N'a4bf6c94-4d2e-7568-e000-9dff2a1a72a5', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:19:11.893' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (657, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'52b5867f-caf6-eea5-ed89-68472950569e', N'::1', N'', N'2022-03-16 03:19:20', NULL, NULL, N'Account', N'Login', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-16T03:19:20.627' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (658, NULL, N'afa13ba3-b983-d0e8-0027-ebf9174c878d', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:19:24.143' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (659, NULL, N'afa13ba3-b983-d0e8-0027-ebf9174c878d', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:19:24.160' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (660, NULL, N'25cfa3da-c087-988e-995c-44dda99921cf', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:19:24.427' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (661, NULL, N'25cfa3da-c087-988e-995c-44dda99921cf', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:19:24.460' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (662, NULL, N'8ab41834-be0e-7d20-ee1b-4a988c2481de', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:19:27.187' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (663, NULL, N'8ab41834-be0e-7d20-ee1b-4a988c2481de', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:19:27.203' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (664, NULL, N'9361e246-9e69-8e8e-9f41-870325435f74', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transection/detail?ticketNo=01232123', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:20:18.953' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (665, NULL, N'9361e246-9e69-8e8e-9f41-870325435f74', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transection/detail?ticketNo=01232123', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:20:18.970' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (666, NULL, N'faba83fa-2c86-8e7e-4f35-86f2add72588', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:20:19.240' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (667, NULL, N'e92498f5-cdad-2b21-42ea-8dc6f7bfea5e', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:20:19.240' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (668, NULL, N'83c3c742-7b7e-4d12-f5b5-e86bdc9cf5cf', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:30:01.500' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (669, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'f7fec10e-10cb-6cb6-66ac-694d504ef9d2', N'::1', N'', N'2022-03-16 03:30:18', NULL, NULL, N'Account', N'Login', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-16T03:30:18.220' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (670, NULL, N'5409f574-9090-09cf-bbcb-d815e2a96091', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:30:18.273' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (671, NULL, N'5409f574-9090-09cf-bbcb-d815e2a96091', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:30:18.290' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (672, NULL, N'4e2db0e1-d708-410f-7b14-316fd8eedb36', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:30:37.453' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (673, NULL, N'4e2db0e1-d708-410f-7b14-316fd8eedb36', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:30:37.470' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (674, NULL, N'e174c229-f706-f0da-41a1-8923aa2bec33', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:31:59.223' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (675, NULL, N'099d8c7d-7a88-f3ec-0e55-3f7a29dd06b1', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:34:32.687' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (676, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'be178096-1898-86b0-c415-19cea9f59a35', N'::1', N'', N'2022-03-16 03:34:44', NULL, NULL, N'Account', N'Login', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-16T03:34:44.097' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (677, NULL, N'62d74016-28cb-f32c-3131-d58fc5f6aa10', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:34:44.160' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (678, NULL, N'62d74016-28cb-f32c-3131-d58fc5f6aa10', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:34:44.180' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (679, NULL, N'701542f9-ba99-bfcb-3ffd-93e823ee06b8', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:34:44.497' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (680, NULL, N'701542f9-ba99-bfcb-3ffd-93e823ee06b8', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:34:44.513' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (681, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'014eb0d3-6e8b-c11f-5ce3-46454843a8de', N'::1', N'', NULL, N'2022-03-16 03:35:08', NULL, N'Account', N'Logout', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-16T03:35:08.247' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (682, NULL, N'e97a15f5-8f7c-ee1d-c887-b3204e95a06c', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin', NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:35:08.337' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (683, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'62871c59-bd78-58a2-1c46-65f2de1d2ced', N'::1', N'', N'2022-03-16 03:35:16', NULL, NULL, N'Account', N'Login', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-16T03:35:16.207' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (684, NULL, N'5787866e-409c-7d8f-95e5-1808b2804ed1', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:35:16.243' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (685, NULL, N'5787866e-409c-7d8f-95e5-1808b2804ed1', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:35:16.257' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (686, NULL, N'337661bb-e7cb-4338-d27c-2feb3f5b7d74', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:35:16.393' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (687, NULL, N'337661bb-e7cb-4338-d27c-2feb3f5b7d74', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:35:16.410' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (688, NULL, N'e5867333-a1b0-94e7-dd0f-01cdf4b14e37', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:35:29.157' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (689, NULL, N'e5867333-a1b0-94e7-dd0f-01cdf4b14e37', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:35:29.173' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (690, NULL, N'0a55db00-0e93-7137-840c-4af2bf64c46e', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:35:29.420' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (691, NULL, N'0a55db00-0e93-7137-840c-4af2bf64c46e', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:35:29.440' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (692, NULL, N'8169c5e4-411e-68fa-6598-a72eb48f8e1a', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:36:07.063' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (693, NULL, N'8169c5e4-411e-68fa-6598-a72eb48f8e1a', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:36:07.080' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (694, NULL, N'ece1731d-e9bd-7258-c819-3cf67b2bc9bb', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:36:08.567' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (695, NULL, N'ece1731d-e9bd-7258-c819-3cf67b2bc9bb', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:36:08.590' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (696, NULL, N'01ba8721-be48-b7b8-ef8a-c9d72bee996a', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:36:27.960' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (697, NULL, N'01ba8721-be48-b7b8-ef8a-c9d72bee996a', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:36:27.977' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (698, NULL, N'707ed7a8-89ab-e658-cc70-610e7c99171c', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:36:28.287' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (699, NULL, N'707ed7a8-89ab-e658-cc70-610e7c99171c', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:36:28.303' AS DateTime))
GO
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (700, NULL, N'c88b54b1-0b57-fc8d-6008-326f249aee5b', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:36:32.507' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (701, NULL, N'c88b54b1-0b57-fc8d-6008-326f249aee5b', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:36:32.520' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (702, NULL, N'1711f229-f1c3-c342-8ab5-1f0a01274895', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:36:32.653' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (703, NULL, N'1711f229-f1c3-c342-8ab5-1f0a01274895', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:36:32.690' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (704, NULL, N'351d7d68-45ad-d7af-6068-f95dd62ceb84', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:37:56.713' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (705, NULL, N'351d7d68-45ad-d7af-6068-f95dd62ceb84', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:37:56.730' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (706, NULL, N'2554db3d-3a02-ab9f-c3fc-77df1244cd18', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:37:57.140' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (707, NULL, N'2554db3d-3a02-ab9f-c3fc-77df1244cd18', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:37:57.167' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (708, NULL, N'a6b61b56-70b8-5a70-f811-1f82f2cd25eb', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:38:07.740' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (709, NULL, N'a6b61b56-70b8-5a70-f811-1f82f2cd25eb', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:38:07.757' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (710, NULL, N'c873c8ff-410a-a98c-7ae9-c7dcb376ebb4', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:38:07.970' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (711, NULL, N'c873c8ff-410a-a98c-7ae9-c7dcb376ebb4', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:38:07.990' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (712, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'6fb948af-c8ed-0d40-c715-cd3106b0802c', N'::1', N'', NULL, N'2022-03-16 03:38:09', NULL, N'Account', N'Logout', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-16T03:38:09.437' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (713, NULL, N'61ccbb25-ce06-55a4-159f-a4b9ab58d38b', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin', NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:38:09.510' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (714, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'd4879521-76b5-d9db-27b0-83f8b2c1d156', N'::1', N'', N'2022-03-16 03:38:22', NULL, NULL, N'Account', N'Login', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-16T03:38:22.580' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (715, NULL, N'61de41bd-5a54-3908-b308-e51d9860a2bb', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:38:22.623' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (716, NULL, N'61de41bd-5a54-3908-b308-e51d9860a2bb', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:38:22.640' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (717, NULL, N'68ac9269-f697-5302-16a5-a25bd64d9428', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:38:22.870' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (718, NULL, N'68ac9269-f697-5302-16a5-a25bd64d9428', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:38:22.887' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (719, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'6370cdad-61c0-ed27-bae2-a83a282b2812', N'::1', N'', NULL, N'2022-03-16 03:38:36', NULL, N'Account', N'Logout', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-16T03:38:36.400' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (720, NULL, N'b32d8db2-d8fc-280c-05d5-f7af379afa1f', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin', NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:38:36.467' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (721, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'bd5c9073-d6d5-c259-a7bc-f3fe58737938', N'::1', N'', N'2022-03-16 03:38:42', NULL, NULL, N'Account', N'Login', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-16T03:38:42.240' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (722, NULL, N'7176f649-cf43-99d3-ade1-140dc667a332', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:38:42.270' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (723, NULL, N'7176f649-cf43-99d3-ade1-140dc667a332', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:38:42.287' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (724, NULL, N'af4d9ac1-a036-e563-44e1-37c75ac93b89', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:38:42.440' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (725, NULL, N'af4d9ac1-a036-e563-44e1-37c75ac93b89', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:38:42.457' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (726, NULL, N'f8a53a7c-c8db-892b-9965-78fa61b65acc', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:42:41.577' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (727, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'd4178417-492d-9465-2f08-1e07c7af8923', N'::1', N'', N'2022-03-16 03:42:51', NULL, NULL, N'Account', N'Login', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-16T03:42:51.193' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (728, NULL, N'43a74450-7a95-05c9-6fa0-2dde9cfc9b28', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:42:51.277' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (729, NULL, N'43a74450-7a95-05c9-6fa0-2dde9cfc9b28', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:42:51.290' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (730, NULL, N'0d75795c-659a-aa7d-4ee9-b6f1bc779053', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:42:51.543' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (731, NULL, N'0d75795c-659a-aa7d-4ee9-b6f1bc779053', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:42:51.563' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (732, NULL, N'c4fa5183-91b7-748b-3611-efa426f1c69d', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:42:53.130' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (733, NULL, N'c4fa5183-91b7-748b-3611-efa426f1c69d', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:42:53.147' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (734, NULL, N'98ac43f4-461b-f261-2174-92aa666739ab', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:44:15.737' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (735, NULL, N'98ac43f4-461b-f261-2174-92aa666739ab', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:44:15.763' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (736, NULL, N'3887179a-433b-9791-eb6d-59cbc6731a7f', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:44:54.117' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (737, NULL, N'3887179a-433b-9791-eb6d-59cbc6731a7f', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:44:54.130' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (738, NULL, N'd66ba94e-4a16-d3d3-ab3f-5ab1639c1c65', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transection/detail?ticketNo=01232123', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:45:13.917' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (739, NULL, N'd66ba94e-4a16-d3d3-ab3f-5ab1639c1c65', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transection/detail?ticketNo=01232123', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:45:13.930' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (740, NULL, N'122ac205-d3ac-034d-ee59-d4cfeac5048a', N'::1', N'/general/getAllLocationsList', NULL, NULL, N'A', N'General', N'getAllLocationsList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:45:14.190' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (741, NULL, N'd520f286-163e-085b-61f7-2e94847813dd', N'::1', N'/general/getAllCommodityList', NULL, NULL, N'A', N'General', N'getAllCommodityList', N'https://localhost:44397/admin/transportation/detail', NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:45:14.237' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (742, NULL, N'16f19a32-1f8f-d271-3038-6b7b4109d962', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:45:15.247' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (743, NULL, N'16f19a32-1f8f-d271-3038-6b7b4109d962', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:45:15.260' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (744, NULL, N'60e2e171-1fe4-6c9b-3612-51adc2bf7d5a', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:45:19.923' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (745, NULL, N'60e2e171-1fe4-6c9b-3612-51adc2bf7d5a', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:45:19.940' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (746, NULL, N'e7136fde-f25c-61d2-a158-fc794b86d2bc', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:47:56.013' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (747, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'400ece6c-fc92-21cd-be3b-c2df68747640', N'::1', N'', N'2022-03-16 03:48:02', NULL, NULL, N'Account', N'Login', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-16T03:48:02.910' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (748, NULL, N'2422d03e-0a7a-30be-dcad-90f436dbc56a', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:48:02.960' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (749, NULL, N'2422d03e-0a7a-30be-dcad-90f436dbc56a', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:48:02.977' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (750, NULL, N'66a2eebd-43ba-ed06-294d-2a5b7207b065', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:48:03.320' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (751, NULL, N'66a2eebd-43ba-ed06-294d-2a5b7207b065', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:48:03.343' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (752, NULL, N'53cbdf96-18b2-e6a7-29db-cdcb0ebd5a78', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:48:04.653' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (753, NULL, N'53cbdf96-18b2-e6a7-29db-cdcb0ebd5a78', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:48:04.673' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (754, NULL, N'42a6d6c0-6bfb-2429-1fe8-c3d326647c89', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:48:12.200' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (755, NULL, N'42a6d6c0-6bfb-2429-1fe8-c3d326647c89', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:48:12.213' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (756, NULL, N'ea8212a0-f4db-14c6-c7e4-a77e1e8936b1', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:51:09.990' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (757, N'37f33cf0-35f7-437b-e0b5-08da04bbff66', N'82400efb-224e-4c80-9676-29019bfde8a1', N'::1', N'', N'2022-03-16 03:51:18', NULL, NULL, N'Account', N'Login', N'', N'identity', N'285fa423-7804-4672-3e24-08da04bbf78f', NULL, NULL, CAST(N'2022-03-16T03:51:18.153' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (758, NULL, N'b353ea2c-6a01-c1a4-dd99-0f208cf057e7', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:51:18.217' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (759, NULL, N'b353ea2c-6a01-c1a4-dd99-0f208cf057e7', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Identity/Account/Login?ReturnUrl=%2Fadmin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:51:18.233' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (760, NULL, N'71fb8ebb-5bf8-0fd9-fc64-502103174110', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:51:18.517' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (761, NULL, N'71fb8ebb-5bf8-0fd9-fc64-502103174110', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:51:18.533' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (762, NULL, N'48e82ec6-6426-e548-da97-cb672d1004be', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:51:20.013' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (763, NULL, N'48e82ec6-6426-e548-da97-cb672d1004be', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:51:20.030' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (764, NULL, N'46648bca-de38-79a4-0ee2-2d283ea2b42f', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:51:27.003' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (765, NULL, N'46648bca-de38-79a4-0ee2-2d283ea2b42f', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:51:27.020' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (766, NULL, N'd948ccd2-fb33-4cc0-6ef4-458e16aef9e1', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:54:01.600' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (767, NULL, N'232ed2fe-2bae-0069-fd6a-0e4956d9c1eb', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:54:01.747' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (768, NULL, N'232ed2fe-2bae-0069-fd6a-0e4956d9c1eb', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:54:01.763' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (769, NULL, N'eed9a1fb-82d0-5d50-a603-0efc84495547', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:54:02.100' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (770, NULL, N'eed9a1fb-82d0-5d50-a603-0efc84495547', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:54:02.117' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (771, NULL, N'5a4024be-7da8-ca97-b6e5-7846542867f7', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:54:03.643' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (772, NULL, N'5a4024be-7da8-ca97-b6e5-7846542867f7', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:54:03.660' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (773, NULL, N'b48b2663-fa73-73bb-54ee-3633ae31a4ce', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:54:07.643' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (774, NULL, N'b48b2663-fa73-73bb-54ee-3633ae31a4ce', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:54:07.657' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (775, NULL, N'5f958747-8e41-1710-c535-04d2196d4850', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:57:09.497' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (776, NULL, N'6de02410-c56f-56de-bcaa-4e8801541981', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:57:09.643' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (777, NULL, N'6de02410-c56f-56de-bcaa-4e8801541981', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:57:09.663' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (778, NULL, N'f52f0c95-31b1-ec4c-814e-60dc7d9732bd', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:57:10.007' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (779, NULL, N'f52f0c95-31b1-ec4c-814e-60dc7d9732bd', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:57:10.027' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (780, NULL, N'175192fb-fc3b-2500-b1d3-a8bb3955afb6', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:57:17.137' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (781, NULL, N'175192fb-fc3b-2500-b1d3-a8bb3955afb6', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:57:17.153' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (782, NULL, N'99503c38-1138-d921-c84a-59c6ee4983d7', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:57:22.763' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (783, NULL, N'99503c38-1138-d921-c84a-59c6ee4983d7', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:57:22.780' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (784, NULL, N'be1c43d3-1866-9ac7-1c64-556e6b4d7dba', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T03:58:44.563' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (785, NULL, N'0bbed548-c488-a53f-35be-cbdd8bb32c3e', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:58:44.707' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (786, NULL, N'0bbed548-c488-a53f-35be-cbdd8bb32c3e', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:58:44.723' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (787, NULL, N'e3b95321-ed67-43ac-f0bd-90e95e140598', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:58:45.050' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (788, NULL, N'e3b95321-ed67-43ac-f0bd-90e95e140598', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:58:45.067' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (789, NULL, N'4017c61c-acbc-8116-7b6c-b648a4b5986d', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:58:56.840' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (790, NULL, N'4017c61c-acbc-8116-7b6c-b648a4b5986d', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:58:56.857' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (791, NULL, N'0b9581ef-6754-c2e1-4a01-06ae8dec12ae', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:59:03.623' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (792, NULL, N'0b9581ef-6754-c2e1-4a01-06ae8dec12ae', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T03:59:03.640' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (793, NULL, N'276ef9cd-05a0-f2d5-293e-9d97a9f61d53', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:03:01.753' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (794, NULL, N'276ef9cd-05a0-f2d5-293e-9d97a9f61d53', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:03:01.773' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (795, NULL, N'0932bb7b-d85b-fcda-3b5c-680058056907', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T04:04:24.453' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (796, NULL, N'83263d10-1f48-4f75-db72-943619b2e7c2', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:04:24.597' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (797, NULL, N'83263d10-1f48-4f75-db72-943619b2e7c2', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:04:24.610' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (798, NULL, N'e6435b57-7752-b9f5-fa6d-fab16eb778b9', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:04:24.970' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (799, NULL, N'e6435b57-7752-b9f5-fa6d-fab16eb778b9', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:04:24.990' AS DateTime))
GO
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (800, NULL, N'7dfdf805-458d-e9da-8a2b-5709c268685d', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:04:27.140' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (801, NULL, N'7dfdf805-458d-e9da-8a2b-5709c268685d', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:04:27.157' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (802, NULL, N'5223ae95-ab4d-7ca5-6c55-3b42b06a28fb', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:04:30.953' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (803, NULL, N'5223ae95-ab4d-7ca5-6c55-3b42b06a28fb', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:04:30.970' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (804, NULL, N'8691e407-9988-23b4-594f-0f008a698fdd', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T04:06:10.913' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (805, NULL, N'8aa60ba0-664a-ac16-fc62-57d64aa902be', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:06:11.047' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (806, NULL, N'8aa60ba0-664a-ac16-fc62-57d64aa902be', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:06:11.063' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (807, NULL, N'3161264b-9ef7-de9a-ccf7-2a8f6d3aaef2', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:06:11.397' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (808, NULL, N'3161264b-9ef7-de9a-ccf7-2a8f6d3aaef2', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:06:11.417' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (809, NULL, N'e3c51039-0673-5bdf-0099-f1ab8d366299', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:06:12.813' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (810, NULL, N'e3c51039-0673-5bdf-0099-f1ab8d366299', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:06:12.830' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (811, NULL, N'f17c3fd9-7a9f-9b4e-97fd-0e4fcda991f9', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:06:17.813' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (812, NULL, N'f17c3fd9-7a9f-9b4e-97fd-0e4fcda991f9', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:06:17.830' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (813, NULL, N'33820e42-2a55-d658-7751-1e2e7628eef8', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T04:13:31.590' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (814, NULL, N'db90e626-8776-9977-f405-303ff12120ec', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:13:31.740' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (815, NULL, N'db90e626-8776-9977-f405-303ff12120ec', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:13:31.757' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (816, NULL, N'15ba9d0c-7be8-b084-759b-e02fcb417ead', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:13:32.127' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (817, NULL, N'15ba9d0c-7be8-b084-759b-e02fcb417ead', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:13:32.143' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (818, NULL, N'2397c5cc-fc9e-44c3-da63-4db12d896dfa', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:13:39.823' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (819, NULL, N'2397c5cc-fc9e-44c3-da63-4db12d896dfa', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:13:39.840' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (820, NULL, N'54b746f9-4103-f777-b5f1-23d4796e6ef2', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:13:52.437' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (821, NULL, N'54b746f9-4103-f777-b5f1-23d4796e6ef2', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:13:52.453' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (822, NULL, N'7064c3d9-8bfa-082e-11cc-cd3b366ebc5f', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T04:25:20.873' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (823, NULL, N'adc0e6d2-c0e6-4838-cc5a-dca4607bb1b7', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:25:21.020' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (824, NULL, N'adc0e6d2-c0e6-4838-cc5a-dca4607bb1b7', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:25:21.040' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (825, NULL, N'8174b875-f0cd-7206-720c-30ff676a7498', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:25:21.443' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (826, NULL, N'8174b875-f0cd-7206-720c-30ff676a7498', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:25:21.463' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (827, NULL, N'fc4313d6-e678-d89a-d135-681e5fdc2a05', N'::1', N'/', NULL, NULL, N'A', N'Home', N'Index', NULL, NULL, NULL, N'1', N'', CAST(N'2022-03-16T04:27:55.210' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (828, NULL, N'fa0567c5-2e02-6619-c05d-9b229f9cf306', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:27:55.353' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (829, NULL, N'fa0567c5-2e02-6619-c05d-9b229f9cf306', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:27:55.373' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (830, NULL, N'7972e2c5-5986-7427-6afb-0aba6890ace4', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:27:55.903' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (831, NULL, N'7972e2c5-5986-7427-6afb-0aba6890ace4', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:27:55.920' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (832, NULL, N'56a7065c-6d0c-835e-f479-8e8cb762dbab', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:27:57.300' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (833, NULL, N'56a7065c-6d0c-835e-f479-8e8cb762dbab', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:27:57.320' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (834, NULL, N'2062c4d6-079d-a4ed-265f-dcdffedb211c', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:28:01.947' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (835, NULL, N'2062c4d6-079d-a4ed-265f-dcdffedb211c', N'::1', N'/admin/representative', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/representative', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T04:28:01.963' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (836, NULL, N'f94fffc7-5dd3-d73c-e4ff-5985139ef05a', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T05:26:56.277' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (837, NULL, N'f94fffc7-5dd3-d73c-e4ff-5985139ef05a', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T05:26:56.597' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (838, NULL, N'f94fffc7-5dd3-d73c-e4ff-5985139ef05a', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T05:27:00.023' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (839, NULL, N'f94fffc7-5dd3-d73c-e4ff-5985139ef05a', N'::1', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T05:27:01.453' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (840, NULL, N'e8960054-d53c-883d-ee94-a81f9120b374', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T05:52:07.863' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (841, NULL, N'e8960054-d53c-883d-ee94-a81f9120b374', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T05:52:08.180' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (842, NULL, N'e8960054-d53c-883d-ee94-a81f9120b374', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T05:52:10.780' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (843, NULL, N'e8960054-d53c-883d-ee94-a81f9120b374', N'::1', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T05:52:12.377' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (844, NULL, N'104fe46a-a8d4-f55f-0423-7f777f7a171f', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T05:57:39.843' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (845, NULL, N'104fe46a-a8d4-f55f-0423-7f777f7a171f', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T05:57:40.080' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (846, NULL, N'3d048585-b82c-3e68-7036-3a0e6eaaf0e8', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'login', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T06:06:37.670' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (847, NULL, N'984aa2f2-1fbf-fe39-e849-e5e3c6fe667e', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'login', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T06:09:00.047' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (848, NULL, N'b4a1a641-ee6b-cf67-62ed-95413792e96c', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'login', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T06:12:15.800' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (849, NULL, N'14cec57f-1fc6-4da6-0b83-ddc00486055e', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'login', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T06:18:27.070' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (850, NULL, N'bf8ae193-b83b-f8d3-b8cf-833baeda1775', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T06:20:45.410' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (851, NULL, N'bf8ae193-b83b-f8d3-b8cf-833baeda1775', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T06:20:45.887' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (852, NULL, N'bf8ae193-b83b-f8d3-b8cf-833baeda1775', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T06:20:47.610' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (853, NULL, N'bf8ae193-b83b-f8d3-b8cf-833baeda1775', N'::1', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T06:20:48.980' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (854, NULL, N'27ce53f7-44e3-ffc0-ca53-fc8ca2bcafa2', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T06:59:44.263' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (855, NULL, N'27ce53f7-44e3-ffc0-ca53-fc8ca2bcafa2', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T06:59:44.643' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (856, NULL, N'27ce53f7-44e3-ffc0-ca53-fc8ca2bcafa2', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T06:59:49.607' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (857, NULL, N'8dd7dcca-a6e8-bc63-42d7-201766289fcb', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:13:04.037' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (858, NULL, N'8dd7dcca-a6e8-bc63-42d7-201766289fcb', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:13:04.313' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (859, NULL, N'8dd7dcca-a6e8-bc63-42d7-201766289fcb', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:13:06.783' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (860, NULL, N'8dd7dcca-a6e8-bc63-42d7-201766289fcb', N'::1', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:13:08.417' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (861, NULL, N'8dd7dcca-a6e8-bc63-42d7-201766289fcb', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/representative/index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:13:10.220' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (862, NULL, N'8dd7dcca-a6e8-bc63-42d7-201766289fcb', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'login', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:13:10.737' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (863, NULL, N'8dd7dcca-a6e8-bc63-42d7-201766289fcb', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'login', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:13:33.197' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (864, NULL, N'29357077-2dd1-93e7-68f2-4aa0f68728bb', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:14:25.407' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (865, NULL, N'29357077-2dd1-93e7-68f2-4aa0f68728bb', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:14:25.653' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (866, NULL, N'29357077-2dd1-93e7-68f2-4aa0f68728bb', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:14:52.203' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (867, NULL, N'29357077-2dd1-93e7-68f2-4aa0f68728bb', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'login', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:14:53.867' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (868, NULL, N'076aa902-8a42-385a-0f45-ecf730fb7a0b', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:16:53.920' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (869, NULL, N'076aa902-8a42-385a-0f45-ecf730fb7a0b', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:16:54.170' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (870, NULL, N'076aa902-8a42-385a-0f45-ecf730fb7a0b', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:16:56.623' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (871, NULL, N'076aa902-8a42-385a-0f45-ecf730fb7a0b', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'login', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:16:58.390' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (872, NULL, N'61dad1d5-4c37-2f06-48a2-bc83f71421f2', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:18:31.337' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (873, NULL, N'61dad1d5-4c37-2f06-48a2-bc83f71421f2', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:18:31.563' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (874, NULL, N'61dad1d5-4c37-2f06-48a2-bc83f71421f2', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:19:04.280' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (875, NULL, N'61dad1d5-4c37-2f06-48a2-bc83f71421f2', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'login', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:19:05.583' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (876, NULL, N'28503e29-af14-0da5-1540-84dac7363be5', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:22:00.257' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (877, NULL, N'28503e29-af14-0da5-1540-84dac7363be5', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:22:03.083' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (878, NULL, N'28503e29-af14-0da5-1540-84dac7363be5', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:22:08.113' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (879, NULL, N'28503e29-af14-0da5-1540-84dac7363be5', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'login', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:22:10.043' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (880, NULL, N'28503e29-af14-0da5-1540-84dac7363be5', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:24:03.830' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (881, NULL, N'28503e29-af14-0da5-1540-84dac7363be5', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:24:05.487' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (882, NULL, N'28503e29-af14-0da5-1540-84dac7363be5', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:24:12.130' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (883, NULL, N'28503e29-af14-0da5-1540-84dac7363be5', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'login', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:24:23.707' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (884, NULL, N'49784880-4a8b-9c86-ffc8-e0f2e31beae0', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:28:04.177' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (885, NULL, N'ef328731-dd80-f849-60ee-0c36c0958eff', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:28:39.480' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (886, NULL, N'ef328731-dd80-f849-60ee-0c36c0958eff', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:28:40.877' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (887, NULL, N'ef328731-dd80-f849-60ee-0c36c0958eff', N'::1', N'/admin/transection/detail', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:28:50.380' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (888, NULL, N'ef328731-dd80-f849-60ee-0c36c0958eff', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/transection/detail?ticketNo=01232123', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:28:57.673' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (889, NULL, N'ef328731-dd80-f849-60ee-0c36c0958eff', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'login', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:29:02.070' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (890, NULL, N'ef328731-dd80-f849-60ee-0c36c0958eff', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:29:32.827' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (891, NULL, N'ef328731-dd80-f849-60ee-0c36c0958eff', N'::1', N'/admin/home/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:29:36.163' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (892, NULL, N'ef328731-dd80-f849-60ee-0c36c0958eff', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:29:46.090' AS DateTime))
INSERT [dbo].[UserAudit] ([AuditId], [UserId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [RoleId], [LangId], [IsFirstLogin], [CreatedOn]) VALUES (893, NULL, N'ef328731-dd80-f849-60ee-0c36c0958eff', N'::1', N'/admin', NULL, NULL, N'A', N'Home', N'login', N'https://localhost:44397/admin/transportation/detail', N'Admin', NULL, N'1', N'', CAST(N'2022-03-16T07:30:20.003' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserAudit] OFF
GO
INSERT [dbo].[Users] ([UserID], [EmailAddress], [Name], [PasswordHash], [Salt], [Password_Version], [Account_Disabled], [AccountID]) VALUES (1, N'akshayBhagwatsupplier@gmail.com', N'Bob Smith', 0xBA8532539830DD0B1447DCC0BCFCE77F99E57034FA1FCAB1D996D1BBB8AA218B10CAFF7235A0ED6F19112D7CE6CDFBA2450E1AB8F65B9E976AD0085826EB72C1, N'44f1c912-37b2-4cf2-85e8-c6fcc28339d8', NULL, 0, N'MX1000')
GO
/****** Object:  StoredProcedure [dbo].[Accounts_CUSTOM]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Accounts_CUSTOM]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20),
 @searchstring varchar(20)
)
AS

BEGIN

  SELECT m.* , 

  TotalRecord = COUNT(*) OVER()
  FROM [dbo].[Accounts] as m


WHERE
  ( @searchstring IS NULL OR @searchstring = '' OR [AccountID] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [Representative] LIKE @searchstring +'%')

ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'Representative' and @orderBy = 'ASC' then [Representative] end ASC,
	case when @sortBy = 'Representative' and @orderBy = 'DESC' then [Representative] end DESC,
	case when @sortBy = 'Include_Transportation' and @orderBy = 'ASC' then [Include_Transportation] end ASC,
	case when @sortBy = 'Include_Transportation' and @orderBy = 'DESC' then [Include_Transportation] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[Accounts_DELETE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Accounts_DELETE]
(
@id bigint
)
AS

DELETE
  [dbo].[Accounts]
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[Accounts_INSERT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Accounts_INSERT]
(
@accountID AS nchar(6) = null,
@representative AS varchar(100) = null,
@includeTransportation AS bit = null
)
AS

INSERT INTO
  [dbo].[Accounts]
(
  [AccountID],
  [Representative],
  [Include_Transportation]
)
VALUES
(
  @accountID,
  @representative,
  @includeTransportation
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[Accounts_PAGING]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Accounts_PAGING]
(
 @PageIndex int,
 @PageSize int
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Accounts] data 


ORDER BY [Id] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[Accounts_SEARCH]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Accounts_SEARCH]
(
@id bigint = null,
@accountID nchar(6) = null,
@representative varchar(100) = null,
@includeTransportation bit = null
)
AS

SELECT
  *
FROM
  [dbo].[Accounts]
WHERE
  (@id IS NULL OR [Id] = @id)
AND
  (@accountID IS NULL OR @accountID = '' OR [AccountID] LIKE @accountID + '%')
AND
  (@representative IS NULL OR @representative = '' OR [Representative] LIKE @representative + '%')
AND
  (@includeTransportation IS NULL OR [Include_Transportation] = @includeTransportation)


GO
/****** Object:  StoredProcedure [dbo].[Accounts_SELECT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Accounts_SELECT]
(
@id AS bigint
)
AS

SELECT
  *
FROM
  [dbo].[Accounts]
WHERE
  Id = @id


GO
/****** Object:  StoredProcedure [dbo].[Accounts_SORT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Accounts_SORT]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Accounts] data 


ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'Representative' and @orderBy = 'ASC' then [Representative] end ASC,
	case when @sortBy = 'Representative' and @orderBy = 'DESC' then [Representative] end DESC,
	case when @sortBy = 'Include_Transportation' and @orderBy = 'ASC' then [Include_Transportation] end ASC,
	case when @sortBy = 'Include_Transportation' and @orderBy = 'DESC' then [Include_Transportation] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[Accounts_UPDATE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Accounts_UPDATE]
(
@id bigint = null,
@accountID nchar(6) = null,
@representative varchar(100) = null,
@includeTransportation bit = null
)
AS

UPDATE
  [dbo].[Accounts]
SET
  [AccountID] = @accountID,
  [Representative] = @representative,
  [Include_Transportation] = @includeTransportation
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[Cust_Accounts]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cust_Accounts]
(
 @AccountId varchar(50)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Accounts] data 
WHERE
  data.AccountID = @AccountId

ORDER BY [AccountID] DESC  

END


GO
/****** Object:  StoredProcedure [dbo].[Cust_Representative_SELECT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cust_Representative_SELECT]
(
@AccountId AS varchar(50)
)
AS

SELECT
  *
FROM
  [dbo].[Representative]
WHERE
  AccountId = @AccountId


GO
/****** Object:  StoredProcedure [dbo].[Cust_TransactionDetail]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cust_TransactionDetail]
(
 @ticketNo varchar(15)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_Detail] data 
WHERE data.TicketNumber =  @ticketNo

ORDER BY [AccountID] DESC  

END


GO
/****** Object:  StoredProcedure [dbo].[Cust_TransactionHeader]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cust_TransactionHeader]
(
 @ticketNo varchar(15)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_Header] data 
WHERE data.TicketNumber =  @ticketNo

ORDER BY [AccountID] DESC  

END


GO
/****** Object:  StoredProcedure [dbo].[Cust_TransactionHeader_CUSTOM]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cust_TransactionHeader_CUSTOM]
(
 @accountId varchar(50),
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20),
 @searchstring varchar(20)
)
AS

BEGIN

  SELECT m.* , 
  Weight = (select SUM(Net) from [MMS_Web].[dbo].[Transaction_Detail] where TicketNumber = m.TicketNumber),
  TotalRecord = COUNT(*) OVER()
  FROM [dbo].[Transaction_Header] as m

WHERE
m.AccountID = @accountId
AND  (( @searchstring IS NULL OR @searchstring = '' OR [AccountID] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [TicketNumber] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [OrderNumber] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [PaymentTerms] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [SupplierTicket] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [CarrierTicket] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [TruckDescription] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [Status] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [PaymentReceiptURL] LIKE @searchstring +'%'))

ORDER BY 

	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'ASC' then [TicketNumber] end ASC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'DESC' then [TicketNumber] end DESC,
	case when @sortBy = 'OrderNumber' and @orderBy = 'ASC' then [OrderNumber] end ASC,
	case when @sortBy = 'OrderNumber' and @orderBy = 'DESC' then [OrderNumber] end DESC,
	case when @sortBy = 'TicketDate' and @orderBy = 'ASC' then [TicketDate] end ASC,
	case when @sortBy = 'TicketDate' and @orderBy = 'DESC' then [TicketDate] end DESC,
	case when @sortBy = 'PaymentTerms' and @orderBy = 'ASC' then [PaymentTerms] end ASC,
	case when @sortBy = 'PaymentTerms' and @orderBy = 'DESC' then [PaymentTerms] end DESC,
	case when @sortBy = 'SupplierTicket' and @orderBy = 'ASC' then [SupplierTicket] end ASC,
	case when @sortBy = 'SupplierTicket' and @orderBy = 'DESC' then [SupplierTicket] end DESC,
	case when @sortBy = 'CarrierTicket' and @orderBy = 'ASC' then [CarrierTicket] end ASC,
	case when @sortBy = 'CarrierTicket' and @orderBy = 'DESC' then [CarrierTicket] end DESC,
	case when @sortBy = 'TruckDescription' and @orderBy = 'ASC' then [TruckDescription] end ASC,
	case when @sortBy = 'TruckDescription' and @orderBy = 'DESC' then [TruckDescription] end DESC,
	case when @sortBy = 'Status' and @orderBy = 'ASC' then [Status] end ASC,
	case when @sortBy = 'Status' and @orderBy = 'DESC' then [Status] end DESC,
	case when @sortBy = 'PaymentReceiptURL' and @orderBy = 'ASC' then [PaymentReceiptURL] end ASC,
	case when @sortBy = 'PaymentReceiptURL' and @orderBy = 'DESC' then [PaymentReceiptURL] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[Cust_TransactionOtherPictures]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cust_TransactionOtherPictures]
(
 @ticketNo varchar(15)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_OtherPictures] data 
WHERE data.TicketNumber =  @ticketNo

ORDER BY [AccountID] DESC  

END


GO
/****** Object:  StoredProcedure [dbo].[Cust_TransactionReceivedPaperword]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cust_TransactionReceivedPaperword]
(
 @ticketNo varchar(15)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_ReceivedPaperword] data 
WHERE data.TicketNumber =  @ticketNo

ORDER BY [AccountID] DESC  

END


GO
/****** Object:  StoredProcedure [dbo].[Cust_TransactionScalePictures]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cust_TransactionScalePictures]
(
 @ticketNo varchar(15)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_ScalePictures] data 
WHERE data.TicketNumber =  @ticketNo

ORDER BY [AccountID] DESC  

END


GO
/****** Object:  StoredProcedure [dbo].[Cust_Users_SELECT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cust_Users_SELECT]
(
@email AS varchar(100)
)
AS

SELECT
  *
FROM
  [dbo].[Users]
WHERE
  EmailAddress = @email


GO
/****** Object:  StoredProcedure [dbo].[Representative_CUSTOM]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Representative_CUSTOM]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20),
 @searchstring varchar(20)
)
AS

BEGIN

  SELECT m.* , 

  TotalRecord = COUNT(*) OVER()
  FROM [dbo].[Representative] as m


WHERE
  ( @searchstring IS NULL OR @searchstring = '' OR [AccountId] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [Name] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [Email] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [OfficePhone] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [CellPhone] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [Image_URL] LIKE @searchstring +'%')

ORDER BY 

	case when @sortBy = 'ID' and @orderBy = 'ASC' then [ID] end ASC,
	case when @sortBy = 'ID' and @orderBy = 'DESC' then [ID] end DESC,
	case when @sortBy = 'AccountId' and @orderBy = 'ASC' then [AccountId] end ASC,
	case when @sortBy = 'AccountId' and @orderBy = 'DESC' then [AccountId] end DESC,
	case when @sortBy = 'Name' and @orderBy = 'ASC' then [Name] end ASC,
	case when @sortBy = 'Name' and @orderBy = 'DESC' then [Name] end DESC,
	case when @sortBy = 'Email' and @orderBy = 'ASC' then [Email] end ASC,
	case when @sortBy = 'Email' and @orderBy = 'DESC' then [Email] end DESC,
	case when @sortBy = 'OfficePhone' and @orderBy = 'ASC' then [OfficePhone] end ASC,
	case when @sortBy = 'OfficePhone' and @orderBy = 'DESC' then [OfficePhone] end DESC,
	case when @sortBy = 'CellPhone' and @orderBy = 'ASC' then [CellPhone] end ASC,
	case when @sortBy = 'CellPhone' and @orderBy = 'DESC' then [CellPhone] end DESC,
	case when @sortBy = 'Image_URL' and @orderBy = 'ASC' then [Image_URL] end ASC,
	case when @sortBy = 'Image_URL' and @orderBy = 'DESC' then [Image_URL] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[Representative_DELETE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Representative_DELETE]
(
@id int
)
AS

DELETE
  [dbo].[Representative]
WHERE
  [ID] = @id


GO
/****** Object:  StoredProcedure [dbo].[Representative_INSERT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Representative_INSERT]
(
@accountId AS varchar(15) = null,
@name AS varchar(100) = null,
@email AS varchar(320) = null,
@officePhone AS varchar(32) = null,
@cellPhone AS varchar(32) = null,
@imageURL AS varchar(150) = null,
@notes AS text = null
)
AS

INSERT INTO
  [dbo].[Representative]
(
  [AccountId],
  [Name],
  [Email],
  [OfficePhone],
  [CellPhone],
  [Image_URL],
  [Notes]
)
VALUES
(
  @accountId,
  @name,
  @email,
  @officePhone,
  @cellPhone,
  @imageURL,
  @notes
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[Representative_PAGING]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Representative_PAGING]
(
 @PageIndex int,
 @PageSize int
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Representative] data 


ORDER BY [ID] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[Representative_SEARCH]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Representative_SEARCH]
(
@id int = null,
@accountId varchar(15) = null,
@name varchar(100) = null,
@email varchar(320) = null,
@officePhone varchar(32) = null,
@cellPhone varchar(32) = null,
@imageURL varchar(150) = null,
@notes text = null
)
AS

SELECT
  *
FROM
  [dbo].[Representative]
WHERE
  (@id IS NULL OR [ID] = @id)
AND
  (@accountId IS NULL OR @accountId = '' OR [AccountId] LIKE @accountId + '%')
AND
  (@name IS NULL OR @name = '' OR [Name] LIKE @name + '%')
AND
  (@email IS NULL OR @email = '' OR [Email] LIKE @email + '%')
AND
  (@officePhone IS NULL OR @officePhone = '' OR [OfficePhone] LIKE @officePhone + '%')
AND
  (@cellPhone IS NULL OR @cellPhone = '' OR [CellPhone] LIKE @cellPhone + '%')
AND
  (@imageURL IS NULL OR @imageURL = '' OR [Image_URL] LIKE @imageURL + '%')


GO
/****** Object:  StoredProcedure [dbo].[Representative_SELECT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Representative_SELECT]
(
@id AS int
)
AS

SELECT
  *
FROM
  [dbo].[Representative]
WHERE
  ID = @id


GO
/****** Object:  StoredProcedure [dbo].[Representative_SORT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Representative_SORT]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Representative] data 


ORDER BY 

	case when @sortBy = 'ID' and @orderBy = 'ASC' then [ID] end ASC,
	case when @sortBy = 'ID' and @orderBy = 'DESC' then [ID] end DESC,
	case when @sortBy = 'AccountId' and @orderBy = 'ASC' then [AccountId] end ASC,
	case when @sortBy = 'AccountId' and @orderBy = 'DESC' then [AccountId] end DESC,
	case when @sortBy = 'Name' and @orderBy = 'ASC' then [Name] end ASC,
	case when @sortBy = 'Name' and @orderBy = 'DESC' then [Name] end DESC,
	case when @sortBy = 'Email' and @orderBy = 'ASC' then [Email] end ASC,
	case when @sortBy = 'Email' and @orderBy = 'DESC' then [Email] end DESC,
	case when @sortBy = 'OfficePhone' and @orderBy = 'ASC' then [OfficePhone] end ASC,
	case when @sortBy = 'OfficePhone' and @orderBy = 'DESC' then [OfficePhone] end DESC,
	case when @sortBy = 'CellPhone' and @orderBy = 'ASC' then [CellPhone] end ASC,
	case when @sortBy = 'CellPhone' and @orderBy = 'DESC' then [CellPhone] end DESC,
	case when @sortBy = 'Image_URL' and @orderBy = 'ASC' then [Image_URL] end ASC,
	case when @sortBy = 'Image_URL' and @orderBy = 'DESC' then [Image_URL] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[Representative_UPDATE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Representative_UPDATE]
(
@id int = null,
@accountId varchar(15) = null,
@name varchar(100) = null,
@email varchar(320) = null,
@officePhone varchar(32) = null,
@cellPhone varchar(32) = null,
@imageURL varchar(150) = null,
@notes text = null
)
AS

UPDATE
  [dbo].[Representative]
SET
  [AccountId] = @accountId,
  [Name] = @name,
  [Email] = @email,
  [OfficePhone] = @officePhone,
  [CellPhone] = @cellPhone,
  [Image_URL] = @imageURL,
  [Notes] = @notes
WHERE
  [ID] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionDetail_CUSTOM]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionDetail_CUSTOM]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20),
 @searchstring varchar(20)
)
AS

BEGIN

  SELECT m.* , 

  TotalRecord = COUNT(*) OVER()
  FROM [dbo].[Transaction_Detail] as m


WHERE
  ( @searchstring IS NULL OR @searchstring = '' OR [AccountID] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [TicketNumber] LIKE @searchstring +'%')

ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'ASC' then [TicketNumber] end ASC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'DESC' then [TicketNumber] end DESC,
	case when @sortBy = 'DetailID' and @orderBy = 'ASC' then [DetailID] end ASC,
	case when @sortBy = 'DetailID' and @orderBy = 'DESC' then [DetailID] end DESC,
	case when @sortBy = 'Gross' and @orderBy = 'ASC' then [Gross] end ASC,
	case when @sortBy = 'Gross' and @orderBy = 'DESC' then [Gross] end DESC,
	case when @sortBy = 'Tare' and @orderBy = 'ASC' then [Tare] end ASC,
	case when @sortBy = 'Tare' and @orderBy = 'DESC' then [Tare] end DESC,
	case when @sortBy = 'Net' and @orderBy = 'ASC' then [Net] end ASC,
	case when @sortBy = 'Net' and @orderBy = 'DESC' then [Net] end DESC,
	case when @sortBy = 'UnitCost' and @orderBy = 'ASC' then [UnitCost] end ASC,
	case when @sortBy = 'UnitCost' and @orderBy = 'DESC' then [UnitCost] end DESC,
	case when @sortBy = 'TotalCost' and @orderBy = 'ASC' then [TotalCost] end ASC,
	case when @sortBy = 'TotalCost' and @orderBy = 'DESC' then [TotalCost] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionDetail_DELETE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionDetail_DELETE]
(
@id bigint
)
AS

DELETE
  [dbo].[Transaction_Detail]
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionDetail_INSERT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionDetail_INSERT]
(
@accountID AS nchar(6) = null,
@ticketNumber AS nchar(8) = null,
@detailID AS int = null,
@gross AS int = null,
@tare AS int = null,
@net AS int = null,
@unitCost AS money = null,
@totalCost AS money = null
)
AS

INSERT INTO
  [dbo].[Transaction_Detail]
(
  [AccountID],
  [TicketNumber],
  [DetailID],
  [Gross],
  [Tare],
  [Net],
  [UnitCost],
  [TotalCost]
)
VALUES
(
  @accountID,
  @ticketNumber,
  @detailID,
  @gross,
  @tare,
  @net,
  @unitCost,
  @totalCost
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[TransactionDetail_PAGING]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionDetail_PAGING]
(
 @PageIndex int,
 @PageSize int
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_Detail] data 


ORDER BY [Id] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionDetail_SEARCH]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionDetail_SEARCH]
(
@id bigint = null,
@accountID nchar(6) = null,
@ticketNumber nchar(8) = null,
@detailID int = null,
@gross int = null,
@tare int = null,
@net int = null,
@unitCost money = null,
@totalCost money = null
)
AS

SELECT
  *
FROM
  [dbo].[Transaction_Detail]
WHERE
  (@id IS NULL OR [Id] = @id)
AND
  (@accountID IS NULL OR @accountID = '' OR [AccountID] LIKE @accountID + '%')
AND
  (@ticketNumber IS NULL OR @ticketNumber = '' OR [TicketNumber] LIKE @ticketNumber + '%')
AND
  (@detailID IS NULL OR [DetailID] = @detailID)
AND
  (@gross IS NULL OR [Gross] = @gross)
AND
  (@tare IS NULL OR [Tare] = @tare)
AND
  (@net IS NULL OR [Net] = @net)
AND
  (@unitCost IS NULL OR [UnitCost] = @unitCost)
AND
  (@totalCost IS NULL OR [TotalCost] = @totalCost)


GO
/****** Object:  StoredProcedure [dbo].[TransactionDetail_SELECT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionDetail_SELECT]
(
@id AS bigint
)
AS

SELECT
  *
FROM
  [dbo].[Transaction_Detail]
WHERE
  Id = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionDetail_SORT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionDetail_SORT]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_Detail] data 


ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'ASC' then [TicketNumber] end ASC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'DESC' then [TicketNumber] end DESC,
	case when @sortBy = 'DetailID' and @orderBy = 'ASC' then [DetailID] end ASC,
	case when @sortBy = 'DetailID' and @orderBy = 'DESC' then [DetailID] end DESC,
	case when @sortBy = 'Gross' and @orderBy = 'ASC' then [Gross] end ASC,
	case when @sortBy = 'Gross' and @orderBy = 'DESC' then [Gross] end DESC,
	case when @sortBy = 'Tare' and @orderBy = 'ASC' then [Tare] end ASC,
	case when @sortBy = 'Tare' and @orderBy = 'DESC' then [Tare] end DESC,
	case when @sortBy = 'Net' and @orderBy = 'ASC' then [Net] end ASC,
	case when @sortBy = 'Net' and @orderBy = 'DESC' then [Net] end DESC,
	case when @sortBy = 'UnitCost' and @orderBy = 'ASC' then [UnitCost] end ASC,
	case when @sortBy = 'UnitCost' and @orderBy = 'DESC' then [UnitCost] end DESC,
	case when @sortBy = 'TotalCost' and @orderBy = 'ASC' then [TotalCost] end ASC,
	case when @sortBy = 'TotalCost' and @orderBy = 'DESC' then [TotalCost] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionDetail_UPDATE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionDetail_UPDATE]
(
@id bigint = null,
@accountID nchar(6) = null,
@ticketNumber nchar(8) = null,
@detailID int = null,
@gross int = null,
@tare int = null,
@net int = null,
@unitCost money = null,
@totalCost money = null
)
AS

UPDATE
  [dbo].[Transaction_Detail]
SET
  [AccountID] = @accountID,
  [TicketNumber] = @ticketNumber,
  [DetailID] = @detailID,
  [Gross] = @gross,
  [Tare] = @tare,
  [Net] = @net,
  [UnitCost] = @unitCost,
  [TotalCost] = @totalCost
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionHeader_CUSTOM]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionHeader_CUSTOM]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20),
 @searchstring varchar(20)
)
AS

BEGIN

  SELECT m.* , 

  TotalRecord = COUNT(*) OVER()
  FROM [dbo].[Transaction_Header] as m


WHERE
  ( @searchstring IS NULL OR @searchstring = '' OR [AccountID] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [TicketNumber] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [OrderNumber] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [PaymentTerms] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [SupplierTicket] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [CarrierTicket] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [TruckDescription] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [Status] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [PaymentReceiptURL] LIKE @searchstring +'%')

ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'ASC' then [TicketNumber] end ASC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'DESC' then [TicketNumber] end DESC,
	case when @sortBy = 'OrderNumber' and @orderBy = 'ASC' then [OrderNumber] end ASC,
	case when @sortBy = 'OrderNumber' and @orderBy = 'DESC' then [OrderNumber] end DESC,
	case when @sortBy = 'TicketDate' and @orderBy = 'ASC' then [TicketDate] end ASC,
	case when @sortBy = 'TicketDate' and @orderBy = 'DESC' then [TicketDate] end DESC,
	case when @sortBy = 'PaymentTerms' and @orderBy = 'ASC' then [PaymentTerms] end ASC,
	case when @sortBy = 'PaymentTerms' and @orderBy = 'DESC' then [PaymentTerms] end DESC,
	case when @sortBy = 'SupplierTicket' and @orderBy = 'ASC' then [SupplierTicket] end ASC,
	case when @sortBy = 'SupplierTicket' and @orderBy = 'DESC' then [SupplierTicket] end DESC,
	case when @sortBy = 'CarrierTicket' and @orderBy = 'ASC' then [CarrierTicket] end ASC,
	case when @sortBy = 'CarrierTicket' and @orderBy = 'DESC' then [CarrierTicket] end DESC,
	case when @sortBy = 'TruckDescription' and @orderBy = 'ASC' then [TruckDescription] end ASC,
	case when @sortBy = 'TruckDescription' and @orderBy = 'DESC' then [TruckDescription] end DESC,
	case when @sortBy = 'Status' and @orderBy = 'ASC' then [Status] end ASC,
	case when @sortBy = 'Status' and @orderBy = 'DESC' then [Status] end DESC,
	case when @sortBy = 'PaymentReceiptURL' and @orderBy = 'ASC' then [PaymentReceiptURL] end ASC,
	case when @sortBy = 'PaymentReceiptURL' and @orderBy = 'DESC' then [PaymentReceiptURL] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionHeader_DELETE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionHeader_DELETE]
(
@id bigint
)
AS

DELETE
  [dbo].[Transaction_Header]
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionHeader_INSERT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionHeader_INSERT]
(
@accountID AS nchar(6) = null,
@ticketNumber AS nchar(8) = null,
@orderNumber AS nchar(11) = null,
@ticketDate AS date = null,
@paymentTerms AS varchar(50) = null,
@supplierTicket AS varchar(100) = null,
@carrierTicket AS varchar(100) = null,
@truckDescription AS varchar(100) = null,
@status AS varchar(50) = null,
@paymentReceiptURL AS varchar(150) = null
)
AS

INSERT INTO
  [dbo].[Transaction_Header]
(
  [AccountID],
  [TicketNumber],
  [OrderNumber],
  [TicketDate],
  [PaymentTerms],
  [SupplierTicket],
  [CarrierTicket],
  [TruckDescription],
  [Status],
  [PaymentReceiptURL]
)
VALUES
(
  @accountID,
  @ticketNumber,
  @orderNumber,
  @ticketDate,
  @paymentTerms,
  @supplierTicket,
  @carrierTicket,
  @truckDescription,
  @status,
  @paymentReceiptURL
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[TransactionHeader_PAGING]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionHeader_PAGING]
(
 @PageIndex int,
 @PageSize int
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_Header] data 


ORDER BY [Id] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionHeader_SEARCH]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionHeader_SEARCH]
(
@id bigint = null,
@accountID nchar(6) = null,
@ticketNumber nchar(8) = null,
@orderNumber nchar(11) = null,
@ticketDate date = null,
@paymentTerms varchar(50) = null,
@supplierTicket varchar(100) = null,
@carrierTicket varchar(100) = null,
@truckDescription varchar(100) = null,
@status varchar(50) = null,
@paymentReceiptURL varchar(150) = null
)
AS

SELECT
  *
FROM
  [dbo].[Transaction_Header]
WHERE
  (@id IS NULL OR [Id] = @id)
AND
  (@accountID IS NULL OR @accountID = '' OR [AccountID] LIKE @accountID + '%')
AND
  (@ticketNumber IS NULL OR @ticketNumber = '' OR [TicketNumber] LIKE @ticketNumber + '%')
AND
  (@orderNumber IS NULL OR @orderNumber = '' OR [OrderNumber] LIKE @orderNumber + '%')
AND
  (@ticketDate IS NULL OR [TicketDate] = @ticketDate)
AND
  (@paymentTerms IS NULL OR @paymentTerms = '' OR [PaymentTerms] LIKE @paymentTerms + '%')
AND
  (@supplierTicket IS NULL OR @supplierTicket = '' OR [SupplierTicket] LIKE @supplierTicket + '%')
AND
  (@carrierTicket IS NULL OR @carrierTicket = '' OR [CarrierTicket] LIKE @carrierTicket + '%')
AND
  (@truckDescription IS NULL OR @truckDescription = '' OR [TruckDescription] LIKE @truckDescription + '%')
AND
  (@status IS NULL OR @status = '' OR [Status] LIKE @status + '%')
AND
  (@paymentReceiptURL IS NULL OR @paymentReceiptURL = '' OR [PaymentReceiptURL] LIKE @paymentReceiptURL + '%')


GO
/****** Object:  StoredProcedure [dbo].[TransactionHeader_SELECT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionHeader_SELECT]
(
@id AS bigint
)
AS

SELECT
  *
FROM
  [dbo].[Transaction_Header]
WHERE
  Id = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionHeader_SORT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionHeader_SORT]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_Header] data 


ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'ASC' then [TicketNumber] end ASC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'DESC' then [TicketNumber] end DESC,
	case when @sortBy = 'OrderNumber' and @orderBy = 'ASC' then [OrderNumber] end ASC,
	case when @sortBy = 'OrderNumber' and @orderBy = 'DESC' then [OrderNumber] end DESC,
	case when @sortBy = 'TicketDate' and @orderBy = 'ASC' then [TicketDate] end ASC,
	case when @sortBy = 'TicketDate' and @orderBy = 'DESC' then [TicketDate] end DESC,
	case when @sortBy = 'PaymentTerms' and @orderBy = 'ASC' then [PaymentTerms] end ASC,
	case when @sortBy = 'PaymentTerms' and @orderBy = 'DESC' then [PaymentTerms] end DESC,
	case when @sortBy = 'SupplierTicket' and @orderBy = 'ASC' then [SupplierTicket] end ASC,
	case when @sortBy = 'SupplierTicket' and @orderBy = 'DESC' then [SupplierTicket] end DESC,
	case when @sortBy = 'CarrierTicket' and @orderBy = 'ASC' then [CarrierTicket] end ASC,
	case when @sortBy = 'CarrierTicket' and @orderBy = 'DESC' then [CarrierTicket] end DESC,
	case when @sortBy = 'TruckDescription' and @orderBy = 'ASC' then [TruckDescription] end ASC,
	case when @sortBy = 'TruckDescription' and @orderBy = 'DESC' then [TruckDescription] end DESC,
	case when @sortBy = 'Status' and @orderBy = 'ASC' then [Status] end ASC,
	case when @sortBy = 'Status' and @orderBy = 'DESC' then [Status] end DESC,
	case when @sortBy = 'PaymentReceiptURL' and @orderBy = 'ASC' then [PaymentReceiptURL] end ASC,
	case when @sortBy = 'PaymentReceiptURL' and @orderBy = 'DESC' then [PaymentReceiptURL] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionHeader_UPDATE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionHeader_UPDATE]
(
@id bigint = null,
@accountID nchar(6) = null,
@ticketNumber nchar(8) = null,
@orderNumber nchar(11) = null,
@ticketDate date = null,
@paymentTerms varchar(50) = null,
@supplierTicket varchar(100) = null,
@carrierTicket varchar(100) = null,
@truckDescription varchar(100) = null,
@status varchar(50) = null,
@paymentReceiptURL varchar(150) = null
)
AS

UPDATE
  [dbo].[Transaction_Header]
SET
  [AccountID] = @accountID,
  [TicketNumber] = @ticketNumber,
  [OrderNumber] = @orderNumber,
  [TicketDate] = @ticketDate,
  [PaymentTerms] = @paymentTerms,
  [SupplierTicket] = @supplierTicket,
  [CarrierTicket] = @carrierTicket,
  [TruckDescription] = @truckDescription,
  [Status] = @status,
  [PaymentReceiptURL] = @paymentReceiptURL
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionOtherPictures_CUSTOM]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionOtherPictures_CUSTOM]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20),
 @searchstring varchar(20)
)
AS

BEGIN

  SELECT m.* , 

  TotalRecord = COUNT(*) OVER()
  FROM [dbo].[Transaction_OtherPictures] as m


WHERE
  ( @searchstring IS NULL OR @searchstring = '' OR [AccountID] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [TicketNumber] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [PictureID] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [Thumbnail_URL] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [FullRes_URL] LIKE @searchstring +'%')

ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'ASC' then [TicketNumber] end ASC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'DESC' then [TicketNumber] end DESC,
	case when @sortBy = 'PictureID' and @orderBy = 'ASC' then [PictureID] end ASC,
	case when @sortBy = 'PictureID' and @orderBy = 'DESC' then [PictureID] end DESC,
	case when @sortBy = 'Thumbnail_URL' and @orderBy = 'ASC' then [Thumbnail_URL] end ASC,
	case when @sortBy = 'Thumbnail_URL' and @orderBy = 'DESC' then [Thumbnail_URL] end DESC,
	case when @sortBy = 'FullRes_URL' and @orderBy = 'ASC' then [FullRes_URL] end ASC,
	case when @sortBy = 'FullRes_URL' and @orderBy = 'DESC' then [FullRes_URL] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionOtherPictures_DELETE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionOtherPictures_DELETE]
(
@id bigint
)
AS

DELETE
  [dbo].[Transaction_OtherPictures]
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionOtherPictures_INSERT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionOtherPictures_INSERT]
(
@accountID AS nchar(6) = null,
@ticketNumber AS nchar(8) = null,
@pictureID AS varchar(50) = null,
@thumbnailURL AS varchar(150) = null,
@fullResURL AS varchar(150) = null
)
AS

INSERT INTO
  [dbo].[Transaction_OtherPictures]
(
  [AccountID],
  [TicketNumber],
  [PictureID],
  [Thumbnail_URL],
  [FullRes_URL]
)
VALUES
(
  @accountID,
  @ticketNumber,
  @pictureID,
  @thumbnailURL,
  @fullResURL
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[TransactionOtherPictures_PAGING]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionOtherPictures_PAGING]
(
 @PageIndex int,
 @PageSize int
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_OtherPictures] data 


ORDER BY [Id] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionOtherPictures_SEARCH]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionOtherPictures_SEARCH]
(
@id bigint = null,
@accountID nchar(6) = null,
@ticketNumber nchar(8) = null,
@pictureID varchar(50) = null,
@thumbnailURL varchar(150) = null,
@fullResURL varchar(150) = null
)
AS

SELECT
  *
FROM
  [dbo].[Transaction_OtherPictures]
WHERE
  (@id IS NULL OR [Id] = @id)
AND
  (@accountID IS NULL OR @accountID = '' OR [AccountID] LIKE @accountID + '%')
AND
  (@ticketNumber IS NULL OR @ticketNumber = '' OR [TicketNumber] LIKE @ticketNumber + '%')
AND
  (@pictureID IS NULL OR @pictureID = '' OR [PictureID] LIKE @pictureID + '%')
AND
  (@thumbnailURL IS NULL OR @thumbnailURL = '' OR [Thumbnail_URL] LIKE @thumbnailURL + '%')
AND
  (@fullResURL IS NULL OR @fullResURL = '' OR [FullRes_URL] LIKE @fullResURL + '%')


GO
/****** Object:  StoredProcedure [dbo].[TransactionOtherPictures_SELECT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionOtherPictures_SELECT]
(
@id AS bigint
)
AS

SELECT
  *
FROM
  [dbo].[Transaction_OtherPictures]
WHERE
  Id = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionOtherPictures_SORT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionOtherPictures_SORT]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_OtherPictures] data 


ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'ASC' then [TicketNumber] end ASC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'DESC' then [TicketNumber] end DESC,
	case when @sortBy = 'PictureID' and @orderBy = 'ASC' then [PictureID] end ASC,
	case when @sortBy = 'PictureID' and @orderBy = 'DESC' then [PictureID] end DESC,
	case when @sortBy = 'Thumbnail_URL' and @orderBy = 'ASC' then [Thumbnail_URL] end ASC,
	case when @sortBy = 'Thumbnail_URL' and @orderBy = 'DESC' then [Thumbnail_URL] end DESC,
	case when @sortBy = 'FullRes_URL' and @orderBy = 'ASC' then [FullRes_URL] end ASC,
	case when @sortBy = 'FullRes_URL' and @orderBy = 'DESC' then [FullRes_URL] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionOtherPictures_UPDATE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionOtherPictures_UPDATE]
(
@id bigint = null,
@accountID nchar(6) = null,
@ticketNumber nchar(8) = null,
@pictureID varchar(50) = null,
@thumbnailURL varchar(150) = null,
@fullResURL varchar(150) = null
)
AS

UPDATE
  [dbo].[Transaction_OtherPictures]
SET
  [AccountID] = @accountID,
  [TicketNumber] = @ticketNumber,
  [PictureID] = @pictureID,
  [Thumbnail_URL] = @thumbnailURL,
  [FullRes_URL] = @fullResURL
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionReceivedPaperword_CUSTOM]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionReceivedPaperword_CUSTOM]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20),
 @searchstring varchar(20)
)
AS

BEGIN

  SELECT m.* , 

  TotalRecord = COUNT(*) OVER()
  FROM [dbo].[Transaction_ReceivedPaperword] as m


WHERE
  ( @searchstring IS NULL OR @searchstring = '' OR [AccountID] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [TicketNumber] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [PictureID] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [Thumbnail_URL] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [FullRes_URL] LIKE @searchstring +'%')

ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'ASC' then [TicketNumber] end ASC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'DESC' then [TicketNumber] end DESC,
	case when @sortBy = 'PictureID' and @orderBy = 'ASC' then [PictureID] end ASC,
	case when @sortBy = 'PictureID' and @orderBy = 'DESC' then [PictureID] end DESC,
	case when @sortBy = 'Thumbnail_URL' and @orderBy = 'ASC' then [Thumbnail_URL] end ASC,
	case when @sortBy = 'Thumbnail_URL' and @orderBy = 'DESC' then [Thumbnail_URL] end DESC,
	case when @sortBy = 'FullRes_URL' and @orderBy = 'ASC' then [FullRes_URL] end ASC,
	case when @sortBy = 'FullRes_URL' and @orderBy = 'DESC' then [FullRes_URL] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionReceivedPaperword_DELETE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionReceivedPaperword_DELETE]
(
@id bigint
)
AS

DELETE
  [dbo].[Transaction_ReceivedPaperword]
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionReceivedPaperword_INSERT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionReceivedPaperword_INSERT]
(
@accountID AS nchar(6) = null,
@ticketNumber AS nchar(8) = null,
@pictureID AS varchar(50) = null,
@thumbnailURL AS varchar(150) = null,
@fullResURL AS varchar(150) = null
)
AS

INSERT INTO
  [dbo].[Transaction_ReceivedPaperword]
(
  [AccountID],
  [TicketNumber],
  [PictureID],
  [Thumbnail_URL],
  [FullRes_URL]
)
VALUES
(
  @accountID,
  @ticketNumber,
  @pictureID,
  @thumbnailURL,
  @fullResURL
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[TransactionReceivedPaperword_PAGING]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionReceivedPaperword_PAGING]
(
 @PageIndex int,
 @PageSize int
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_ReceivedPaperword] data 


ORDER BY [Id] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionReceivedPaperword_SEARCH]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionReceivedPaperword_SEARCH]
(
@id bigint = null,
@accountID nchar(6) = null,
@ticketNumber nchar(8) = null,
@pictureID varchar(50) = null,
@thumbnailURL varchar(150) = null,
@fullResURL varchar(150) = null
)
AS

SELECT
  *
FROM
  [dbo].[Transaction_ReceivedPaperword]
WHERE
  (@id IS NULL OR [Id] = @id)
AND
  (@accountID IS NULL OR @accountID = '' OR [AccountID] LIKE @accountID + '%')
AND
  (@ticketNumber IS NULL OR @ticketNumber = '' OR [TicketNumber] LIKE @ticketNumber + '%')
AND
  (@pictureID IS NULL OR @pictureID = '' OR [PictureID] LIKE @pictureID + '%')
AND
  (@thumbnailURL IS NULL OR @thumbnailURL = '' OR [Thumbnail_URL] LIKE @thumbnailURL + '%')
AND
  (@fullResURL IS NULL OR @fullResURL = '' OR [FullRes_URL] LIKE @fullResURL + '%')


GO
/****** Object:  StoredProcedure [dbo].[TransactionReceivedPaperword_SELECT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionReceivedPaperword_SELECT]
(
@id AS bigint
)
AS

SELECT
  *
FROM
  [dbo].[Transaction_ReceivedPaperword]
WHERE
  Id = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionReceivedPaperword_SORT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionReceivedPaperword_SORT]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_ReceivedPaperword] data 


ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'ASC' then [TicketNumber] end ASC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'DESC' then [TicketNumber] end DESC,
	case when @sortBy = 'PictureID' and @orderBy = 'ASC' then [PictureID] end ASC,
	case when @sortBy = 'PictureID' and @orderBy = 'DESC' then [PictureID] end DESC,
	case when @sortBy = 'Thumbnail_URL' and @orderBy = 'ASC' then [Thumbnail_URL] end ASC,
	case when @sortBy = 'Thumbnail_URL' and @orderBy = 'DESC' then [Thumbnail_URL] end DESC,
	case when @sortBy = 'FullRes_URL' and @orderBy = 'ASC' then [FullRes_URL] end ASC,
	case when @sortBy = 'FullRes_URL' and @orderBy = 'DESC' then [FullRes_URL] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionReceivedPaperword_UPDATE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionReceivedPaperword_UPDATE]
(
@id bigint = null,
@accountID nchar(6) = null,
@ticketNumber nchar(8) = null,
@pictureID varchar(50) = null,
@thumbnailURL varchar(150) = null,
@fullResURL varchar(150) = null
)
AS

UPDATE
  [dbo].[Transaction_ReceivedPaperword]
SET
  [AccountID] = @accountID,
  [TicketNumber] = @ticketNumber,
  [PictureID] = @pictureID,
  [Thumbnail_URL] = @thumbnailURL,
  [FullRes_URL] = @fullResURL
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionScalePictures_CUSTOM]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionScalePictures_CUSTOM]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20),
 @searchstring varchar(20)
)
AS

BEGIN

  SELECT m.* , 

  TotalRecord = COUNT(*) OVER()
  FROM [dbo].[Transaction_ScalePictures] as m


WHERE
  ( @searchstring IS NULL OR @searchstring = '' OR [AccountID] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [TicketNumber] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [PictureID] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [Thumbnail_URL] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [FullRes_URL] LIKE @searchstring +'%')

ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'ASC' then [TicketNumber] end ASC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'DESC' then [TicketNumber] end DESC,
	case when @sortBy = 'PictureID' and @orderBy = 'ASC' then [PictureID] end ASC,
	case when @sortBy = 'PictureID' and @orderBy = 'DESC' then [PictureID] end DESC,
	case when @sortBy = 'Thumbnail_URL' and @orderBy = 'ASC' then [Thumbnail_URL] end ASC,
	case when @sortBy = 'Thumbnail_URL' and @orderBy = 'DESC' then [Thumbnail_URL] end DESC,
	case when @sortBy = 'FullRes_URL' and @orderBy = 'ASC' then [FullRes_URL] end ASC,
	case when @sortBy = 'FullRes_URL' and @orderBy = 'DESC' then [FullRes_URL] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionScalePictures_DELETE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionScalePictures_DELETE]
(
@id bigint
)
AS

DELETE
  [dbo].[Transaction_ScalePictures]
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionScalePictures_INSERT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionScalePictures_INSERT]
(
@accountID AS nchar(6) = null,
@ticketNumber AS nchar(8) = null,
@pictureID AS varchar(50) = null,
@thumbnailURL AS varchar(150) = null,
@fullResURL AS varchar(150) = null
)
AS

INSERT INTO
  [dbo].[Transaction_ScalePictures]
(
  [AccountID],
  [TicketNumber],
  [PictureID],
  [Thumbnail_URL],
  [FullRes_URL]
)
VALUES
(
  @accountID,
  @ticketNumber,
  @pictureID,
  @thumbnailURL,
  @fullResURL
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[TransactionScalePictures_PAGING]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionScalePictures_PAGING]
(
 @PageIndex int,
 @PageSize int
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_ScalePictures] data 


ORDER BY [Id] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionScalePictures_SEARCH]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionScalePictures_SEARCH]
(
@id bigint = null,
@accountID nchar(6) = null,
@ticketNumber nchar(8) = null,
@pictureID varchar(50) = null,
@thumbnailURL varchar(150) = null,
@fullResURL varchar(150) = null
)
AS

SELECT
  *
FROM
  [dbo].[Transaction_ScalePictures]
WHERE
  (@id IS NULL OR [Id] = @id)
AND
  (@accountID IS NULL OR @accountID = '' OR [AccountID] LIKE @accountID + '%')
AND
  (@ticketNumber IS NULL OR @ticketNumber = '' OR [TicketNumber] LIKE @ticketNumber + '%')
AND
  (@pictureID IS NULL OR @pictureID = '' OR [PictureID] LIKE @pictureID + '%')
AND
  (@thumbnailURL IS NULL OR @thumbnailURL = '' OR [Thumbnail_URL] LIKE @thumbnailURL + '%')
AND
  (@fullResURL IS NULL OR @fullResURL = '' OR [FullRes_URL] LIKE @fullResURL + '%')


GO
/****** Object:  StoredProcedure [dbo].[TransactionScalePictures_SELECT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionScalePictures_SELECT]
(
@id AS bigint
)
AS

SELECT
  *
FROM
  [dbo].[Transaction_ScalePictures]
WHERE
  Id = @id


GO
/****** Object:  StoredProcedure [dbo].[TransactionScalePictures_SORT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionScalePictures_SORT]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_ScalePictures] data 


ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'ASC' then [TicketNumber] end ASC,
	case when @sortBy = 'TicketNumber' and @orderBy = 'DESC' then [TicketNumber] end DESC,
	case when @sortBy = 'PictureID' and @orderBy = 'ASC' then [PictureID] end ASC,
	case when @sortBy = 'PictureID' and @orderBy = 'DESC' then [PictureID] end DESC,
	case when @sortBy = 'Thumbnail_URL' and @orderBy = 'ASC' then [Thumbnail_URL] end ASC,
	case when @sortBy = 'Thumbnail_URL' and @orderBy = 'DESC' then [Thumbnail_URL] end DESC,
	case when @sortBy = 'FullRes_URL' and @orderBy = 'ASC' then [FullRes_URL] end ASC,
	case when @sortBy = 'FullRes_URL' and @orderBy = 'DESC' then [FullRes_URL] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionScalePictures_UPDATE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionScalePictures_UPDATE]
(
@id bigint = null,
@accountID nchar(6) = null,
@ticketNumber nchar(8) = null,
@pictureID varchar(50) = null,
@thumbnailURL varchar(150) = null,
@fullResURL varchar(150) = null
)
AS

UPDATE
  [dbo].[Transaction_ScalePictures]
SET
  [AccountID] = @accountID,
  [TicketNumber] = @ticketNumber,
  [PictureID] = @pictureID,
  [Thumbnail_URL] = @thumbnailURL,
  [FullRes_URL] = @fullResURL
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransectionSetting_CUSTOM]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransectionSetting_CUSTOM]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20),
 @searchstring varchar(20)
)
AS

BEGIN

  SELECT m.* , 

  TotalRecord = COUNT(*) OVER()
  FROM [dbo].[TransectionSetting] as m


WHERE
  ( @searchstring IS NULL OR @searchstring = '' OR [Notes] LIKE @searchstring +'%')

ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'LocationID' and @orderBy = 'ASC' then [LocationID] end ASC,
	case when @sortBy = 'LocationID' and @orderBy = 'DESC' then [LocationID] end DESC,
	case when @sortBy = 'CommodityID' and @orderBy = 'ASC' then [CommodityID] end ASC,
	case when @sortBy = 'CommodityID' and @orderBy = 'DESC' then [CommodityID] end DESC,
	case when @sortBy = 'Notes' and @orderBy = 'ASC' then [Notes] end ASC,
	case when @sortBy = 'Notes' and @orderBy = 'DESC' then [Notes] end DESC,
	case when @sortBy = 'CreatedBy' and @orderBy = 'ASC' then [CreatedBy] end ASC,
	case when @sortBy = 'CreatedBy' and @orderBy = 'DESC' then [CreatedBy] end DESC,
	case when @sortBy = 'CreatedOn' and @orderBy = 'ASC' then [CreatedOn] end ASC,
	case when @sortBy = 'CreatedOn' and @orderBy = 'DESC' then [CreatedOn] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransectionSetting_DELETE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransectionSetting_DELETE]
(
@id int
)
AS

DELETE
  [dbo].[TransectionSetting]
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransectionSetting_INSERT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransectionSetting_INSERT]
(
@locationID AS int = null,
@commodityID AS int = null,
@notes AS nvarchar(1000) = null,
@createdBy AS uniqueidentifier = null,
@createdOn AS datetime = null
)
AS

INSERT INTO
  [dbo].[TransectionSetting]
(
  [LocationID],
  [CommodityID],
  [Notes],
  [CreatedBy],
  [CreatedOn]
)
VALUES
(
  @locationID,
  @commodityID,
  @notes,
  @createdBy,
  @createdOn
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[TransectionSetting_PAGING]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransectionSetting_PAGING]
(
 @PageIndex int,
 @PageSize int
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[TransectionSetting] data 


ORDER BY [Id] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransectionSetting_SEARCH]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransectionSetting_SEARCH]
(
@id int = null,
@locationID int = null,
@commodityID int = null,
@notes nvarchar(1000) = null,
@createdBy uniqueidentifier = null,
@createdOn datetime = null
)
AS

SELECT
  *
FROM
  [dbo].[TransectionSetting]
WHERE
  (@id IS NULL OR [Id] = @id)
AND
  (@locationID IS NULL OR [LocationID] = @locationID)
AND
  (@commodityID IS NULL OR [CommodityID] = @commodityID)
AND
  (@notes IS NULL OR @notes = '' OR [Notes] LIKE @notes + '%')
AND
  (@createdBy IS NULL OR [CreatedBy] = @createdBy)
AND
  (@createdOn IS NULL OR [CreatedOn] = @createdOn)


GO
/****** Object:  StoredProcedure [dbo].[TransectionSetting_SELECT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransectionSetting_SELECT]
(
@id AS int
)
AS

SELECT
  *
FROM
  [dbo].[TransectionSetting]
WHERE
  Id = @id


GO
/****** Object:  StoredProcedure [dbo].[TransectionSetting_SORT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransectionSetting_SORT]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[TransectionSetting] data 


ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'LocationID' and @orderBy = 'ASC' then [LocationID] end ASC,
	case when @sortBy = 'LocationID' and @orderBy = 'DESC' then [LocationID] end DESC,
	case when @sortBy = 'CommodityID' and @orderBy = 'ASC' then [CommodityID] end ASC,
	case when @sortBy = 'CommodityID' and @orderBy = 'DESC' then [CommodityID] end DESC,
	case when @sortBy = 'Notes' and @orderBy = 'ASC' then [Notes] end ASC,
	case when @sortBy = 'Notes' and @orderBy = 'DESC' then [Notes] end DESC,
	case when @sortBy = 'CreatedBy' and @orderBy = 'ASC' then [CreatedBy] end ASC,
	case when @sortBy = 'CreatedBy' and @orderBy = 'DESC' then [CreatedBy] end DESC,
	case when @sortBy = 'CreatedOn' and @orderBy = 'ASC' then [CreatedOn] end ASC,
	case when @sortBy = 'CreatedOn' and @orderBy = 'DESC' then [CreatedOn] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransectionSetting_UPDATE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransectionSetting_UPDATE]
(
@id int = null,
@locationID int = null,
@commodityID int = null,
@notes nvarchar(1000) = null,
@createdBy uniqueidentifier = null,
@createdOn datetime = null
)
AS

UPDATE
  [dbo].[TransectionSetting]
SET
  [LocationID] = @locationID,
  [CommodityID] = @commodityID,
  [Notes] = @notes,
  [CreatedBy] = @createdBy,
  [CreatedOn] = @createdOn
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransportationCommodities_CUSTOM]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationCommodities_CUSTOM]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20),
 @searchstring varchar(20)
)
AS

BEGIN

  SELECT m.* , 

  TotalRecord = COUNT(*) OVER()
  FROM [dbo].[Transportation_Commodities] as m


WHERE
  ( @searchstring IS NULL OR @searchstring = '' OR [AccountID] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [Commodity_Name] LIKE @searchstring +'%')

ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'LocationID' and @orderBy = 'ASC' then [LocationID] end ASC,
	case when @sortBy = 'LocationID' and @orderBy = 'DESC' then [LocationID] end DESC,
	case when @sortBy = 'CommodityID' and @orderBy = 'ASC' then [CommodityID] end ASC,
	case when @sortBy = 'CommodityID' and @orderBy = 'DESC' then [CommodityID] end DESC,
	case when @sortBy = 'Commodity_Name' and @orderBy = 'ASC' then [Commodity_Name] end ASC,
	case when @sortBy = 'Commodity_Name' and @orderBy = 'DESC' then [Commodity_Name] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransportationCommodities_DELETE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationCommodities_DELETE]
(
@id bigint
)
AS

DELETE
  [dbo].[Transportation_Commodities]
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransportationCommodities_INSERT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationCommodities_INSERT]
(
@accountID AS nchar(6) = null,
@locationID AS int = null,
@commodityID AS int = null,
@commodityName AS varchar(100) = null
)
AS

INSERT INTO
  [dbo].[Transportation_Commodities]
(
  [AccountID],
  [LocationID],
  [CommodityID],
  [Commodity_Name]
)
VALUES
(
  @accountID,
  @locationID,
  @commodityID,
  @commodityName
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[TransportationCommodities_PAGING]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationCommodities_PAGING]
(
 @PageIndex int,
 @PageSize int
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transportation_Commodities] data 


ORDER BY [Id] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransportationCommodities_SEARCH]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationCommodities_SEARCH]
(
@id bigint = null,
@accountID nchar(6) = null,
@locationID int = null,
@commodityID int = null,
@commodityName varchar(100) = null
)
AS

SELECT
  *
FROM
  [dbo].[Transportation_Commodities]
WHERE
  (@id IS NULL OR [Id] = @id)
AND
  (@accountID IS NULL OR @accountID = '' OR [AccountID] LIKE @accountID + '%')
AND
  (@locationID IS NULL OR [LocationID] = @locationID)
AND
  (@commodityID IS NULL OR [CommodityID] = @commodityID)
AND
  (@commodityName IS NULL OR @commodityName = '' OR [Commodity_Name] LIKE @commodityName + '%')


GO
/****** Object:  StoredProcedure [dbo].[TransportationCommodities_SELECT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationCommodities_SELECT]
(
@id AS bigint
)
AS

SELECT
  *
FROM
  [dbo].[Transportation_Commodities]
WHERE
  Id = @id


GO
/****** Object:  StoredProcedure [dbo].[TransportationCommodities_SORT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationCommodities_SORT]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transportation_Commodities] data 


ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'LocationID' and @orderBy = 'ASC' then [LocationID] end ASC,
	case when @sortBy = 'LocationID' and @orderBy = 'DESC' then [LocationID] end DESC,
	case when @sortBy = 'CommodityID' and @orderBy = 'ASC' then [CommodityID] end ASC,
	case when @sortBy = 'CommodityID' and @orderBy = 'DESC' then [CommodityID] end DESC,
	case when @sortBy = 'Commodity_Name' and @orderBy = 'ASC' then [Commodity_Name] end ASC,
	case when @sortBy = 'Commodity_Name' and @orderBy = 'DESC' then [Commodity_Name] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransportationCommodities_UPDATE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationCommodities_UPDATE]
(
@id bigint = null,
@accountID nchar(6) = null,
@locationID int = null,
@commodityID int = null,
@commodityName varchar(100) = null
)
AS

UPDATE
  [dbo].[Transportation_Commodities]
SET
  [AccountID] = @accountID,
  [LocationID] = @locationID,
  [CommodityID] = @commodityID,
  [Commodity_Name] = @commodityName
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransportationLocations_CUSTOM]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationLocations_CUSTOM]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20),
 @searchstring varchar(20)
)
AS

BEGIN

  SELECT m.* , 

  TotalRecord = COUNT(*) OVER()
  FROM [dbo].[Transportation_Locations] as m


WHERE
  ( @searchstring IS NULL OR @searchstring = '' OR [AccountID] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [LocationName] LIKE @searchstring +'%')

ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'LocationID' and @orderBy = 'ASC' then [LocationID] end ASC,
	case when @sortBy = 'LocationID' and @orderBy = 'DESC' then [LocationID] end DESC,
	case when @sortBy = 'LocationName' and @orderBy = 'ASC' then [LocationName] end ASC,
	case when @sortBy = 'LocationName' and @orderBy = 'DESC' then [LocationName] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransportationLocations_DELETE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationLocations_DELETE]
(
@id bigint
)
AS

DELETE
  [dbo].[Transportation_Locations]
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[TransportationLocations_INSERT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationLocations_INSERT]
(
@accountID AS nchar(6) = null,
@locationID AS int = null,
@locationName AS varchar(100) = null
)
AS

INSERT INTO
  [dbo].[Transportation_Locations]
(
  [AccountID],
  [LocationID],
  [LocationName]
)
VALUES
(
  @accountID,
  @locationID,
  @locationName
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[TransportationLocations_PAGING]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationLocations_PAGING]
(
 @PageIndex int,
 @PageSize int
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transportation_Locations] data 


ORDER BY [Id] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransportationLocations_SEARCH]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationLocations_SEARCH]
(
@id bigint = null,
@accountID nchar(6) = null,
@locationID int = null,
@locationName varchar(100) = null
)
AS

SELECT
  *
FROM
  [dbo].[Transportation_Locations]
WHERE
  (@id IS NULL OR [Id] = @id)
AND
  (@accountID IS NULL OR @accountID = '' OR [AccountID] LIKE @accountID + '%')
AND
  (@locationID IS NULL OR [LocationID] = @locationID)
AND
  (@locationName IS NULL OR @locationName = '' OR [LocationName] LIKE @locationName + '%')


GO
/****** Object:  StoredProcedure [dbo].[TransportationLocations_SELECT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationLocations_SELECT]
(
@id AS bigint
)
AS

SELECT
  *
FROM
  [dbo].[Transportation_Locations]
WHERE
  Id = @id


GO
/****** Object:  StoredProcedure [dbo].[TransportationLocations_SORT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationLocations_SORT]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transportation_Locations] data 


ORDER BY 

	case when @sortBy = 'Id' and @orderBy = 'ASC' then [Id] end ASC,
	case when @sortBy = 'Id' and @orderBy = 'DESC' then [Id] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'LocationID' and @orderBy = 'ASC' then [LocationID] end ASC,
	case when @sortBy = 'LocationID' and @orderBy = 'DESC' then [LocationID] end DESC,
	case when @sortBy = 'LocationName' and @orderBy = 'ASC' then [LocationName] end ASC,
	case when @sortBy = 'LocationName' and @orderBy = 'DESC' then [LocationName] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransportationLocations_UPDATE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationLocations_UPDATE]
(
@id bigint = null,
@accountID nchar(6) = null,
@locationID int = null,
@locationName varchar(100) = null
)
AS

UPDATE
  [dbo].[Transportation_Locations]
SET
  [AccountID] = @accountID,
  [LocationID] = @locationID,
  [LocationName] = @locationName
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[UserAudit_CUSTOM]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserAudit_CUSTOM]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20),
 @searchstring varchar(20)
)
AS

BEGIN

  SELECT m.* , 

  TotalRecord = COUNT(*) OVER()
  FROM [dbo].[UserAudit] as m


WHERE
  ( @searchstring IS NULL OR @searchstring = '' OR [SessionId] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [IpAddress] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [PageAccessed] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [LoggedInAt] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [LoggedOutAt] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [LoginStatus] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [ControllerName] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [ActionName] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [UrlReferrer] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [Area] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [LangId] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [IsFirstLogin] LIKE @searchstring +'%')

ORDER BY 

	case when @sortBy = 'AuditId' and @orderBy = 'ASC' then [AuditId] end ASC,
	case when @sortBy = 'AuditId' and @orderBy = 'DESC' then [AuditId] end DESC,
	case when @sortBy = 'UserId' and @orderBy = 'ASC' then [UserId] end ASC,
	case when @sortBy = 'UserId' and @orderBy = 'DESC' then [UserId] end DESC,
	case when @sortBy = 'SessionId' and @orderBy = 'ASC' then [SessionId] end ASC,
	case when @sortBy = 'SessionId' and @orderBy = 'DESC' then [SessionId] end DESC,
	case when @sortBy = 'IpAddress' and @orderBy = 'ASC' then [IpAddress] end ASC,
	case when @sortBy = 'IpAddress' and @orderBy = 'DESC' then [IpAddress] end DESC,
	case when @sortBy = 'PageAccessed' and @orderBy = 'ASC' then [PageAccessed] end ASC,
	case when @sortBy = 'PageAccessed' and @orderBy = 'DESC' then [PageAccessed] end DESC,
	case when @sortBy = 'LoggedInAt' and @orderBy = 'ASC' then [LoggedInAt] end ASC,
	case when @sortBy = 'LoggedInAt' and @orderBy = 'DESC' then [LoggedInAt] end DESC,
	case when @sortBy = 'LoggedOutAt' and @orderBy = 'ASC' then [LoggedOutAt] end ASC,
	case when @sortBy = 'LoggedOutAt' and @orderBy = 'DESC' then [LoggedOutAt] end DESC,
	case when @sortBy = 'LoginStatus' and @orderBy = 'ASC' then [LoginStatus] end ASC,
	case when @sortBy = 'LoginStatus' and @orderBy = 'DESC' then [LoginStatus] end DESC,
	case when @sortBy = 'ControllerName' and @orderBy = 'ASC' then [ControllerName] end ASC,
	case when @sortBy = 'ControllerName' and @orderBy = 'DESC' then [ControllerName] end DESC,
	case when @sortBy = 'ActionName' and @orderBy = 'ASC' then [ActionName] end ASC,
	case when @sortBy = 'ActionName' and @orderBy = 'DESC' then [ActionName] end DESC,
	case when @sortBy = 'UrlReferrer' and @orderBy = 'ASC' then [UrlReferrer] end ASC,
	case when @sortBy = 'UrlReferrer' and @orderBy = 'DESC' then [UrlReferrer] end DESC,
	case when @sortBy = 'Area' and @orderBy = 'ASC' then [Area] end ASC,
	case when @sortBy = 'Area' and @orderBy = 'DESC' then [Area] end DESC,
	case when @sortBy = 'RoleId' and @orderBy = 'ASC' then [RoleId] end ASC,
	case when @sortBy = 'RoleId' and @orderBy = 'DESC' then [RoleId] end DESC,
	case when @sortBy = 'LangId' and @orderBy = 'ASC' then [LangId] end ASC,
	case when @sortBy = 'LangId' and @orderBy = 'DESC' then [LangId] end DESC,
	case when @sortBy = 'IsFirstLogin' and @orderBy = 'ASC' then [IsFirstLogin] end ASC,
	case when @sortBy = 'IsFirstLogin' and @orderBy = 'DESC' then [IsFirstLogin] end DESC,
	case when @sortBy = 'CreatedOn' and @orderBy = 'ASC' then [CreatedOn] end ASC,
	case when @sortBy = 'CreatedOn' and @orderBy = 'DESC' then [CreatedOn] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[UserAudit_DELETE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserAudit_DELETE]
(
@auditId bigint
)
AS

DELETE
  [dbo].[UserAudit]
WHERE
  [AuditId] = @auditId


GO
/****** Object:  StoredProcedure [dbo].[UserAudit_INSERT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserAudit_INSERT]
(
@userId AS uniqueidentifier = null,
@sessionId AS varchar(50) = null,
@ipAddress AS varchar(50) = null,
@pageAccessed AS varchar(500) = null,
@loggedInAt AS varchar(50) = null,
@loggedOutAt AS varchar(50) = null,
@loginStatus AS varchar = null,
@controllerName AS varchar(50) = null,
@actionName AS varchar(50) = null,
@urlReferrer AS varchar(500) = null,
@area AS varchar(50) = null,
@roleId AS uniqueidentifier = null,
@langId AS varchar(2) = null,
@isFirstLogin AS varchar(2) = null,
@createdOn AS datetime = null
)
AS

INSERT INTO
  [dbo].[UserAudit]
(
  [UserId],
  [SessionId],
  [IpAddress],
  [PageAccessed],
  [LoggedInAt],
  [LoggedOutAt],
  [LoginStatus],
  [ControllerName],
  [ActionName],
  [UrlReferrer],
  [Area],
  [RoleId],
  [LangId],
  [IsFirstLogin],
  [CreatedOn]
)
VALUES
(
  @userId,
  @sessionId,
  @ipAddress,
  @pageAccessed,
  @loggedInAt,
  @loggedOutAt,
  @loginStatus,
  @controllerName,
  @actionName,
  @urlReferrer,
  @area,
  @roleId,
  @langId,
  @isFirstLogin,
  @createdOn
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[UserAudit_PAGING]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserAudit_PAGING]
(
 @PageIndex int,
 @PageSize int
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[UserAudit] data 


ORDER BY [AuditId] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[UserAudit_SEARCH]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserAudit_SEARCH]
(
@auditId bigint = null,
@userId uniqueidentifier = null,
@sessionId varchar(50) = null,
@ipAddress varchar(50) = null,
@pageAccessed varchar(500) = null,
@loggedInAt varchar(50) = null,
@loggedOutAt varchar(50) = null,
@loginStatus varchar = null,
@controllerName varchar(50) = null,
@actionName varchar(50) = null,
@urlReferrer varchar(500) = null,
@area varchar(50) = null,
@roleId uniqueidentifier = null,
@langId varchar(2) = null,
@isFirstLogin varchar(2) = null,
@createdOn datetime = null
)
AS

SELECT
  *
FROM
  [dbo].[UserAudit]
WHERE
  (@auditId IS NULL OR [AuditId] = @auditId)
AND
  (@userId IS NULL OR [UserId] = @userId)
AND
  (@sessionId IS NULL OR @sessionId = '' OR [SessionId] LIKE @sessionId + '%')
AND
  (@ipAddress IS NULL OR @ipAddress = '' OR [IpAddress] LIKE @ipAddress + '%')
AND
  (@pageAccessed IS NULL OR @pageAccessed = '' OR [PageAccessed] LIKE @pageAccessed + '%')
AND
  (@loggedInAt IS NULL OR @loggedInAt = '' OR [LoggedInAt] LIKE @loggedInAt + '%')
AND
  (@loggedOutAt IS NULL OR @loggedOutAt = '' OR [LoggedOutAt] LIKE @loggedOutAt + '%')
AND
  (@loginStatus IS NULL OR @loginStatus = '' OR [LoginStatus] LIKE @loginStatus + '%')
AND
  (@controllerName IS NULL OR @controllerName = '' OR [ControllerName] LIKE @controllerName + '%')
AND
  (@actionName IS NULL OR @actionName = '' OR [ActionName] LIKE @actionName + '%')
AND
  (@urlReferrer IS NULL OR @urlReferrer = '' OR [UrlReferrer] LIKE @urlReferrer + '%')
AND
  (@area IS NULL OR @area = '' OR [Area] LIKE @area + '%')
AND
  (@roleId IS NULL OR [RoleId] = @roleId)
AND
  (@langId IS NULL OR @langId = '' OR [LangId] LIKE @langId + '%')
AND
  (@isFirstLogin IS NULL OR @isFirstLogin = '' OR [IsFirstLogin] LIKE @isFirstLogin + '%')
AND
  (@createdOn IS NULL OR [CreatedOn] = @createdOn)


GO
/****** Object:  StoredProcedure [dbo].[UserAudit_SELECT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserAudit_SELECT]
(
@auditId AS bigint
)
AS

SELECT
  *
FROM
  [dbo].[UserAudit]
WHERE
  AuditId = @auditId


GO
/****** Object:  StoredProcedure [dbo].[UserAudit_SORT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserAudit_SORT]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[UserAudit] data 


ORDER BY 

	case when @sortBy = 'AuditId' and @orderBy = 'ASC' then [AuditId] end ASC,
	case when @sortBy = 'AuditId' and @orderBy = 'DESC' then [AuditId] end DESC,
	case when @sortBy = 'UserId' and @orderBy = 'ASC' then [UserId] end ASC,
	case when @sortBy = 'UserId' and @orderBy = 'DESC' then [UserId] end DESC,
	case when @sortBy = 'SessionId' and @orderBy = 'ASC' then [SessionId] end ASC,
	case when @sortBy = 'SessionId' and @orderBy = 'DESC' then [SessionId] end DESC,
	case when @sortBy = 'IpAddress' and @orderBy = 'ASC' then [IpAddress] end ASC,
	case when @sortBy = 'IpAddress' and @orderBy = 'DESC' then [IpAddress] end DESC,
	case when @sortBy = 'PageAccessed' and @orderBy = 'ASC' then [PageAccessed] end ASC,
	case when @sortBy = 'PageAccessed' and @orderBy = 'DESC' then [PageAccessed] end DESC,
	case when @sortBy = 'LoggedInAt' and @orderBy = 'ASC' then [LoggedInAt] end ASC,
	case when @sortBy = 'LoggedInAt' and @orderBy = 'DESC' then [LoggedInAt] end DESC,
	case when @sortBy = 'LoggedOutAt' and @orderBy = 'ASC' then [LoggedOutAt] end ASC,
	case when @sortBy = 'LoggedOutAt' and @orderBy = 'DESC' then [LoggedOutAt] end DESC,
	case when @sortBy = 'LoginStatus' and @orderBy = 'ASC' then [LoginStatus] end ASC,
	case when @sortBy = 'LoginStatus' and @orderBy = 'DESC' then [LoginStatus] end DESC,
	case when @sortBy = 'ControllerName' and @orderBy = 'ASC' then [ControllerName] end ASC,
	case when @sortBy = 'ControllerName' and @orderBy = 'DESC' then [ControllerName] end DESC,
	case when @sortBy = 'ActionName' and @orderBy = 'ASC' then [ActionName] end ASC,
	case when @sortBy = 'ActionName' and @orderBy = 'DESC' then [ActionName] end DESC,
	case when @sortBy = 'UrlReferrer' and @orderBy = 'ASC' then [UrlReferrer] end ASC,
	case when @sortBy = 'UrlReferrer' and @orderBy = 'DESC' then [UrlReferrer] end DESC,
	case when @sortBy = 'Area' and @orderBy = 'ASC' then [Area] end ASC,
	case when @sortBy = 'Area' and @orderBy = 'DESC' then [Area] end DESC,
	case when @sortBy = 'RoleId' and @orderBy = 'ASC' then [RoleId] end ASC,
	case when @sortBy = 'RoleId' and @orderBy = 'DESC' then [RoleId] end DESC,
	case when @sortBy = 'LangId' and @orderBy = 'ASC' then [LangId] end ASC,
	case when @sortBy = 'LangId' and @orderBy = 'DESC' then [LangId] end DESC,
	case when @sortBy = 'IsFirstLogin' and @orderBy = 'ASC' then [IsFirstLogin] end ASC,
	case when @sortBy = 'IsFirstLogin' and @orderBy = 'DESC' then [IsFirstLogin] end DESC,
	case when @sortBy = 'CreatedOn' and @orderBy = 'ASC' then [CreatedOn] end ASC,
	case when @sortBy = 'CreatedOn' and @orderBy = 'DESC' then [CreatedOn] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[UserAudit_UPDATE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserAudit_UPDATE]
(
@auditId bigint = null,
@userId uniqueidentifier = null,
@sessionId varchar(50) = null,
@ipAddress varchar(50) = null,
@pageAccessed varchar(500) = null,
@loggedInAt varchar(50) = null,
@loggedOutAt varchar(50) = null,
@loginStatus varchar = null,
@controllerName varchar(50) = null,
@actionName varchar(50) = null,
@urlReferrer varchar(500) = null,
@area varchar(50) = null,
@roleId uniqueidentifier = null,
@langId varchar(2) = null,
@isFirstLogin varchar(2) = null,
@createdOn datetime = null
)
AS

UPDATE
  [dbo].[UserAudit]
SET
  [UserId] = @userId,
  [SessionId] = @sessionId,
  [IpAddress] = @ipAddress,
  [PageAccessed] = @pageAccessed,
  [LoggedInAt] = @loggedInAt,
  [LoggedOutAt] = @loggedOutAt,
  [LoginStatus] = @loginStatus,
  [ControllerName] = @controllerName,
  [ActionName] = @actionName,
  [UrlReferrer] = @urlReferrer,
  [Area] = @area,
  [RoleId] = @roleId,
  [LangId] = @langId,
  [IsFirstLogin] = @isFirstLogin,
  [CreatedOn] = @createdOn
WHERE
  [AuditId] = @auditId


GO
/****** Object:  StoredProcedure [dbo].[UserHistory_CUSTOM]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserHistory_CUSTOM]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20),
 @searchstring varchar(20)
)
AS

BEGIN

  SELECT m.* , 

  TotalRecord = COUNT(*) OVER()
  FROM [dbo].[User_History] as m


WHERE
  ( @searchstring IS NULL OR @searchstring = '' OR [IP] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [EventType] LIKE @searchstring +'%')

ORDER BY 

	case when @sortBy = 'UserID' and @orderBy = 'ASC' then [UserID] end ASC,
	case when @sortBy = 'UserID' and @orderBy = 'DESC' then [UserID] end DESC,
	case when @sortBy = 'EventDate' and @orderBy = 'ASC' then [EventDate] end ASC,
	case when @sortBy = 'EventDate' and @orderBy = 'DESC' then [EventDate] end DESC,
	case when @sortBy = 'IP' and @orderBy = 'ASC' then [IP] end ASC,
	case when @sortBy = 'IP' and @orderBy = 'DESC' then [IP] end DESC,
	case when @sortBy = 'EventType' and @orderBy = 'ASC' then [EventType] end ASC,
	case when @sortBy = 'EventType' and @orderBy = 'DESC' then [EventType] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[UserHistory_INSERT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserHistory_INSERT]
(
@userID AS uniqueidentifier = null,
@eventDate AS datetime = null,
@ip AS nchar(15) = null,
@eventType AS varchar(50) = null,
@details AS text = null
)
AS

INSERT INTO
  [dbo].[User_History]
(
  [UserID],
  [EventDate],
  [IP],
  [EventType],
  [Details]
)
VALUES
(
  @userID,
  @eventDate,
  @ip,
  @eventType,
  @details
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[UserHistory_PAGING]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserHistory_PAGING]
(
 @PageIndex int,
 @PageSize int
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[User_History] data 


ORDER BY [UserID] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[UserHistory_SEARCH]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserHistory_SEARCH]
(
@userID uniqueidentifier = null,
@eventDate datetime = null,
@ip nchar(15) = null,
@eventType varchar(50) = null,
@details text = null
)
AS

SELECT
  *
FROM
  [dbo].[User_History]
WHERE
  (@userID IS NULL OR [UserID] = @userID)
AND
  (@eventDate IS NULL OR [EventDate] = @eventDate)
AND
  (@ip IS NULL OR @ip = '' OR [IP] LIKE @ip + '%')
AND
  (@eventType IS NULL OR @eventType = '' OR [EventType] LIKE @eventType + '%')


GO
/****** Object:  StoredProcedure [dbo].[UserHistory_SORT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserHistory_SORT]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[User_History] data 


ORDER BY 

	case when @sortBy = 'UserID' and @orderBy = 'ASC' then [UserID] end ASC,
	case when @sortBy = 'UserID' and @orderBy = 'DESC' then [UserID] end DESC,
	case when @sortBy = 'EventDate' and @orderBy = 'ASC' then [EventDate] end ASC,
	case when @sortBy = 'EventDate' and @orderBy = 'DESC' then [EventDate] end DESC,
	case when @sortBy = 'IP' and @orderBy = 'ASC' then [IP] end ASC,
	case when @sortBy = 'IP' and @orderBy = 'DESC' then [IP] end DESC,
	case when @sortBy = 'EventType' and @orderBy = 'ASC' then [EventType] end ASC,
	case when @sortBy = 'EventType' and @orderBy = 'DESC' then [EventType] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[Users_CUSTOM]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_CUSTOM]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20),
 @searchstring varchar(20)
)
AS

BEGIN

  SELECT m.* , 

  TotalRecord = COUNT(*) OVER()
  FROM [dbo].[Users] as m


WHERE
  ( @searchstring IS NULL OR @searchstring = '' OR [EmailAddress] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [Name] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [Salt] LIKE @searchstring +'%')
OR  ( @searchstring IS NULL OR @searchstring = '' OR [AccountID] LIKE @searchstring +'%')

ORDER BY 

	case when @sortBy = 'UserID' and @orderBy = 'ASC' then [UserID] end ASC,
	case when @sortBy = 'UserID' and @orderBy = 'DESC' then [UserID] end DESC,
	case when @sortBy = 'EmailAddress' and @orderBy = 'ASC' then [EmailAddress] end ASC,
	case when @sortBy = 'EmailAddress' and @orderBy = 'DESC' then [EmailAddress] end DESC,
	case when @sortBy = 'Name' and @orderBy = 'ASC' then [Name] end ASC,
	case when @sortBy = 'Name' and @orderBy = 'DESC' then [Name] end DESC,
	case when @sortBy = 'PasswordHash' and @orderBy = 'ASC' then [PasswordHash] end ASC,
	case when @sortBy = 'PasswordHash' and @orderBy = 'DESC' then [PasswordHash] end DESC,
	case when @sortBy = 'Salt' and @orderBy = 'ASC' then [Salt] end ASC,
	case when @sortBy = 'Salt' and @orderBy = 'DESC' then [Salt] end DESC,
	case when @sortBy = 'Password_Version' and @orderBy = 'ASC' then [Password_Version] end ASC,
	case when @sortBy = 'Password_Version' and @orderBy = 'DESC' then [Password_Version] end DESC,
	case when @sortBy = 'Account_Disabled' and @orderBy = 'ASC' then [Account_Disabled] end ASC,
	case when @sortBy = 'Account_Disabled' and @orderBy = 'DESC' then [Account_Disabled] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[Users_DELETE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_DELETE]
(
@userID int
)
AS

DELETE
  [dbo].[Users]
WHERE
  [UserID] = @userID


GO
/****** Object:  StoredProcedure [dbo].[Users_INSERT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_INSERT]
(
@userID AS int = null,
@emailAddress AS varchar(320) = null,
@name AS varchar(100) = null,
@passwordHash AS binary = null,
@salt AS nvarchar(36) = null,
@passwordVersion AS int = null,
@accountDisabled AS bit = null,
@accountID AS nchar(6) = null
)
AS

INSERT INTO
  [dbo].[Users]
(
  [UserID],
  [EmailAddress],
  [Name],
  [PasswordHash],
  [Salt],
  [Password_Version],
  [Account_Disabled],
  [AccountID]
)
VALUES
(
  @userID,
  @emailAddress,
  @name,
  @passwordHash,
  @salt,
  @passwordVersion,
  @accountDisabled,
  @accountID
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[Users_PAGING]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_PAGING]
(
 @PageIndex int,
 @PageSize int
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Users] data 


ORDER BY [UserID] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[Users_SEARCH]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_SEARCH]
(
@userID int = null,
@emailAddress varchar(320) = null,
@name varchar(100) = null,
@passwordHash binary = null,
@salt nvarchar(36) = null,
@passwordVersion int = null,
@accountDisabled bit = null,
@accountID nchar(6) = null
)
AS

SELECT
  *
FROM
  [dbo].[Users]
WHERE
  (@userID IS NULL OR [UserID] = @userID)
AND
  (@emailAddress IS NULL OR @emailAddress = '' OR [EmailAddress] LIKE @emailAddress + '%')
AND
  (@name IS NULL OR @name = '' OR [Name] LIKE @name + '%')
AND
  (@salt IS NULL OR @salt = '' OR [Salt] LIKE @salt + '%')
AND
  (@passwordVersion IS NULL OR [Password_Version] = @passwordVersion)
AND
  (@accountDisabled IS NULL OR [Account_Disabled] = @accountDisabled)
AND
  (@accountID IS NULL OR @accountID = '' OR [AccountID] LIKE @accountID + '%')


GO
/****** Object:  StoredProcedure [dbo].[Users_SELECT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_SELECT]
(
@userID AS int
)
AS

SELECT
  *
FROM
  [dbo].[Users]
WHERE
  UserID = @userID


GO
/****** Object:  StoredProcedure [dbo].[Users_SORT]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_SORT]
(
 @PageIndex int,
 @PageSize int,
 @sortBy varchar(20),
 @orderBy varchar(20)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Users] data 


ORDER BY 

	case when @sortBy = 'UserID' and @orderBy = 'ASC' then [UserID] end ASC,
	case when @sortBy = 'UserID' and @orderBy = 'DESC' then [UserID] end DESC,
	case when @sortBy = 'EmailAddress' and @orderBy = 'ASC' then [EmailAddress] end ASC,
	case when @sortBy = 'EmailAddress' and @orderBy = 'DESC' then [EmailAddress] end DESC,
	case when @sortBy = 'Name' and @orderBy = 'ASC' then [Name] end ASC,
	case when @sortBy = 'Name' and @orderBy = 'DESC' then [Name] end DESC,
	case when @sortBy = 'PasswordHash' and @orderBy = 'ASC' then [PasswordHash] end ASC,
	case when @sortBy = 'PasswordHash' and @orderBy = 'DESC' then [PasswordHash] end DESC,
	case when @sortBy = 'Salt' and @orderBy = 'ASC' then [Salt] end ASC,
	case when @sortBy = 'Salt' and @orderBy = 'DESC' then [Salt] end DESC,
	case when @sortBy = 'Password_Version' and @orderBy = 'ASC' then [Password_Version] end ASC,
	case when @sortBy = 'Password_Version' and @orderBy = 'DESC' then [Password_Version] end DESC,
	case when @sortBy = 'Account_Disabled' and @orderBy = 'ASC' then [Account_Disabled] end ASC,
	case when @sortBy = 'Account_Disabled' and @orderBy = 'DESC' then [Account_Disabled] end DESC,
	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[Users_UPDATE]    Script Date: 16-03-2022 13:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_UPDATE]
(
@userID int = null,
@emailAddress varchar(320) = null,
@name varchar(100) = null,
@passwordHash binary = null,
@salt nvarchar(36) = null,
@passwordVersion int = null,
@accountDisabled bit = null,
@accountID nchar(6) = null
)
AS

UPDATE
  [dbo].[Users]
SET
  [UserID] = @userID,
  [EmailAddress] = @emailAddress,
  [Name] = @name,
  [PasswordHash] = @passwordHash,
  [Salt] = @salt,
  [Password_Version] = @passwordVersion,
  [Account_Disabled] = @accountDisabled,
  [AccountID] = @accountID
WHERE
  [UserID] = @userID


GO
USE [master]
GO
ALTER DATABASE [MMS_Web] SET  READ_WRITE 
GO
