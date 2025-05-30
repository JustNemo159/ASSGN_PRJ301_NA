USE [master]
GO
/****** Object:  Database [ASSGN_PRJ_Web_PhoneShop]    Script Date: 7/21/2023 3:15:29 PM ******/
CREATE DATABASE [ASSGN_PRJ_Web_PhoneShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASSGN_PRJ_Web_PhoneShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ASSGN_PRJ_Web_PhoneShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASSGN_PRJ_Web_PhoneShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ASSGN_PRJ_Web_PhoneShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASSGN_PRJ_Web_PhoneShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET RECOVERY FULL 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET  MULTI_USER 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASSGN_PRJ_Web_PhoneShop', N'ON'
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET QUERY_STORE = OFF
GO
USE [ASSGN_PRJ_Web_PhoneShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/21/2023 3:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/21/2023 3:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[AccountID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/21/2023 3:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/21/2023 3:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[productName] [nvarchar](255) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/21/2023 3:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[totalPrice] [float] NULL,
	[note] [nvarchar](255) NULL,
	[create_date] [date] NULL,
	[shipping_id] [int] NULL,
	[status] [nvarchar](20) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 7/21/2023 3:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 7/21/2023 3:15:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (1, N'long', N'123456', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (2, N'longpl2003', N'123456', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (3, N'tuanvm', N'123456', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (4, N'thaottp', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (5, N'huyvd', N'882003', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (6, N'masonmount', N'chelsea', 1, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (7, N'james', N'123', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (8, N'sonvt', N'1752010', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (9, N'linhnp', N'614000', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (10, N'longvhhe', N'123456', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (11, N'duongdd', N'123456', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (12, N'vanvd', N'123456', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (13, N'hant', N'2271977', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (14, N'lukaku', N'123', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (15, N'enzo', N'chelsea', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (16, N'bruno', N'muvodich', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (17, N'longdepzai', N'123', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (18, N'iloveyou', N'together', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (19, N'longpl', N'1082003', 1, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (20, N'iloveprj', N'123456', 0, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (21, N'nkunku', N'chelseafc', 0, 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (22, N'ilovefptu', N'123', 1, 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (45, N'dungla', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (46, N'huytuan', N'99222003', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'APPLE')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'SAMSUNG')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'VIVO')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'OPPO')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (66, 42, N'Samsung Galaxy S21 Ultra', N'https://cdn.tgdd.vn/Products/Images/42/226316/samsung-galaxy-s21-ultra-bac-600x600-1-200x200.jpg', 789, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (68, 44, N'iPhone 13 Pro', N'https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-thumb-600x600.jpg', 899, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (69, 44, N'Samsung Galaxy S21 Ultra', N'https://cdn.tgdd.vn/Products/Images/42/226316/samsung-galaxy-s21-ultra-bac-600x600-1-200x200.jpg', 789, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (70, 45, N'iPhone 13', N'https://cdn.nguyenkimmall.com/images/detailed/756/dien-thoai-iphone-13-128gb-hong-1.jpg', 690, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (71, 46, N'Samsung Galaxy S20 FE', N'https://cdn.tgdd.vn/Products/Images/42/224859/samsung-galaxy-s20-fan-edition-xanh-la-thumbnew-600x600.jpeg', 880, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (72, 47, N'iPhone 12', N'https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-tim-1-600x600.jpg', 500, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (73, 47, N'OPPO Find X3 Pro', N'https://cdn.tgdd.vn/Products/Images/42/232190/oppo-find-x3-pro-black-001-1-600x600.jpg', 389, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (74, 47, N'Vivo V21 5G', N'https://cdn11.dienmaycholon.vn/filewebdmclnew/DMCL21/Picture//Apro/Apro_product_26479/v21-5g8gb128gb-_multi_2_957_450.png.webp', 389, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id], [status]) VALUES (42, 4, 789, N'ok', CAST(N'2023-07-20' AS Date), 41, N'process')
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id], [status]) VALUES (44, 7, 1688, N'ok', CAST(N'2023-07-21' AS Date), 43, N'done')
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id], [status]) VALUES (45, 10, 690, N'Ship lun', CAST(N'2023-07-21' AS Date), 44, N'wait')
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id], [status]) VALUES (46, 4, 880, N'ship now', CAST(N'2023-07-21' AS Date), 45, N'wait')
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id], [status]) VALUES (47, 12, 1778, N'ok', CAST(N'2023-07-21' AS Date), 46, N'wait')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (19, N'iPhone 14 Pro Max', N'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-den-thumb-600x600.jpg', 999.0000, N'iPhone 14 - Một bước tiến vượt trội của công nghệ di động.', N'iPhone 14, thiết bị đột phá của Apple, kế thừa tinh hoa của dòng iPhone trước đó và mang đến những nâng cấp đáng kể. Với thiết kế hiện đại, màn hình OLED sắc nét, camera chất lượng cao, và vi xử lý mạnh mẽ, iPhone 14 đem lại trải nghiệm tuyệt vời cho người dùng. Với khả năng kết nối 5G và hỗ trợ công nghệ thực tế tăng cường (AR), iPhone 14 mở ra một thế giới mới của ứng dụng và trò chơi đầy sáng tạo.', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (20, N'iPhone 13 Pro', N'https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-thumb-600x600.jpg', 899.0000, N'iPhone 13 Pro không có nhiều sự thay đổi về thiết kế, khi máy vẫn sở hữu kiểu dáng tương tự như điện thoại iPhone 12 ', N'Mỗi lần ra mắt phiên bản mới là mỗi lần iPhone chiếm sóng trên khắp các mặt trận và lần này cái tên khiến vô số người "sục sôi" là iPhone 13 Pro, chiếc điện thoại thông minh vẫn giữ nguyên thiết kế cao cấp, cụm 3 camera được nâng cấp, cấu hình mạnh mẽ cùng thời lượng pin lớn ấn tượng. ', 1, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (21, N'Samsung Galaxy S21 Ultra', N'https://cdn.tgdd.vn/Products/Images/42/226316/samsung-galaxy-s21-ultra-bac-600x600-1-200x200.jpg', 789.0000, N'Samsung Galaxy S21 Ultra - Thiết bị đỉnh cao của công nghệ di động', N' Samsung Galaxy S21 Ultra là một trong những smartphone hàng đầu của Samsung. Với màn hình Dynamic AMOLED 2X lớn, camera đa cảm biến mạnh mẽ và hiệu suất vượt trội, chiếc điện thoại này mang đến trải nghiệm tuyệt vời cho người dùng. Khả năng chụp ảnh chuyên nghiệp, hỗ trợ quay video 8K và khả năng kết nối 5G, Galaxy S21 Ultra là một công cụ sáng tạo và mạnh mẽ trong lòng bàn tay của bạn.', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (22, N'iPhone 13', N'https://cdn.nguyenkimmall.com/images/detailed/756/dien-thoai-iphone-13-128gb-hong-1.jpg', 690.0000, N'iPhone 13 128GB có hiệu năng vượt trội nhờ chip Apple A15 Bionic', N'Điện thoại iPhone 13 Hồng được trang bị con chip A15 Bionic sản xuất siêu mạnh trên tiến trình 5nm, nhờ đó điện thoại đạt được hiệu năng ấn tượng, CPU nhanh hơn 50%, GPU nhanh hơn 30% khi so với các mẫu đối thủ cùng phân khúc. Đồng thời, với hiệu năng được cải tiến, người dùng có được những trải nghiệm tốt hơn trên điện thoại khi dùng các ứng dụng chỉnh sửa ảnh hay “phá đảo” các tựa game đồ họa cao mượt mà.', 1, 14)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (23, N'Samsung Galaxy Note 20 Ultra', N'https://cdn.tgdd.vn/Products/Images/42/220522/samsung-galaxy-note-20-ultra-vangdong-600x600-600x600.jpg', 600.0000, N'Samsung Galaxy Note 20 Ultra - Sức mạnh và sự sáng tạo vượt trội.', N'Samsung Galaxy Note 20 Ultra là sự kết hợp hoàn hảo giữa hiệu suất cao, thiết kế sang trọng và tính năng đột phá. Với màn hình Dynamic AMOLED, bút S Pen thông minh và camera đa cảm biến, chiếc điện thoại này cho phép người dùng làm việc sáng tạo và tận hưởng giải trí tuyệt vời. Galaxy Note 20 Ultra cũng hỗ trợ kết nối 5G và khả năng chụp ảnh, quay video chất lượng cao.', 2, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (24, N'iPhone 12', N'https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-tim-1-600x600.jpg', 500.0000, N'iPhone 12 - Sự đổi mới táo bạo của Apple', N' iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12', 1, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (25, N'Samsung Galaxy Z Fold 3', N'https://cdn.xtmobile.vn/vnt_upload/product/Hinh_DT/SamSung/thumbs/(600x600)_crop_galaxy-z-fold-3-5g-xtmobile.jpg', 600.0000, N'Samsung Galaxy Z Fold 3 - Thế hệ mới của công nghệ gập màn hình.', N'Samsung Galaxy Z Fold 3 là một trong những chiếc điện thoại gập màn hình đáng chú ý nhất trên thị trường. Với màn hình Infinity Flex Dynamic AMOLED, thiết kế gọn nhẹ và tính năng đột phá, Galaxy Z Fold 3 mang đến trải nghiệm độc đáo cho người dùng. Chiếc điện thoại này cũng hỗ trợ bút S Pen, kết nối 5G và khả năng chụp ảnh, quay video chất lượng cao.', 2, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (26, N'Samsung Galaxy S20 FE', N'https://cdn.tgdd.vn/Products/Images/42/224859/samsung-galaxy-s20-fan-edition-xanh-la-thumbnew-600x600.jpeg', 880.0000, N'Samsung Galaxy S20 FE - Hiệu suất cao với giá cả hợp lý.', N'Samsung Galaxy S20 FE (Fan Edition) là phiên bản đặc biệt dành cho người hâm mộ với giá cả phải chăng. Với màn hình Dynamic AMOLED, camera chất lượng cao và hiệu suất mạnh mẽ, S20 FE mang đến trải nghiệm cao cấp với mức giá hợp lý. Thiết bị này cũng hỗ trợ kết nối 5G, khả năng chụp ảnh, quay video 4K và đáp ứng nhu cầu đa phương tiện của người dùng.', 2, 14)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (27, N'OPPO Find X3 Pro', N'https://cdn.tgdd.vn/Products/Images/42/232190/oppo-find-x3-pro-black-001-1-600x600.jpg', 389.0000, N'OPPO Find X3 Pro - Sự hoàn hảo trong mọi chi tiết.', N'OPPO Find X3 Pro là chiếc điện thoại cao cấp nhất của OPPO. Với màn hình AMOLED 120Hz, hệ thống camera đa cảm biến chất lượng cao và hiệu suất mạnh mẽ của vi xử lý Snapdragon 888, Find X3 Pro mang đến trải nghiệm đỉnh cao cho người dùng. Thiết bị này cũng hỗ trợ công nghệ sạc nhanh SuperVOOC 2.0, kết nối 5G và khả năng chụp ảnh, quay video chất lượng cao.', 4, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (28, N'Vivo X60 Pro+', N'https://cdn.tgdd.vn/Products/Images/42/232104/Vivo-x60-Pro-Plus--600x600.jpg', 390.0000, N'Vivo X60 Pro+ - Sự kết hợp hoàn hảo giữa hiệu suất và nhiếp ảnh.', N'Vivo X60 Pro+ là một trong những chiếc điện thoại hàng đầu của Vivo. Với hệ thống camera Zeiss đa cảm biến chất lượng cao và hiệu suất mạnh mẽ của vi xử lý Qualcomm Snapdragon 888, X60 Pro+ đem đến khả năng chụp ảnh chuyên nghiệp và trải nghiệm mượt mà. Thiết bị này cũng hỗ trợ màn hình AMOLED, công nghệ sạc nhanh và tính năng ổn định trong thiết kế và hoạt động.', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (29, N'Vivo V21 5G', N'https://cdn11.dienmaycholon.vn/filewebdmclnew/DMCL21/Picture//Apro/Apro_product_26479/v21-5g8gb128gb-_multi_2_957_450.png.webp', 389.0000, N'Vivo V21 5G - Tự tin chụp ảnh selfie đẳng cấp.', N'Vivo V21 5G là một chiếc điện thoại tầm trung mới nhất của Vivo. Với camera selfie 44MP OIS và tính năng chụp ảnh chuyên nghiệp, V21 5G cho phép bạn tự tin chụp ảnh đẹp mỗi lần. Thiết bị này cũng hỗ trợ kết nối 5G, màn hình AMOLED, hiệu suất ổn định và khả năng sử dụng lâu dài.', 3, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (30, N'OPPO Reno6 Pro+', N'https://cdn.tgdd.vn/Products/Images/42/236187/oppo-reno6-pro-grey-600x600.jpg', 380.0000, N'OPPO Reno6 Pro+ - Sự sáng tạo vượt trội trong thiết kế.', N'OPPO Reno6 Pro+ là một chiếc điện thoại hàng đầu trong dòng Reno6 của OPPO. Với màn hình AMOLED 90Hz, hệ thống camera đa cảm biến và hiệu suất ổn định của vi xử lý Snapdragon 870, Reno6 Pro+ cung cấp trải nghiệm tuyệt vời cho người dùng. Thiết bị này cũng hỗ trợ công nghệ sạc nhanh SuperVOOC 2.0, kết nối 5G và khả năng chụp ảnh, quay video chất lượng cao.', 4, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (31, N'Vivo Y73', N'https://cdn.tgdd.vn/Products/Images/42/241348/vivo-y73-2021-1-600x600.jpg', 389.0000, N'Vivo Y73 - Sự kết hợp hoàn hảo giữa hiệu suất và phong cách.', N'Vivo Y73 là một chiếc điện thoại tầm trung phù hợp cho người dùng yêu thích phong cách. Với màn hình AMOLED, camera chất lượng cao và hiệu suất ổn định của vi xử lý MediaTek Helio G95, Y73 đem đến trải nghiệm tuyệt vời cho người dùng. Thiết bị này cũng hỗ trợ công nghệ sạc nhanh, khả năng chụp ảnh, quay video chất lượng cao và pin dung lượng lớn để đáp ứng nhu cầu hàng ngày.', 3, 19)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (32, N'OPPO A94', N'https://cdn.tgdd.vn/Products/Images/42/234316/oppo-a94-black-thumb-purple-600x600-200x200.jpg', 369.0000, N'OPPO A94 - Mạnh mẽ và thời trang.', N'OPPO A94 là một chiếc điện thoại tầm trung đáng chú ý của OPPO. Với màn hình AMOLED, camera chất lượng cao và hiệu suất ổn định của vi xử lý MediaTek Helio P95, A94 mang đến trải nghiệm đáng tin cậy cho người dùng hàng ngày. Thiết bị này cũng hỗ trợ công nghệ sạc nhanh VOOC 4.0, khả năng chụp ảnh, quay video chất lượng cao và pin dung lượng lớn để đáp ứng nhu cầu sử dụng lâu dài.', 4, 15)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (33, N'Vivo X50 Pro', N'https://asia-exstatic-vivofs.vivo.com/PSee2l50xoirPK7y/1595385977372/0c33091c300449b7ffe0d6225a98684c.png', 389.0000, N'Vivo X50 Pro - Điện thoại chuyên nghiệp cho nhiếp ảnh gia.', N'Vivo X50 Pro là một chiếc điện thoại chuyên nghiệp với hệ thống camera ổn định và chất lượng cao. Với khả năng chụp ảnh chống rung gimbal và cảm biến ảnh lớn, X50 Pro đem đến khả năng chụp ảnh chuyên nghiệp và mượt mà. Thiết bị này cũng hỗ trợ màn hình AMOLED, hiệu suất ổn định và khả năng sáng tạo trong nhiếp ảnh.', 3, 18)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (35, N'OPPO F19 Pro+', N'https://cdn.tgdd.vn/Products/Images/42/235310/oppo-f19-pro-plus-600x600-600x600.jpg', 299.0000, N' OPPO F19 Pro+ - Mỏng nhẹ và sáng tạo.', N'OPPO F19 Pro+ là một chiếc điện thoại tầm trung tiên tiến của OPPO. Với thiết kế mỏng nhẹ, màn hình AMOLED, camera đa cảm biến và hiệu suất ổn định của vi xử lý MediaTek Dimensity 800U, F19 Pro+ mang đến trải nghiệm sáng tạo và tiện ích cho người dùng. Thiết bị này cũng hỗ trợ công nghệ sạc nhanh VOOC 4.0, khả năng chụp ảnh, quay video chất lượng cao và pin dung lượng lớn để đáp ứng nhu cầu sử dụng hàng ngày.', 4, 15)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (21, N'Vũ Đức Huy', N'0971200366', N'')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (22, N'Khánh Toàn', N'09001009', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (23, N'Long Hoang', N'0794126568', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (24, N'Long Hoang', N'0794126568', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (25, N'Tuan', N'0913562231', N'Nghe An')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (26, N'Long Hoang', N'0794126568', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (27, N'Long Hoang', N'0794126568', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (28, N'Long Hoang', N'0794126568', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (29, N'Thao', N'0913552231', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (30, N'Long Hoang', N'0794126568', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (31, N'Huy', N'0987655555555555555', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (32, N'Long Hoang', N'0794126568', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (33, N'Long Hoang', N'0794126568', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (34, N'Long Hoang', N'0794126568', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (36, N'Long Hoang', N'0794126568', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (37, N'TH', N'0123456789', N'Ha Giang')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (38, N'Tuan', N'0912345678', N'Hoa lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (39, N'Long Hoang', N'0794126568', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (40, N'Long Hoang', N'0794126568', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (41, N'Loi Quang Nguyen', N'0912345678', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (42, N'Hai Kieu', N'0812345678', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (43, N'Long Hoang', N'0794126568', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (44, N'Long Hoang', N'0794126568', N'Hoa Lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (45, N'Tuan', N'0912345678', N'Hoa lac')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (46, N'Van', N'0912345678', N'Pha Lai')
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [status]  DEFAULT ('wait') FOR [status]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_product] FOREIGN KEY([AccountID])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shipping] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shipping]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_Category]
GO
USE [master]
GO
ALTER DATABASE [ASSGN_PRJ_Web_PhoneShop] SET  READ_WRITE 
GO
