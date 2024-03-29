
USE [MMS_Web]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 17-09-2022 04:46:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [nchar](6) NULL,
	[Representative] [varchar](100) NULL,
	[Include_Transportation] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 17-09-2022 04:46:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[OrderNumber] [varchar](50) NULL,
	[ItemName] [varchar](100) NULL,
	[OrderedWeight] [varchar](50) NULL,
	[ReceivedWeight] [varchar](50) NULL,
	[DueWeight] [varchar](50) NULL,
	[Price] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Header]    Script Date: 17-09-2022 04:46:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Header](
	[OrderNumber] [varchar](50) NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Representative]    Script Date: 17-09-2022 04:46:19 PM ******/
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
/****** Object:  Table [dbo].[Transaction_Detail]    Script Date: 17-09-2022 04:46:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Detail](
	[AccountID] [nchar](6) NULL,
	[TicketNumber] [nchar](8) NULL,
	[DetailID] [int] NULL,
	[Gross] [int] NULL,
	[Tare] [int] NULL,
	[Net] [int] NULL,
	[UnitCost] [money] NULL,
	[TotalCost] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_Header]    Script Date: 17-09-2022 04:46:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Header](
	[AccountID] [nchar](6) NULL,
	[TicketNumber] [nchar](8) NULL,
	[OrderNumber] [nchar](11) NULL,
	[TicketDate] [date] NULL,
	[PaymentTerms] [varchar](50) NULL,
	[SupplierTicket] [varchar](100) NULL,
	[CarrierTicket] [varchar](100) NULL,
	[TruckDescription] [varchar](100) NULL,
	[Status] [varchar](50) NULL,
	[PaymentReceiptURL] [varchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_OtherPictures]    Script Date: 17-09-2022 04:46:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_OtherPictures](
	[AccountID] [nchar](6) NULL,
	[TicketNumber] [nchar](8) NULL,
	[PictureID] [varchar](50) NULL,
	[Thumbnail_URL] [varchar](150) NULL,
	[FullRes_URL] [varchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_ReceivedPaperword]    Script Date: 17-09-2022 04:46:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_ReceivedPaperword](
	[AccountID] [nchar](6) NULL,
	[TicketNumber] [nchar](8) NULL,
	[PictureID] [varchar](50) NULL,
	[Thumbnail_URL] [varchar](150) NULL,
	[FullRes_URL] [varchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_ScalePictures]    Script Date: 17-09-2022 04:46:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_ScalePictures](
	[AccountID] [nchar](6) NULL,
	[TicketNumber] [nchar](8) NULL,
	[PictureID] [varchar](50) NULL,
	[Thumbnail_URL] [varchar](150) NULL,
	[FullRes_URL] [varchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransectionSetting]    Script Date: 17-09-2022 04:46:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransectionSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NULL,
	[CommodityID] [int] NULL,
	[Notes] [nvarchar](1000) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_TransectionSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transportation_Commodities]    Script Date: 17-09-2022 04:46:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportation_Commodities](
	[AccountID] [nchar](6) NULL,
	[LocationID] [int] NULL,
	[CommodityID] [int] NULL,
	[Commodity_Name] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transportation_Locations]    Script Date: 17-09-2022 04:46:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportation_Locations](
	[AccountID] [nchar](6) NULL,
	[LocationID] [int] NULL,
	[LocationName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAudit]    Script Date: 17-09-2022 04:46:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAudit](
	[AuditId] [bigint] IDENTITY(1,1) NOT NULL,
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
	[LangId] [varchar](2) NULL,
	[CreatedOn] [datetime] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17-09-2022 04:46:19 PM ******/
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
INSERT [dbo].[Accounts] ([AccountID], [Representative], [Include_Transportation]) VALUES (N'MX1000', N'Anthony J. Selby', 1)
GO
INSERT [dbo].[Order_Detail] ([OrderNumber], [ItemName], [OrderedWeight], [ReceivedWeight], [DueWeight], [Price]) VALUES (N'PO 0123232 ', N'gold', N'200', N'200', N'50', N'2999')
GO
INSERT [dbo].[Order_Detail] ([OrderNumber], [ItemName], [OrderedWeight], [ReceivedWeight], [DueWeight], [Price]) VALUES (N'PO 0123233 ', N'Silver', N'250', N'450', N'150', N'1985')
GO
INSERT [dbo].[Order_Header] ([OrderNumber], [EffectiveDate], [ExpirationDate], [Status]) VALUES (N'PO 0123232 ', CAST(N'2021-06-02' AS Date), CAST(N'2021-07-02' AS Date), 1)
GO
INSERT [dbo].[Order_Header] ([OrderNumber], [EffectiveDate], [ExpirationDate], [Status]) VALUES (N'PO 0123233 ', CAST(N'2021-06-02' AS Date), CAST(N'2021-07-02' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Representative] ON 
GO
INSERT [dbo].[Representative] ([ID], [AccountId], [Name], [Email], [OfficePhone], [CellPhone], [Image_URL], [Notes]) VALUES (1, N'MX1000', N'Anthony Selby Rep', N'anthony.selby+rep@gmail.com', N'(260) 232 3000', N'(260) 232 3015', N'http://www.metalx.net/images/f63e2cd7-398c-4464-9475-858498a0f78f.png', N'Anthony is a AR at Metalx dealing with metal')
GO
SET IDENTITY_INSERT [dbo].[Representative] OFF
GO
INSERT [dbo].[Transaction_Detail] ([AccountID], [TicketNumber], [DetailID], [Gross], [Tare], [Net], [UnitCost], [TotalCost]) VALUES (N'MX1000', N'01232123', 1, 2001, 1, 2000, NULL, NULL)
GO
INSERT [dbo].[Transaction_Header] ([AccountID], [TicketNumber], [OrderNumber], [TicketDate], [PaymentTerms], [SupplierTicket], [CarrierTicket], [TruckDescription], [Status], [PaymentReceiptURL]) VALUES (N'MX1000', N'01232123', N'PO 0123232 ', CAST(N'2021-06-02' AS Date), N'15 Days', N'No Paperwork', N'XS1999', N'Small Truck Carrier', N'Paid', N'https://www.invoicesimple.com/wp-content/uploads/2018/05/InvoiceSimple-PDF-Template.pdf')
GO
INSERT [dbo].[Transaction_Header] ([AccountID], [TicketNumber], [OrderNumber], [TicketDate], [PaymentTerms], [SupplierTicket], [CarrierTicket], [TruckDescription], [Status], [PaymentReceiptURL]) VALUES (N'MX1000', N'22222222', N'PO 0123232 ', CAST(N'2021-06-02' AS Date), N'15 Days', N'No Paperwork', N'XS1999', N'Small Truck Carrier', N'Paid', N'https://www.invoicesimple.com/wp-content/uploads/2018/05/InvoiceSimple-PDF-Template.pdf')
GO
INSERT [dbo].[Transaction_ReceivedPaperword] ([AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (N'MX1000', N'01232123', N'1', N'https://thumbs.dreamstime.com/z/nature-forest-trees-growing-to-upward-to-sun-wallpaper-42907586.jpg', N'https://thumbs.dreamstime.com/z/nature-forest-trees-growing-to-upward-to-sun-wallpaper-42907586.jpg')
GO
INSERT [dbo].[Transaction_ReceivedPaperword] ([AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (N'MX1000', N'01232123', N'2', N'https://thumbs.dreamstime.com/z/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg', N'https://thumbs.dreamstime.com/z/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg')
GO
INSERT [dbo].[Transaction_ReceivedPaperword] ([AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (N'MX1000', N'01232123', N'3', N'https://thumbs.dreamstime.com/z/beautiful-rain-forest-21199829.jpg', N'https://thumbs.dreamstime.com/z/beautiful-rain-forest-21199829.jpg')
GO
INSERT [dbo].[Transaction_ReceivedPaperword] ([AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (N'MX1000', N'01232123', N'4', N'https://thumbs.dreamstime.com/z/beautiful-landscape-flowing-water-17075673.jpg', N'https://thumbs.dreamstime.com/z/beautiful-landscape-flowing-water-17075673.jpg')
GO
INSERT [dbo].[Transaction_ReceivedPaperword] ([AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (N'MX1000', N'01232123', N'5', N'https://thumbs.dreamstime.com/z/lake-landscape-29322283.jpg', N'https://thumbs.dreamstime.com/z/lake-landscape-29322283.jpg')
GO
INSERT [dbo].[Transaction_ScalePictures] ([AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (N'MX1000', N'01232123', N'1', N'https://thumbs.dreamstime.com/z/wheels-2655503.jpg', N'https://thumbs.dreamstime.com/z/wheels-2655503.jpg')
GO
INSERT [dbo].[Transaction_ScalePictures] ([AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (N'MX1000', N'01232123', N'2', N'https://thumbs.dreamstime.com/z/wheels-2655446.jpg', N'https://thumbs.dreamstime.com/z/wheels-2655446.jpg')
GO
INSERT [dbo].[Transaction_ScalePictures] ([AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (N'MX1000', N'01232123', N'3', N'https://thumbs.dreamstime.com/z/wheels-2655429.jpg', N'https://thumbs.dreamstime.com/z/wheels-2655429.jpg')
GO
INSERT [dbo].[Transaction_ScalePictures] ([AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (N'MX1000', N'01232123', N'4', N'https://thumbs.dreamstime.com/z/circuit-board-2040418.jpg', N'https://thumbs.dreamstime.com/z/circuit-board-2040418.jpg')
GO
INSERT [dbo].[Transaction_ScalePictures] ([AccountID], [TicketNumber], [PictureID], [Thumbnail_URL], [FullRes_URL]) VALUES (N'MX1000', N'01232123', N'5', N'https://thumbs.dreamstime.com/z/digital-background-2655284.jpg', N'https://thumbs.dreamstime.com/z/digital-background-2655284.jpg')
GO
SET IDENTITY_INSERT [dbo].[TransectionSetting] ON 
GO
INSERT [dbo].[TransectionSetting] ([Id], [LocationID], [CommodityID], [Notes], [CreatedOn], [CreatedBy]) VALUES (7, 1, 1, N'Testing 1', CAST(N'2022-03-07T13:27:40.077' AS DateTime), 1)
GO
INSERT [dbo].[TransectionSetting] ([Id], [LocationID], [CommodityID], [Notes], [CreatedOn], [CreatedBy]) VALUES (8, 1, 1, N'Testing 2', CAST(N'2022-03-10T14:35:55.460' AS DateTime), 1)
GO
INSERT [dbo].[TransectionSetting] ([Id], [LocationID], [CommodityID], [Notes], [CreatedOn], [CreatedBy]) VALUES (9, 1, 1, N'dfsfsd', CAST(N'2022-03-17T05:33:29.513' AS DateTime), 1)
GO
INSERT [dbo].[TransectionSetting] ([Id], [LocationID], [CommodityID], [Notes], [CreatedOn], [CreatedBy]) VALUES (10, 0, 0, N'tesg', CAST(N'2022-03-27T15:50:37.307' AS DateTime), 2)
GO
INSERT [dbo].[TransectionSetting] ([Id], [LocationID], [CommodityID], [Notes], [CreatedOn], [CreatedBy]) VALUES (11, 0, 0, N'df', CAST(N'2022-04-28T09:22:34.840' AS DateTime), 2)
GO
INSERT [dbo].[TransectionSetting] ([Id], [LocationID], [CommodityID], [Notes], [CreatedOn], [CreatedBy]) VALUES (12, 0, 0, N'vbv', CAST(N'2022-05-25T03:39:22.043' AS DateTime), 2)
GO
INSERT [dbo].[TransectionSetting] ([Id], [LocationID], [CommodityID], [Notes], [CreatedOn], [CreatedBy]) VALUES (13, 0, 0, N'dfhsfd', CAST(N'2022-07-01T06:48:34.627' AS DateTime), 2)
GO
SET IDENTITY_INSERT [dbo].[TransectionSetting] OFF
GO
INSERT [dbo].[Transportation_Commodities] ([AccountID], [LocationID], [CommodityID], [Commodity_Name]) VALUES (N'MX1000', 1, 1, N'Sheet Iron')
GO
INSERT [dbo].[Transportation_Commodities] ([AccountID], [LocationID], [CommodityID], [Commodity_Name]) VALUES (N'MX1000', 1, 2, N'Maintenace Scrap')
GO
INSERT [dbo].[Transportation_Commodities] ([AccountID], [LocationID], [CommodityID], [Commodity_Name]) VALUES (N'MX1002', 1, 2, N'Maintenace Scrap')
GO
INSERT [dbo].[Transportation_Locations] ([AccountID], [LocationID], [LocationName]) VALUES (N'MX1002', 1, N'Main Location')
GO
INSERT [dbo].[Transportation_Locations] ([AccountID], [LocationID], [LocationName]) VALUES (N'MX1000', 1, N'Office')
GO
SET IDENTITY_INSERT [dbo].[UserAudit] ON 
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10983, N'1e90d9bc-c743-f9c3-b24b-a5f8c1af4363', N'68.45.10.255', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-03-18T13:37:00.080' AS DateTime), 1)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10984, N'1e90d9bc-c743-f9c3-b24b-a5f8c1af4363', N'68.45.10.255', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T13:37:00.233' AS DateTime), 1)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10985, N'1e90d9bc-c743-f9c3-b24b-a5f8c1af4363', N'68.45.10.255', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T13:37:32.987' AS DateTime), 1)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10986, N'1e90d9bc-c743-f9c3-b24b-a5f8c1af4363', N'68.45.10.255', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/Home/SignIn', N'Admin', N'1', CAST(N'2022-03-18T13:39:28.677' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10987, N'1e90d9bc-c743-f9c3-b24b-a5f8c1af4363', N'68.45.10.255', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T13:39:28.880' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10988, N'1e90d9bc-c743-f9c3-b24b-a5f8c1af4363', N'68.45.10.255', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T13:39:30.943' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10989, N'1e90d9bc-c743-f9c3-b24b-a5f8c1af4363', N'68.45.10.255', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T13:40:00.980' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10990, N'1e90d9bc-c743-f9c3-b24b-a5f8c1af4363', N'68.45.10.255', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T13:40:05.950' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10991, N'1e90d9bc-c743-f9c3-b24b-a5f8c1af4363', N'68.45.10.255', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-03-18T13:40:58.503' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10992, N'1e90d9bc-c743-f9c3-b24b-a5f8c1af4363', N'68.45.10.255', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-03-18T13:41:01.357' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10993, N'1e90d9bc-c743-f9c3-b24b-a5f8c1af4363', N'68.45.10.255', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-03-18T13:41:02.077' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10994, N'1e90d9bc-c743-f9c3-b24b-a5f8c1af4363', N'68.45.10.255', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-03-18T13:41:02.597' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10995, N'1e90d9bc-c743-f9c3-b24b-a5f8c1af4363', N'68.45.10.255', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-03-18T13:41:29.853' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10996, N'1e90d9bc-c743-f9c3-b24b-a5f8c1af4363', N'68.45.10.255', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-03-18T13:42:00.277' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10997, N'04ddee51-f325-f0a4-45bf-a90dcc4f35da', N'68.45.10.255', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-18T14:17:08.930' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10998, N'0c258929-d98b-5002-429c-2b9a31b80d92', N'103.100.16.208', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', N'1', CAST(N'2022-03-18T14:36:20.240' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (10999, N'f7c3b95c-ddc0-4d60-c1e3-906722b41e34', N'103.100.16.208', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/home/SignIn', N'Admin', N'1', CAST(N'2022-03-18T14:37:01.187' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11000, N'f7c3b95c-ddc0-4d60-c1e3-906722b41e34', N'103.100.16.208', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T14:37:02.010' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11001, N'f7c3b95c-ddc0-4d60-c1e3-906722b41e34', N'103.100.16.208', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T14:37:08.007' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11002, N'f7c3b95c-ddc0-4d60-c1e3-906722b41e34', N'103.100.16.208', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T14:37:52.420' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11003, N'f7c3b95c-ddc0-4d60-c1e3-906722b41e34', N'103.100.16.208', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-03-18T14:37:53.297' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11004, N'edc84c5d-175f-ebf1-17a7-bd1145f5407f', N'103.100.16.208', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-03-18T16:13:08.273' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11005, N'edc84c5d-175f-ebf1-17a7-bd1145f5407f', N'103.100.16.208', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T16:13:09.783' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11006, N'edc84c5d-175f-ebf1-17a7-bd1145f5407f', N'103.100.16.208', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T16:13:13.697' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11007, N'edc84c5d-175f-ebf1-17a7-bd1145f5407f', N'103.100.16.208', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-18T16:13:19.287' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11008, N'edc84c5d-175f-ebf1-17a7-bd1145f5407f', N'103.100.16.208', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-18T16:13:31.447' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11009, N'fead4220-f303-52a8-7aac-b7286248b528', N'103.100.16.208', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T16:18:33.497' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11010, N'4b1abcc1-ba26-1e09-7e49-30057c960490', N'103.100.16.208', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transportation/SignIn', N'Admin', N'1', CAST(N'2022-03-18T16:18:53.063' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11011, N'4b1abcc1-ba26-1e09-7e49-30057c960490', N'103.100.16.208', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T16:18:55.987' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11012, N'4b1abcc1-ba26-1e09-7e49-30057c960490', N'103.100.16.208', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T16:18:56.097' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11013, N'4b1abcc1-ba26-1e09-7e49-30057c960490', N'103.100.16.208', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-18T16:19:00.437' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11014, N'e8c1c366-ed49-2f0a-7934-9d6f876276aa', N'103.100.16.208', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-18T16:22:26.467' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11015, N'66ee90bb-3041-c2be-207c-f43c2bc1680a', N'103.100.16.208', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-03-18T16:22:45.560' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11016, N'66ee90bb-3041-c2be-207c-f43c2bc1680a', N'103.100.16.208', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T16:22:46.600' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11017, N'66ee90bb-3041-c2be-207c-f43c2bc1680a', N'103.100.16.208', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T16:22:49.057' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11018, N'66ee90bb-3041-c2be-207c-f43c2bc1680a', N'103.100.16.208', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-18T16:23:01.637' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11019, N'66ee90bb-3041-c2be-207c-f43c2bc1680a', N'103.100.16.208', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-18T16:23:16.390' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11020, N'66ee90bb-3041-c2be-207c-f43c2bc1680a', N'103.100.16.208', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-18T16:23:33.227' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11021, N'66ee90bb-3041-c2be-207c-f43c2bc1680a', N'103.100.16.208', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-03-18T16:23:35.247' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11022, N'66ee90bb-3041-c2be-207c-f43c2bc1680a', N'103.100.16.208', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-03-18T16:23:36.437' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11023, N'd725cd3d-6628-2d4f-a0a8-86878c882624', N'68.45.10.255', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/home/SignIn', N'Admin', N'1', CAST(N'2022-03-18T17:27:57.223' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11024, N'd725cd3d-6628-2d4f-a0a8-86878c882624', N'68.45.10.255', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T17:27:57.780' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11025, N'd725cd3d-6628-2d4f-a0a8-86878c882624', N'68.45.10.255', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-18T17:27:59.563' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11026, N'd725cd3d-6628-2d4f-a0a8-86878c882624', N'68.45.10.255', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-03-18T17:28:00.470' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11027, N'd725cd3d-6628-2d4f-a0a8-86878c882624', N'68.45.10.255', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-18T17:28:02.330' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11028, N'5d121cca-b24b-92c3-f171-2f166fbcbd04', N'68.45.10.255', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-03-18T18:22:49.513' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11029, N'2c2d3dc0-5aa3-a282-73fa-936af1225e42', N'68.45.10.255', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-03-18T18:22:49.570' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11030, N'037c3818-ce08-20f8-07b9-48bd33a06ff2', N'68.45.10.255', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-18T19:37:57.087' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11031, N'8a5385a3-1fd9-90c9-d037-4b5ac817c789', N'103.100.16.211', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', N'1', CAST(N'2022-03-20T02:43:52.583' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11032, N'7ec93fae-f8b7-b12a-d624-c19b522894a1', N'103.100.16.211', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/home/SignIn', N'Admin', N'1', CAST(N'2022-03-20T02:44:08.713' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11033, N'7ec93fae-f8b7-b12a-d624-c19b522894a1', N'103.100.16.211', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/home/SignIn', N'Admin', N'1', CAST(N'2022-03-20T02:44:09.273' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11034, N'7ec93fae-f8b7-b12a-d624-c19b522894a1', N'103.100.16.211', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-20T02:44:11.097' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11035, N'7ec93fae-f8b7-b12a-d624-c19b522894a1', N'103.100.16.211', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-20T02:44:13.890' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11036, N'74912d7a-e76d-6a49-5464-7e3d4741a022', N'123.201.0.86', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/account/login', N'Admin', N'1', CAST(N'2022-03-21T09:11:05.257' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11037, N'74912d7a-e76d-6a49-5464-7e3d4741a022', N'123.201.0.86', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-21T09:11:07.690' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11038, N'74912d7a-e76d-6a49-5464-7e3d4741a022', N'123.201.0.86', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-21T09:11:08.883' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11039, N'74912d7a-e76d-6a49-5464-7e3d4741a022', N'123.201.0.86', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-21T09:11:14.157' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11040, N'74912d7a-e76d-6a49-5464-7e3d4741a022', N'123.201.0.86', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-21T09:11:18.790' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11041, N'74912d7a-e76d-6a49-5464-7e3d4741a022', N'123.201.0.86', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-21T09:11:23.070' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11042, N'74912d7a-e76d-6a49-5464-7e3d4741a022', N'123.201.0.86', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-03-21T09:11:25.967' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11043, N'74912d7a-e76d-6a49-5464-7e3d4741a022', N'123.201.0.86', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-03-21T09:11:26.933' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11044, N'74912d7a-e76d-6a49-5464-7e3d4741a022', N'123.201.0.86', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-03-21T09:11:28.113' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11045, N'8afdc217-2396-8f45-ca84-fc8e64fa273a', N'174.205.39.163', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-03-21T20:02:58.577' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11046, N'8afdc217-2396-8f45-ca84-fc8e64fa273a', N'174.205.39.163', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-21T20:03:00.297' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11047, N'8afdc217-2396-8f45-ca84-fc8e64fa273a', N'174.205.39.163', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-21T20:03:39.653' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11048, N'8afdc217-2396-8f45-ca84-fc8e64fa273a', N'174.205.39.163', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-03-21T20:04:36.180' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11049, N'8afdc217-2396-8f45-ca84-fc8e64fa273a', N'174.205.39.163', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-03-21T20:04:52.877' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11050, N'6bf25281-ce5e-b5e4-83b8-81f25d5695eb', N'82.17.226.241', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-03-27T15:50:14.143' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11051, N'6bf25281-ce5e-b5e4-83b8-81f25d5695eb', N'82.17.226.241', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-27T15:50:15.280' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11052, N'6bf25281-ce5e-b5e4-83b8-81f25d5695eb', N'82.17.226.241', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-27T15:50:25.080' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11053, N'6bf25281-ce5e-b5e4-83b8-81f25d5695eb', N'82.17.226.241', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-27T15:50:28.720' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11054, N'6bf25281-ce5e-b5e4-83b8-81f25d5695eb', N'82.17.226.241', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-27T15:50:37.297' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11055, N'6bf25281-ce5e-b5e4-83b8-81f25d5695eb', N'82.17.226.241', N'/admin/transportation/detail?msg=Transportation%20successfully%20added.', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-27T15:50:37.490' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11056, N'6bf25281-ce5e-b5e4-83b8-81f25d5695eb', N'82.17.226.241', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail?msg=Transportation%20successfully%20added.', N'Admin', N'1', CAST(N'2022-03-27T15:50:43.543' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11057, N'6bf25281-ce5e-b5e4-83b8-81f25d5695eb', N'82.17.226.241', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-03-27T15:50:43.873' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11058, N'6bf25281-ce5e-b5e4-83b8-81f25d5695eb', N'82.17.226.241', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-03-27T15:51:07.813' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11059, N'179c4a5b-d338-3e20-855b-aa91f5f25205', N'103.100.16.215', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-03-30T09:35:30.353' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11060, N'179c4a5b-d338-3e20-855b-aa91f5f25205', N'103.100.16.215', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-30T09:35:34.083' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11061, N'179c4a5b-d338-3e20-855b-aa91f5f25205', N'103.100.16.215', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-03-30T09:37:06.903' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11062, N'179c4a5b-d338-3e20-855b-aa91f5f25205', N'103.100.16.215', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=22222222', N'Admin', N'1', CAST(N'2022-03-30T09:37:12.723' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11063, N'179c4a5b-d338-3e20-855b-aa91f5f25205', N'103.100.16.215', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-03-30T09:37:15.487' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11064, N'179c4a5b-d338-3e20-855b-aa91f5f25205', N'103.100.16.215', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-30T09:37:18.987' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11065, N'179c4a5b-d338-3e20-855b-aa91f5f25205', N'103.100.16.215', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-03-30T09:37:22.993' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11066, N'179c4a5b-d338-3e20-855b-aa91f5f25205', N'103.100.16.215', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-03-30T09:37:23.873' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11067, N'179c4a5b-d338-3e20-855b-aa91f5f25205', N'103.100.16.215', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-03-30T09:37:25.200' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11068, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/login', N'Admin', N'1', CAST(N'2022-04-28T09:21:23.813' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11069, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-04-28T09:21:25.740' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11070, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-04-28T09:21:28.007' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11071, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=22222222', N'Admin', N'1', CAST(N'2022-04-28T09:21:30.807' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11072, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-04-28T09:21:36.957' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11073, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-04-28T09:21:40.920' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11074, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-04-28T09:21:52.993' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11075, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-04-28T09:21:53.650' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11076, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-04-28T09:22:01.480' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11077, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=22222222', N'Admin', N'1', CAST(N'2022-04-28T09:22:06.040' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11078, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-04-28T09:22:06.380' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11079, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-04-28T09:22:07.337' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11080, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-04-28T09:22:25.380' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11081, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-04-28T09:22:27.343' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11082, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-04-28T09:22:34.833' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11083, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/transportation/detail?msg=Transportation%20successfully%20added.', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-04-28T09:22:35.097' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11084, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail?msg=Transportation%20successfully%20added.', N'Admin', N'1', CAST(N'2022-04-28T09:22:37.513' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11085, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-04-28T09:22:37.993' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11086, N'bd95f182-23b7-fdf8-d13f-9c936d17e3ed', N'123.201.29.6', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-04-28T09:22:41.057' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11087, N'c261f3f6-2ad9-ab06-ab1a-e1d5a07ac7b3', N'123.201.29.6', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', N'1', CAST(N'2022-04-28T09:23:43.100' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11088, N'08c66467-fbb1-5b16-1bf2-c82cf8b00ffa', N'103.100.16.251', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-05-25T02:52:43.660' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11089, N'08c66467-fbb1-5b16-1bf2-c82cf8b00ffa', N'103.100.16.251', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-05-25T02:52:46.533' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11090, N'f71322f7-f57d-7025-93e5-3ff2b770fef9', N'103.100.16.251', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-05-25T03:26:19.623' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11091, N'f71322f7-f57d-7025-93e5-3ff2b770fef9', N'103.100.16.251', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-05-25T03:26:25.467' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11092, N'f71322f7-f57d-7025-93e5-3ff2b770fef9', N'103.100.16.251', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-05-25T03:26:27.330' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11093, N'f71322f7-f57d-7025-93e5-3ff2b770fef9', N'103.100.16.251', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=22222222', N'Admin', N'1', CAST(N'2022-05-25T03:26:30.163' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11094, N'f71322f7-f57d-7025-93e5-3ff2b770fef9', N'103.100.16.251', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-05-25T03:38:29.037' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11095, N'f71322f7-f57d-7025-93e5-3ff2b770fef9', N'103.100.16.251', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-05-25T03:38:29.990' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11096, N'f71322f7-f57d-7025-93e5-3ff2b770fef9', N'103.100.16.251', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-05-25T03:38:39.123' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11097, N'f71322f7-f57d-7025-93e5-3ff2b770fef9', N'103.100.16.251', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-05-25T03:38:39.277' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11098, N'f71322f7-f57d-7025-93e5-3ff2b770fef9', N'103.100.16.251', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-05-25T03:38:40.327' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11099, N'f71322f7-f57d-7025-93e5-3ff2b770fef9', N'103.100.16.251', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-05-25T03:39:15.597' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11100, N'f71322f7-f57d-7025-93e5-3ff2b770fef9', N'103.100.16.251', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-05-25T03:39:17.977' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11101, N'f71322f7-f57d-7025-93e5-3ff2b770fef9', N'103.100.16.251', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-05-25T03:39:22.037' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11102, N'f71322f7-f57d-7025-93e5-3ff2b770fef9', N'103.100.16.251', N'/admin/transportation/detail?msg=Transportation%20successfully%20added.', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-05-25T03:39:22.340' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11103, N'f71322f7-f57d-7025-93e5-3ff2b770fef9', N'103.100.16.251', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail?msg=Transportation%20successfully%20added.', N'Admin', N'1', CAST(N'2022-05-25T03:39:24.313' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11104, N'22c768d1-2ce7-710c-3efa-b6663a31e52a', N'175.100.133.100', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/transactions', N'Admin', N'1', CAST(N'2022-06-02T09:43:35.390' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11105, N'22c768d1-2ce7-710c-3efa-b6663a31e52a', N'175.100.133.100', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-06-02T09:43:37.633' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11106, N'22c768d1-2ce7-710c-3efa-b6663a31e52a', N'175.100.133.100', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-06-02T09:43:42.897' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11107, N'86168b43-edf0-db18-dda4-1217f4aa0f20', N'219.91.181.66', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-06-09T10:44:08.890' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11108, N'86168b43-edf0-db18-dda4-1217f4aa0f20', N'219.91.181.66', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-06-09T10:44:11.257' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11109, N'86168b43-edf0-db18-dda4-1217f4aa0f20', N'219.91.181.66', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-06-09T10:44:18.650' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11110, N'86168b43-edf0-db18-dda4-1217f4aa0f20', N'219.91.181.66', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-06-09T10:44:21.033' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11111, N'86168b43-edf0-db18-dda4-1217f4aa0f20', N'219.91.181.66', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-06-09T10:44:23.967' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11112, N'86168b43-edf0-db18-dda4-1217f4aa0f20', N'219.91.181.66', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-06-09T10:44:24.463' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11113, N'86168b43-edf0-db18-dda4-1217f4aa0f20', N'219.91.181.66', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-06-09T10:45:18.747' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11114, N'86168b43-edf0-db18-dda4-1217f4aa0f20', N'219.91.181.66', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-06-09T10:45:20.047' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11115, N'86168b43-edf0-db18-dda4-1217f4aa0f20', N'219.91.181.66', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-06-09T10:45:20.570' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11116, N'86168b43-edf0-db18-dda4-1217f4aa0f20', N'219.91.181.66', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-06-09T10:45:20.893' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11117, N'86168b43-edf0-db18-dda4-1217f4aa0f20', N'219.91.181.66', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-06-09T10:45:23.303' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11118, N'86168b43-edf0-db18-dda4-1217f4aa0f20', N'219.91.181.66', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-06-09T10:45:23.670' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11119, N'0be90943-ec86-d0a6-492a-303407171468', N'219.91.181.66', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-06-09T13:00:59.193' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11120, N'8c29bf27-d04e-97a3-4ed5-aeca054f9aa3', N'219.91.181.66', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-06-09T13:01:02.537' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11121, N'28062775-7340-4046-ba83-c67f6c8fa775', N'206.176.159.24', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-06-17T12:38:36.913' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11122, N'28062775-7340-4046-ba83-c67f6c8fa775', N'206.176.159.24', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-06-17T12:38:37.710' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11123, N'28062775-7340-4046-ba83-c67f6c8fa775', N'206.176.159.24', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-06-17T12:38:41.460' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11124, N'28062775-7340-4046-ba83-c67f6c8fa775', N'206.176.159.24', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-06-17T12:38:42.523' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11125, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-06-30T12:45:14.397' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11126, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-06-30T12:45:14.867' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11127, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-06-30T12:45:17.277' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11128, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-06-30T12:45:20.570' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11129, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=22222222', N'Admin', N'1', CAST(N'2022-06-30T12:45:28.730' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11130, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-06-30T12:45:32.153' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11131, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-06-30T12:45:39.630' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11132, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-06-30T12:45:56.330' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11133, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-06-30T12:45:58.463' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11134, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-06-30T12:45:59.020' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11135, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-06-30T13:05:40.900' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11136, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-06-30T13:05:41.603' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11137, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-06-30T13:05:44.480' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11138, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=22222222', N'Admin', N'1', CAST(N'2022-06-30T13:05:47.943' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11139, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-06-30T13:05:48.523' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11140, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-06-30T13:05:49.963' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11141, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-06-30T13:06:05.383' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11142, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-06-30T13:06:08.153' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11143, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-06-30T13:06:11.957' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11144, N'aabf04de-1953-5d62-4009-e2453321fe00', N'175.100.133.252', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-06-30T13:08:14.537' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11145, N'c3dbd86f-db75-a7c6-43bd-37efda7613fd', N'175.100.133.61', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-07-01T06:43:56.437' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11146, N'c3dbd86f-db75-a7c6-43bd-37efda7613fd', N'175.100.133.61', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-07-01T06:43:57.807' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11147, N'c3dbd86f-db75-a7c6-43bd-37efda7613fd', N'175.100.133.61', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-07-01T06:48:11.870' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11148, N'c3dbd86f-db75-a7c6-43bd-37efda7613fd', N'175.100.133.61', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-07-01T06:48:28.457' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11149, N'c3dbd86f-db75-a7c6-43bd-37efda7613fd', N'175.100.133.61', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-07-01T06:48:34.610' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11150, N'c3dbd86f-db75-a7c6-43bd-37efda7613fd', N'175.100.133.61', N'/admin/transportation/detail?msg=Transportation%20successfully%20added.', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-07-01T06:48:34.897' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11151, N'c3dbd86f-db75-a7c6-43bd-37efda7613fd', N'175.100.133.61', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail?msg=Transportation%20successfully%20added.', N'Admin', N'1', CAST(N'2022-07-01T06:48:38.427' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11152, N'c3dbd86f-db75-a7c6-43bd-37efda7613fd', N'175.100.133.61', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-07-01T06:49:00.390' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11153, N'c3dbd86f-db75-a7c6-43bd-37efda7613fd', N'175.100.133.61', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-07-01T06:49:00.907' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11154, N'c3dbd86f-db75-a7c6-43bd-37efda7613fd', N'175.100.133.61', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-07-01T06:49:25.677' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11155, N'c3dbd86f-db75-a7c6-43bd-37efda7613fd', N'175.100.133.61', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-07-01T06:50:05.080' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11156, N'c3dbd86f-db75-a7c6-43bd-37efda7613fd', N'175.100.133.61', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-07-01T06:50:05.250' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11157, N'c3dbd86f-db75-a7c6-43bd-37efda7613fd', N'175.100.133.61', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-07-01T06:50:05.680' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11158, N'c3dbd86f-db75-a7c6-43bd-37efda7613fd', N'175.100.133.61', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-07-01T06:50:06.470' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11159, N'dabc4f83-242f-e408-fc36-938f74996a2b', N'94.204.169.46', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://208.80.29.178/HOme/login', N'Admin', N'1', CAST(N'2022-07-06T14:13:14.867' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11160, N'dabc4f83-242f-e408-fc36-938f74996a2b', N'94.204.169.46', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://208.80.29.178/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-07-06T14:13:18.693' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11161, N'dabc4f83-242f-e408-fc36-938f74996a2b', N'94.204.169.46', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://208.80.29.178/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-07-06T14:13:30.790' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11162, N'dabc4f83-242f-e408-fc36-938f74996a2b', N'94.204.169.46', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://208.80.29.178/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-07-06T14:13:36.213' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11163, N'b24f27d3-5e16-3b4b-03b3-c5880d900d61', N'49.36.183.193', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-07-18T11:15:02.163' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11164, N'b24f27d3-5e16-3b4b-03b3-c5880d900d61', N'49.36.183.193', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-07-18T11:15:04.003' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11165, N'b24f27d3-5e16-3b4b-03b3-c5880d900d61', N'49.36.183.193', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-07-18T11:15:08.247' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11166, N'b24f27d3-5e16-3b4b-03b3-c5880d900d61', N'49.36.183.193', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-07-18T11:15:13.870' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11167, N'b24f27d3-5e16-3b4b-03b3-c5880d900d61', N'49.36.183.193', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-07-18T11:15:21.943' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11168, N'a7064b0d-ee46-5a1f-20af-3f371b5b7360', N'73.23.78.107', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-07-19T05:24:11.077' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11169, N'a7064b0d-ee46-5a1f-20af-3f371b5b7360', N'73.23.78.107', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-07-19T05:24:12.690' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11170, N'a7064b0d-ee46-5a1f-20af-3f371b5b7360', N'73.23.78.107', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-07-19T05:24:26.833' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11171, N'a7064b0d-ee46-5a1f-20af-3f371b5b7360', N'73.23.78.107', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-07-19T05:24:28.400' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11172, N'a7064b0d-ee46-5a1f-20af-3f371b5b7360', N'73.23.78.107', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-07-19T05:24:30.037' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11173, N'a7064b0d-ee46-5a1f-20af-3f371b5b7360', N'73.23.78.107', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-07-19T05:24:30.790' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11174, N'a7064b0d-ee46-5a1f-20af-3f371b5b7360', N'73.23.78.107', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-07-19T05:24:31.137' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11175, N'a7064b0d-ee46-5a1f-20af-3f371b5b7360', N'73.23.78.107', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-07-19T05:24:31.917' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11176, N'a7064b0d-ee46-5a1f-20af-3f371b5b7360', N'73.23.78.107', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-07-19T05:24:32.700' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11177, N'a7064b0d-ee46-5a1f-20af-3f371b5b7360', N'73.23.78.107', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-07-19T05:24:37.707' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11178, N'a3ab47c5-6604-689b-439a-26476f37324b', N'42.108.196.93', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-08-05T20:07:30.637' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11179, N'a3ab47c5-6604-689b-439a-26476f37324b', N'42.108.196.93', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-08-05T20:07:32.773' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11180, N'a3ab47c5-6604-689b-439a-26476f37324b', N'42.108.196.93', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-08-05T20:07:36.673' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11181, N'a3ab47c5-6604-689b-439a-26476f37324b', N'42.108.196.93', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-08-05T20:07:38.033' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11182, N'20988b51-5228-e570-98de-57aa985f3bea', N'122.177.105.165', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-08-09T08:27:53.170' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11183, N'20988b51-5228-e570-98de-57aa985f3bea', N'122.177.105.165', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-08-09T08:27:56.230' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11184, N'20988b51-5228-e570-98de-57aa985f3bea', N'122.177.105.165', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-08-09T08:28:02.050' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11185, N'20988b51-5228-e570-98de-57aa985f3bea', N'122.177.105.165', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=22222222', N'Admin', N'1', CAST(N'2022-08-09T08:28:15.313' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11186, N'20988b51-5228-e570-98de-57aa985f3bea', N'122.177.105.165', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-08-09T08:28:22.067' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11187, N'20988b51-5228-e570-98de-57aa985f3bea', N'122.177.105.165', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-08-09T08:28:34.490' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11188, N'20988b51-5228-e570-98de-57aa985f3bea', N'122.177.105.165', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-08-09T08:28:35.020' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11189, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-08-25T15:39:42.643' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11190, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-08-25T15:39:43.737' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11191, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-08-25T15:39:51.320' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11192, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-08-25T15:40:04.990' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11193, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-08-25T15:40:07.003' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11194, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-08-25T15:40:54.617' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11195, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-08-25T15:40:55.153' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11196, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-08-25T15:41:05.900' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11197, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-08-25T15:42:12.380' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11198, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-08-25T15:42:12.850' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11199, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-08-25T15:42:48.637' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11200, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-08-25T15:53:10.623' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11201, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-08-25T15:53:10.860' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11202, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-08-25T15:53:36.423' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11203, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-08-25T15:54:11.297' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11204, N'1d377d14-cc27-f150-7c9e-0d96b1171919', N'68.45.239.245', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-08-25T15:54:30.240' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11205, N'85e80082-39de-c756-8b1d-4d11c202e8f0', N'68.45.239.245', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-08-25T16:53:55.157' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11206, N'928571fb-2301-e31f-dc99-1cb1de32dc20', N'68.45.239.245', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/home/SignIn', N'Admin', N'1', CAST(N'2022-08-25T16:54:28.160' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11207, N'928571fb-2301-e31f-dc99-1cb1de32dc20', N'68.45.239.245', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-08-25T16:54:28.430' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11208, N'928571fb-2301-e31f-dc99-1cb1de32dc20', N'68.45.239.245', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-08-25T16:54:56.850' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11209, N'ae60454f-db4d-dfb5-0d0c-848e2aab2026', N'68.45.239.245', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-08-25T17:15:33.793' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11210, N'5b7428da-d220-256b-a4cd-987e8d92b63f', N'68.45.239.245', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin', N'Admin', N'1', CAST(N'2022-08-25T17:15:39.143' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11211, N'5b7428da-d220-256b-a4cd-987e8d92b63f', N'68.45.239.245', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-08-25T17:15:39.440' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11212, N'5b7428da-d220-256b-a4cd-987e8d92b63f', N'68.45.239.245', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-08-25T17:15:40.660' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11213, N'5b7428da-d220-256b-a4cd-987e8d92b63f', N'68.45.239.245', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-08-25T17:16:03.083' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11214, N'5b7428da-d220-256b-a4cd-987e8d92b63f', N'68.45.239.245', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-08-25T17:16:04.013' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11215, N'5b7428da-d220-256b-a4cd-987e8d92b63f', N'68.45.239.245', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-08-25T17:16:04.150' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11216, N'5b7428da-d220-256b-a4cd-987e8d92b63f', N'68.45.239.245', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-08-25T17:16:06.670' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11217, N'634baffe-52d6-6cf3-543b-a3928b7dd658', N'122.169.37.171', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-08-26T05:45:03.990' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11218, N'634baffe-52d6-6cf3-543b-a3928b7dd658', N'122.169.37.171', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-08-26T05:45:05.800' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11219, N'634baffe-52d6-6cf3-543b-a3928b7dd658', N'122.169.37.171', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-08-26T05:45:07.933' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11220, N'634baffe-52d6-6cf3-543b-a3928b7dd658', N'122.169.37.171', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-08-26T05:45:09.773' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11221, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://10.100.1.47/', N'Admin', N'1', CAST(N'2022-09-09T00:32:00.893' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11222, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://10.100.1.47/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-09T00:32:01.493' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11223, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://10.100.1.47/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-09T00:32:40.550' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11224, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://10.100.1.47/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-09-09T00:32:42.073' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11225, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://10.100.1.47/admin/representative/index', N'Admin', N'1', CAST(N'2022-09-09T00:32:44.470' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11226, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://10.100.1.47/admin/home/index', N'Admin', N'1', CAST(N'2022-09-09T00:32:44.613' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11227, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://10.100.1.47/admin/home/index', N'Admin', N'1', CAST(N'2022-09-09T00:38:33.820' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11228, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://10.100.1.47/admin/transection/detail?ticketNo=22222222', N'Admin', N'1', CAST(N'2022-09-09T00:41:53.910' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11229, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://10.100.1.47/admin/home/index', N'Admin', N'1', CAST(N'2022-09-09T00:41:54.200' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11230, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://10.100.1.47/admin/home/index', N'Admin', N'1', CAST(N'2022-09-09T00:44:57.083' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11231, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://10.100.1.47/admin/transection/detail?ticketNo=22222222', N'Admin', N'1', CAST(N'2022-09-09T00:47:51.067' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11232, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://10.100.1.47/admin/home/index', N'Admin', N'1', CAST(N'2022-09-09T00:47:51.287' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11233, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://10.100.1.47/admin/home/index', N'Admin', N'1', CAST(N'2022-09-09T00:48:02.013' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11234, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://10.100.1.47/admin/transection/detail?ticketNo=22222222', N'Admin', N'1', CAST(N'2022-09-09T00:55:35.997' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11235, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://10.100.1.47/admin/home/index', N'Admin', N'1', CAST(N'2022-09-09T00:55:36.203' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11236, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://10.100.1.47/admin/home/index', N'Admin', N'1', CAST(N'2022-09-09T01:15:15.087' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11237, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://10.100.1.47/admin/home/index', N'Admin', N'1', CAST(N'2022-09-09T01:15:15.293' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11238, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://10.100.1.47/admin/home/index', N'Admin', N'1', CAST(N'2022-09-09T01:15:16.343' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11239, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://10.100.1.47/admin/home/index', N'Admin', N'1', CAST(N'2022-09-09T01:15:16.483' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11240, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://10.100.1.47/admin/home/index', N'Admin', N'1', CAST(N'2022-09-09T01:15:17.433' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11241, N'cf461779-2ca8-981a-ff9b-18cb831d648a', N'10.12.51.3', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://10.100.1.47/admin/home/index', N'Admin', N'1', CAST(N'2022-09-09T01:15:17.693' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11242, N'd9b16782-1084-c255-cf6e-2850e977f5e9', N'122.170.168.16', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-09-12T09:57:50.263' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11243, N'd9b16782-1084-c255-cf6e-2850e977f5e9', N'122.170.168.16', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-12T09:57:54.680' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11244, N'd9b16782-1084-c255-cf6e-2850e977f5e9', N'122.170.168.16', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-12T09:58:03.847' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11245, N'a9d22c12-0256-7d9f-d4a9-745af424cf00', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-12T09:58:50.337' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11246, N'a9d22c12-0256-7d9f-d4a9-745af424cf00', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-12T09:59:03.413' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11247, N'd9b16782-1084-c255-cf6e-2850e977f5e9', N'122.170.168.16', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=22222222', N'Admin', N'1', CAST(N'2022-09-12T09:59:22.890' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11248, N'd9b16782-1084-c255-cf6e-2850e977f5e9', N'122.170.168.16', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=22222222', N'Admin', N'1', CAST(N'2022-09-12T09:59:22.883' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11249, N'd9b16782-1084-c255-cf6e-2850e977f5e9', N'122.170.168.16', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-12T09:59:24.013' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11250, N'd9b16782-1084-c255-cf6e-2850e977f5e9', N'122.170.168.16', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-12T09:59:26.963' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11251, N'0c75e7fd-9307-0438-03c0-0f1bf1e65590', N'68.50.174.11', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-09-12T12:22:15.690' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11252, N'0c75e7fd-9307-0438-03c0-0f1bf1e65590', N'68.50.174.11', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-12T12:22:17.413' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11253, N'b7c881e7-a2d7-b609-9711-daa2e11b0611', N'68.45.239.245', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-09-12T15:51:33.840' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11254, N'b7c881e7-a2d7-b609-9711-daa2e11b0611', N'68.45.239.245', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-12T15:51:35.540' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11255, N'b7c881e7-a2d7-b609-9711-daa2e11b0611', N'68.45.239.245', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-12T15:51:50.050' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11256, N'b7c881e7-a2d7-b609-9711-daa2e11b0611', N'68.45.239.245', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-09-12T15:51:51.613' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11257, N'b7c881e7-a2d7-b609-9711-daa2e11b0611', N'68.45.239.245', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-09-12T15:51:56.070' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11258, N'b7c881e7-a2d7-b609-9711-daa2e11b0611', N'68.45.239.245', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-12T15:51:56.180' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11259, N'b7c881e7-a2d7-b609-9711-daa2e11b0611', N'68.45.239.245', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-12T15:51:59.470' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11260, N'308a5545-cc71-ed87-70d7-6852ef948466', N'50.121.88.67', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-09-13T10:26:39.710' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11261, N'308a5545-cc71-ed87-70d7-6852ef948466', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-13T10:26:49.827' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11262, N'308a5545-cc71-ed87-70d7-6852ef948466', N'50.121.88.67', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/Admin/Home/logout', N'Admin', N'1', CAST(N'2022-09-13T10:27:22.687' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11263, N'308a5545-cc71-ed87-70d7-6852ef948466', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-13T10:27:24.033' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11264, N'308a5545-cc71-ed87-70d7-6852ef948466', N'50.121.88.67', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-13T10:27:27.373' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11265, N'308a5545-cc71-ed87-70d7-6852ef948466', N'50.121.88.67', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-09-13T10:27:30.623' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11266, N'308a5545-cc71-ed87-70d7-6852ef948466', N'50.121.88.67', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-09-13T10:27:39.210' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11267, N'308a5545-cc71-ed87-70d7-6852ef948466', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-13T10:27:40.810' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11268, N'308a5545-cc71-ed87-70d7-6852ef948466', N'50.121.88.67', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-13T10:27:42.533' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11269, N'56198e21-6cba-3554-2c93-b9297b5df27e', N'103.100.16.251', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-09-14T02:09:37.787' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11270, N'56198e21-6cba-3554-2c93-b9297b5df27e', N'103.100.16.251', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T02:09:41.380' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11271, N'0ea2246a-ba81-eefb-3793-5c7f2b2c5672', N'103.100.16.251', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T03:38:10.293' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11272, N'0617f94b-cc88-917f-5fad-2863b2cb039a', N'203.189.249.52', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-09-14T03:58:35.787' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11273, N'0617f94b-cc88-917f-5fad-2863b2cb039a', N'203.189.249.52', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T03:58:38.547' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11274, N'0617f94b-cc88-917f-5fad-2863b2cb039a', N'203.189.249.52', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T03:58:54.720' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11275, N'5c28b8fa-67b3-ee70-4215-011afeec5463', N'27.4.152.162', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-09-14T04:22:58.277' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11276, N'5c28b8fa-67b3-ee70-4215-011afeec5463', N'27.4.152.162', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T04:23:00.697' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11277, N'5c28b8fa-67b3-ee70-4215-011afeec5463', N'27.4.152.162', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T04:23:27.593' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11278, N'5c28b8fa-67b3-ee70-4215-011afeec5463', N'27.4.152.162', N'/Admin/Transportation/GetCommodityByLocation?locationId=1', NULL, NULL, N'A', N'Transportation', N'GetCommodityByLocation', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-09-14T04:23:31.477' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11279, N'5c28b8fa-67b3-ee70-4215-011afeec5463', N'27.4.152.162', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-09-14T04:24:05.700' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11280, N'5c28b8fa-67b3-ee70-4215-011afeec5463', N'27.4.152.162', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-09-14T04:24:14.950' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11281, N'5c28b8fa-67b3-ee70-4215-011afeec5463', N'27.4.152.162', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-14T04:24:15.507' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11282, N'5c28b8fa-67b3-ee70-4215-011afeec5463', N'27.4.152.162', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-14T04:24:17.723' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11283, N'15dc87a3-1c38-48d6-3dad-32aea1d43e98', N'122.169.91.85', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/home/login', N'Admin', N'1', CAST(N'2022-09-14T04:30:09.967' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11284, N'15dc87a3-1c38-48d6-3dad-32aea1d43e98', N'122.169.91.85', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T04:30:11.510' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11285, N'15dc87a3-1c38-48d6-3dad-32aea1d43e98', N'122.169.91.85', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T04:31:57.537' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11286, N'15dc87a3-1c38-48d6-3dad-32aea1d43e98', N'122.169.91.85', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-09-14T04:32:01.973' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11287, N'15dc87a3-1c38-48d6-3dad-32aea1d43e98', N'122.169.91.85', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-14T04:32:02.783' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11288, N'15dc87a3-1c38-48d6-3dad-32aea1d43e98', N'122.169.91.85', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-14T04:32:05.377' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11289, N'43cb9640-0414-cc63-64c9-5bfbf8757af0', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T05:20:09.910' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11290, N'03719ae2-858f-b8da-d20b-cd799e992850', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T05:28:15.633' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11291, N'974feaf1-9a96-1cc9-08d1-9e784ba5f986', N'50.121.88.67', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-09-14T10:14:34.260' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11292, N'974feaf1-9a96-1cc9-08d1-9e784ba5f986', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T10:14:36.833' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11293, N'488cbab9-6deb-1503-df9e-d9c8b86ffa08', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T11:15:09.530' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11294, N'488cbab9-6deb-1503-df9e-d9c8b86ffa08', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T11:15:14.020' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11295, N'488cbab9-6deb-1503-df9e-d9c8b86ffa08', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/Order/detail', N'Admin', N'1', CAST(N'2022-09-14T11:15:33.810' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11296, N'488cbab9-6deb-1503-df9e-d9c8b86ffa08', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T11:15:35.610' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11297, N'c063fa8a-351b-f733-5dd5-3a1e73018cfb', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T11:18:45.993' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11298, N'c063fa8a-351b-f733-5dd5-3a1e73018cfb', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T11:18:49.467' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11299, N'c063fa8a-351b-f733-5dd5-3a1e73018cfb', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', N'1', CAST(N'2022-09-14T11:19:49.417' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11300, N'c063fa8a-351b-f733-5dd5-3a1e73018cfb', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T11:20:01.620' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11301, N'482d8db7-d4c5-50a9-dca9-d2eb21aad6d2', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T11:36:09.027' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11302, N'482d8db7-d4c5-50a9-dca9-d2eb21aad6d2', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T11:36:12.130' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11303, N'8810273b-c664-7d0c-02a1-15113335485d', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T11:40:16.430' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11304, N'8810273b-c664-7d0c-02a1-15113335485d', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T11:40:19.907' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11305, N'25be478d-0156-7b98-c388-ebf711dca4d8', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T11:47:29.937' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11306, N'25be478d-0156-7b98-c388-ebf711dca4d8', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T11:47:35.940' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11307, N'5b90f774-719f-060f-dc32-26e7f7a029c1', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T11:51:14.630' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11308, N'5b90f774-719f-060f-dc32-26e7f7a029c1', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T11:51:17.773' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11309, N'5b90f774-719f-060f-dc32-26e7f7a029c1', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-14T11:51:20.793' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11310, N'bd088c8b-a5cb-93c5-f6c9-bcdc083e6469', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T11:54:40.533' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11311, N'bd088c8b-a5cb-93c5-f6c9-bcdc083e6469', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T11:54:44.247' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11312, N'a41b20ff-4da8-9a29-ea7b-3b3b5a571b2f', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T12:01:45.237' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11313, N'a41b20ff-4da8-9a29-ea7b-3b3b5a571b2f', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T12:01:49.407' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11314, N'a7799378-4167-c096-53c8-409ab9e6554d', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T12:24:21.063' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11315, N'a7799378-4167-c096-53c8-409ab9e6554d', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T12:24:46.673' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11316, N'6aacbf68-ea6f-899a-dc60-02f49911d3e9', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T12:30:15.543' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11317, N'6aacbf68-ea6f-899a-dc60-02f49911d3e9', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T12:30:19.597' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11318, N'4d2c3eaa-06e1-cb7b-fad6-cfe536411227', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T12:44:10.920' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11319, N'4d2c3eaa-06e1-cb7b-fad6-cfe536411227', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T12:44:20.497' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11320, N'20f50238-6586-b3f1-ee32-91ceeb559046', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T16:35:10.020' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11321, N'20f50238-6586-b3f1-ee32-91ceeb559046', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T16:35:11.233' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11322, N'3c112dfd-7304-081e-6507-cfca7e2516cf', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T16:40:29.450' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11323, N'3c112dfd-7304-081e-6507-cfca7e2516cf', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T16:40:29.943' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11324, N'2dc3e407-854e-dc57-3658-cd2f79437c76', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T16:44:07.283' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11325, N'2dc3e407-854e-dc57-3658-cd2f79437c76', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T16:44:08.007' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11326, N'3472cadb-23d9-3c44-4136-fa334c9ddfed', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-14T16:54:45.250' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11327, N'ced2cca9-159d-979f-74a6-80a2c3a52989', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T17:28:50.257' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11328, N'ced2cca9-159d-979f-74a6-80a2c3a52989', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T17:28:51.080' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11329, N'e021c973-f10f-03af-9739-1629bb323880', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T17:32:10.733' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11330, N'e021c973-f10f-03af-9739-1629bb323880', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T17:32:11.173' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11331, N'ce18bcad-99c4-a74e-3d16-eaa1eae95c97', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T17:36:30.483' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11332, N'ce18bcad-99c4-a74e-3d16-eaa1eae95c97', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T17:36:31.047' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11333, N'4baf9baf-aabb-a1b4-fe9b-4748e74d1d65', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T17:47:51.807' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11334, N'4baf9baf-aabb-a1b4-fe9b-4748e74d1d65', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T17:47:52.493' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11335, N'11fcb9d5-aa0a-6e06-ed8b-a8bf4b030bb9', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T17:52:15.130' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11336, N'11fcb9d5-aa0a-6e06-ed8b-a8bf4b030bb9', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T17:52:15.603' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11337, N'715f2dfd-ad0f-c6e1-87e0-19430aa881ea', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T17:56:44.553' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11338, N'715f2dfd-ad0f-c6e1-87e0-19430aa881ea', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T17:56:45.310' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11339, N'715f2dfd-ad0f-c6e1-87e0-19430aa881ea', N'::1', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T17:56:47.593' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11340, N'715f2dfd-ad0f-c6e1-87e0-19430aa881ea', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T17:57:09.217' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11341, N'b000856d-6bdd-6460-d048-0ff572b8aa2f', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T17:58:55.537' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11342, N'b000856d-6bdd-6460-d048-0ff572b8aa2f', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T17:58:56.010' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11343, N'b000856d-6bdd-6460-d048-0ff572b8aa2f', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/Order/detail?OrderNo=PO%200123232', N'Admin', N'1', CAST(N'2022-09-14T17:59:17.633' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11344, N'b000856d-6bdd-6460-d048-0ff572b8aa2f', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-14T17:59:17.823' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11345, N'b000856d-6bdd-6460-d048-0ff572b8aa2f', N'::1', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-14T17:59:19.983' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11346, N'ee30cd06-d68a-214a-ac89-4a02038c3e88', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:01:30.507' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11347, N'ee30cd06-d68a-214a-ac89-4a02038c3e88', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:01:31.300' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11348, N'73eebc44-a909-f1eb-7904-112a3ad5d1fd', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:02:50.960' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11349, N'73eebc44-a909-f1eb-7904-112a3ad5d1fd', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:02:51.500' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11350, N'73eebc44-a909-f1eb-7904-112a3ad5d1fd', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:02:59.830' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11351, N'73eebc44-a909-f1eb-7904-112a3ad5d1fd', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:03:00.070' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11352, N'8f679617-7ede-e45f-cecf-d8412f611aee', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:06:26.463' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11353, N'8f679617-7ede-e45f-cecf-d8412f611aee', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:06:26.933' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11354, N'b3575587-a2f3-4e4b-a9c9-6b0b7e16e27f', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:08:28.413' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11355, N'b3575587-a2f3-4e4b-a9c9-6b0b7e16e27f', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:08:29.237' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11356, N'571cd46d-4ebc-46a4-e133-1e70b7165a9f', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:11:02.033' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11357, N'571cd46d-4ebc-46a4-e133-1e70b7165a9f', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:11:02.653' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11358, N'02448a52-e72d-132a-4abf-87fcd0ab6960', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:14:05.830' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11359, N'02448a52-e72d-132a-4abf-87fcd0ab6960', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:14:06.393' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11360, N'693ebf6a-5b32-bd3b-0222-abed8c572a81', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:25:58.933' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11361, N'693ebf6a-5b32-bd3b-0222-abed8c572a81', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:25:59.777' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11362, N'65530573-0db4-110a-3326-07e4ef6d264f', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:28:15.117' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11363, N'65530573-0db4-110a-3326-07e4ef6d264f', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:28:15.560' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11364, N'f97623f3-a2e7-b7a3-0427-8e6661392a25', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:30:48.317' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11365, N'f97623f3-a2e7-b7a3-0427-8e6661392a25', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:30:48.763' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11366, N'f9e42375-97b8-1cbb-0572-aceb90bf8051', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:33:25.033' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11367, N'f9e42375-97b8-1cbb-0572-aceb90bf8051', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:33:25.817' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11368, N'e6529d81-4770-6aaa-e312-84168675eb73', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:35:23.930' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11369, N'e6529d81-4770-6aaa-e312-84168675eb73', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:35:24.497' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11370, N'8c57a6ef-995c-f3b9-a99c-53c18e280d9a', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:38:52.607' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11371, N'8c57a6ef-995c-f3b9-a99c-53c18e280d9a', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:38:53.030' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11372, N'168447fc-66a1-2c7e-0211-e08ee6297879', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:43:04.260' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11373, N'168447fc-66a1-2c7e-0211-e08ee6297879', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:43:04.700' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11374, N'c13bacb7-fcbd-5936-a9ab-9740096d8ae1', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:46:33.500' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11375, N'c13bacb7-fcbd-5936-a9ab-9740096d8ae1', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:46:34.050' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11376, N'7fa74874-e0ce-f099-89cb-cc94ab1881c5', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:48:24.087' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11377, N'7fa74874-e0ce-f099-89cb-cc94ab1881c5', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:48:24.527' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11378, N'c42f20bb-f165-07d4-d81b-fe80ed4d39cd', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T18:58:57.073' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11379, N'c42f20bb-f165-07d4-d81b-fe80ed4d39cd', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T18:58:57.840' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11380, N'c42f20bb-f165-07d4-d81b-fe80ed4d39cd', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-14T19:01:55.650' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11381, N'c42f20bb-f165-07d4-d81b-fe80ed4d39cd', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-09-14T19:01:56.973' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11382, N'c42f20bb-f165-07d4-d81b-fe80ed4d39cd', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-14T19:01:57.180' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11383, N'c42f20bb-f165-07d4-d81b-fe80ed4d39cd', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/Order/detail?OrderNo=PO%200123233', N'Admin', N'1', CAST(N'2022-09-14T19:11:25.340' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11384, N'c42f20bb-f165-07d4-d81b-fe80ed4d39cd', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-09-14T19:11:28.407' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11385, N'c42f20bb-f165-07d4-d81b-fe80ed4d39cd', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-14T19:11:28.977' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11386, N'c42f20bb-f165-07d4-d81b-fe80ed4d39cd', N'::1', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-14T19:11:31.340' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11387, N'0ffd75b7-b400-173c-6eff-f347c5d8040c', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T19:36:16.573' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11388, N'0ffd75b7-b400-173c-6eff-f347c5d8040c', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T19:36:17.407' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11389, N'a6b44d64-e13e-000b-723b-57af538e47ba', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T19:37:57.040' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11390, N'a6b44d64-e13e-000b-723b-57af538e47ba', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T19:37:57.477' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11391, N'f5543a4d-48ae-b787-738f-69919d825dad', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T19:43:01.820' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11392, N'f5543a4d-48ae-b787-738f-69919d825dad', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T19:43:02.277' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11393, N'099458e6-27c0-9190-4b3a-d26ac97491c2', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T19:59:15.257' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11394, N'099458e6-27c0-9190-4b3a-d26ac97491c2', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T19:59:16.010' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11395, N'5af0b1a7-e2ef-4aa1-b2da-108092537a4c', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T20:05:01.493' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11396, N'5af0b1a7-e2ef-4aa1-b2da-108092537a4c', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T20:05:02.363' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11397, N'9677e0cb-dd0c-de26-2770-56af2e918bd5', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T20:12:24.180' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11398, N'9677e0cb-dd0c-de26-2770-56af2e918bd5', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T20:12:24.983' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11399, N'5156cde8-4b8b-8f14-2f94-ed8036cd60a6', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T20:14:45.120' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11400, N'5156cde8-4b8b-8f14-2f94-ed8036cd60a6', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T20:14:45.680' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11401, N'93805438-54cd-125a-3cc0-77606ff01c40', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T20:16:32.660' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11402, N'93805438-54cd-125a-3cc0-77606ff01c40', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T20:16:33.333' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11403, N'93805438-54cd-125a-3cc0-77606ff01c40', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/Order/detail?OrderNo=PO%200123232', N'Admin', N'1', CAST(N'2022-09-14T20:18:42.807' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11404, N'93805438-54cd-125a-3cc0-77606ff01c40', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-14T20:18:43.073' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11405, N'6eb4f62e-de19-93c9-e54e-24f4b158af63', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T20:25:56.847' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11406, N'6eb4f62e-de19-93c9-e54e-24f4b158af63', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T20:25:57.600' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11407, N'f694db3e-b0c7-32be-197d-c04b76c4379e', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T20:27:38.120' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11408, N'f694db3e-b0c7-32be-197d-c04b76c4379e', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T20:27:38.677' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11409, N'46843598-2ca0-6235-ff62-64b4446dcc59', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-14T20:40:08.587' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11410, N'46843598-2ca0-6235-ff62-64b4446dcc59', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-14T20:40:09.503' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11411, N'8105d49b-b3d8-77d3-11fd-86d9a433dcfd', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-15T05:34:47.507' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11412, N'8105d49b-b3d8-77d3-11fd-86d9a433dcfd', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T05:34:48.603' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11413, N'4cc30ff4-33ad-ba5c-8e4a-a6339316328e', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-15T05:49:34.260' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11414, N'4cc30ff4-33ad-ba5c-8e4a-a6339316328e', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T05:49:34.883' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11415, N'a01097de-0f36-3722-07a8-4e07692a6580', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-15T07:45:30.473' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11416, N'a01097de-0f36-3722-07a8-4e07692a6580', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T07:45:33.113' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11417, N'a01097de-0f36-3722-07a8-4e07692a6580', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-15T07:47:12.013' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11418, N'a01097de-0f36-3722-07a8-4e07692a6580', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T07:47:13.487' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11419, N'a01097de-0f36-3722-07a8-4e07692a6580', N'127.0.0.1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-15T07:48:48.217' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11420, N'a01097de-0f36-3722-07a8-4e07692a6580', N'127.0.0.1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T07:48:54.363' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11421, N'072c0e8f-e113-8230-245c-365023a12d28', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-15T09:02:48.577' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11422, N'04549a9e-fbb8-16e1-be23-94e516373aa9', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-15T09:28:26.367' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11423, N'04549a9e-fbb8-16e1-be23-94e516373aa9', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T09:28:40.730' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11424, N'5eeb42d4-c0fe-ddc5-63cb-300ed8f038a4', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-15T09:33:37.530' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11425, N'5eeb42d4-c0fe-ddc5-63cb-300ed8f038a4', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T09:33:40.487' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11426, N'5eeb42d4-c0fe-ddc5-63cb-300ed8f038a4', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', NULL, N'Admin', N'1', CAST(N'2022-09-15T09:38:04.473' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11427, N'5eeb42d4-c0fe-ddc5-63cb-300ed8f038a4', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T09:38:06.267' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11428, N'5eeb42d4-c0fe-ddc5-63cb-300ed8f038a4', N'::1', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T09:43:04.600' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11429, N'5eeb42d4-c0fe-ddc5-63cb-300ed8f038a4', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-09-15T09:43:12.757' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11430, N'5eeb42d4-c0fe-ddc5-63cb-300ed8f038a4', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T09:43:17.423' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11431, N'5eeb42d4-c0fe-ddc5-63cb-300ed8f038a4', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-09-15T09:45:40.750' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11432, N'5eeb42d4-c0fe-ddc5-63cb-300ed8f038a4', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T09:45:43.587' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11433, N'5eeb42d4-c0fe-ddc5-63cb-300ed8f038a4', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-09-15T09:46:38.703' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11434, N'5eeb42d4-c0fe-ddc5-63cb-300ed8f038a4', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T09:46:42.947' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11435, N'08d55e89-863d-82e6-dfaa-d49c3452ec79', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-09-15T09:52:41.553' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11436, N'0702af4f-9f8f-c3b9-db54-3697a6bacbc0', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-15T09:55:12.413' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11437, N'0702af4f-9f8f-c3b9-db54-3697a6bacbc0', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T09:55:16.163' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11438, N'0702af4f-9f8f-c3b9-db54-3697a6bacbc0', N'::1', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T10:04:19.987' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11439, N'7bca97c6-bb4f-2dad-61fc-e150944e9eb0', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-15T10:18:00.977' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11440, N'7bca97c6-bb4f-2dad-61fc-e150944e9eb0', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T10:18:04.373' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11441, N'26ee95cb-38fe-6125-f007-cde812d94aac', N'::1', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/', N'Admin', N'1', CAST(N'2022-09-15T10:22:52.390' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11442, N'26ee95cb-38fe-6125-f007-cde812d94aac', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T10:22:56.633' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11443, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-09-15T10:34:24.290' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11444, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T10:34:26.703' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11445, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/detail?OrderNo=PO%200123233', N'Admin', N'1', CAST(N'2022-09-15T10:40:21.613' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11446, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:40:22.277' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11447, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:40:24.153' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11448, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:40:24.177' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11449, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:40:26.540' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11450, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:40:28.253' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11451, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:40:31.733' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11452, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:40:34.260' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11453, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:40:40.767' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11454, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:40:55.310' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11455, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:41:00.140' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11456, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-15T10:41:00.130' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11457, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:41:00.873' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11458, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:41:03.347' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11459, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:41:04.067' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11460, N'559780a1-5d23-ef80-e52f-bea8cea741aa', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:41:06.423' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11461, N'd5955eba-2a11-6a17-1099-d2fb1ca8e38d', N'50.121.88.67', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-09-15T10:57:41.917' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11462, N'd5955eba-2a11-6a17-1099-d2fb1ca8e38d', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T10:57:43.070' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11463, N'd5955eba-2a11-6a17-1099-d2fb1ca8e38d', N'50.121.88.67', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-15T10:57:58.377' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11464, N'd5955eba-2a11-6a17-1099-d2fb1ca8e38d', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:57:59.350' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11465, N'd5955eba-2a11-6a17-1099-d2fb1ca8e38d', N'50.121.88.67', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-15T10:58:04.627' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11466, N'd5955eba-2a11-6a17-1099-d2fb1ca8e38d', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:58:04.890' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11467, N'd5955eba-2a11-6a17-1099-d2fb1ca8e38d', N'50.121.88.67', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:58:21.190' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11468, N'd5955eba-2a11-6a17-1099-d2fb1ca8e38d', N'50.121.88.67', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T10:58:37.893' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11469, N'd5955eba-2a11-6a17-1099-d2fb1ca8e38d', N'50.121.88.67', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/detail?OrderNo=PO%200123233', N'Admin', N'1', CAST(N'2022-09-15T11:00:01.873' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11470, N'd5955eba-2a11-6a17-1099-d2fb1ca8e38d', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T11:00:02.113' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11471, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-09-15T11:55:52.547' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11472, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T11:55:53.123' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11473, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-15T11:56:03.140' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11474, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T11:56:03.363' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11475, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T11:56:04.333' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11476, N'fec58823-1a32-ad48-9b41-337f0999dcf1', N'106.214.126.138', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T11:56:13.860' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11477, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/detail?OrderNo=PO%200123232', N'Admin', N'1', CAST(N'2022-09-15T11:57:20.473' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11478, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T11:57:20.837' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11479, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T11:57:23.757' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11480, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=22222222', N'Admin', N'1', CAST(N'2022-09-15T11:57:26.047' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11481, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-09-15T11:57:28.273' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11482, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/detail?OrderNo=PO%200123233', N'Admin', N'1', CAST(N'2022-09-15T11:57:46.943' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11483, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T11:57:47.203' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11484, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T11:57:48.317' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11485, N'ac4f18a7-a071-513d-636e-f5bc85648370', N'106.214.126.138', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:03:39.170' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11486, N'ac4f18a7-a071-513d-636e-f5bc85648370', N'106.214.126.138', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-15T12:05:33.760' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11487, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-09-15T12:05:47.443' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11488, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T12:05:47.790' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11489, N'0e4241b6-3f2f-57f5-d9cb-7cccb5510faf', N'68.50.174.11', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T12:05:49.240' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11490, N'ac4f18a7-a071-513d-636e-f5bc85648370', N'106.214.126.138', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/home/SignIn', N'Admin', N'1', CAST(N'2022-09-15T12:06:06.510' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11491, N'ac4f18a7-a071-513d-636e-f5bc85648370', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T12:06:07.187' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11492, N'ac4f18a7-a071-513d-636e-f5bc85648370', N'106.214.126.138', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-15T12:06:11.717' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11493, N'ac4f18a7-a071-513d-636e-f5bc85648370', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:06:12.120' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11494, N'ac4f18a7-a071-513d-636e-f5bc85648370', N'106.214.126.138', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:06:13.520' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11495, N'740fbe68-517b-cbec-b533-aa528d997d4e', N'68.50.174.11', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-09-15T12:07:34.813' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11496, N'740fbe68-517b-cbec-b533-aa528d997d4e', N'68.50.174.11', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T12:07:35.097' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11497, N'740fbe68-517b-cbec-b533-aa528d997d4e', N'68.50.174.11', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T12:08:34.243' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11498, N'740fbe68-517b-cbec-b533-aa528d997d4e', N'68.50.174.11', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/detail?OrderNo=PO%200123233', N'Admin', N'1', CAST(N'2022-09-15T12:10:25.043' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11499, N'740fbe68-517b-cbec-b533-aa528d997d4e', N'68.50.174.11', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:10:25.580' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11500, N'ac4f18a7-a071-513d-636e-f5bc85648370', N'106.214.126.138', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/detail?OrderNo=PO%200123233', N'Admin', N'1', CAST(N'2022-09-15T12:10:26.707' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11501, N'ac4f18a7-a071-513d-636e-f5bc85648370', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:10:27.293' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11502, N'740fbe68-517b-cbec-b533-aa528d997d4e', N'68.50.174.11', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:10:27.897' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11503, N'ac4f18a7-a071-513d-636e-f5bc85648370', N'106.214.126.138', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:10:32.197' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11504, N'740fbe68-517b-cbec-b533-aa528d997d4e', N'68.50.174.11', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/detail?OrderNo=PO%200123233', N'Admin', N'1', CAST(N'2022-09-15T12:13:00.640' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11505, N'740fbe68-517b-cbec-b533-aa528d997d4e', N'68.50.174.11', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:13:01.083' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11506, N'ac4f18a7-a071-513d-636e-f5bc85648370', N'106.214.126.138', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/detail?OrderNo=PO%200123233', N'Admin', N'1', CAST(N'2022-09-15T12:13:01.867' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11507, N'ac4f18a7-a071-513d-636e-f5bc85648370', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:13:02.683' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11508, N'740fbe68-517b-cbec-b533-aa528d997d4e', N'68.50.174.11', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:13:08.853' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11509, N'ac4f18a7-a071-513d-636e-f5bc85648370', N'106.214.126.138', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/detail?OrderNo=PO%200123233', N'Admin', N'1', CAST(N'2022-09-15T12:13:17.080' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11510, N'ac4f18a7-a071-513d-636e-f5bc85648370', N'106.214.126.138', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:13:17.620' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11511, N'740fbe68-517b-cbec-b533-aa528d997d4e', N'68.50.174.11', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/detail?OrderNo=PO%200123233', N'Admin', N'1', CAST(N'2022-09-15T12:14:53.433' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11512, N'740fbe68-517b-cbec-b533-aa528d997d4e', N'68.50.174.11', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:14:53.753' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11513, N'740fbe68-517b-cbec-b533-aa528d997d4e', N'68.50.174.11', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:14:54.920' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11514, N'a2dfbbbd-eaf3-4fbb-40d2-02b842e46ccd', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-15T12:21:58.717' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11515, N'a2dfbbbd-eaf3-4fbb-40d2-02b842e46ccd', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:22:01.683' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11516, N'a2dfbbbd-eaf3-4fbb-40d2-02b842e46ccd', N'::1', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:22:07.083' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11517, N'aab837fa-ba41-142b-48ad-4599d08dee9f', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-15T12:41:02.873' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11518, N'aab837fa-ba41-142b-48ad-4599d08dee9f', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:41:04.990' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11519, N'aab837fa-ba41-142b-48ad-4599d08dee9f', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-15T12:43:52.743' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11520, N'aab837fa-ba41-142b-48ad-4599d08dee9f', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:43:54.490' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11521, N'aab837fa-ba41-142b-48ad-4599d08dee9f', N'::1', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:43:58.003' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11522, N'9a8899be-9c4e-42c6-ff67-d0bd1bdb84b4', N'68.50.174.11', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T12:53:36.447' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11523, N'271a0d10-b626-d21d-a5dc-7f9b6979d015', N'68.50.174.11', N'/Admin/Home/Index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/', N'Admin', N'1', CAST(N'2022-09-15T12:53:42.060' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11524, N'271a0d10-b626-d21d-a5dc-7f9b6979d015', N'68.50.174.11', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/Admin/Home/Index', N'Admin', N'1', CAST(N'2022-09-15T12:53:42.833' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11525, N'271a0d10-b626-d21d-a5dc-7f9b6979d015', N'68.50.174.11', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-15T12:53:54.610' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11526, N'271a0d10-b626-d21d-a5dc-7f9b6979d015', N'68.50.174.11', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T12:53:56.187' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11527, N'e3cc5fce-1314-d989-0cc5-8e5a5838358a', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/Order/detail?OrderNo=PO%200123233', N'Admin', N'1', CAST(N'2022-09-15T13:01:32.950' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11528, N'e3cc5fce-1314-d989-0cc5-8e5a5838358a', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T13:01:39.343' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11529, N'e3cc5fce-1314-d989-0cc5-8e5a5838358a', N'::1', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T13:01:46.443' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11530, N'e3cc5fce-1314-d989-0cc5-8e5a5838358a', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/admin/Order/detail?OrderNo=PO%200123233', N'Admin', N'1', CAST(N'2022-09-15T13:11:19.970' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11531, N'e3cc5fce-1314-d989-0cc5-8e5a5838358a', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T13:11:24.217' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11532, N'e3cc5fce-1314-d989-0cc5-8e5a5838358a', N'::1', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-15T13:11:27.030' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11533, N'edac1c1e-a00d-23ba-2476-602fa5a1a3ef', N'50.121.88.67', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/order/index', N'Admin', N'1', CAST(N'2022-09-16T09:38:15.277' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11534, N'edac1c1e-a00d-23ba-2476-602fa5a1a3ef', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T09:38:15.647' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11535, N'edac1c1e-a00d-23ba-2476-602fa5a1a3ef', N'50.121.88.67', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T09:38:18.703' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11536, N'edac1c1e-a00d-23ba-2476-602fa5a1a3ef', N'50.121.88.67', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-09-16T09:38:31.650' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11537, N'edac1c1e-a00d-23ba-2476-602fa5a1a3ef', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T09:38:31.970' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11538, N'edac1c1e-a00d-23ba-2476-602fa5a1a3ef', N'50.121.88.67', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-16T09:44:09.543' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11539, N'edac1c1e-a00d-23ba-2476-602fa5a1a3ef', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T09:44:09.963' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11540, N'edac1c1e-a00d-23ba-2476-602fa5a1a3ef', N'50.121.88.67', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T09:49:00.583' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11541, N'edac1c1e-a00d-23ba-2476-602fa5a1a3ef', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T09:49:00.847' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11542, N'edac1c1e-a00d-23ba-2476-602fa5a1a3ef', N'50.121.88.67', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T09:49:02.170' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11543, N'edac1c1e-a00d-23ba-2476-602fa5a1a3ef', N'50.121.88.67', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/detail?OrderNo=PO%200123232', N'Admin', N'1', CAST(N'2022-09-16T09:51:23.647' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11544, N'edac1c1e-a00d-23ba-2476-602fa5a1a3ef', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T09:51:23.863' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11545, N'48710d66-21aa-2019-2e27-60d1184cf853', N'50.121.88.67', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/detail?OrderNo=PO%200123232', N'Admin', N'1', CAST(N'2022-09-16T10:35:41.087' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11546, N'48710d66-21aa-2019-2e27-60d1184cf853', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T10:35:41.940' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11547, N'055aada1-db7a-d31a-ba95-ee634ad01fda', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-16T10:35:53.220' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11548, N'ff4f834a-1110-2b1b-e868-3a2acb4afb73', N'::1', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'https://localhost:44397/Admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-16T10:39:36.000' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11549, N'ff4f834a-1110-2b1b-e868-3a2acb4afb73', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T10:39:42.157' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11550, N'ff4f834a-1110-2b1b-e868-3a2acb4afb73', N'::1', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T10:41:45.097' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11551, N'ff4f834a-1110-2b1b-e868-3a2acb4afb73', N'::1', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T10:43:18.627' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11552, N'48710d66-21aa-2019-2e27-60d1184cf853', N'50.121.88.67', N'/admin/transection/detail?ticketNo=22222222', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T10:48:35.947' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11553, N'48710d66-21aa-2019-2e27-60d1184cf853', N'50.121.88.67', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/Admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-16T10:49:25.213' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11554, N'48710d66-21aa-2019-2e27-60d1184cf853', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T10:49:25.447' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11555, N'48710d66-21aa-2019-2e27-60d1184cf853', N'50.121.88.67', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-16T10:50:04.347' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11556, N'48710d66-21aa-2019-2e27-60d1184cf853', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T10:50:04.503' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11557, N'48710d66-21aa-2019-2e27-60d1184cf853', N'50.121.88.67', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T10:50:07.363' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11558, N'ff50af81-8efe-979c-40c1-e0e39e4e1d08', N'::1', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'https://localhost:44397/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T10:57:03.737' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11559, N'2ea4c679-9240-e795-f229-fb0ee8d63c0c', N'110.226.23.100', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/detail?OrderNo=PO%200123232', N'Admin', N'1', CAST(N'2022-09-16T11:03:17.873' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11560, N'28322b8b-8d42-2ddc-9da6-3e04320a6910', N'110.226.23.100', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/Admin/Order/Index', N'Admin', N'1', CAST(N'2022-09-16T11:04:21.473' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11561, N'28322b8b-8d42-2ddc-9da6-3e04320a6910', N'110.226.23.100', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T11:04:22.690' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11562, N'28322b8b-8d42-2ddc-9da6-3e04320a6910', N'110.226.23.100', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T11:05:44.573' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11563, N'36a59701-fa9b-172f-0997-8766a287e6a5', N'50.121.88.67', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/Order/detail?OrderNo=PO%200123232', N'Admin', N'1', CAST(N'2022-09-16T11:05:59.433' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11564, N'36a59701-fa9b-172f-0997-8766a287e6a5', N'50.121.88.67', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T11:05:59.677' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11565, N'36a59701-fa9b-172f-0997-8766a287e6a5', N'50.121.88.67', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T11:06:04.650' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11566, N'36a59701-fa9b-172f-0997-8766a287e6a5', N'50.121.88.67', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/transportation/detail', N'Admin', N'1', CAST(N'2022-09-16T11:06:06.890' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11567, N'36a59701-fa9b-172f-0997-8766a287e6a5', N'50.121.88.67', N'/admin/representative/index', NULL, NULL, N'A', N'Representative', N'Index', N'http://mmstest.metalx.net/admin/representative/index', N'Admin', N'1', CAST(N'2022-09-16T11:06:14.187' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11568, N'28322b8b-8d42-2ddc-9da6-3e04320a6910', N'110.226.23.100', N'/admin/transactions/index', NULL, NULL, N'A', N'Home', N'Index', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-09-16T11:06:23.607' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11569, N'28322b8b-8d42-2ddc-9da6-3e04320a6910', N'110.226.23.100', N'/admin/transactions/getTransections', NULL, NULL, N'A', N'Home', N'getTransections', N'http://mmstest.metalx.net/admin/home/index', N'Admin', N'1', CAST(N'2022-09-16T11:06:24.130' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11570, N'791d95c6-6201-7243-0481-51fdd4cfee95', N'110.226.23.100', N'/admin/transportation/detail', NULL, NULL, N'A', N'Transportation', N'detail', N'http://mmstest.metalx.net/admin/transection/detail?ticketNo=01232123', N'Admin', N'1', CAST(N'2022-09-16T11:54:07.200' AS DateTime), NULL)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11571, N'314519e6-ab0d-b3d7-723f-b785b81aa41f', N'::1', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin/Order/detail?OrderNo=PO%200123232', N'Admin', N'1', CAST(N'2022-09-16T12:15:00.277' AS DateTime), 2)
GO
INSERT [dbo].[UserAudit] ([AuditId], [SessionId], [IpAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName], [UrlReferrer], [Area], [LangId], [CreatedOn], [UserId]) VALUES (11572, N'314519e6-ab0d-b3d7-723f-b785b81aa41f', N'::1', N'/admin/transection/detail?ticketNo=01232123', NULL, NULL, N'A', N'Transection', N'detail', N'https://localhost:44397/admin/Order/detail?OrderNo=PO%200123232', N'Admin', N'1', CAST(N'2022-09-16T12:15:52.730' AS DateTime), 2)
GO
SET IDENTITY_INSERT [dbo].[UserAudit] OFF
GO
INSERT [dbo].[Users] ([UserID], [EmailAddress], [Name], [PasswordHash], [Salt], [Password_Version], [Account_Disabled], [AccountID]) VALUES (2, N'anthony.selby+supplier@gmail.com', N'Bob Smith', 0xBA8532539830DD0B1447DCC0BCFCE77F99E57034FA1FCAB1D996D1BBB8AA218B10CAFF7235A0ED6F19112D7CE6CDFBA2450E1AB8F65B9E976AD0085826EB72C1, N'44f1c912-37b2-4cf2-85e8-c6fcc28339d8', NULL, 0, N'MX1000')
GO
/****** Object:  StoredProcedure [dbo].[Accounts_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
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

	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'Representative' and @orderBy = 'ASC' then [Representative] end ASC,
	case when @sortBy = 'Representative' and @orderBy = 'DESC' then [Representative] end DESC,
	case when @sortBy = 'Include_Transportation' and @orderBy = 'ASC' then [Include_Transportation] end ASC,
	case when @sortBy = 'Include_Transportation' and @orderBy = 'DESC' then [Include_Transportation] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[Accounts_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Accounts_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
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


ORDER BY [AccountID] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[Accounts_SEARCH]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Accounts_SEARCH]
(
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
  (@accountID IS NULL OR @accountID = '' OR [AccountID] LIKE @accountID + '%')
AND
  (@representative IS NULL OR @representative = '' OR [Representative] LIKE @representative + '%')
AND
  (@includeTransportation IS NULL OR [Include_Transportation] = @includeTransportation)


GO
/****** Object:  StoredProcedure [dbo].[Accounts_SORT]    Script Date: 17-09-2022 04:46:20 PM ******/
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

	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'Representative' and @orderBy = 'ASC' then [Representative] end ASC,
	case when @sortBy = 'Representative' and @orderBy = 'DESC' then [Representative] end DESC,
	case when @sortBy = 'Include_Transportation' and @orderBy = 'ASC' then [Include_Transportation] end ASC,
	case when @sortBy = 'Include_Transportation' and @orderBy = 'DESC' then [Include_Transportation] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[AspNetUsers_DELETE]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AspNetUsers_DELETE]
(
@id uniqueidentifier
)
AS

DELETE
  [dbo].[AspNetUsers]
WHERE
  [Id] = @id


GO
/****** Object:  StoredProcedure [dbo].[AspNetUsers_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AspNetUsers_PAGING]
(
 @PageIndex int,
 @PageSize int
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[AspNetUsers] data 


ORDER BY [Id] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[AspNetUsers_SELECT]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AspNetUsers_SELECT]
(
@id AS uniqueidentifier
)
AS

SELECT
  *
FROM
  [dbo].[AspNetUsers]
WHERE
  Id = @id


GO
/****** Object:  StoredProcedure [dbo].[Cust_Representative_SELECT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
  *,u.Name as UserName
FROM
  [dbo].[Representative] r inner join 
  [dbo].[Users] u on r.AccountId = u.AccountID
WHERE
  r.AccountId = @AccountId


GO
/****** Object:  StoredProcedure [dbo].[Cust_TransactionDetail]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Cust_TransactionHeader]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Cust_TransactionHeader]
(
 @ticketNo varchar(15),
 @accountId varchar(15)
)
AS

BEGIN

  SELECT data.* , 
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Transaction_Header] data 
WHERE data.TicketNumber =  @ticketNo and data.AccountID=@accountId

ORDER BY [AccountID] DESC  

END
GO
/****** Object:  StoredProcedure [dbo].[Cust_TransactionHeader_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Cust_TransactionOtherPictures]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Cust_TransactionReceivedPaperword]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Cust_TransactionScalePictures]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Cust_Users_SELECT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[OrderDetail_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[OrderDetail_CUSTOM]  
(  
 @PageIndex int,  
 @PageSize int,  
 @sortBy varchar(20),  
 @orderBy varchar(20),  
 @searchstring varchar(20)  
)  
AS 
  
BEGIN  
  
  SELECT o.* ,   
  
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Order_Detail] as o  
  
  
WHERE  
  ( @searchstring IS NULL OR @searchstring = '' OR OrderNumber LIKE @searchstring +'%')  
OR  ( @searchstring IS NULL OR @searchstring = '' OR OrderedWeight LIKE @searchstring +'%')  
OR  ( @searchstring IS NULL OR @searchstring = '' OR ItemName LIKE @searchstring +'%')  
OR  ( @searchstring IS NULL OR @searchstring = '' OR ReceivedWeight LIKE @searchstring +'%')  
OR  ( @searchstring IS NULL OR @searchstring = '' OR DueWeight LIKE @searchstring +'%')  
OR  ( @searchstring IS NULL OR @searchstring = '' OR Price LIKE @searchstring +'%')   
  
ORDER BY   
  
 case when @sortBy = 'OrderNumber' and @orderBy = 'ASC' then OrderNumber end ASC,  
 case when @sortBy = 'OrderedWeight' and @orderBy = 'ASC' then OrderedWeight end ASC,  
 case when @sortBy = 'ItemName' and @orderBy = 'ASC' then ItemName end ASC,  
 case when @sortBy = 'ReceivedWeight' and @orderBy = 'ASC' then ReceivedWeight end ASC,  
 case when @sortBy = 'DueWeight' and @orderBy = 'ASC' then DueWeight end ASC,  
 case when @sortBy = 'Price' and @orderBy = 'ASC' then Price end ASC,  
  case when @sortBy = 'OrderNumber' and @orderBy = 'DESC' then OrderNumber end DESC,  
 case when @sortBy = 'OrderedWeight' and @orderBy = 'DESC' then OrderedWeight end DESC,  
 case when @sortBy = 'ItemName' and @orderBy = 'DESC' then ItemName end DESC,  
 case when @sortBy = 'ReceivedWeight' and @orderBy = 'DESC' then ReceivedWeight end DESC,  
 case when @sortBy = 'DueWeight' and @orderBy = 'DESC' then DueWeight end DESC,  
 case when @sortBy = 'Price' and @orderBy = 'DESC' then Price end DESC  
  
OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY  
END  
  
  
GO
/****** Object:  StoredProcedure [dbo].[OrderDetail_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderDetail_INSERT]  
(  
@OrderNumber AS varchar(60) = null,  
@ItemName AS varchar(60) = null,  
@OrderedWeight AS varchar(60) = null,
@ReceivedWeight AS varchar(60) = null,
@DueWeight AS varchar(60) = null,
@Price AS varchar(60) = null
)  
AS  
  
INSERT INTO  
  [dbo].[Order_Detail]  
(  
   OrderNumber, ItemName, OrderedWeight, ReceivedWeight, DueWeight, Price
)  
VALUES  
(  
   @OrderNumber, @ItemName, @OrderedWeight, @ReceivedWeight, @DueWeight, @Price 
)  
  
SELECT SCOPE_IDENTITY()  
  
  
GO
/****** Object:  StoredProcedure [dbo].[OrderDetail_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderDetail_PAGING]  
(  
 @PageIndex int,  
 @PageSize int  
)  
AS  
 
BEGIN  
  
  SELECT data.* ,   
  TotalRecord = COUNT(*) OVER()    
  FROM [dbo].[Order_Detail] data   
  
ORDER BY [OrderNumber] DESC    
  
OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY  
END  
  
  
GO
/****** Object:  StoredProcedure [dbo].[OrderDetail_SELECT]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[OrderDetail_SELECT]
(
@OrderNumber AS varchar(500)
)
AS

SELECT
  *
FROM
 [dbo].[Order_Detail]
WHERE
 OrderNumber= @OrderNumber
GO
/****** Object:  StoredProcedure [dbo].[OrderHeader_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderHeader_CUSTOM]  
(  
 @PageIndex int,  
 @PageSize int,  
 @sortBy varchar(20),  
 @orderBy varchar(20),  
 @searchstring varchar(20)  
)  
AS 
  
BEGIN  
  
  SELECT o.* ,   
  
  TotalRecord = COUNT(*) OVER()  
  FROM [dbo].[Order_Header] as o  
  
  
WHERE  
  ( @searchstring IS NULL OR @searchstring = '' OR OrderNumber LIKE @searchstring +'%')  
OR  ( @searchstring IS NULL OR @searchstring = '' OR EffectiveDate LIKE @searchstring +'%')  
OR  ( @searchstring IS NULL OR @searchstring = '' OR ExpirationDate LIKE @searchstring +'%')  
OR  ( @searchstring IS NULL OR @searchstring = '' OR Status LIKE @searchstring +'%')    
  
ORDER BY   
 case when @sortBy = 'OrderNumber' and @orderBy = 'ASC' then OrderNumber end ASC,  
 case when @sortBy = 'EffectiveDate' and @orderBy = 'ASC' then EffectiveDate end ASC,  
 case when @sortBy = 'ExpirationDate' and @orderBy = 'ASC' then ExpirationDate end ASC,  
 case when @sortBy = 'Status' and @orderBy = 'ASC' then Status end ASC,  
   case when @sortBy = 'OrderNumber' and @orderBy = 'DESC' then OrderNumber end DESC,  
 case when @sortBy = 'EffectiveDate' and @orderBy = 'DESC' then EffectiveDate end DESC,  
 case when @sortBy = 'ExpirationDate' and @orderBy = 'DESC' then ExpirationDate end DESC,  
 case when @sortBy = 'Status' and @orderBy = 'DESC' then Status end DESC  
OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY  
END  
  
  
GO
/****** Object:  StoredProcedure [dbo].[OrderHeader_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   
CREATE PROCEDURE [dbo].[OrderHeader_INSERT]  
(  
@OrderNumber AS nchar(6) = null,  
@EffectiveDate AS date = null,  
@ExpirationDate AS date = null,
@Status bit
)  
AS  
  

INSERT INTO  
  [dbo].[Order_Header]  
(  
  OrderNumber,
   EffectiveDate,
    ExpirationDate,
	 Status 
)  
VALUES  
(  
 @OrderNumber,
   @EffectiveDate,
    @ExpirationDate,
	 @Status  
)  
  
SELECT SCOPE_IDENTITY()  
  
  
GO
/****** Object:  StoredProcedure [dbo].[OrderHeader_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderHeader_PAGING]  
(  
 @PageIndex int,  
 @PageSize int  
)  
AS  
  
BEGIN  
  
  SELECT data.* ,   
  TotalRecord = COUNT(*) OVER()    
  FROM [dbo].[Order_Header] data   
  
ORDER BY [OrderNumber] DESC    
  
OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY  
END  
  
  
GO
/****** Object:  StoredProcedure [dbo].[OrderHeader_SELECT]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderHeader_SELECT]  
(  
@OrderNumber AS varchar(500)  
)  
AS  
  
SELECT  
  OH.*,TH.PaymentReceiptURL  
FROM  
 [dbo].[Order_Header]  OH
 left join [Transaction_Header] TH
 ON OH.OrderNumber=TH.OrderNumber
WHERE  
 OH.OrderNumber= @OrderNumber  
GO
/****** Object:  StoredProcedure [dbo].[Representative_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Representative_DELETE]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Representative_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Representative_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Representative_SEARCH]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Representative_SELECT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Representative_SORT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Representative_UPDATE]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionDetail_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionDetail_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionDetail_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
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


ORDER BY [AccountID] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionDetail_SEARCH]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionDetail_SEARCH]
(
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
/****** Object:  StoredProcedure [dbo].[TransactionDetail_SORT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionHeader_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionHeader_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionHeader_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
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


ORDER BY [AccountID] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionHeader_PAGINGWithOrderNo]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TransactionHeader_PAGINGWithOrderNo]  
(  
 @PageIndex int,  
 @PageSize int,  
 @OrderNo varchar(50)  
)  
AS  
  
BEGIN  

     SELECT td.* ,   
	  data.TicketDate, 
  TotalRecord = COUNT(*) OVER()    
  FROM [dbo].[Transaction_Header] data inner join
  [dbo].[Transaction_Detail] td on data.TicketNumber=td.TicketNumber
   where data.OrderNumber=@OrderNo
   
  
ORDER BY [AccountID] DESC    
  
OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY  
END  
GO
/****** Object:  StoredProcedure [dbo].[TransactionHeader_SEARCH]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionHeader_SEARCH]
(
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
/****** Object:  StoredProcedure [dbo].[TransactionHeader_SORT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionOtherPictures_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionOtherPictures_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionOtherPictures_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
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


ORDER BY [AccountID] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionOtherPictures_SEARCH]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionOtherPictures_SEARCH]
(
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
/****** Object:  StoredProcedure [dbo].[TransactionOtherPictures_SORT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionReceivedPaperword_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionReceivedPaperword_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionReceivedPaperword_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
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


ORDER BY [AccountID] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionReceivedPaperword_SEARCH]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionReceivedPaperword_SEARCH]
(
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
/****** Object:  StoredProcedure [dbo].[TransactionReceivedPaperword_SORT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionScalePictures_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionScalePictures_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransactionScalePictures_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
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


ORDER BY [AccountID] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransactionScalePictures_SEARCH]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransactionScalePictures_SEARCH]
(
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
/****** Object:  StoredProcedure [dbo].[TransactionScalePictures_SORT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransectionSetting_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransectionSetting_DELETE]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransectionSetting_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransectionSetting_INSERT]
(
@locationID AS int = null,
@commodityID AS int = null,
@notes AS nvarchar(1000) = null,
@createdBy AS int = null,
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
/****** Object:  StoredProcedure [dbo].[TransectionSetting_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransectionSetting_SELECT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransectionSetting_SORT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransectionSetting_UPDATE]    Script Date: 17-09-2022 04:46:20 PM ******/
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
@createdBy int = null,
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
/****** Object:  StoredProcedure [dbo].[TransportationCommodities_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransportationCommodities_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransportationCommodities_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
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


ORDER BY [AccountID] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransportationCommodities_SEARCH]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationCommodities_SEARCH]
(
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
  (@accountID IS NULL OR @accountID = '' OR [AccountID] LIKE @accountID + '%')
AND
  (@locationID IS NULL OR [LocationID] = @locationID)
AND
  (@commodityID IS NULL OR [CommodityID] = @commodityID)
AND
  (@commodityName IS NULL OR @commodityName = '' OR [Commodity_Name] LIKE @commodityName + '%')


GO
/****** Object:  StoredProcedure [dbo].[TransportationCommodities_SORT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransportationLocations_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
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

	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'LocationID' and @orderBy = 'ASC' then [LocationID] end ASC,
	case when @sortBy = 'LocationID' and @orderBy = 'DESC' then [LocationID] end DESC,
	case when @sortBy = 'LocationName' and @orderBy = 'ASC' then [LocationName] end ASC,
	case when @sortBy = 'LocationName' and @orderBy = 'DESC' then [LocationName] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransportationLocations_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TransportationLocations_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
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


ORDER BY [AccountID] DESC  

OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[TransportationLocations_SEARCH]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransportationLocations_SEARCH]
(
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
  (@accountID IS NULL OR @accountID = '' OR [AccountID] LIKE @accountID + '%')
AND
  (@locationID IS NULL OR [LocationID] = @locationID)
AND
  (@locationName IS NULL OR @locationName = '' OR [LocationName] LIKE @locationName + '%')


GO
/****** Object:  StoredProcedure [dbo].[TransportationLocations_SORT]    Script Date: 17-09-2022 04:46:20 PM ******/
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

	case when @sortBy = 'AccountID' and @orderBy = 'ASC' then [AccountID] end ASC,
	case when @sortBy = 'AccountID' and @orderBy = 'DESC' then [AccountID] end DESC,
	case when @sortBy = 'LocationID' and @orderBy = 'ASC' then [LocationID] end ASC,
	case when @sortBy = 'LocationID' and @orderBy = 'DESC' then [LocationID] end DESC,
	case when @sortBy = 'LocationName' and @orderBy = 'ASC' then [LocationName] end ASC,
	case when @sortBy = 'LocationName' and @orderBy = 'DESC' then [LocationName] end DESC



OFFSET ((@PageIndex-1) *@PageSize)  ROWS FETCH NEXT @PageSize ROWS ONLY
END


GO
/****** Object:  StoredProcedure [dbo].[UserAudit_DELETE]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UserAudit_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserAudit_INSERT]
(
@userId AS int = null,
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
@langId AS varchar(2) = null,
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
  [LangId],
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
  @langId,
  @createdOn
)

SELECT SCOPE_IDENTITY()


GO
/****** Object:  StoredProcedure [dbo].[UserAudit_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UserAudit_SELECT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UserHistory_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UserHistory_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UserHistory_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UserHistory_SEARCH]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UserHistory_SORT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Users_CUSTOM]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Users_DELETE]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Users_INSERT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Users_PAGING]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Users_SEARCH]    Script Date: 17-09-2022 04:46:20 PM ******/
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
  *,a.Include_Transportation
FROM
  [dbo].[Users] u 
  INNER JOIN Accounts a ON u.AccountID=a.AccountID
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
  (@accountID IS NULL OR @accountID = '' OR u.[AccountID] LIKE @accountID + '%')


GO
/****** Object:  StoredProcedure [dbo].[Users_SELECT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Users_SORT]    Script Date: 17-09-2022 04:46:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Users_UPDATE]    Script Date: 17-09-2022 04:46:20 PM ******/
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
