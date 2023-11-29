CREATE DATABASE QLBANSACH
GO

USE QLBANSACH
GO


-----Table
CREATE TABLE USERS
(
	Id VARCHAR(10) NOT NULL,
	FullName NVARCHAR(30) NOT NULL,
	Password VARCHAR(30) NOT NULL,
	Email VARCHAR(255),
	Phone CHAR(10) NOT NULL
)

CREATE TABLE ROLES
(
	Id VARCHAR(10) NOT NULL,
	Name NVARCHAR(30) NOT NULL
)

CREATE TABLE USERROLES
(
	Id VARCHAR(10) NOT NULL,
	UserId VARCHAR(10) NOT NULL,
	RoleId VARCHAR(10) NOT NULL
)

CREATE TABLE WEBACTIONS
(
	Id VARCHAR(10) NOT NULL,
	Name NVARCHAR(30),
)

CREATE TABLE ROLEACTIONS
(
	Id VARCHAR(10) NOT NULL,
	RoleId VARCHAR(10) NOT NULL,
	WebActionId VARCHAR(10) NOT NULL,
)

CREATE TABLE CATEGORIES
(
	Id VARCHAR(10) NOT NULL,
	Name NVARCHAR(50)
)

CREATE TABLE BANNERS
(
	Id VARCHAR(10) NOT NULL,
	Image TEXT,
	Name NVARCHAR(50),
	Description NTEXT
)

CREATE TABLE VOUCHERS
(
	Id VARCHAR(10) NOT NULL,
	Quantity INT,
	PercentDiscount DECIMAL,
	MaxDiscount MONEY
)

CREATE TABLE AUTHORS
(
	Id VARCHAR(10) NOT NULL,
	Name NVARCHAR(50),
	Image TEXT,
	Description NTEXT
)

CREATE TABLE SUPPLIERS
(
	Id VARCHAR(10) NOT NULL,
	Name NVARCHAR(50),
	Email VARCHAR(255),
	Description NTEXT,
	Phone CHAR(10) NOT NULL
)

CREATE TABLE CUSTOMERS
(
	Id VARCHAR(10) NOT NULL,
	FullName NVARCHAR(50),
	Photo TEXT,
	Activated BIT,
	Password VARCHAR(50),
	Email VARCHAR(255),
	Phone CHAR(10) NOT NULL
)
-- Sửa kiểu dữ liệu của cột Id từ CHAR(10) thành NVARCHAR



CREATE TABLE BOOKS
(
	Id VARCHAR(10) NOT NULL,
	Title NVARCHAR(100),
	AuthorId VARCHAR(10) NOT NULL,
	SupplierId VARCHAR(10) NOT NULL,
	UnitPrice MONEY,
	PricePercent DECIMAL(10,2),
	PublishYear INT,
	Available BIT,
	Quantity INT
)

CREATE TABLE BOOKDETAILS
(
	BookId VARCHAR(10) NOT NULL,
	CategoryId VARCHAR(10) NOT NULL,
	Dimensions CHAR(20),
	Pages INT,
	Description NTEXT
)

CREATE TABLE BOOKIMG
(
	BookId VARCHAR(10) NOT NULL,
	Image0 TEXT,
	Image1 TEXT,
	Image2 TEXT,
	Image3 TEXT
)

CREATE TABLE ORDERS
(
	Id VARCHAR(10) NOT NULL,
	CustomerId VARCHAR(10) NOT NULL,
	OrderDate DATETIME,
	Status TINYINT,
	Address NVARCHAR(100),
	Description NTEXT
)

CREATE TABLE CARTS
(
	Id VARCHAR(10) NOT NULL,
	BookId VARCHAR(10) NOT NULL,
	CustomerId VARCHAR(10) NOT NULL,
)


CREATE TABLE ORDERDETAILS
(
	Id VARCHAR(10) NOT NULL,
	OrderId VARCHAR(10) NOT NULL,
	BookId VARCHAR(10) NOT NULL,
	UnitPrice MONEY,
	Quantity INT,
)

CREATE TABLE BILLS
(
	Id VARCHAR(10) NOT NULL,
	OrderId VARCHAR(10) NOT NULL,
	UserId VARCHAR(10) NOT NULL,
	VoucherId VARCHAR(10) NOT NULL,
	BillDate DATETIME,
	TotalAmount MONEY
)



-----Primary key 
ALTER TABLE USERS
ADD PRIMARY KEY (Id);

ALTER TABLE ROLES
ADD PRIMARY KEY (Id);

ALTER TABLE USERROLES
ADD PRIMARY KEY (Id);

ALTER TABLE WEBACTIONS
ADD PRIMARY KEY (Id);

ALTER TABLE ROLEACTIONS
ADD PRIMARY KEY (Id);

ALTER TABLE CATEGORIES
ADD PRIMARY KEY (Id);

ALTER TABLE BANNERS
ADD PRIMARY KEY (Id);

ALTER TABLE VOUCHERS
ADD PRIMARY KEY (Id);

ALTER TABLE AUTHORS
ADD PRIMARY KEY (Id);

ALTER TABLE SUPPLIERS
ADD PRIMARY KEY (Id);

ALTER TABLE CUSTOMERS
ADD PRIMARY KEY (Id);

