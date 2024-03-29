USE [master]
GO
/****** Object:  Database [MusicManagement]    Script Date: 5/18/2023 10:03:51 AM ******/
CREATE DATABASE [MusicManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SA\MSSQL\DATA\MusicManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MusicManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SA\MSSQL\DATA\MusicManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MusicManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MusicManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MusicManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [MusicManagement] SET  MULTI_USER 
GO
ALTER DATABASE [MusicManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MusicManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MusicManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MusicManagement', N'ON'
GO
ALTER DATABASE [MusicManagement] SET QUERY_STORE = OFF
GO
USE [MusicManagement]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 5/18/2023 10:03:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 5/18/2023 10:03:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [varchar](10) NOT NULL,
	[date] [datetime] NOT NULL,
	[total] [int] NOT NULL,
	[customername] [varchar](200) NULL,
	[payment] [varchar](10) NULL,
	[enddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 5/18/2023 10:03:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[img] [nvarchar](200) NULL,
	[quantity] [int] NOT NULL,
	[categoryID] [varchar](10) NOT NULL,
 CONSTRAINT [PK__tblProdu__2D10D14A7F9F08D5] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 5/18/2023 10:03:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 5/18/2023 10:03:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](10) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[Email] [varchar](25) NOT NULL,
	[Address] [varchar](25) NOT NULL,
	[roleID] [varchar](10) NOT NULL,
	[img] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'DT', N'Dan Toc')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'East', N'Mien Dong')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'O', N'Orchesta')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'West', N'Mien Tay')
