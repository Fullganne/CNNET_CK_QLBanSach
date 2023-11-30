USE [master]
GO
/****** Object:  Database [QLBANSACH]    Script Date: 29/11/2023 8:50:40 CH ******/
CREATE DATABASE [QLBANSACH]
GO

USE [QLBANSACH]
GO
/****** Object:  Table [dbo].[AUTHORS]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTHORS](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Image] [text] NULL,
	[Description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BANNERS]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANNERS](
	[Id] [varchar](10) NOT NULL,
	[Image] [text] NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BILLS]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILLS](
	[Id] [varchar](10) NOT NULL,
	[OrderId] [varchar](10) NOT NULL,
	[UserId] [varchar](10) NOT NULL,
	[VoucherId] [varchar](10) NOT NULL,
	[BillDate] [datetime] NULL,
	[TotalAmount] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOOKDETAILS]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOKDETAILS](
	[BookId] [varchar](10) NOT NULL,
	[CategoryId] [varchar](10) NOT NULL,
	[Dimensions] [char](20) NULL,
	[Pages] [int] NULL,
	[Description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOOKIMG]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOKIMG](
	[BookId] [varchar](10) NOT NULL,
	[Image0] [text] NULL,
	[Image1] [text] NULL,
	[Image2] [text] NULL,
	[Image3] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOOKS]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOKS](
	[Id] [varchar](10) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[AuthorId] [varchar](10) NOT NULL,
	[SupplierId] [varchar](10) NOT NULL,
	[UnitPrice] [money] NULL,
	[PricePercent] [decimal](10, 2) NULL,
	[PublishYear] [int] NULL,
	[Available] [bit] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CARTS]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARTS](
	[Id] [varchar](10) NOT NULL,
	[BookId] [varchar](10) NOT NULL,
	[CustomerId] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIES]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIES](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMERS]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMERS](
	[Id] [varchar](10) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Photo] [text] NULL,
	[Activated] [bit] NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](255) NULL,
	[Phone] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERDETAILS]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERDETAILS](
	[Id] [varchar](10) NOT NULL,
	[OrderId] [varchar](10) NOT NULL,
	[BookId] [varchar](10) NOT NULL,
	[UnitPrice] [money] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[Id] [varchar](10) NOT NULL,
	[CustomerId] [varchar](10) NOT NULL,
	[OrderDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[Address] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLEACTIONS]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLEACTIONS](
	[Id] [varchar](10) NOT NULL,
	[RoleId] [varchar](10) NOT NULL,
	[WebActionId] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLES]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLES](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUPPLIERS]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUPPLIERS](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [varchar](255) NULL,
	[Description] [ntext] NULL,
	[Phone] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERROLES]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERROLES](
	[Id] [varchar](10) NOT NULL,
	[UserId] [varchar](10) NOT NULL,
	[RoleId] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[Id] [varchar](10) NOT NULL,
	[FullName] [nvarchar](30) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[Email] [varchar](255) NULL,
	[Phone] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VOUCHERS]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VOUCHERS](
	[Id] [varchar](10) NOT NULL,
	[Quantity] [int] NULL,
	[PercentDiscount] [decimal](18, 0) NULL,
	[MaxDiscount] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WEBACTIONS]    Script Date: 29/11/2023 8:50:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEBACTIONS](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AUTHORS] ([Id], [Name], [Image], [Description]) VALUES (N'A100', N'Ngô Tất Tố', N'assets/authors/NgoTatTo.jpg', N'Là văn,nhà nho, nhà văn học Việt Nam')
INSERT [dbo].[AUTHORS] ([Id], [Name], [Image], [Description]) VALUES (N'A101', N'Nam Cao', N'assets/authors/NamCao.jpg', N'Nhà văn, nhà thơ, nhà báo và cũng là một chiến sĩ, liệt sỹ người Việt Nam')
INSERT [dbo].[AUTHORS] ([Id], [Name], [Image], [Description]) VALUES (N'A102', N'Vũ Trọng Phụng', N'assets/authors/VuTrongPhung.jpg', N'')
INSERT [dbo].[AUTHORS] ([Id], [Name], [Image], [Description]) VALUES (N'A103', N'Nguyễn Minh Châu', N'assets/authors/NguyenMinhChau.jpg', N'')
INSERT [dbo].[AUTHORS] ([Id], [Name], [Image], [Description]) VALUES (N'A104', N'Thạch Lam', N'assets/authors/ThachLam.jpg', N'')
INSERT [dbo].[AUTHORS] ([Id], [Name], [Image], [Description]) VALUES (N'A105', N'Nguyễn Khuyến', N'assets/authors/NguyenKhuyen.jpg', N'')
INSERT [dbo].[AUTHORS] ([Id], [Name], [Image], [Description]) VALUES (N'A106', N'Nguyễn Du', N'assets/authors/NguyenDu.jpg', N'')
INSERT [dbo].[AUTHORS] ([Id], [Name], [Image], [Description]) VALUES (N'A107', N'Chủ tịch Hồ CHí Minh', N'assets/authors/HoChiMinh.jpg', N'')
INSERT [dbo].[AUTHORS] ([Id], [Name], [Image], [Description]) VALUES (N'A108', N'Lưu Quang Vũ', N'assets/authors/LuuQuangVu.jpg', N'')
INSERT [dbo].[AUTHORS] ([Id], [Name], [Image], [Description]) VALUES (N'A201', N'Nguyễn Đoàn Minh Thư', N'assets/authors/Nguy?n Ðoàn Minh Thu.jpg', N'Amateur Psychology là một podcast về khoa học xã hội, bằng cách sử dụng tâm lý học qua các nghiên cứu và lý thuyết được chứng minh bằng các thí nghiệm khoa học, Amateur Psychology sẽ giải mã những hiện tượng tâm lý học trong đời sống hằng ngày một cách khoa học và dễ dàng ứng dụng vào cuộc sống.')
INSERT [dbo].[AUTHORS] ([Id], [Name], [Image], [Description]) VALUES (N'A202', N'Maria Nemeth PhD', N'assets/authors/Maria Nemeth PhD.jpg', N'')
INSERT [dbo].[AUTHORS] ([Id], [Name], [Image], [Description]) VALUES (N'A203', N'Trâu Hoành Minh', N'//', N'')
INSERT [dbo].[AUTHORS] ([Id], [Name], [Image], [Description]) VALUES (N'A204', N'Lim Sewon', N'', N'')
INSERT [dbo].[AUTHORS] ([Id], [Name], [Image], [Description]) VALUES (N'A205', N'Rasmus Hoài Nam', N'', N'')
GO
INSERT [dbo].[BANNERS] ([Id], [Image], [Name], [Description]) VALUES (N'B1', N'', N' Quảng cáo', N' Quảng cáo bán sách')
INSERT [dbo].[BANNERS] ([Id], [Image], [Name], [Description]) VALUES (N'B2', N'', N'Anh văn ', N'Quảng cáo sách anh văn')
GO
INSERT [dbo].[BILLS] ([Id], [OrderId], [UserId], [VoucherId], [BillDate], [TotalAmount]) VALUES (N'BL10000', N'O100001', N'U10000', N'VKANN', CAST(N'1905-07-15T00:00:00.000' AS DateTime), 200000.0000)
INSERT [dbo].[BILLS] ([Id], [OrderId], [UserId], [VoucherId], [BillDate], [TotalAmount]) VALUES (N'BL10001', N'O100000', N'U10000', N'VKANN', CAST(N'1905-07-11T00:00:00.000' AS DateTime), 180000.0000)
GO
INSERT [dbo].[BOOKDETAILS] ([BookId], [CategoryId], [Dimensions], [Pages], [Description]) VALUES (N'B1000', N'C_VH', N'20.5 x 14.5 cm      ', 720, N'Ngô Tất Tố sinh tại làng Lộc Hà, tổng Hội Phụ, phủ Từ Sơn, nay là thôn Lộc Hà, huyện Đông Anh, Hà Nội. Ông là một trong những nhà văn sáng lập trào lưu hiện thực trong nền NXB Văn Học nước nhà trước năm 1945 với các tác phẩm tiêu biểu như Tắt đèn, Việc làng, Lều chõng, Tập án cái đình... Ngô Tất Tố đồng thời là nhà báo nổi tiếng với biệt tài viết tản văn và chính luận, là nhà văn hoá thành danh với các pho truyện lịch sử, khảo cứu triết học, dịch thuật, phê bình... 
Với tổng số hơn 30 bút danh, trên hơn 30 tờ báo, tạp chí, suốt 30 năm cầm bút viết văn làm báo, Ngô Tất Tố đã để lại hơn 1500 tác phẩm các thể loại, trong đó có 1350 di tác... 
Ông được truy tặng Giải thưởng Hồ Chí Minh về NXB Văn Học nghệ thuật Đợt I (1996). Trên cả nước có 8 thành phố lớn có phố và đường phố mang tên Ngô Tất Tố.')
INSERT [dbo].[BOOKDETAILS] ([BookId], [CategoryId], [Dimensions], [Pages], [Description]) VALUES (N'B1001', N'C_VH', N'20.5 x 14.5 x 3.2 cm', 739, N'Nam Cao có nhiều đóng góp quan trọng đối với việc hoàn thiện phong cách truyện ngắn và tiểu thuyết Việt Nam nửa đầu thế kỷ XX . Với 15 năm cầm bút, Nam Cao đã để lại một văn nghiệp đồ sộ với 2 tiểu thuyết, 50 truyện ngắn, bút ký, ... trong đó có những nhân vật như Lão Hạc, giáo Thứ, Bá Kiến, Thị Nở, Chí Phèo,...không thể phai mờ trông tâm trí người đọc nhiều thế hệ . ')
INSERT [dbo].[BOOKDETAILS] ([BookId], [CategoryId], [Dimensions], [Pages], [Description]) VALUES (N'B1002', N'C_VH', N'20.5 x 14.5 x 1.1 cm', 222, N'Nhắc đến Vũ Trọng Phụng người ta nghĩ ngay tới một nhà văn tài hoa nhưng bạc mệnh. Có năng khiếu nghệ thuật từ nhỏ, ông sáng tác từ rất sớm và thử nghiệm mình trên nhiều thể loại: viết báo, viết kịch, sáng tác truyện ngắn, truyện vừa, tiểu thuyết, phê bình văn học… Nhưng có thể nói, tiểu thuyết và phóng sự là hai thể loại thành công nhất của nhà văn tài hoa này. Vũ Trọng Phụng được báo giới thời bấy giờ mệnh danh là “ông vua phóng sự đất Bắc”, là “nhà tiểu thuyết trác việt”.
Với giọng văn sắc sảo, mang đậm chất châm biếm, trào phúng và nội dung tư tưởng sâu sắc, các tác phẩm của Vũ Trọng Phụng đều hướng tới chủ đề hiện thực, tố cáo và vạch trần xã hội Việt Nam trước cách mạng tháng 8 - một xã hội bê bối với những tấn trò đời bi kịch. Đọc những trang văn của ông, người ta không khỏi ngậm ngùi, chua chát. Ra đi vì bệnh tật khi mới 27 tuổi đời, khi tài năng đang độ phát triển rực rỡ, Vũ Trọng Phụng để lại trong làng văn và trong lòng độc giả một chỗ trống không dễ gì khỏa lấp.')
INSERT [dbo].[BOOKDETAILS] ([BookId], [CategoryId], [Dimensions], [Pages], [Description]) VALUES (N'B1003', N'C_VH', N'20.5 x 14.5 x 2 cm  ', 423, N'Nguyễn Minh Châu là một trong những nhà văn tiêu biểu của nền Văn học Việt Nam hiện đại. Tác phẩm của ông luôn có sức hấp dẫn riêng biệt, nhà văn khẳng định bản sắc cá nhân nghệ sĩ bằng nét phong cách kết hợp hài hòa chất triết lý cuộc đời với chất trữ tình lãng mạn.
	Hình tượng nhân vật trong tác phẩm của ông được soi thấu bởi mối quan hệ đa chiều, phức tạp nhưng hòa hợp và thống nhất với tư tưởng đề cao tôn vinh những giá trị cuộc sống của nhà văn. Chiều sâu mới mẻ trong sáng tác truyện của Nguyễn Minh Châu chính là nảy sinh trong sự đổi mới các bình diện nhận thức đời sống, mạnh dạn đi tìm nhiều cách thể hiện khác nhau, tự làm phong phú các khả năng nghệ thuật của mình và của chung nền văn xuôi chúng ta.')
INSERT [dbo].[BOOKDETAILS] ([BookId], [CategoryId], [Dimensions], [Pages], [Description]) VALUES (N'B1004', N'C_VH', N'20.5 x 13.5 x 1 cm  ', 200, N'"Những cơn gió mạnh của đồng nội, mùi thơm mát của hoa cỏ và vẻ rộng rãi của khoảng trời mấy chiếm cả linh hồn tôi. Những cuộc đi chơi lâu trong các vườn chè nương sắn, hay trên sườn đồi làm cho người tôi bồng bột, hoạt độnghơn lên. Những lúc ấy, tôi muốn có một người con gái đi bên cạnh, để chia sẻ bao nhiêu cảm giác say sưa ấy.
Nhưng tôi còn ham muốn những cái thú mà một cô thiếu nữ không đem đến được. Tôi còn thích ngắm cảnh rừng đồi, thích vượt qua những nơi cỏ và lau sậy sắc làm sây sát cả chân tay. Những buổi trưa nắng, tôi tìm chỗ có bóng mát, phanh áo nằm trên cỏ thiu thiu ngủ..."
(Trích Nắng trong vườn)')
INSERT [dbo].[BOOKDETAILS] ([BookId], [CategoryId], [Dimensions], [Pages], [Description]) VALUES (N'B1005', N'C_VH', N'20.5 x 13.5 x 1 cm  ', 200, N'“Nguyễn Khuyến là người đã sáng tạo nên những áng văn chương điêu luyện, tuy thế, trong thơ ông tuyệt nhiên không thấy dấu vết của sự đẽo gọt cầu kì. Nhiều bài thơ dung dị của Nguyễn Khuyến cho ta cái cảm tưởng nhà thơ đã thoát ra khỏi cái vỏ vật chất của ngôn từ mà tóm bắt đúng cái thần của sự sống. Sự sống hiện ra trong thơ cô đúc đến đậm đặc, và thật như chính nó.” (Giáo sư NGUYỄN HUỆ CHI)
“Làm nên cái độc đáo riêng của nhà thơ thì chủ yếu là những vần thơ Nguyễn Khuyến viết về nông thôn, bao gồm những vần thơ viết về con người, cảnh vật thiên nhiên và về phong tục tập quán. Về phương diện này không có một nhà thơ nào đương thời viết được bằng ông, và trước đó, trong lịch sử văn học Việt Nam cũng chưa ai viết được như ông.” (Giáo sư NGUYỄN LỘC)')
INSERT [dbo].[BOOKDETAILS] ([BookId], [CategoryId], [Dimensions], [Pages], [Description]) VALUES (N'B1006', N'C_VH', N'20.5 x 13.5 x 1 cm  ', 201, N'Trong lịch sử mấy ngàn năm của dân tộc ta, chưa bao giờ có tác phẩm nào được nhân dân yêu quý như Truyện Kiều. 
	Mặc dù thể chế chính trị quốc gia thay đổi theo từng giai đoạn nhưng lòng người say mê Truyện Kiều không hề thay đổi. Vì sao vậy? Đào Nguyên Phổ, trong lời tựa cho quyển Đoạn trường tân thanh (tức Truyện Kiều) in năm 1902 đã trả lời: “Lời lẽ xinh xắn mà văn hoa, âm điệu ngân vang mà tròn trịa, tài liệu chọn rất rộng, sự việc kể rất tường, lượm lặt những diễm khúc tình tứ của cổ nhân, 
	lại góp đến cả phương ngôn ngạn ngữ nước nhà, mặn mà, vụn vặt không sót, quê mùa tao nhã đều thu… khiến người cười, khiến người khóc, khiến người vui, khiến người buồn, khiến người giở đi giở lại ngàn lần, càng đọc thuộc lại càng không biết chán, thật là một khúc Nam âm tuyệt xướng, một điệu tình phổ bực đầu vậy”…')
INSERT [dbo].[BOOKDETAILS] ([BookId], [CategoryId], [Dimensions], [Pages], [Description]) VALUES (N'B1007', N'C_VH', N'20.5 x 13.5 cm      ', 175, N'Chủ tịch Hồ Chí Minh là vị lãnh tụ thiên tài của Đảng và nhân dân Việt Nam, anh hùng giải phóng dân tộc, danh nhân văn hoá thế giới. Người kết tinh trong mình những phẩm chất và giá trị tinh thần cao quý nhất của giai cấp công nhân và dân tộc việt Nam. Cuộc đời, sự nghiệp của Người là một tấm gương sáng vì dân, vì nước. Trong suốt cuộc đời hoạt động cách mạng, Người đã trải qua nhiều khó khăn, gian khổ, thậm chí nguy hiểm đến tính mạng, nhưng dù bất kỳ hoàn cảnh nào. Người cũng vẫn luôn lạc quan, tin tưởng vào thắng lợi của cách mạng. Tinh thần ấy thể hiện rõ trong nhiều trước tác của Người, trong đó tập thơ Nhật ký trong tù.
	Đây là một tập thơ chữ Hán, gồm hơn một trăm bài thơ, phần cuối có một số ghi chép về quân sự và thời sự, được Chủ tịch Hồ Chí Minh sáng tác trong thời gian hơn một năm (từ 29-8-1942 đến 10-9-1943) Người bị chính quyền địa phương của Tưởng Giới Thạch bắt giam trái phép tại các nhà tù ở tỉnh Quảng tây, Trung Quốc. Nhật ký trong tù lên án chế độc nhà tù hà khắc của chính quyền Quốc dân Đảng, thể hiện tinh thần lạc quan cách mạng và tình cảm nhân đạo cộng sản chủ nghĩa cao đẹp của Chủ tịch Hồ Chí Minh. Tập thơ được đánh giá là một văn kiện lịch sử quan trọng, một tác phẩm văn học xuất sắc, có tác dụng giáo dục sâu sắc phẩm chất và đạo đức cách mạng cho nhiều thế hệ.
Nhật Ký Trong Tù 
Chủ tịch Hồ Chí Minh là vị lãnh tụ thiên tài của Đảng và nhân dân Việt Nam, anh hùng giải phóng dân tộc, danh nhân văn hoá thế giới. Người kết tinh trong mình những phẩm chất và giá trị tinh thần cao quý nhất của giai cấp công nhân và dân tộc việt Nam. Cuộc đời, sự nghiệp của Người là một tấm gương sáng vì dân, vì nước. Trong suốt cuộc đời hoạt động cách mạng, Người đã trải qua nhiều khó khăn, gian khổ, thậm chí nguy hiểm đến tính mạng, nhưng dù bất kỳ hoàn cảnh nào. Người cũng vẫn luôn lạc quan, tin tưởng vào thắng lợi của cách mạng. Tinh thần ấy thể hiện rõ trong nhiều trước tác của Người, trong đó tập thơ Nhật ký trong tù.
Đây là một tập thơ chữ Hán, gồm hơn một trăm bài thơ, phần cuối có một số ghi chép về quân sự và thời sự, được Chủ tịch Hồ Chí Minh sáng tác trong thời gian hơn một năm (từ 29-8-1942 đến 10-9-1943) Người bị chính quyền địa phương của Tưởng Giới Thạch bắt giam trái phép tại các nhà tù ở tỉnh Quảng tây, Trung Quốc. Nhật ký trong tù lên án chế độc nhà tù hà khắc của chính quyền Quốc dân Đảng, thể hiện tinh thần lạc quan cách mạng và tình cảm nhân đạo cộng sản chủ nghĩa cao đẹp của Chủ tịch Hồ Chí Minh. Tập thơ được đánh giá là một văn kiện lịch sử quan trọng, một tác phẩm văn học xuất sắc, có tác dụng giáo dục sâu sắc phẩm chất và đạo đức cách mạng cho nhiều thế hệ.')
INSERT [dbo].[BOOKDETAILS] ([BookId], [CategoryId], [Dimensions], [Pages], [Description]) VALUES (N'B1008', N'C_VH', N'20.5 x 13.5 cm      ', 175, N'Với gia tài tác phẩm để lại, có thể nói, Lưu Quang Vũ đã có những đóng góp dấu ấn trong sự nghiệp sáng tác văn chương và là một trong những tác gia quan trọng của văn học Việt Nam sau 1975, đặc biệt về lĩnh vực sân khấu. Khi còn sống, ông đã đoạt nhiều giải thưởng sáng tác, đáng kể nhất là về kịch bản, có thể gọi ông là “Cây bút vàng” bởi đã nhận được rất nhiều huy chương vàng hội diễn sân khấu chuyên nghiệp toàn quốc. Năm 2000, Lưu Quang Vũ được truy tặng Giải thưởng Hồ Chí Minh về Văn học nghệ thuật. Ông là tác giả trẻ tuổi nhất được trao giải thưởng cao quý này. Nhiều vở kịch của ông cho đến nay vẫn được dàn dựng và luôn được công chúng mến mộ. 
	Nội dung hai vở kịch nổi tiếng Tôi và chúng ta, Hồn Trương Ba da hàng thịt của Lưu Quang Vũ cũng được trích giảng trong chương trình Ngữ Văn của trường phổ thông.')
INSERT [dbo].[BOOKDETAILS] ([BookId], [CategoryId], [Dimensions], [Pages], [Description]) VALUES (N'B2000', N'C_TL', N'17 x 13 x 1 cm      ', 184, N'Hành tinh của một kẻ nghĩ nhiều là hành trình khám phá thế giới nội tâm của một người trẻ. Đó là một hành tinh đầy hỗn loạn của những suy nghĩ trăn trở, những dằn vặt, những cuộc chiến nội tâm, những cảm xúc vừa phức tạp cũng vừa rất đỗi con người. Một thế giới quen thuộc với tất cả chúng ta.
Và nếu bạn cũng là một kẻ nghĩ nhiều, chào mừng bạn đến với hành tinh này.“Sự cô đơn không nằm ở việc không có bạn bè hay người thân mà ngay cả trong sự sum vầy ta vẫn cảm thấy không có ai có thể hiểu mình tường tận từ sâu tâm hồn. Là sự cô đơn như thể chỉ có một mình mình trên một hành tinh đơn độc trong đầu, một hành tinh không bao giờ có khách viếng thăm”.')
INSERT [dbo].[BOOKDETAILS] ([BookId], [CategoryId], [Dimensions], [Pages], [Description]) VALUES (N'B2001', N'C_TL', N'24 x 13 x 1.7 cm    ', 420, N'Tiền là một chủ đề không dễ chịu với hầu hết chúng ta. Nhiều người thà nói về cuộc sống tình dục của họ còn hơn nói về số dư tài khoản ngân hàng. Chúng ta yêu tiền và chúng ta cũng ghét nó. Chúng ta không thể sống với nó, và cũng không thể sống thiếu nó. Tiền có thể là cội nguồn cho niềm vui và sự sáng tạo, cũng có thể mang lại sự thất vọng và đau khổ tùy thuộc vào mối quan hệ của chúng ta với nó. 
Và trong ta hình thành đủ loại cảm xúc nghi ngờ và sợ hãi, mong ước và kỳ vọng mỗi khi đối mặt với tiền - không chỉ khi chúng ta gặp một nhà hoạch định tài chính hay nhân viên tín dụng, mà là trên mọi khía cạnh trong cuộc sống.
“Năng lượng của tiền” sẽ mang đến cho mọi người một công cụ để sử dụng tất cả những thông tin và kiến thức sẵn về tiền, cũng như để tiếp cận với trí tuệ chúng ta - bởi kiến thức cộng với sự thông minh sẽ mang lại sức mạnh, đặc biệt là sức mạnh của ĐỒNG TIỀN.')
INSERT [dbo].[BOOKDETAILS] ([BookId], [CategoryId], [Dimensions], [Pages], [Description]) VALUES (N'B2002', N'C_TL', N'20.5 x 14.5 x 1.4 cm', 312, N'“Tâm lý học tính cách” lấy “chín kiểu hình tính cách” làm trọng tâm, với nền tảng là những lý luận của tâm lý học tính cách và tâm lý học chiều sâu , giới thiệu đến bạn đọc một cách chi tiết về đặc trưng và phương pháp cải thiện khuyết điểm dành cho chín kiểu hình tính cách của con người.
Với ngôn từ dễ hiểu, ví dụ sinh động cùng nội dung chi tiết mang tính xác thực cao, tôi tin rằng cuốn sách này không chỉ giúp bạn đọc nhận thức được kiểu hình tính cách của bản thân, mà quan trọng hơn là giúp các bạn phát huy sở trường, đồng thời khắc phục khiếm khuyết của chính mình.
Có thể nói, cuốn sách này cung cấp cho độc giả công cụ hữu ích để tự hoàn thiện tính cách. Qua đây, tác giả hy vọng mỗi người đều may mắn mở được cánh cửa lớn hướng về cuộc sống hạnh phúc cá nhân.')
INSERT [dbo].[BOOKDETAILS] ([BookId], [CategoryId], [Dimensions], [Pages], [Description]) VALUES (N'B2003', N'C_TL', N'20.5 x 14.5 x 0.8 cm', 200, N'Làm Gì Có Ai Thực Lòng Muốn Chết
Cố giáo sư Lim Sewon là giáo sư tại Đại học Y khoa Sungkyunkwan và là bác sĩ tâm thần tại bệnh viện Kang Buk Samsung. Công việc của giáo sư Lim Sewon là tìm lại hạnh phúc cho những người đang đánh mất chúng, người ta gọi đó là công việc "điều trị bệnh trầm cảm".
Ngôn từ giản dị nhưng sâu sắc, ẩn chứa nhiều thông điệp tích cực và chữa lành cho bất cứ ai đọc cuốn sách này, hy vọng vào tương lai để có thể được hạnh phúc. Khi đặt bút viết cuốn sách này, tác giả muốn giúp nhiều người hơn, kể cả chính ông, những người đang phải vật lộn với nỗi đau khổ, để học có thể tìm thấy dẫu chỉ là một chút của niềm hy vọng mong manh, để có thể nắm trong tay một manh mối nhỏ của hạnh phúc.
Cuốn sách này có thể giúp đỡ dù chỉ là một phần nhỏ bé cho những ai đang rơi vào tuyệt vọng, hay những người thân trong gia đình họ, trên hết là tất cả những người muốn lấp đầy từng khoảnh khắc của cuộc đời mình bằng niềm hạnh phúc.')
INSERT [dbo].[BOOKDETAILS] ([BookId], [CategoryId], [Dimensions], [Pages], [Description]) VALUES (N'B2004', N'C_KTBK', N'20.5 x 14.5 x 0.8 cm', 163, N'Theo dòng chảy lịch sử, mỗi giai đoạn thăng trầm đều xuất hiện những nhà khoa học kiệt xuất với những phát minh làm thay đổi cuộc sống của con người. Thực tế đã chứng minh cuộc sống của chúng ta trở nên tốt đẹp và hiện đại hơn nhờ sự đóng góp không nhỏ của các nhà khoa học này.
Vậy đó là những nhà khoa học nào? Họ đã đóng góp những nghiên cứu, phát minh nào cho thế giới? Tất cả sẽ được giải đáp trong cuốn sách Giai thoại về các thiên tài - Hành trình khám phá tài năng do tác giả Rasmus Hoài Nam biên soạn.
Bên cạnh việc cung cấp thông tin chi tiết về các nhà khoa học thiên tài có nhiều đóng góp cho nhân loại, cuốn sách còn mang đến cho độc giả thêm nhiều thông tin về cuộc đời và những giai thoại thú vị, những điểm khác biệt của các nhà khoa học này.
Theo tác giả, điểm khác biệt đó chính là một trong những yếu tố quan trọng để tạo ra những phát minh vĩ đại.')
GO
INSERT [dbo].[BOOKIMG] ([BookId], [Image0], [Image1], [Image2], [Image3]) VALUES (N'B1000', N'assets/productImg/B1000-0.png', N'assets/productImg/B1000-1.jpg', N'assets/productImg/B1000-2.jpg', N'assets/productImg/B1000-3.png')
INSERT [dbo].[BOOKIMG] ([BookId], [Image0], [Image1], [Image2], [Image3]) VALUES (N'B1001', N'assets/productImg/B1001-0.png', N'assets/productImg/B1001-1.jpg', N'assets/productImg/B1001-2.jpg', N'assets/productImg/B1001-3.png')
INSERT [dbo].[BOOKIMG] ([BookId], [Image0], [Image1], [Image2], [Image3]) VALUES (N'B1002', N'assets/productImg/B1002-0.jpg', N'assets/productImg/B1002-1.jpg', N'assets/productImg/B1002-2.jpg', N'assets/productImg/B1002-3.jpg')
INSERT [dbo].[BOOKIMG] ([BookId], [Image0], [Image1], [Image2], [Image3]) VALUES (N'B1003', N'assets/productImg/B1003-0.jpg', N'assets/productImg/B1003-1.jpg', N'assets/productImg/B1003-2.jpg', N'assets/productImg/B1003-3.jpg')
INSERT [dbo].[BOOKIMG] ([BookId], [Image0], [Image1], [Image2], [Image3]) VALUES (N'B1004', N'assets/productImg/B1004-0.jpg', N'assets/productImg/B1004-1.jpg', N'assets/productImg/B1004-2.jpg', N'assets/productImg/B1004-3.jpg')
INSERT [dbo].[BOOKIMG] ([BookId], [Image0], [Image1], [Image2], [Image3]) VALUES (N'B1005', N'assets/productImg/B1005-0.jpg', N'assets/productImg/B1005-1.jpg', N'assets/productImg/B1005-2.jpg', N'assets/productImg/B1005-3.jpg')
INSERT [dbo].[BOOKIMG] ([BookId], [Image0], [Image1], [Image2], [Image3]) VALUES (N'B1006', N'assets/productImg/B1006-0.jpg', N'assets/productImg/B1006-1.jpg', N'assets/productImg/B1006-2.jpg', N'assets/productImg/B1006-3.jpg')
INSERT [dbo].[BOOKIMG] ([BookId], [Image0], [Image1], [Image2], [Image3]) VALUES (N'B1007', N'assets/productImg/B1007-0.jpg', N'assets/productImg/B1007-1.jpg', N'assets/productImg/B1007-2.jpg', N'assets/productImg/B1007-3.jpg')
INSERT [dbo].[BOOKIMG] ([BookId], [Image0], [Image1], [Image2], [Image3]) VALUES (N'B1008', N'assets/productImg/B1008-0.jpg', N'assets/productImg/B1008-1.jpg', N'assets/productImg/B1008-2.jpg', N'assets/productImg/B1008-3.jpg')
INSERT [dbo].[BOOKIMG] ([BookId], [Image0], [Image1], [Image2], [Image3]) VALUES (N'B2000', N'assets/productImg/B2000-0.jpg', N'assets/productImg/B2000-1.jpg', N'assets/productImg/B2000-2.jpg', N'assets/productImg/B2000-3.jpg')
INSERT [dbo].[BOOKIMG] ([BookId], [Image0], [Image1], [Image2], [Image3]) VALUES (N'B2001', N'assets/productImg/B2001-0.jpg', N'assets/productImg/B2001-1.jpg', N'assets/productImg/B2001-2.jpg', N'assets/productImg/B2001-3.jpg')
INSERT [dbo].[BOOKIMG] ([BookId], [Image0], [Image1], [Image2], [Image3]) VALUES (N'B2002', N'assets/productImg/B2002-0.jpg', N'assets/productImg/B2002-1.jpg', N'assets/productImg/B2002-2.jpg', N'assets/productImg/B2002-3.jpg')
INSERT [dbo].[BOOKIMG] ([BookId], [Image0], [Image1], [Image2], [Image3]) VALUES (N'B2003', N'assets/productImg/B2003-0.jpg', N'assets/productImg/B2003-1.jpg', N'assets/productImg/B2003-2.jpg', N'assets/productImg/B2003-3.jpg')
INSERT [dbo].[BOOKIMG] ([BookId], [Image0], [Image1], [Image2], [Image3]) VALUES (N'B2004', N'assets/productImg/B2004-0.jpg', N'assets/productImg/B2004-1.jpg', N'assets/productImg/B2004-2.jpg', N'assets/productImg/B2004-3.jpg')
GO
INSERT [dbo].[BOOKS] ([Id], [Title], [AuthorId], [SupplierId], [UnitPrice], [PricePercent], [PublishYear], [Available], [Quantity]) VALUES (N'B1000', N'Tuyển tập Ngô Tất Tố', N'A100', N'S1000', 107250.0000, CAST(0.15 AS Decimal(10, 2)), 2023, 1, 10)
INSERT [dbo].[BOOKS] ([Id], [Title], [AuthorId], [SupplierId], [UnitPrice], [PricePercent], [PublishYear], [Available], [Quantity]) VALUES (N'B1001', N'Tuyển tập Nam Cao', N'A101', N'S1000', 114250.0000, CAST(0.15 AS Decimal(10, 2)), 2022, 1, 10)
INSERT [dbo].[BOOKS] ([Id], [Title], [AuthorId], [SupplierId], [UnitPrice], [PricePercent], [PublishYear], [Available], [Quantity]) VALUES (N'B1002', N'Tuyển tập Vũ Trọng Phụng', N'A102', N'S1004', 46000.0000, CAST(0.15 AS Decimal(10, 2)), 2022, 1, 10)
INSERT [dbo].[BOOKS] ([Id], [Title], [AuthorId], [SupplierId], [UnitPrice], [PricePercent], [PublishYear], [Available], [Quantity]) VALUES (N'B1003', N'Tuyển Tập Truyện Ngắn Hay Nhất Của Nguyễn Minh Châu', N'A103', N'S1004', 86000.0000, CAST(0.15 AS Decimal(10, 2)), 2022, 1, 5)
INSERT [dbo].[BOOKS] ([Id], [Title], [AuthorId], [SupplierId], [UnitPrice], [PricePercent], [PublishYear], [Available], [Quantity]) VALUES (N'B1004', N'Hai Đứa Trẻ (Tái Bản 2023)', N'A104', N'S1004', 48000.0000, CAST(0.15 AS Decimal(10, 2)), 2023, 1, 5)
INSERT [dbo].[BOOKS] ([Id], [Title], [AuthorId], [SupplierId], [UnitPrice], [PricePercent], [PublishYear], [Available], [Quantity]) VALUES (N'B1005', N'Văn Học Trong Nhà Trường: Thơ Nguyễn Khuyến', N'A105', N'S1005', 32000.0000, CAST(0.00 AS Decimal(10, 2)), 2019, 1, 5)
INSERT [dbo].[BOOKS] ([Id], [Title], [AuthorId], [SupplierId], [UnitPrice], [PricePercent], [PublishYear], [Available], [Quantity]) VALUES (N'B1006', N'Tác Phẩm Văn Học Trong Nhà Trường - Truyện Kiều', N'A106', N'S1005', 45000.0000, CAST(0.00 AS Decimal(10, 2)), 2023, 1, 10)
INSERT [dbo].[BOOKS] ([Id], [Title], [AuthorId], [SupplierId], [UnitPrice], [PricePercent], [PublishYear], [Available], [Quantity]) VALUES (N'B1007', N'Nhật Ký Trong Tù ', N'A107', N'S1005', 48000.0000, CAST(0.20 AS Decimal(10, 2)), 2021, 1, 10)
INSERT [dbo].[BOOKS] ([Id], [Title], [AuthorId], [SupplierId], [UnitPrice], [PricePercent], [PublishYear], [Available], [Quantity]) VALUES (N'B1008', N'Hồn Trương Ba Da Hàng Thịt - Tủ Sách Văn Học Trong Nhà Trường', N'A108', N'S1005', 52000.0000, CAST(0.10 AS Decimal(10, 2)), 2021, 1, 10)
INSERT [dbo].[BOOKS] ([Id], [Title], [AuthorId], [SupplierId], [UnitPrice], [PricePercent], [PublishYear], [Available], [Quantity]) VALUES (N'B2000', N'Hành Tinh Của Một Kẻ Nghĩ Nhiều', N'A201', N'S1002', 70000.0000, CAST(0.15 AS Decimal(10, 2)), 2023, 1, 15)
INSERT [dbo].[BOOKS] ([Id], [Title], [AuthorId], [SupplierId], [UnitPrice], [PricePercent], [PublishYear], [Available], [Quantity]) VALUES (N'B2001', N'Năng lượng của tiền', N'A202', N'S1002', 203000.0000, CAST(0.25 AS Decimal(10, 2)), 2022, 1, 5)
INSERT [dbo].[BOOKS] ([Id], [Title], [AuthorId], [SupplierId], [UnitPrice], [PricePercent], [PublishYear], [Available], [Quantity]) VALUES (N'B2002', N'Tâm lý học tính cách', N'A203', N'S1002', 92000.0000, CAST(0.10 AS Decimal(10, 2)), 2021, 1, 10)
INSERT [dbo].[BOOKS] ([Id], [Title], [AuthorId], [SupplierId], [UnitPrice], [PricePercent], [PublishYear], [Available], [Quantity]) VALUES (N'B2003', N'Làm Gì Có Ai Thực Lòng Muốn Chết', N'A204', N'S1002', 78000.0000, CAST(0.50 AS Decimal(10, 2)), 2022, 1, 10)
INSERT [dbo].[BOOKS] ([Id], [Title], [AuthorId], [SupplierId], [UnitPrice], [PricePercent], [PublishYear], [Available], [Quantity]) VALUES (N'B2004', N'Giai Thoại Về Các Thiên Tài - Hành Trình Khám Phá Tài Năng', N'A205', N'S1003', 55000.0000, CAST(0.50 AS Decimal(10, 2)), 2022, 1, 5)
GO
INSERT [dbo].[CATEGORIES] ([Id], [Name]) VALUES (N'C_KT', N'Kinh tế')
INSERT [dbo].[CATEGORIES] ([Id], [Name]) VALUES (N'C_KTBK', N'Kiến thức bách khoa')
INSERT [dbo].[CATEGORIES] ([Id], [Name]) VALUES (N'C_TL', N'Tâm lý')
INSERT [dbo].[CATEGORIES] ([Id], [Name]) VALUES (N'C_VH', N'Văn học')
GO
INSERT [dbo].[CUSTOMERS] ([Id], [FullName], [Photo], [Activated], [Password], [Email], [Phone]) VALUES (N'0337333919', N'admin', N'', 0, N'MTIzQGFuZ2ExNDA4', N'abc123@gmail.com', N'0337333919')
INSERT [dbo].[CUSTOMERS] ([Id], [FullName], [Photo], [Activated], [Password], [Email], [Phone]) VALUES (N'C10000', N'Nguyễn Văn A', N'', 1, N'123hfs', N'firewolf@gmail.com', N'0337333918')
INSERT [dbo].[CUSTOMERS] ([Id], [FullName], [Photo], [Activated], [Password], [Email], [Phone]) VALUES (N'C10001', N'Lê Thị B', N'', 0, N'123hfs', N'lehongngot17102003@gmail.com', N'0384753419')
INSERT [dbo].[CUSTOMERS] ([Id], [FullName], [Photo], [Activated], [Password], [Email], [Phone]) VALUES (N'C10002', N'Nguyễn Đức Ân', N'', 0, N'MTQwODIwMDNAYW5nYTE0MDg=', N'firewolf148@gmail.com', N'0337333918')
INSERT [dbo].[CUSTOMERS] ([Id], [FullName], [Photo], [Activated], [Password], [Email], [Phone]) VALUES (N'C10004', N'NA', N'', 0, N'MTIzQGFuZ2ExNDA4', N'ng13@gmail.com', N'0978656656')
GO
INSERT [dbo].[ORDERDETAILS] ([Id], [OrderId], [BookId], [UnitPrice], [Quantity]) VALUES (N'OD1003', N'O100000', N'B1001', 190000.0000, 1)
INSERT [dbo].[ORDERDETAILS] ([Id], [OrderId], [BookId], [UnitPrice], [Quantity]) VALUES (N'OD1004', N'O100001', N'B1001', 200000.0000, 1)
GO
INSERT [dbo].[ORDERS] ([Id], [CustomerId], [OrderDate], [Status], [Address], [Description]) VALUES (N'O100000', N'C10000', CAST(N'1894-06-18T00:00:00.000' AS DateTime), 0, N'Mỹ thành bắc,Cai Lậy,Tiền Giang', N'Nhân xác vào giờ trưa')
INSERT [dbo].[ORDERS] ([Id], [CustomerId], [OrderDate], [Status], [Address], [Description]) VALUES (N'O100001', N'C10001', CAST(N'1894-06-18T00:00:00.000' AS DateTime), 0, N'Mỹ Tho', N'Nhân xác vào giờ trưa')
GO
INSERT [dbo].[ROLEACTIONS] ([Id], [RoleId], [WebActionId]) VALUES (N'RA1000', N'R101', N'WA1000')
INSERT [dbo].[ROLEACTIONS] ([Id], [RoleId], [WebActionId]) VALUES (N'RA1001', N'R101', N'WA1001')
GO
INSERT [dbo].[ROLES] ([Id], [Name]) VALUES (N'R100', N'Admin')
INSERT [dbo].[ROLES] ([Id], [Name]) VALUES (N'R101', N'Nhân viên kho')
GO
INSERT [dbo].[SUPPLIERS] ([Id], [Name], [Email], [Description], [Phone]) VALUES (N'S1000', N'Minh Long', N'minhlong@gmail.com', N'Cung cấp sách văn thơ', N'0384753419')
INSERT [dbo].[SUPPLIERS] ([Id], [Name], [Email], [Description], [Phone]) VALUES (N'S1001', N'Nguyễn Đức Ân', N'firewolf148@gmail.com', N'Cung cấp sách kinh tế', N'0337333918')
INSERT [dbo].[SUPPLIERS] ([Id], [Name], [Email], [Description], [Phone]) VALUES (N'S1002', N'AZ Việt Nam', N'AzVietNam@gmail.com', N'Cung cấp sách tâm lý', N'0333104142')
INSERT [dbo].[SUPPLIERS] ([Id], [Name], [Email], [Description], [Phone]) VALUES (N'S1003', N'Tân Việt', N'tanviet@gmail.com', N'Cung cấp sách kiến thức bách khoa', N'0123456789')
INSERT [dbo].[SUPPLIERS] ([Id], [Name], [Email], [Description], [Phone]) VALUES (N'S1004', N'Cty Văn Hóa & Truyền Thông Trí Việt', N'vhvttTriViet@gmail.com', N'Cung c?p tác ph?m van h?c', N'0102034567')
INSERT [dbo].[SUPPLIERS] ([Id], [Name], [Email], [Description], [Phone]) VALUES (N'S1005', N'Kim Đồng', N'NXBKimDong@gmail.com', N'Cung c?p tác ph?m van h?c', N'033412142 ')
GO
INSERT [dbo].[USERROLES] ([Id], [UserId], [RoleId]) VALUES (N'UR1000', N'U10000', N'R100')
INSERT [dbo].[USERROLES] ([Id], [UserId], [RoleId]) VALUES (N'UR1001', N'U10000', N'R101')
GO
INSERT [dbo].[USERS] ([Id], [FullName], [Password], [Email], [Phone]) VALUES (N'U10000', N'Nguyễn Đức Ân', N'123', N'firewolf148@gmail.com', N'0337333918')
INSERT [dbo].[USERS] ([Id], [FullName], [Password], [Email], [Phone]) VALUES (N'U10001', N'Lê Thị Hồng Ngọt', N'123', N'lehongongot17102003@gmail.com', N'0384753419')
GO
INSERT [dbo].[VOUCHERS] ([Id], [Quantity], [PercentDiscount], [MaxDiscount]) VALUES (N'VKANN', 10, CAST(0 AS Decimal(18, 0)), 50000.0000)
INSERT [dbo].[VOUCHERS] ([Id], [Quantity], [PercentDiscount], [MaxDiscount]) VALUES (N'VNNKA', 20, CAST(0 AS Decimal(18, 0)), 20000.0000)
GO
INSERT [dbo].[WEBACTIONS] ([Id], [Name]) VALUES (N'WA1000', N'Thêm user')
INSERT [dbo].[WEBACTIONS] ([Id], [Name]) VALUES (N'WA1001', N'Xóa user')
INSERT [dbo].[WEBACTIONS] ([Id], [Name]) VALUES (N'WA1002', N'Sửa user')
INSERT [dbo].[WEBACTIONS] ([Id], [Name]) VALUES (N'WA1003', N'Xem danh sách user')
GO
ALTER TABLE [dbo].[BILLS]  WITH CHECK ADD  CONSTRAINT [FK_BILLS_ORDERS] FOREIGN KEY([OrderId])
REFERENCES [dbo].[ORDERS] ([Id])
GO
ALTER TABLE [dbo].[BILLS] CHECK CONSTRAINT [FK_BILLS_ORDERS]
GO
ALTER TABLE [dbo].[BILLS]  WITH CHECK ADD  CONSTRAINT [FK_BILLS_USERS] FOREIGN KEY([UserId])
REFERENCES [dbo].[USERS] ([Id])
GO
ALTER TABLE [dbo].[BILLS] CHECK CONSTRAINT [FK_BILLS_USERS]
GO
ALTER TABLE [dbo].[BILLS]  WITH CHECK ADD  CONSTRAINT [FK_BILLS_VOUCHERS] FOREIGN KEY([VoucherId])
REFERENCES [dbo].[VOUCHERS] ([Id])
GO
ALTER TABLE [dbo].[BILLS] CHECK CONSTRAINT [FK_BILLS_VOUCHERS]
GO
ALTER TABLE [dbo].[BOOKDETAILS]  WITH CHECK ADD  CONSTRAINT [FK_BOOKDETAILS_BOOKS] FOREIGN KEY([BookId])
REFERENCES [dbo].[BOOKS] ([Id])
GO
ALTER TABLE [dbo].[BOOKDETAILS] CHECK CONSTRAINT [FK_BOOKDETAILS_BOOKS]
GO
ALTER TABLE [dbo].[BOOKDETAILS]  WITH CHECK ADD  CONSTRAINT [FK_BOOKDETAILS_CATEGORIES] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CATEGORIES] ([Id])
GO
ALTER TABLE [dbo].[BOOKDETAILS] CHECK CONSTRAINT [FK_BOOKDETAILS_CATEGORIES]
GO
ALTER TABLE [dbo].[BOOKIMG]  WITH CHECK ADD  CONSTRAINT [FK_BOOKIMG_BOOKS] FOREIGN KEY([BookId])
REFERENCES [dbo].[BOOKS] ([Id])
GO
ALTER TABLE [dbo].[BOOKIMG] CHECK CONSTRAINT [FK_BOOKIMG_BOOKS]
GO
ALTER TABLE [dbo].[BOOKS]  WITH CHECK ADD  CONSTRAINT [FK_BOOKS_AUTHORS] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[AUTHORS] ([Id])
GO
ALTER TABLE [dbo].[BOOKS] CHECK CONSTRAINT [FK_BOOKS_AUTHORS]
GO
ALTER TABLE [dbo].[BOOKS]  WITH CHECK ADD  CONSTRAINT [FK_BOOKS_SUPPLIERS] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[SUPPLIERS] ([Id])
GO
ALTER TABLE [dbo].[BOOKS] CHECK CONSTRAINT [FK_BOOKS_SUPPLIERS]
GO
ALTER TABLE [dbo].[CARTS]  WITH CHECK ADD  CONSTRAINT [FK_CARTS_BOOKS] FOREIGN KEY([BookId])
REFERENCES [dbo].[BOOKS] ([Id])
GO
ALTER TABLE [dbo].[CARTS] CHECK CONSTRAINT [FK_CARTS_BOOKS]
GO
ALTER TABLE [dbo].[CARTS]  WITH CHECK ADD  CONSTRAINT [FK_CARTS_CUSTOMER] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[CUSTOMERS] ([Id])
GO
ALTER TABLE [dbo].[CARTS] CHECK CONSTRAINT [FK_CARTS_CUSTOMER]
GO
ALTER TABLE [dbo].[ORDERDETAILS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERDETAILS_BOOKS] FOREIGN KEY([BookId])
REFERENCES [dbo].[BOOKS] ([Id])
GO
ALTER TABLE [dbo].[ORDERDETAILS] CHECK CONSTRAINT [FK_ORDERDETAILS_BOOKS]
GO
ALTER TABLE [dbo].[ORDERDETAILS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERDETAILS_ORDERS] FOREIGN KEY([OrderId])
REFERENCES [dbo].[ORDERS] ([Id])
GO
ALTER TABLE [dbo].[ORDERDETAILS] CHECK CONSTRAINT [FK_ORDERDETAILS_ORDERS]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_CUSTOMERS] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[CUSTOMERS] ([Id])
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_CUSTOMERS]
GO
ALTER TABLE [dbo].[ROLEACTIONS]  WITH CHECK ADD  CONSTRAINT [FK_ROLEACTIONS_ROLES] FOREIGN KEY([RoleId])
REFERENCES [dbo].[ROLES] ([Id])
GO
ALTER TABLE [dbo].[ROLEACTIONS] CHECK CONSTRAINT [FK_ROLEACTIONS_ROLES]
GO
ALTER TABLE [dbo].[ROLEACTIONS]  WITH CHECK ADD  CONSTRAINT [FK_ROLEACTIONS_WEBACTIONS] FOREIGN KEY([WebActionId])
REFERENCES [dbo].[WEBACTIONS] ([Id])
GO
ALTER TABLE [dbo].[ROLEACTIONS] CHECK CONSTRAINT [FK_ROLEACTIONS_WEBACTIONS]
GO
ALTER TABLE [dbo].[USERROLES]  WITH CHECK ADD  CONSTRAINT [FK_USERROLES_ROLES] FOREIGN KEY([RoleId])
REFERENCES [dbo].[ROLES] ([Id])
GO
ALTER TABLE [dbo].[USERROLES] CHECK CONSTRAINT [FK_USERROLES_ROLES]
GO
ALTER TABLE [dbo].[USERROLES]  WITH CHECK ADD  CONSTRAINT [FK_USERROLES_USERS] FOREIGN KEY([UserId])
REFERENCES [dbo].[USERS] ([Id])
GO
ALTER TABLE [dbo].[USERROLES] CHECK CONSTRAINT [FK_USERROLES_USERS]
GO
USE [master]
GO
ALTER DATABASE [QLBANSACH] SET  READ_WRITE 
GO