ALTER TABLE BOOKS
ADD PRIMARY KEY (Id);

ALTER TABLE BOOKDETAILS
ADD PRIMARY KEY (BookId);

ALTER TABLE BOOKIMG
ADD PRIMARY KEY (BookId);

ALTER TABLE ORDERS
ADD PRIMARY KEY (Id);

ALTER TABLE ORDERDETAILS
ADD PRIMARY KEY (Id);

ALTER TABLE BILLS
ADD PRIMARY KEY (Id);

ALTER TABLE CARTS
ADD PRIMARY KEY(ID)

-----Forgein key
--1
ALTER TABLE BOOKDETAILS
ADD CONSTRAINT FK_BOOKDETAILS_CATEGORIES
FOREIGN KEY (CategoryId) REFERENCES CATEGORIES(Id);
--2
ALTER TABLE BOOKDETAILS
ADD CONSTRAINT FK_BOOKDETAILS_BOOKS
FOREIGN KEY (BookId) REFERENCES BOOKS(Id);
--3
ALTER TABLE BOOKS
ADD CONSTRAINT FK_BOOKS_AUTHORS
FOREIGN KEY (AuthorId) REFERENCES AUTHORS(Id);
--4
ALTER TABLE BOOKS
ADD CONSTRAINT FK_BOOKS_SUPPLIERS
FOREIGN KEY (SupplierId) REFERENCES SUPPLIERS(Id);
--5
ALTER TABLE ORDERDETAILS
ADD CONSTRAINT FK_ORDERDETAILS_BOOKS
FOREIGN KEY (BookId) REFERENCES BOOKS(Id);
--6
ALTER TABLE ORDERDETAILS
ADD CONSTRAINT FK_ORDERDETAILS_ORDERS
FOREIGN KEY (OrderId) REFERENCES ORDERS(Id);
--7
ALTER TABLE ORDERS
ADD CONSTRAINT FK_ORDERS_CUSTOMERS
FOREIGN KEY (CustomerId) REFERENCES CUSTOMERS(Id);
--8
ALTER TABLE BILLS
ADD CONSTRAINT FK_BILLS_VOUCHERS
FOREIGN KEY (VoucherId) REFERENCES VOUCHERS(Id);
--9
ALTER TABLE BILLS
ADD CONSTRAINT FK_BILLS_ORDERS
FOREIGN KEY (OrderId) REFERENCES ORDERS(Id);
--10
ALTER TABLE BILLS
ADD CONSTRAINT FK_BILLS_USERS
FOREIGN KEY (UserId) REFERENCES USERS(Id);
--11
ALTER TABLE USERROLES
ADD CONSTRAINT FK_USERROLES_USERS
FOREIGN KEY (UserId) REFERENCES USERS(Id);
--12
ALTER TABLE USERROLES
ADD CONSTRAINT FK_USERROLES_ROLES
FOREIGN KEY (RoleId) REFERENCES ROLES(Id);
--13
ALTER TABLE ROLEACTIONS
ADD CONSTRAINT FK_ROLEACTIONS_ROLES
FOREIGN KEY (RoleId) REFERENCES ROLES(Id);
--14
ALTER TABLE ROLEACTIONS
ADD CONSTRAINT FK_ROLEACTIONS_WEBACTIONS
FOREIGN KEY (WebActionId) REFERENCES WEBACTIONS(Id);

ALTER TABLE CARTS
ADD CONSTRAINT FK_CARTS_CUSTOMER
FOREIGN KEY (CustomerId) REFERENCES CUSTOMERS(Id);

ALTER TABLE CARTS
ADD CONSTRAINT FK_CARTS_BOOKS
FOREIGN KEY (BookId) REFERENCES BOOKS(Id);

ALTER TABLE BOOKIMG
ADD CONSTRAINT FK_BOOKIMG_BOOKS
FOREIGN KEY (BookId) REFERENCES BOOKS(Id);


-----Insert
INSERT INTO USERS
VALUES ('U10000', N'Nguyễn Đức Ân', '123', 'firewolf148@gmail.com', '0337333918'),
('U10001', N'Lê Thị Hồng Ngọt', '123', 'lehongongot17102003@gmail.com', '0384753419');

INSERT INTO ROLES
VALUES ('R100', N'Admin'),
       ('R101', N'Nhân viên kho')

INSERT INTO USERROLES
VALUES ('UR1000', 'U10000', 'R100'),
('UR1001', 'U10000', 'R101')

INSERT INTO WEBACTIONS 
VALUES ('WA1000',N'Thêm user'),
	   ('WA1001',N'Xóa user'),
	   ('WA1002',N'Sửa user'),
	   ('WA1003',N'Xem danh sách user')

INSERT INTO ROLEACTIONS 
VALUES ('RA1000','R101','WA1000'),
	   ('RA1001','R101','WA1001')
--
INSERT INTO BANNERS 
VALUES ('B1','', N' Quảng cáo', N' Quảng cáo bán sách'),
     ('B2', '', N'Anh văn ', N'Quảng cáo sách anh văn')

INSERT INTO VOUCHERS 
VALUES ('VKANN',10,0.2,50000),
	   ('VNNKA',20,0.3,20000)