GO
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'124542', CAST(N'2023-04-25T19:41:00.000' AS DateTime), 500, N'Admin la toiw', N'Card', CAST(N'2023-04-25T19:41:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'125648', CAST(N'2023-04-25T18:55:00.000' AS DateTime), 400, N'today i bought', N'Card', CAST(N'2023-05-25T18:55:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'127179', CAST(N'2022-11-02T13:12:00.000' AS DateTime), 400, N'hey i bought a thing', N'Card', CAST(N'2022-12-02T13:12:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'153684', CAST(N'2023-04-06T21:14:00.000' AS DateTime), 400, N'namhn', N'Card', CAST(N'2023-04-06T21:14:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'155211', CAST(N'2022-11-02T01:40:00.000' AS DateTime), 400, N'namhn', N'Card', CAST(N'2022-12-02T01:40:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'159658', CAST(N'2023-04-15T09:23:00.000' AS DateTime), 49995, N'nicetryer', N'Card', CAST(N'2023-04-15T09:23:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'163781', CAST(N'2022-11-04T07:58:00.000' AS DateTime), 2250, N'namhn', N'Card', CAST(N'2022-12-04T07:58:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'173751', CAST(N'2022-11-02T13:18:00.000' AS DateTime), 4500, N'namhn', N'Card', CAST(N'2022-12-02T13:18:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'216605', CAST(N'2022-11-02T13:14:00.000' AS DateTime), 6500, N'namhn', N'Card', CAST(N'2022-12-02T13:14:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'220713', CAST(N'2022-11-07T23:10:00.000' AS DateTime), 1400, N'oh hi im place again', N'Card', CAST(N'2022-12-07T23:10:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'223608', CAST(N'2023-04-13T19:30:00.000' AS DateTime), 700, N'Admin la toi', N'Card', CAST(N'2023-04-13T19:30:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'225776', CAST(N'2022-11-01T22:17:00.000' AS DateTime), 1500, N'qwerty', N'Card', NULL)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'237991', CAST(N'2022-11-02T11:17:00.000' AS DateTime), 3500, N'ultraG', N'Card', CAST(N'2022-12-02T11:17:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'255963', CAST(N'2022-11-02T10:58:00.000' AS DateTime), 3600, N'namhn', N'Card', CAST(N'2022-12-02T10:58:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'257818', CAST(N'2022-11-02T11:16:00.000' AS DateTime), 500, N'namhn', N'Card', CAST(N'2022-12-02T11:16:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'273554', CAST(N'2022-11-01T23:20:00.000' AS DateTime), 35200, N'tech Miss gra', N'Card', NULL)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'300522', CAST(N'2022-11-02T13:08:00.000' AS DateTime), 500, N'anhhaiga', N'Card', CAST(N'2022-12-02T13:08:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'307401', CAST(N'2022-11-01T22:11:00.000' AS DateTime), 1950, N'sadadvfcc', N'Card', NULL)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'309505', CAST(N'2022-11-01T23:10:00.000' AS DateTime), 3995, N'namhn', N'COD', NULL)
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'317896', CAST(N'2022-11-02T11:02:00.000' AS DateTime), 800, N'namhn', N'Card', CAST(N'2022-12-02T11:02:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'369770', CAST(N'2022-11-02T10:56:00.000' AS DateTime), 400, N'namhn', N'Card', CAST(N'2022-12-02T10:56:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'383323', CAST(N'2023-04-26T09:44:00.000' AS DateTime), 21598, N'namhn', N'COD', CAST(N'2023-04-26T09:44:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [date], [total], [customername], [payment], [enddate]) VALUES (N'434050', CAST(N'2023-05-18T23:47:00.000' AS DateTime), 991, N'anhhaiga', N'Card', CAST(N'2023-05-18T23:47:00.000' AS DateTime))
GO
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'DT1', N'Dan Tranh', 500, N'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Dantranh_top02.jpg/800px-Dantranh_top02.jpg', 30, N'DT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'DT15', N'Dan Ti Ba cua AnhBS', 991, N'https://congdecor.com/wp-content/uploads/2022/07/mo-hinh-dan-ty-ba-trang-tri-1.jpg', 32, N'DT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'DT2', N'Sao Truc', 400, N'https://vmef.vn/images/2020/03/05/200305-saotruc_large.jpg', 23, N'DT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'DT3', N'Dan Ti Ba', 333, N'http://tatham.vn/media/news/28_dantybatrungquoc120714.jpg', 21, N'DT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'DT4', N'Dan Nguyet', 399, N'https://giasuhanoigioi.edu.vn/wp-content/uploads/2019/08/gia-su-day-dan-nguyet.jpg', 8, N'DT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'DT5', N'Dan Bau', 450, N'https://toquoc.mediacdn.vn/2019/11/20/15-15742246071391182503635.jpg', 17, N'DT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'DT6', N'Dan Nhi', 750, N'https://dotchuoinon.files.wordpress.com/2015/06/dannhi5.jpg', 56, N'DT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'DT7', N'Dan Day', 200, N'https://znews-photo.zingcdn.me/w660/Uploaded/jotnhg/2020_07_12/dan.jpg', 10, N'DT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'DT79', N'Null Excep keep go', 347, N'No Image Provided', 10, N'DT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'DT8', N'Dan Tam', 799, N'https://dotchuoinon.files.wordpress.com/2015/06/dantam_c491b.jpg', 1, N'DT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'DT9', N'Dan Nguyet 2', 555, N'https://th.bing.com/th/id/R.85486f3223856353cd38746a46c5a3ce?rik=WhfUjjNoTm1%2f0w&pid=ImgRaw&r=0&sres=1&sresct=1', 40, N'DT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'Ea1', N'Bagpipes - Scotland', 500, N'https://www.scottishbagpipers.com/wp-content/uploads/2022/01/bagpiper-uniform-mob.jpg', 7, N'East')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'Ea2', N'Orchestra Leader', 400, N'https://cso.org/media/q2mnsrcn/muti_naples_hero_1240-980x520.jpg?center=0.27326952856294778,0.505&mode=crop&width=1440&height=795&format=jpg&quality=85&rnd=132729987544930000', 10, N'East')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'Ea3', N'Stage Composer', 350, N'https://i.ytimg.com/vi/pO481doRObY/maxresdefault.jpg', 9, N'East')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'Ea4', N'Eastern Basic', 650, N'https://easternmusicfestival.org/wp-content/uploads/2021/01/Study-Euphonum-Tuba-Institute-Julie-Averette-for-Eastern-Music-Festival-OPTIMIZED.jpg', 10, N'East')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'Ea5', N'Singer', 555, N'https://img.freepik.com/free-photo/passionate-black-male-singer-performing-against-red_1258-26348.jpg?w=2000', 10, N'East')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'O1', N'Violin', 499, N'https://cdn.huongnghiepaau.com/wp-content/themes/huongnghiepaau/assets/images/music/violin-banner-object-main-v2.png', 3, N'DT')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'O2', N'Harp', 700, N'https://cdn.britannica.com/90/210490-050-34704C4C/woman-harp.jpg', 8, N'O')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'O3', N'Wood Winds: Flute', 450, N'https://www.dawkes.co.uk/sound-room/wp-content/uploads/2021/03/WoodwindOrchestra_1.jpg', 10, N'O')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'O4', N'Bass clarinet', 499, N'https://i.ytimg.com/vi/MjWDcRej7DQ/maxresdefault.jpg', 10, N'O')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'O5', N'Trumpet', 400, N'https://wayo.net.au/wp-content/uploads/2014/02/trumpets.jpg', 10, N'O')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'We1', N'Guitar', 550, N'https://vietthuongshop.vn/upload/content/images/Tuvan/2019/1-2019/10-dieu-can-biet-khi-moi-hoc-choi-guitar-1.jpg', 10, N'West')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'We2', N'Cowboys', 370, N'https://content.api.news/v3/images/bin/6f5ab76f17b5bcacde80b484b2193603?width=650', 10, N'West')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'We3', N'Jazz', 350, N'https://vietthuong.edu.vn/wp-content/uploads/2020/07/piano-jazz.png', 10, N'West')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'We4', N'Western Basic - On Sale ! ', 419, N'http://student-activity.binus.ac.id/paramabira/wp-content/uploads/sites/48/2020/06/Country-western-Music.jpg', 10, N'West')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [img], [quantity], [categoryID]) VALUES (N'We5', N'Advanced Tickles', 250, N'https://vcdn1-dulich.vnecdn.net/2021/11/25/1-jpeg-3325-1637825320.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=TKT65LXUKS0lgNBHPmQAgA', 10, N'West')
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [Email], [Address], [roleID], [img]) VALUES (N'anhbsd', N'qwe1232', N'Duc Anh', N'anhbsd@gmail.com', N'VNUHCM', N'AD', N'No Image Provided')
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [Email], [Address], [roleID], [img]) VALUES (N'exact2', N'qweasdzxc', N'qazar22', N'asd@rfed', N'HNssss', N'US', N'')
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [Email], [Address], [roleID], [img]) VALUES (N'hoadnt2', N'1', N'Hòa DNT', N'namhuynh2610@gmail.com', N'Tân Uyên Ne', N'AD', NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [Email], [Address], [roleID], [img]) VALUES (N'hogwart1', N'qwerty', N'wonder2', N'asd@gmas', N'Ho Tay', N'US', N'')
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [Email], [Address], [roleID], [img]) VALUES (N'namhn', N'1', N'Nhựt Nam', N'namhn@gmail.com', N'Tp.HCM', N'US', N'https://nguoinoitieng.tv/images/nnt/102/0/bgkd.jpg')
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [Email], [Address], [roleID], [img]) VALUES (N'newuser1', N'oollooll', N'Vip user', N'vip@gmailfer', N'VN', N'US', N'')
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [Email], [Address], [roleID], [img]) VALUES (N'newuseral', N'qazwsx123', N'lenvena', N'sdk@dasds', N'advenc', N'US', N'No Image Provided')
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [Email], [Address], [roleID], [img]) VALUES (N'qweasdzxc', N'qazwsxedc', N'InternalF', N'asd@rfeding', N'QUS', N'US', N'No Image Provided')
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [Email], [Address], [roleID], [img]) VALUES (N'SE161000', N'1', N'Nguyễn Văn Đậu', N'vandau@gmail.com', N'HongKong', N'US', NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [fullName], [Email], [Address], [roleID], [img]) VALUES (N'trundr1', N'123', N'ndadasd', N'@dasdad', N'ADDA', N'US', N'No Image Provided')
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK__tblProduc__categ__3B75D760] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK__tblProduc__categ__3B75D760]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK__tblUsers__roleID__32E0915F] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK__tblUsers__roleID__32E0915F]
GO
USE [master]
GO
ALTER DATABASE [MusicManagement] SET  READ_WRITE 
GO
