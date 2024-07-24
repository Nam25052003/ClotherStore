USE [master]
GO
/****** Object:  Database [ClotherStore]    Script Date: 7/24/2024 2:40:57 PM ******/
CREATE DATABASE [ClotherStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClotherStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ClotherStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClotherStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ClotherStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ClotherStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClotherStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClotherStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClotherStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClotherStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClotherStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClotherStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClotherStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ClotherStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClotherStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClotherStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClotherStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClotherStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClotherStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClotherStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClotherStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClotherStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClotherStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClotherStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClotherStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClotherStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClotherStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClotherStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClotherStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClotherStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClotherStore] SET  MULTI_USER 
GO
ALTER DATABASE [ClotherStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClotherStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClotherStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClotherStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClotherStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClotherStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ClotherStore] SET QUERY_STORE = OFF
GO
USE [ClotherStore]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 7/24/2024 2:40:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[photo] [nvarchar](50) NULL,
 CONSTRAINT [pk_accounts] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authorities]    Script Date: 7/24/2024 2:40:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[roleid] [nvarchar](10) NULL,
 CONSTRAINT [pk_authorities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 7/24/2024 2:40:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [pk_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetail]    Script Date: 7/24/2024 2:40:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[orderid] [bigint] NULL,
	[productid] [int] NULL,
 CONSTRAINT [pk_orderdetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 7/24/2024 2:40:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NULL,
	[address] [nvarchar](100) NULL,
	[username] [nvarchar](50) NULL,
 CONSTRAINT [pk_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productdetail]    Script Date: 7/24/2024 2:40:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productdetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productid] [int] NULL,
	[productpropertiesid] [int] NULL,
 CONSTRAINT [pk_productdetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productproperties]    Script Date: 7/24/2024 2:40:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productproperties](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imagesmall] [nvarchar](100) NULL,
	[color] [nvarchar](50) NULL,
	[size] [char](4) NULL,
	[gender] [nvarchar](10) NULL,
	[type] [nvarchar](30) NULL,
 CONSTRAINT [pk_productproperties] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 7/24/2024 2:40:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[image] [nvarchar](100) NULL,
	[price] [float] NULL,
	[createdate] [date] NULL,
	[available] [bit] NULL,
	[categoryid] [int] NULL,
 CONSTRAINT [pk_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 7/24/2024 2:40:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [pk_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'nam', N'123', N'NGUYỄN PHƯƠNG NAM', N'conbothunghang@gmail.com', N'')
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'nam2', N'123', N'NGUYỄN PHƯƠNG NAM', N'daubotq0123@gmail.com', N'')
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'user1', N'123', N'user1', N'nam028200@gmail.com', N'avt.jpg')
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'user2', N'123', N'user2', N'nam028200@gmail.com', N'avt.jpg')
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo]) VALUES (N'user3', N'123', N'user3', N'nam028200@gmail.com', N'avt.jpg')
GO
SET IDENTITY_INSERT [dbo].[authorities] ON 

INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (2, N'user2', N'STAF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (3, N'user3', N'DIRE')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (6, N'user1', N'CUST')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (11, N'nam', N'CUST')
SET IDENTITY_INSERT [dbo].[authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name]) VALUES (1, N'T-shirt')
INSERT [dbo].[categories] ([id], [name]) VALUES (2, N'Shirt')
INSERT [dbo].[categories] ([id], [name]) VALUES (3, N'Skirt')
INSERT [dbo].[categories] ([id], [name]) VALUES (4, N'Flared pants')
INSERT [dbo].[categories] ([id], [name]) VALUES (5, N'Jean')
INSERT [dbo].[categories] ([id], [name]) VALUES (6, N'Trouser')
INSERT [dbo].[categories] ([id], [name]) VALUES (7, N'Dress')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[orderdetail] ON 

INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (1, 22.989999771118164, 1, 6, 44)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (2, 32.9900016784668, 1, 6, 45)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (3, 50.9900016784668, 1, 6, 43)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (4, 87.989997863769531, 1, 6, 50)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (5, 55.9900016784668, 1, 6, 49)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (6, 80.989997863769531, 1, 6, 52)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (7, 15.989999771118164, 1, 6, 53)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (8, 15.989999771118164, 2, 6, 54)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (9, 22.989999771118164, 1, 7, 44)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (10, 50.9900016784668, 1, 7, 43)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (11, 15.989999771118164, 1, 7, 58)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (12, 5.9899997711181641, 1, 7, 60)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (13, 15.989999771118164, 1, 7, 61)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (14, 15.590000152587891, 1, 7, 62)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (15, 50.9900016784668, 1, 8, 43)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (16, 22.989999771118164, 1, 8, 44)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (17, 32.9900016784668, 1, 8, 45)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (18, 22.989999771118164, 1, 9, 44)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (19, 32.9900016784668, 1, 9, 45)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (20, 55.9900016784668, 1, 10, 59)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (21, 5.9899997711181641, 1, 10, 60)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (22, 15.989999771118164, 1, 10, 58)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (26, 22.989999771118164, 1, 12, 44)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (27, 32.9900016784668, 1, 12, 45)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (28, 50.9900016784668, 1, 12, 43)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (29, 55.9900016784668, 1, 12, 59)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (30, 55.9900016784668, 1, 13, 59)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (31, 5.9899997711181641, 1, 13, 60)
INSERT [dbo].[orderdetail] ([id], [price], [quantity], [orderid], [productid]) VALUES (32, 12.39900016784668, 1, 13, 48)
SET IDENTITY_INSERT [dbo].[orderdetail] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [createdate], [address], [username]) VALUES (2, CAST(N'2023-08-18T00:00:00.000' AS DateTime), N'', N'user3')
INSERT [dbo].[orders] ([id], [createdate], [address], [username]) VALUES (3, CAST(N'2023-08-18T00:00:00.000' AS DateTime), N'asdadsa', N'user3')
INSERT [dbo].[orders] ([id], [createdate], [address], [username]) VALUES (4, CAST(N'2023-08-18T00:00:00.000' AS DateTime), N'asdadsa', N'user3')
INSERT [dbo].[orders] ([id], [createdate], [address], [username]) VALUES (5, CAST(N'2023-08-18T00:00:00.000' AS DateTime), N'dadada', N'user3')
INSERT [dbo].[orders] ([id], [createdate], [address], [username]) VALUES (6, CAST(N'2023-08-18T00:00:00.000' AS DateTime), N'aaaa', N'user3')
INSERT [dbo].[orders] ([id], [createdate], [address], [username]) VALUES (7, CAST(N'2023-08-18T00:00:00.000' AS DateTime), N'binh thanh', N'user1')
INSERT [dbo].[orders] ([id], [createdate], [address], [username]) VALUES (8, CAST(N'2023-08-18T00:00:00.000' AS DateTime), N'', N'user1')
INSERT [dbo].[orders] ([id], [createdate], [address], [username]) VALUES (9, CAST(N'2023-08-18T00:00:00.000' AS DateTime), N'', N'user1')
INSERT [dbo].[orders] ([id], [createdate], [address], [username]) VALUES (10, CAST(N'2023-08-18T00:00:00.000' AS DateTime), N'asas', N'user1')
INSERT [dbo].[orders] ([id], [createdate], [address], [username]) VALUES (12, CAST(N'2023-08-19T00:00:00.000' AS DateTime), N'123123', N'user3')
INSERT [dbo].[orders] ([id], [createdate], [address], [username]) VALUES (13, CAST(N'2023-08-19T00:00:00.000' AS DateTime), N'1231223', N'user1')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[productdetail] ON 

INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (1, 43, 1)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (2, 44, 3)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (3, 45, 4)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (4, 46, 5)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (5, 47, 2)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (6, 48, 4)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (7, 49, 5)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (8, 50, 6)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (9, 51, 3)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (10, 52, 5)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (11, 53, 5)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (12, 54, 7)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (13, 55, 3)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (14, 56, 3)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (15, 57, 10)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (16, 58, 15)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (17, 59, 19)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (18, 60, 20)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (19, 61, 22)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (20, 62, 14)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (25, 68, 16)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (26, 69, 21)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (27, 70, 14)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (28, 71, 20)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (29, 72, 31)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (30, 73, 37)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (31, 74, 25)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (32, 75, 38)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (33, 76, 30)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (34, 77, 34)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (35, 78, 41)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (36, 79, 39)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (37, 80, 33)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (38, 81, 23)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (39, 82, 35)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (40, 83, 40)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (41, 84, 29)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (42, 85, 17)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (43, 86, 17)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (44, 87, 17)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (45, 88, 17)
INSERT [dbo].[productdetail] ([id], [productid], [productpropertiesid]) VALUES (46, 89, 17)
SET IDENTITY_INSERT [dbo].[productdetail] OFF
GO
SET IDENTITY_INSERT [dbo].[productproperties] ON 

INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (1, NULL, N'orange', N'XL  ', N'Male', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (2, NULL, N'red', N'XL  ', N'Male', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (3, NULL, N'blue', N'XL  ', N'Male', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (4, NULL, N'white', N'XL  ', N'Male', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (5, NULL, N'gray', N'XL  ', N'Male', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (6, NULL, N'light-blue', N'XL  ', N'Male', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (7, NULL, N'light-gray', N'XL  ', N'Male', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (8, NULL, N'pink', N'XL  ', N'Male', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (9, NULL, N'brown', N'XL  ', N'Male', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (10, NULL, N'black', N'XL  ', N'Male', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (11, NULL, N'green', N'XL  ', N'Male', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (12, NULL, N'orange', N'S   ', N'Female', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (13, NULL, N'red', N'S   ', N'Female', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (14, NULL, N'blue', N'S   ', N'Female', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (15, NULL, N'white', N'S   ', N'Female', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (16, NULL, N'gray', N'S   ', N'Female', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (17, NULL, N'light-blue', N'S   ', N'Female', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (18, NULL, N'light-gray', N'S   ', N'Female', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (19, NULL, N'pink', N'S   ', N'Female', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (20, NULL, N'brown', N'S   ', N'Female', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (21, NULL, N'black', N'S   ', N'Female', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (22, NULL, N'green', N'S   ', N'Female', N'adults')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (23, NULL, N'black', N'M   ', N'Male', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (24, NULL, N'red', N'M   ', N'Male', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (25, NULL, N'green', N'M   ', N'Male', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (26, NULL, N'blue', N'M   ', N'Male', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (27, NULL, N'light-blue', N'M   ', N'Male', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (28, NULL, N'pink', N'M   ', N'Male', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (29, NULL, N'brown', N'M   ', N'Male', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (30, NULL, N'white ', N'M   ', N'Male', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (31, NULL, N'gray', N'M   ', N'Male', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (32, NULL, N'black', N'S   ', N'Female', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (33, NULL, N'green', N'S   ', N'Female', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (34, NULL, N'red', N'S   ', N'Female', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (35, NULL, N'blue', N'S   ', N'Female', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (36, NULL, N'light-blue', N'S   ', N'Female', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (37, NULL, N'light-green', N'S   ', N'Female', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (38, NULL, N'pink', N'S   ', N'Female', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (39, NULL, N'brown', N'S   ', N'Female', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (40, NULL, N'orange', N'S   ', N'Female', N'kids')
INSERT [dbo].[productproperties] ([id], [imagesmall], [color], [size], [gender], [type]) VALUES (41, NULL, N'gray', N'S   ', N'Female', N'kids')
SET IDENTITY_INSERT [dbo].[productproperties] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (43, N'Áo thun 1', N'piquecacao.jpg', 50.99, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (44, N'Áo thun 2', N'excoolsomiden_52.jpg', 22.99, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (45, N'Áo thun 3', N'thumb_polo_s2_trang.jpg', 32.99, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (46, N'Áo thun 4', N'v2xanhreutruoc_16.jpg', 11.99, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (47, N'Áo thun 5', N'polo-cafe-do-do-6.jpg', 12.939, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (48, N'Áo sơ mi 1', N'cae24.jpg', 12.399, CAST(N'2023-08-01' AS Date), 1, 2)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (49, N'Áo sơ mi 2', N'cf2.jpg', 55.99, CAST(N'2023-08-01' AS Date), 1, 2)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (50, N'Áo sơ mi 3', N'cf5.jpg', 87.99, CAST(N'2023-08-01' AS Date), 1, 2)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (51, N'Áo sơ mi 4', N'cfaqua_78.jpg', 15.99, CAST(N'2023-08-01' AS Date), 1, 2)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (52, N'Áo sơ mi 5', N'cfxamnhat2.jpg', 80.99, CAST(N'2023-08-01' AS Date), 1, 2)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (53, N'quần dài nam 1', N'1-copy-2_99.jpg', 15.99, CAST(N'2023-08-01' AS Date), 1, 6)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (54, N'quần dài nam 2', N'grapeneGhi_truoc.jpg', 15.99, CAST(N'2023-08-01' AS Date), 1, 6)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (55, N'quần dài nam 3', N'jean-slimfit-xanh-dam-6_46.jpg', 15.99, CAST(N'2023-08-01' AS Date), 1, 6)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (56, N'quần dài nam 4', N'navyupsoronanavyu_32_44.jpg', 15.99, CAST(N'2023-08-01' AS Date), 1, 6)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (57, N'quần dài nam 5', N'udensoro_copy.jpg', 15.99, CAST(N'2023-08-01' AS Date), 1, 6)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (58, N'Áo thun nữ 1', N'vngoods_00_455760.jpg', 15.99, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (59, N'Áo thun nữ 2', N'vngoods_10_456006.jpg', 55.99, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (60, N'Áo thun nữ 3', N'vngoods_35_456013.jpg', 5.99, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (61, N'Áo thun nữ 4', N'vngoods_53_462671.jpg', 15.99, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (62, N'Áo thun nữ 5', N'vngoods_69_458291.jpg', 15.59, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (68, N'Váy nữ 1', N'vngoods_04_458122.jpg', 33.99, CAST(N'2023-08-01' AS Date), 1, 7)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (69, N'Váy nữ 2', N'vngoods_09_462084.jpg', 2.99, CAST(N'2023-08-01' AS Date), 1, 7)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (70, N'Váy nữ 3', N'vngoods_09_463306.jpg', 11.99, CAST(N'2023-08-01' AS Date), 1, 7)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (71, N'Váy nữ 4', N'vngoods_38_462080.jpg', 22.99, CAST(N'2023-08-01' AS Date), 1, 7)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (72, N'Đồ trẻ em 1', N'vngoods_07_457762.jpg', 19.99, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (73, N'Đồ trẻ em 2', N'vngoods_50_466304.jpg', 4.99, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (74, N'Đồ trẻ em 3', N'vngoods_55_461151.jpg', 5.99, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (75, N'Đồ trẻ em 4', N'vngoods_70_466303.jpg', 45.99, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (76, N'Đồ trẻ em 5', N'vngoods_00_456964.jpg', 9.99, CAST(N'2023-08-01' AS Date), 1, 1)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (77, N'Đồ trẻ em 6', N'vngoods_64_455859.jpg', 12.79, CAST(N'2023-08-01' AS Date), 1, 5)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (78, N'Đồ trẻ em 7', N'vngoods_09_460668.jpg', 13.59, CAST(N'2023-08-01' AS Date), 1, 3)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (79, N'Đồ trẻ em 8', N'vngoods_32_460668002.jpg', 12.79, CAST(N'2023-08-01' AS Date), 1, 3)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (80, N'Đồ trẻ em 9', N'vngoods_57_460668003.jpg', 13.59, CAST(N'2023-08-01' AS Date), 1, 3)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (81, N'Đồ trẻ em 10', N'vngoods_09_454371.jpg', 12.79, CAST(N'2023-08-01' AS Date), 1, 6)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (82, N'Đồ trẻ em 11', N'vngoods_09_454516.jpg', 13.59, CAST(N'2023-08-01' AS Date), 1, 6)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (83, N'Đồ trẻ em 12', N'vngoods_13_460092.jpg', 12.79, CAST(N'2023-08-01' AS Date), 1, 6)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (84, N'Đồ trẻ em 13', N'vngoods_32_462021.jpg', 13.59, CAST(N'2023-08-01' AS Date), 1, 6)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (85, N'Jean nữ 1', N'vngoods_63_464683.jpg', 15.29, CAST(N'2023-08-01' AS Date), 1, 5)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (86, N'Jean nữ 2', N'vngoods_62_458188.jpg', 15.59, CAST(N'2023-08-01' AS Date), 1, 5)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (87, N'Jean nữ 3', N'vngoods_62_463396.jpg', 12.99, CAST(N'2023-08-01' AS Date), 1, 5)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (88, N'Jean nữ 4', N'vngoods_64_453975.jpg', 17.99, CAST(N'2023-08-01' AS Date), 1, 5)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (89, N'Jean nữ 5', N'vngoods_64_455859.jpg', 12.99, CAST(N'2023-08-01' AS Date), 1, 5)
INSERT [dbo].[products] ([id], [name], [image], [price], [createdate], [available], [categoryid]) VALUES (92, N'Jean nam 1', N'362aa2b7.jpg', 22, CAST(N'2023-08-19' AS Date), 0, NULL)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
INSERT [dbo].[roles] ([id], [name]) VALUES (N'CUST', N'customer')
INSERT [dbo].[roles] ([id], [name]) VALUES (N'DIRE', N'director')
INSERT [dbo].[roles] ([id], [name]) VALUES (N'STAF', N'staffs')
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [fk_authorities_accounts] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [fk_authorities_accounts]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD  CONSTRAINT [fk_authorities_roles] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[authorities] CHECK CONSTRAINT [fk_authorities_roles]
GO
ALTER TABLE [dbo].[orderdetail]  WITH CHECK ADD  CONSTRAINT [fk_orderdetail_orders] FOREIGN KEY([orderid])
REFERENCES [dbo].[orders] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orderdetail] CHECK CONSTRAINT [fk_orderdetail_orders]
GO
ALTER TABLE [dbo].[orderdetail]  WITH CHECK ADD  CONSTRAINT [fk_orderdetail_products] FOREIGN KEY([productid])
REFERENCES [dbo].[products] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orderdetail] CHECK CONSTRAINT [fk_orderdetail_products]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_accounts] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [fk_orders_accounts]
GO
ALTER TABLE [dbo].[productdetail]  WITH CHECK ADD  CONSTRAINT [fk_productdetail_productproperties] FOREIGN KEY([productpropertiesid])
REFERENCES [dbo].[productproperties] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[productdetail] CHECK CONSTRAINT [fk_productdetail_productproperties]
GO
ALTER TABLE [dbo].[productdetail]  WITH CHECK ADD  CONSTRAINT [fk_productdetail_products] FOREIGN KEY([productid])
REFERENCES [dbo].[products] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[productdetail] CHECK CONSTRAINT [fk_productdetail_products]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_categories] FOREIGN KEY([categoryid])
REFERENCES [dbo].[categories] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [fk_products_categories]
GO
USE [master]
GO
ALTER DATABASE [ClotherStore] SET  READ_WRITE 
GO