INSERT INTO CATEGORIES 
VALUES ('C_VH',N'Văn học'),
	   ('C_KT',N'Kinh tế'),
	   ('C_TL',N'Tâm lý'),
	   ('C_KTBK',N'Kiến thức bách khoa')


INSERT INTO AUTHORS 
VALUES ('A100',N'Ngô Tất Tố','assets/authors/NgoTatTo.jpg',N'Là văn,nhà nho, nhà văn học Việt Nam'),
	   ('A101',N'Nam Cao','assets/authors/NamCao.jpg',N'Nhà văn, nhà thơ, nhà báo và cũng là một chiến sĩ, liệt sỹ người Việt Nam'),
	   ('A102',N'Vũ Trọng Phụng','assets/authors/VuTrongPhung.jpg',''),
	   ('A103',N'Nguyễn Minh Châu','assets/authors/NguyenMinhChau.jpg',''),
	   ('A104',N'Thạch Lam','assets/authors/ThachLam.jpg',''),
	   ('A105',N'Nguyễn Khuyến','assets/authors/NguyenKhuyen.jpg',''),
	   ('A106',N'Nguyễn Du','assets/authors/NguyenDu.jpg',''),
	   ('A107',N'Chủ tịch Hồ CHí Minh','assets/authors/HoChiMinh.jpg',''),
	   ('A108',N'Lưu Quang Vũ','assets/authors/LuuQuangVu.jpg',''),
	   ('A201',N'Nguyễn Đoàn Minh Thư',N'assets/authors/Nguyễn Đoàn Minh Thư.jpg',N'Amateur Psychology là một podcast về khoa học xã hội, bằng cách sử dụng tâm lý học qua các nghiên cứu và lý thuyết được chứng minh bằng các thí nghiệm khoa học, Amateur Psychology sẽ giải mã những hiện tượng tâm lý học trong đời sống hằng ngày một cách khoa học và dễ dàng ứng dụng vào cuộc sống.'),
	   ('A202',N'Maria Nemeth PhD','assets/authors/Maria Nemeth PhD.jpg',N''),
	   ('A203',N'Trâu Hoành Minh','//',N''),
	   ('A204',N'Lim Sewon','',''),
	   ('A205',N'Rasmus Hoài Nam','','')
	 
INSERT INTO SUPPLIERS
VALUES ('S1000',N'Minh Long','minhlong@gmail.com',N'Cung cấp sách văn thơ','0384753419'),
	   ('S1001',N'Nguyễn Đức Ân','firewolf148@gmail.com',N'Cung cấp sách kinh tế','0337333918'),
	   ('S1002',N'AZ Việt Nam','AzVietNam@gmail.com',N'Cung cấp sách tâm lý','0333104142'),
	   ('S1003',N'Tân Việt','tanviet@gmail.com',N'Cung cấp sách kiến thức bách khoa','0123456789'),
	   ('S1004',N'Cty Văn Hóa & Truyền Thông Trí Việt','vhvttTriViet@gmail.com','Cung cấp tác phẩm văn học','0102034567'),
	   ('S1005',N'Kim Đồng','NXBKimDong@gmail.com','Cung cấp tác phẩm văn học','033412142')

--Trigger Encrypt
/*CREATE TRIGGER trg_EncryptPassword
ON CUSTOMERS
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @IdCustomer VARCHAR(10), @PasswordHash VARBINARY(64)
	SELECT @IdCustomer=Id, @PasswordHash = Password
	FROM INSERTED

	SET @PasswordHash = CONVERT(VARBINARY(64), HASHBYTES('SHA2_256', Password))
END*/
/*CREATE PROC sp_EncryptPassword
	@Id VARCHAR(10),
	@FullName NVARCHAR(50),
	@Photo TEXT,
	@Activated BIT,
	@Password VARCHAR(50),
	@Email VARCHAR(255),
	@Phone CHAR(10)
AS
BEGIN
	DECLARE @MatKhauHash VARBINARY(64)
    SET @MatKhauHash = CONVERT(VARBINARY(64), HASHBYTES('SHA2_256', @Password))
	INSERT INTO CUSTOMERS
	VALUES(@Id, @FullName, @Photo, @Activated, @MatKhauHash, @Email, @Phone)
END;*/

INSERT INTO CUSTOMERS
VALUES ('C10000',N'Nguyễn Văn A','',1,'123hfs','firewolf148@gmail.com','0337333918'),
	   ('C10001',N'Lê Thị B','',0,'123hfs','lehongngot17102003@gmail.com','0384753419')

INSERT INTO BOOKS
VALUES ('B1000',N'Tuyển tập Ngô Tất Tố','A100','S1000',107250,0.15,2023,1,10),
	   ('B1001',N'Tuyển tập Nam Cao','A101','S1000',114250,0.15,2022,1,10),
	   ('B1002',N'Tuyển tập Vũ Trọng Phụng','A102','S1004',46000,0.15,2022,1,10),
	   ('B1003',N'Tuyển Tập Truyện Ngắn Hay Nhất Của Nguyễn Minh Châu','A103','S1004',86000,0.15,2022,1,5),
	   ('B1004',N'Hai Đứa Trẻ (Tái Bản 2023)','A104','S1004',48000,0.15,2023,1,5),
	   ('B1005',N'Văn Học Trong Nhà Trường: Thơ Nguyễn Khuyến','A105','S1005',32000,0,2019,1,5),
	   ('B1006',N'Tác Phẩm Văn Học Trong Nhà Trường - Truyện Kiều','A106','S1005',45000,0.0,2023,1,10),
	   ('B1007',N'Nhật Ký Trong Tù ','A107','S1005',48000,0.2,2021,1,10),
	   ('B1008',N'Hồn Trương Ba Da Hàng Thịt - Tủ Sách Văn Học Trong Nhà Trường','A108','S1005',52000,0.1,2021,1,10),
	   ('B2000',N'Hành Tinh Của Một Kẻ Nghĩ Nhiều','A201','S1002',70000,0.15,2023,1,15),
	   ('B2001',N'Năng lượng của tiền','A202','S1002',203000,0.25,2022,1,5),
	   ('B2002',N'Tâm lý học tính cách','A203','S1002',92000,0.1,2021,1,10),
	   ('B2003',N'Làm Gì Có Ai Thực Lòng Muốn Chết','A204','S1002', 78000,0.5,2022,1,10),
	   ('B2004',N'Giai Thoại Về Các Thiên Tài - Hành Trình Khám Phá Tài Năng','A205','S1003',55000,0.5,2022,1,5)
	   

INSERT INTO BOOKIMG
VALUES ('B1000','assets/productImg/B1000-0.png','assets/productImg/B1000-1.jpg','assets/productImg/B1000-2.jpg','assets/productImg/B1000-3.png'),
	   ('B1001','assets/productImg/B1001-0.png','assets/productImg/B1001-1.jpg','assets/productImg/B1001-2.jpg','assets/productImg/B1001-3.png'),
	   ('B1002','assets/productImg/B1002-0.jpg','assets/productImg/B1002-1.jpg','assets/productImg/B1002-2.jpg','assets/productImg/B1002-3.jpg'),
	   ('B1003','assets/productImg/B1003-0.jpg','assets/productImg/B1003-1.jpg','assets/productImg/B1003-2.jpg','assets/productImg/B1003-3.jpg'),
	   ('B1004','assets/productImg/B1004-0.jpg','assets/productImg/B1004-1.jpg','assets/productImg/B1004-2.jpg','assets/productImg/B1004-3.jpg'),
	   ('B1005','assets/productImg/B1005-0.jpg','assets/productImg/B1005-1.jpg','assets/productImg/B1005-2.jpg','assets/productImg/B1005-3.jpg'),
	   ('B1006','assets/productImg/B1006-0.jpg','assets/productImg/B1006-1.jpg','assets/productImg/B1006-2.jpg','assets/productImg/B1006-3.jpg'),
	   ('B1007','assets/productImg/B1007-0.jpg','assets/productImg/B1007-1.jpg','assets/productImg/B1007-2.jpg','assets/productImg/B1007-3.jpg'),
	   ('B1008','assets/productImg/B1008-0.jpg','assets/productImg/B1008-1.jpg','assets/productImg/B1008-2.jpg','assets/productImg/B1008-3.jpg'),
       ('B2000','assets/productImg/B2000-0.jpg','assets/productImg/B2000-1.jpg','assets/productImg/B2000-2.jpg','assets/productImg/B2000-3.jpg'),
	   ('B2001','assets/productImg/B2001-0.jpg','assets/productImg/B2001-1.jpg','assets/productImg/B2001-2.jpg','assets/productImg/B2001-3.jpg'),
	   ('B2002','assets/productImg/B2002-0.jpg','assets/productImg/B2002-1.jpg','assets/productImg/B2002-2.jpg','assets/productImg/B2002-3.jpg'),
	   ('B2003','assets/productImg/B2003-0.jpg','assets/productImg/B2003-1.jpg','assets/productImg/B2003-2.jpg','assets/productImg/B2003-3.jpg'),
	   ('B2004','assets/productImg/B2004-0.jpg','assets/productImg/B2004-1.jpg','assets/productImg/B2004-2.jpg','assets/productImg/B2004-3.jpg')


INSERT INTO BOOKDETAILS
VALUES ('B1000','C_VH','20.5 x 14.5 cm',720,N'Ngô Tất Tố sinh tại làng Lộc Hà, tổng Hội Phụ, phủ Từ Sơn, nay là thôn Lộc Hà, huyện Đông Anh, Hà Nội. Ông là một trong những nhà văn sáng lập trào lưu hiện thực trong nền NXB Văn Học nước nhà trước năm 1945 với các tác phẩm tiêu biểu như Tắt đèn, Việc làng, Lều chõng, Tập án cái đình... Ngô Tất Tố đồng thời là nhà báo nổi tiếng với biệt tài viết tản văn và chính luận, là nhà văn hoá thành danh với các pho truyện lịch sử, khảo cứu triết học, dịch thuật, phê bình... 
Với tổng số hơn 30 bút danh, trên hơn 30 tờ báo, tạp chí, suốt 30 năm cầm bút viết văn làm báo, Ngô Tất Tố đã để lại hơn 1500 tác phẩm các thể loại, trong đó có 1350 di tác... 
Ông được truy tặng Giải thưởng Hồ Chí Minh về NXB Văn Học nghệ thuật Đợt I (1996). Trên cả nước có 8 thành phố lớn có phố và đường phố mang tên Ngô Tất Tố.'),
	('B1001','C_VH','20.5 x 14.5 x 3.2 cm',739,N'Nam Cao có nhiều đóng góp quan trọng đối với việc hoàn thiện phong cách truyện ngắn và tiểu thuyết Việt Nam nửa đầu thế kỷ XX . Với 15 năm cầm bút, Nam Cao đã để lại một văn nghiệp đồ sộ với 2 tiểu thuyết, 50 truyện ngắn, bút ký, ... trong đó có những nhân vật như Lão Hạc, giáo Thứ, Bá Kiến, Thị Nở, Chí Phèo,...không thể phai mờ trông tâm trí người đọc nhiều thế hệ . '),
	('B1002','C_VH','20.5 x 14.5 x 1.1 cm',222,N'Nhắc đến Vũ Trọng Phụng người ta nghĩ ngay tới một nhà văn tài hoa nhưng bạc mệnh. Có năng khiếu nghệ thuật từ nhỏ, ông sáng tác từ rất sớm và thử nghiệm mình trên nhiều thể loại: viết báo, viết kịch, sáng tác truyện ngắn, truyện vừa, tiểu thuyết, phê bình văn học… Nhưng có thể nói, tiểu thuyết và phóng sự là hai thể loại thành công nhất của nhà văn tài hoa này. Vũ Trọng Phụng được báo giới thời bấy giờ mệnh danh là “ông vua phóng sự đất Bắc”, là “nhà tiểu thuyết trác việt”.
Với giọng văn sắc sảo, mang đậm chất châm biếm, trào phúng và nội dung tư tưởng sâu sắc, các tác phẩm của Vũ Trọng Phụng đều hướng tới chủ đề hiện thực, tố cáo và vạch trần xã hội Việt Nam trước cách mạng tháng 8 - một xã hội bê bối với những tấn trò đời bi kịch. Đọc những trang văn của ông, người ta không khỏi ngậm ngùi, chua chát. Ra đi vì bệnh tật khi mới 27 tuổi đời, khi tài năng đang độ phát triển rực rỡ, Vũ Trọng Phụng để lại trong làng văn và trong lòng độc giả một chỗ trống không dễ gì khỏa lấp.'),
	('B1003','C_VH','20.5 x 14.5 x 2 cm',423,N'Nguyễn Minh Châu là một trong những nhà văn tiêu biểu của nền Văn học Việt Nam hiện đại. Tác phẩm của ông luôn có sức hấp dẫn riêng biệt, nhà văn khẳng định bản sắc cá nhân nghệ sĩ bằng nét phong cách kết hợp hài hòa chất triết lý cuộc đời với chất trữ tình lãng mạn.
	Hình tượng nhân vật trong tác phẩm của ông được soi thấu bởi mối quan hệ đa chiều, phức tạp nhưng hòa hợp và thống nhất với tư tưởng đề cao tôn vinh những giá trị cuộc sống của nhà văn. Chiều sâu mới mẻ trong sáng tác truyện của Nguyễn Minh Châu chính là nảy sinh trong sự đổi mới các bình diện nhận thức đời sống, mạnh dạn đi tìm nhiều cách thể hiện khác nhau, tự làm phong phú các khả năng nghệ thuật của mình và của chung nền văn xuôi chúng ta.'),
	('B1004','C_VH','20.5 x 13.5 x 1 cm',200,N'"Những cơn gió mạnh của đồng nội, mùi thơm mát của hoa cỏ và vẻ rộng rãi của khoảng trời mấy chiếm cả linh hồn tôi. Những cuộc đi chơi lâu trong các vườn chè nương sắn, hay trên sườn đồi làm cho người tôi bồng bột, hoạt độnghơn lên. Những lúc ấy, tôi muốn có một người con gái đi bên cạnh, để chia sẻ bao nhiêu cảm giác say sưa ấy.
Nhưng tôi còn ham muốn những cái thú mà một cô thiếu nữ không đem đến được. Tôi còn thích ngắm cảnh rừng đồi, thích vượt qua những nơi cỏ và lau sậy sắc làm sây sát cả chân tay. Những buổi trưa nắng, tôi tìm chỗ có bóng mát, phanh áo nằm trên cỏ thiu thiu ngủ..."
(Trích Nắng trong vườn)'),
	('B1005','C_VH','20.5 x 13.5 x 1 cm',200,N'“Nguyễn Khuyến là người đã sáng tạo nên những áng văn chương điêu luyện, tuy thế, trong thơ ông tuyệt nhiên không thấy dấu vết của sự đẽo gọt cầu kì. Nhiều bài thơ dung dị của Nguyễn Khuyến cho ta cái cảm tưởng nhà thơ đã thoát ra khỏi cái vỏ vật chất của ngôn từ mà tóm bắt đúng cái thần của sự sống. Sự sống hiện ra trong thơ cô đúc đến đậm đặc, và thật như chính nó.” (Giáo sư NGUYỄN HUỆ CHI)
“Làm nên cái độc đáo riêng của nhà thơ thì chủ yếu là những vần thơ Nguyễn Khuyến viết về nông thôn, bao gồm những vần thơ viết về con người, cảnh vật thiên nhiên và về phong tục tập quán. Về phương diện này không có một nhà thơ nào đương thời viết được bằng ông, và trước đó, trong lịch sử văn học Việt Nam cũng chưa ai viết được như ông.” (Giáo sư NGUYỄN LỘC)'),
	('B1006','C_VH','20.5 x 13.5 x 1 cm',201,N'Trong lịch sử mấy ngàn năm của dân tộc ta, chưa bao giờ có tác phẩm nào được nhân dân yêu quý như Truyện Kiều. 
	Mặc dù thể chế chính trị quốc gia thay đổi theo từng giai đoạn nhưng lòng người say mê Truyện Kiều không hề thay đổi. Vì sao vậy? Đào Nguyên Phổ, trong lời tựa cho quyển Đoạn trường tân thanh (tức Truyện Kiều) in năm 1902 đã trả lời: “Lời lẽ xinh xắn mà văn hoa, âm điệu ngân vang mà tròn trịa, tài liệu chọn rất rộng, sự việc kể rất tường, lượm lặt những diễm khúc tình tứ của cổ nhân, 
	lại góp đến cả phương ngôn ngạn ngữ nước nhà, mặn mà, vụn vặt không sót, quê mùa tao nhã đều thu… khiến người cười, khiến người khóc, khiến người vui, khiến người buồn, khiến người giở đi giở lại ngàn lần, càng đọc thuộc lại càng không biết chán, thật là một khúc Nam âm tuyệt xướng, một điệu tình phổ bực đầu vậy”…'),
	('B1007','C_VH','20.5 x 13.5 cm',175,N'Chủ tịch Hồ Chí Minh là vị lãnh tụ thiên tài của Đảng và nhân dân Việt Nam, anh hùng giải phóng dân tộc, danh nhân văn hoá thế giới. Người kết tinh trong mình những phẩm chất và giá trị tinh thần cao quý nhất của giai cấp công nhân và dân tộc việt Nam. Cuộc đời, sự nghiệp của Người là một tấm gương sáng vì dân, vì nước. Trong suốt cuộc đời hoạt động cách mạng, Người đã trải qua nhiều khó khăn, gian khổ, thậm chí nguy hiểm đến tính mạng, nhưng dù bất kỳ hoàn cảnh nào. Người cũng vẫn luôn lạc quan, tin tưởng vào thắng lợi của cách mạng. Tinh thần ấy thể hiện rõ trong nhiều trước tác của Người, trong đó tập thơ Nhật ký trong tù.
	Đây là một tập thơ chữ Hán, gồm hơn một trăm bài thơ, phần cuối có một số ghi chép về quân sự và thời sự, được Chủ tịch Hồ Chí Minh sáng tác trong thời gian hơn một năm (từ 29-8-1942 đến 10-9-1943) Người bị chính quyền địa phương của Tưởng Giới Thạch bắt giam trái phép tại các nhà tù ở tỉnh Quảng tây, Trung Quốc. Nhật ký trong tù lên án chế độc nhà tù hà khắc của chính quyền Quốc dân Đảng, thể hiện tinh thần lạc quan cách mạng và tình cảm nhân đạo cộng sản chủ nghĩa cao đẹp của Chủ tịch Hồ Chí Minh. Tập thơ được đánh giá là một văn kiện lịch sử quan trọng, một tác phẩm văn học xuất sắc, có tác dụng giáo dục sâu sắc phẩm chất và đạo đức cách mạng cho nhiều thế hệ.
Nhật Ký Trong Tù 
Chủ tịch Hồ Chí Minh là vị lãnh tụ thiên tài của Đảng và nhân dân Việt Nam, anh hùng giải phóng dân tộc, danh nhân văn hoá thế giới. Người kết tinh trong mình những phẩm chất và giá trị tinh thần cao quý nhất của giai cấp công nhân và dân tộc việt Nam. Cuộc đời, sự nghiệp của Người là một tấm gương sáng vì dân, vì nước. Trong suốt cuộc đời hoạt động cách mạng, Người đã trải qua nhiều khó khăn, gian khổ, thậm chí nguy hiểm đến tính mạng, nhưng dù bất kỳ hoàn cảnh nào. Người cũng vẫn luôn lạc quan, tin tưởng vào thắng lợi của cách mạng. Tinh thần ấy thể hiện rõ trong nhiều trước tác của Người, trong đó tập thơ Nhật ký trong tù.
Đây là một tập thơ chữ Hán, gồm hơn một trăm bài thơ, phần cuối có một số ghi chép về quân sự và thời sự, được Chủ tịch Hồ Chí Minh sáng tác trong thời gian hơn một năm (từ 29-8-1942 đến 10-9-1943) Người bị chính quyền địa phương của Tưởng Giới Thạch bắt giam trái phép tại các nhà tù ở tỉnh Quảng tây, Trung Quốc. Nhật ký trong tù lên án chế độc nhà tù hà khắc của chính quyền Quốc dân Đảng, thể hiện tinh thần lạc quan cách mạng và tình cảm nhân đạo cộng sản chủ nghĩa cao đẹp của Chủ tịch Hồ Chí Minh. Tập thơ được đánh giá là một văn kiện lịch sử quan trọng, một tác phẩm văn học xuất sắc, có tác dụng giáo dục sâu sắc phẩm chất và đạo đức cách mạng cho nhiều thế hệ.'),
	('B1008','C_VH','20.5 x 13.5 cm',175,N'Với gia tài tác phẩm để lại, có thể nói, Lưu Quang Vũ đã có những đóng góp dấu ấn trong sự nghiệp sáng tác văn chương và là một trong những tác gia quan trọng của văn học Việt Nam sau 1975, đặc biệt về lĩnh vực sân khấu. Khi còn sống, ông đã đoạt nhiều giải thưởng sáng tác, đáng kể nhất là về kịch bản, có thể gọi ông là “Cây bút vàng” bởi đã nhận được rất nhiều huy chương vàng hội diễn sân khấu chuyên nghiệp toàn quốc. Năm 2000, Lưu Quang Vũ được truy tặng Giải thưởng Hồ Chí Minh về Văn học nghệ thuật. Ông là tác giả trẻ tuổi nhất được trao giải thưởng cao quý này. Nhiều vở kịch của ông cho đến nay vẫn được dàn dựng và luôn được công chúng mến mộ. 
	Nội dung hai vở kịch nổi tiếng Tôi và chúng ta, Hồn Trương Ba da hàng thịt của Lưu Quang Vũ cũng được trích giảng trong chương trình Ngữ Văn của trường phổ thông.'),
	('B2000','C_TL','17 x 13 x 1 cm',184,N'Hành tinh của một kẻ nghĩ nhiều là hành trình khám phá thế giới nội tâm của một người trẻ. Đó là một hành tinh đầy hỗn loạn của những suy nghĩ trăn trở, những dằn vặt, những cuộc chiến nội tâm, những cảm xúc vừa phức tạp cũng vừa rất đỗi con người. Một thế giới quen thuộc với tất cả chúng ta.
Và nếu bạn cũng là một kẻ nghĩ nhiều, chào mừng bạn đến với hành tinh này.“Sự cô đơn không nằm ở việc không có bạn bè hay người thân mà ngay cả trong sự sum vầy ta vẫn cảm thấy không có ai có thể hiểu mình tường tận từ sâu tâm hồn. Là sự cô đơn như thể chỉ có một mình mình trên một hành tinh đơn độc trong đầu, một hành tinh không bao giờ có khách viếng thăm”.'),
	('B2001','C_TL','24 x 13 x 1.7 cm',420,N'Tiền là một chủ đề không dễ chịu với hầu hết chúng ta. Nhiều người thà nói về cuộc sống tình dục của họ còn hơn nói về số dư tài khoản ngân hàng. Chúng ta yêu tiền và chúng ta cũng ghét nó. Chúng ta không thể sống với nó, và cũng không thể sống thiếu nó. Tiền có thể là cội nguồn cho niềm vui và sự sáng tạo, cũng có thể mang lại sự thất vọng và đau khổ tùy thuộc vào mối quan hệ của chúng ta với nó. 
Và trong ta hình thành đủ loại cảm xúc nghi ngờ và sợ hãi, mong ước và kỳ vọng mỗi khi đối mặt với tiền - không chỉ khi chúng ta gặp một nhà hoạch định tài chính hay nhân viên tín dụng, mà là trên mọi khía cạnh trong cuộc sống.
“Năng lượng của tiền” sẽ mang đến cho mọi người một công cụ để sử dụng tất cả những thông tin và kiến thức sẵn về tiền, cũng như để tiếp cận với trí tuệ chúng ta - bởi kiến thức cộng với sự thông minh sẽ mang lại sức mạnh, đặc biệt là sức mạnh của ĐỒNG TIỀN.'),
	('B2002','C_TL','20.5 x 14.5 x 1.4 cm',312,N'“Tâm lý học tính cách” lấy “chín kiểu hình tính cách” làm trọng tâm, với nền tảng là những lý luận của tâm lý học tính cách và tâm lý học chiều sâu , giới thiệu đến bạn đọc một cách chi tiết về đặc trưng và phương pháp cải thiện khuyết điểm dành cho chín kiểu hình tính cách của con người.
Với ngôn từ dễ hiểu, ví dụ sinh động cùng nội dung chi tiết mang tính xác thực cao, tôi tin rằng cuốn sách này không chỉ giúp bạn đọc nhận thức được kiểu hình tính cách của bản thân, mà quan trọng hơn là giúp các bạn phát huy sở trường, đồng thời khắc phục khiếm khuyết của chính mình.
Có thể nói, cuốn sách này cung cấp cho độc giả công cụ hữu ích để tự hoàn thiện tính cách. Qua đây, tác giả hy vọng mỗi người đều may mắn mở được cánh cửa lớn hướng về cuộc sống hạnh phúc cá nhân.'),
	('B2003','C_TL','20.5 x 14.5 x 0.8 cm',200,N'Làm Gì Có Ai Thực Lòng Muốn Chết
Cố giáo sư Lim Sewon là giáo sư tại Đại học Y khoa Sungkyunkwan và là bác sĩ tâm thần tại bệnh viện Kang Buk Samsung. Công việc của giáo sư Lim Sewon là tìm lại hạnh phúc cho những người đang đánh mất chúng, người ta gọi đó là công việc "điều trị bệnh trầm cảm".
Ngôn từ giản dị nhưng sâu sắc, ẩn chứa nhiều thông điệp tích cực và chữa lành cho bất cứ ai đọc cuốn sách này, hy vọng vào tương lai để có thể được hạnh phúc. Khi đặt bút viết cuốn sách này, tác giả muốn giúp nhiều người hơn, kể cả chính ông, những người đang phải vật lộn với nỗi đau khổ, để học có thể tìm thấy dẫu chỉ là một chút của niềm hy vọng mong manh, để có thể nắm trong tay một manh mối nhỏ của hạnh phúc.
Cuốn sách này có thể giúp đỡ dù chỉ là một phần nhỏ bé cho những ai đang rơi vào tuyệt vọng, hay những người thân trong gia đình họ, trên hết là tất cả những người muốn lấp đầy từng khoảnh khắc của cuộc đời mình bằng niềm hạnh phúc.'),
	('B2004','C_KTBK','20.5 x 14.5 x 0.8 cm',163,N'Theo dòng chảy lịch sử, mỗi giai đoạn thăng trầm đều xuất hiện những nhà khoa học kiệt xuất với những phát minh làm thay đổi cuộc sống của con người. Thực tế đã chứng minh cuộc sống của chúng ta trở nên tốt đẹp và hiện đại hơn nhờ sự đóng góp không nhỏ của các nhà khoa học này.
Vậy đó là những nhà khoa học nào? Họ đã đóng góp những nghiên cứu, phát minh nào cho thế giới? Tất cả sẽ được giải đáp trong cuốn sách Giai thoại về các thiên tài - Hành trình khám phá tài năng do tác giả Rasmus Hoài Nam biên soạn.
Bên cạnh việc cung cấp thông tin chi tiết về các nhà khoa học thiên tài có nhiều đóng góp cho nhân loại, cuốn sách còn mang đến cho độc giả thêm nhiều thông tin về cuộc đời và những giai thoại thú vị, những điểm khác biệt của các nhà khoa học này.
Theo tác giả, điểm khác biệt đó chính là một trong những yếu tố quan trọng để tạo ra những phát minh vĩ đại.')


INSERT INTO  ORDERS
VALUES ('O100000','C10000',01-01-2023,00,N'Mỹ thành bắc,Cai Lậy,Tiền Giang',N'Nhân xác vào giờ trưa'),
		('O100001','C10001',01-01-2023,00,N'Mỹ Tho',N'Nhân xác vào giờ trưa')

INSERT INTO ORDERDETAILS
VALUES ('OD1004','O100001','B1001',200000,1),
	  ('OD1003','O100000','B1001',190000,1)

INSERT INTO BILLS
VALUES ('BL10000','O100001','U10000','VKANN',2023-01-01,200000),
       ('BL10001','O100000','U10000','VKANN',2023-05-01,180000)
GO

-----Stored Procedure


-----Trigger
---- CẬP NHẬT LẠI KHO HÀNG SÁCH
CREATE TRIGGER TG_CAPNHATSOLUONGTONKHO
ON ORDERDETAILS
AFTER INSERT
AS
BEGIN
	-- LẤY THÔNG TIN VỪA INSERT 
	DECLARE @BOOKID CHAR(10)
	DECLARE @QUANTITY INT
	SELECT @BOOKID=BookId,@QUANTITY =Quantity
	FROM INSERTED

	--CẬP NHẬT GIẢM SỐ LƯỢNG TỒN CỦA HÀNG HÓA
	UPDATE BOOKS
	SET Quantity = Quantity-@QUANTITY 
	WHERE Id=@BOOKID
END
GO
--- CẬP NHẬT LẠI SỐ LƯỢNG VOUCHER
CREATE TRIGGER TG_CAPNHATVOUCHER
ON BILLS
AFTER INSERT
AS
BEGIN
	DECLARE @IDVOUCHER CHAR(10)
	SELECT @IDVOUCHER= VoucherId 
	FROM INSERTED
	
	UPDATE VOUCHERS
	SET Quantity = Quantity-1
	WHERE Id=@IDVOUCHER
END
GO
--- CHECK MAIL CHO KHÁCH HÀNG
CREATE TRIGGER CHECK_MAIL
ON CUSTOMERS
AFTER INSERT
AS 
BEGIN
    IF EXISTS (
        SELECT 1
        FROM INSERTED
        WHERE Email NOT LIKE '%@gmail.com'
    )
    BEGIN
        RAISERROR('Định dạng email không hợp lệ. Email phải có định dạng name@example.com', 16, 1);
        ROLLBACK TRANSACTION;  -- Rollback the transaction if the format is invalid
    END
END;
GO
-- CHECH PHONE
CREATE TRIGGER CHECK_PHONE
ON CUSTOMERS
AFTER INSERT
AS
BEGIN
IF EXISTS (
	SELECT 1
	FROM INSERTED
	WHERE Phone NOT LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
	)
	BEGIN
	RAISERROR ('Số điện chưa đúng đinh dạng,vui lòng nhập lại',16,1)
	ROLLBACK TRANSACTION;
	END
END;

/*CREATE FUNCTION AUTO_IDSP()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(MaSanPham) FROM SanPham) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaSanPham, 3)) FROM SanPham
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'SP00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'SP0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
*/