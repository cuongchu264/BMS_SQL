CREATE DATABASE BMS
GO

USE BMS
GO


CREATE TABLE Carousels
(
	CarouselId Int Identity(1,1) PRIMARY KEY,
	Caption nvarchar(Max),
	Text nvarchar(Max),
	Img nvarchar(Max),
	Link nvarchar(Max)
)
GO

CREATE TABLE Categories
(
	CategoryId int Identity(1,1) PRIMARY KEY,
	CategoryName nvarchar(255),
)
GO

CREATE TABLE HotProducts
(
	HotProductId int Identity(1,1) PRIMARY KEY,
	HotProductName nvarchar(255),
	CategoryId int,
	HPPrice float,
	HPAvatar nvarchar(255),
	HPDescription ntext,
	HPInStocks int,
	img1 nvarchar(255),
	CONSTRAINT FK_CategoryId FOREIGN KEY(CategoryId)
		REFERENCES Categories(CategoryId)
)
GO

CREATE TABLE Products
(
	ProductId int Identity(1,1) PRIMARY KEY,
	ProductName nvarchar(255),
	CategoryId int,
	Price float,
	Avatar nvarchar(255),
	Description ntext,
	InStocks int,
	CONSTRAINT FK_CategoryId_Products FOREIGN KEY(CategoryId)
		REFERENCES Categories(CategoryId),
	img1 nvarchar(255),
)
GO

CREATE TABLE Brands
(
	BrandId int PRIMARY KEY,
	BrandName nvarchar(255),
	BrandDescription nvarchar(255),
	BrandImg nvarchar(255)
)
GO

CREATE TABLE NewsCategories
(
	NewCateId int Identity(1,1) PRIMARY KEY,
	NewCateName nvarchar(255),
)
GO

CREATE TABLE News
(
	NewId int Identity(1,1) PRIMARY KEY,
	NewTitle nvarchar(255),
	NewComment nvarchar(255),
	NewImg nvarchar(255),
	NewLink nvarchar(255),
	NewCategory int,
	NewCategoryName nvarchar(255),
	CONSTRAINT FK_News_CateID FOREIGN KEY(NewCategory)
		REFERENCES NewsCategories(NewCateId)
)
GO



CREATE TABLE CustomerReviews
(
	CustomerReviewId int Identity(1,1) PRIMARY KEY,
	CustomerName nvarchar(255),
	CustomerEmail nvarchar(255),
	CustomerPhone nvarchar(255),
	DateReviews date,
	Star int,
	Content nvarchar(255),
)
GO

CREATE TABLE Founders
(
	FounderId int identity(1,1) PRIMARY KEY,
	FounderName nvarchar(255),
	FounderImg nvarchar(max),
	FounderComment nvarchar(max)
)
GO



CREATE TABLE Carts
(
	CartId int identity(1,1) PRIMARY KEY,
	ProductId int,
	ProductName nvarchar(255),
	Avatar nvarchar(255),
	Price float,
	Size int,
	Quantity int,
	UserName nvarchar(255),
)

CREATE TABLE Bills
(
	BillId int identity(1,1) PRIMARY KEY,
	CustomerName nvarchar(Max),
	UserName nvarchar(255),
	Phone nvarchar(255),
	Address nvarchar(Max),
	DayOrder datetime DEFAULT (getdate()),
	Total float,
	Status nvarchar(Max),
)


CREATE TABLE CartDetails
(
	CartDetailId int identity(1,1) PRIMARY KEY,
	ProductName nvarchar(255),
	Avatar nvarchar(255),
	Size int,
	Quantity int,
	Price float,
	BillId int,
	ProductId int,
	CONSTRAINT FK_BillId FOREIGN KEY(BillId)
		REFERENCES Bills(BillId),
	CONSTRAINT FK_ProductId FOREIGN KEY(ProductId)
		REFERENCES Products(ProductId)
)

CREATE TABLE ProductReviews
(
	ProductReviewId int identity(1,1) PRIMARY KEY,
	CustomerName nvarchar(255),
	Star int,
	Content nvarchar(Max),
	ProductId int,
	CONSTRAINT FK_ProductReviews_ProductId FOREIGN KEY(ProductId)
		REFERENCES Products(ProductId)
)

CREATE TABLE Users
(
	USerId int identity(1,1) PRIMARY KEY,
	UserName nvarchar(255),
	Password nvarchar(255),
	FullName nvarchar(255),
	Email nvarchar(255),
	Phone nvarchar(255),
	Address nvarchar(Max),
	Avatar nvarchar(Max),
	DayCreated datetime DEFAULT (getdate()),
)

CREATE TABLE Charts
(
	ChartId int identity(1,1) PRIMARY KEY,
	ChartMonth nvarchar(255),
	ChartSumOfBill int,
)

CREATE TABLE MoneyCharts
(
	MoneyChartId int identity(1,1) PRIMARY KEY,
	MoneyChartMonth nvarchar(255),
	ChartSumOfMoney int,
)

CREATE TABLE UserCharts
(
	UserChartId int identity(1,1) PRIMARY KEY,
	UserChartMonth nvarchar(255),
	ChartSumOfUser int,
)



--carousel
Insert Into Carousels (Caption, Text, Img, Link)
Values(N'Mang lại giải pháp tốt nhất cho ngôi nhà của bạn',N'Chuyên cung cấp Vật liệu Xây dựng và Vật liệu Trang trí Nội - Ngoại thất uy tín chuyên nghiệp hàng đầu tại khu vực Đà Nẵng, Hội An, Tam Kỳ, Quảng Nam, Quảng Ngãi, Quy Nhơn và các tỉnh Miền Trung, Tây Nguyên...','https://bizweb.dktcdn.net/100/387/417/themes/765499/assets/slider_1.jpg?1664793449068', 'https://vatlieuxaydung24h.vn/gach-block-lat-via-he')
Insert Into Carousels (Caption, Text, Img, Link)
Values(N'Đa dạng các loại hình sản phẩm',N'Sản xuất và phân phối từ Gạch, cát, đá, xi măng, sắt, thép, ống nước và phụ kiện ống nước, bồn nước, bình nước nóng, máy năng lượng lặt trời, gạch men, gạch đá trang trí, thiết bị vệ sinh, sen vòi rửa, sơn, vật liệu chống thấm, gạch block, ngói lợp, tấm lợp, thiết bị xây dựng, dụng cụ thi công, thanh kèo thép nhẹ BlueScope, thiết bị hồ bơi, xông hơi, Spa…','https://bizweb.dktcdn.net/100/387/417/themes/765499/assets/slider_2.jpg?1664793449068', 'https://vatlieuxaydung24h.vn/may-xong-hoi')
Insert Into Carousels (Caption, Text, Img, Link)
Values(N'Nguồn nhân lực hàng đầu',N'Sáng lập bởi các cổ đông có nhiều năm kinh nghiệm trong lĩnh vực thiết kế kiến trúc, thi công xây dựng và cung cấp VLXD & TT NNT hàng đầu tại Đà Nẵng, Hội An, Quảng Nam, Quy Nhơn và các tỉnh thành khu vực Miền Trung, Tây Nguyên.','https://bizweb.dktcdn.net/100/387/417/themes/765499/assets/slider_3.jpg?1664793449068', 'https://vatlieuxaydung24h.vn/ngoi-lop-nha')
Insert Into Carousels (Caption, Text, Img, Link)
Values(N'Chiến lược trở thành công ty hàng đầu trong lĩnh vực Phân phối Sỉ & Lẻ các loại vật liệu xây dựng và Trang trí Nội ngoại thất, thi công hoàn thiện công trình dân dụng và công nghiệp',N'Đặt mục tiêu lấy chất lượng, tiến độ, sự hài lòng của khách hàng làm nền tảng cho sự phát triển.','https://bizweb.dktcdn.net/100/387/417/themes/765499/assets/slider_4.jpg?1664793449068', 'https://vatlieuxaydung24h.vn/nha-may-san-xuat-gach-bong-gio-my-thuat-danatiles')
Insert Into Carousels (Caption, Text, Img, Link)
Values(N'Đáp ứng đầy đủ nhu cầu của khách hàng',N'Đội ngũ kỹ sư, công nhân của công ty luôn năng động, chuyên nghiệp sẽ làm thoả mãn tất cả những khách hàng khó tính nhất và được các chủ đầu tư đánh giá cao.','https://bizweb.dktcdn.net/100/387/417/themes/765499/assets/slider_5.jpg?1664793449068', 'https://vatlieuxaydung24h.vn/nha-thau-tu-van-thiet-ke-thi-cong-xay-dung-ho-boi-be-boi')


--categories
Insert Into Categories(CategoryName)
values (N'Gạch trang trí')
Insert Into Categories(CategoryName)
values (N'Vật liệu thô')
Insert Into Categories(CategoryName)
values (N'Thiết bị ngành nước')
Insert Into Categories(CategoryName)
values (N'Ngói lợp nhà')
select * from HotProducts
delete HotProducts


--hot products
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Gạch men lát nền giả gỗ GR05 150x800',1, 500000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-men-gia-go-gr-15805-150x800.jpg?v=1664867655653', N'Với nhiều năm kinh nghiệm trong lĩnh vực phân phối các loại gạch men, gạch granite bóng kinh, gạch porcelain, gạch trang trí, gạch lát nền, thiết bị vệ sinh, phòng tắm... Công ty Hưng Gia Bình cam kết sẽ mang đến cho Quý khách hàng những sản phẩm gạch ốp lát và thiết bị phòng tắm, spa chuyên nghiệp, hàng chất lượng với giá cạnh tranh nhất.',7,'https://bizweb.dktcdn.net/100/387/417/products/gach-men-gia-go-gr-15805-150x800.jpg?v=1664867655653')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Gạch Inax 255/VIZ-10',1, 525000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1455345gach-inax-255-viz-10-jpeg.jpg?v=1595666790067', N'Gạch inax 255/VIZ-10 khi thi công ốp gạch theo chiều ngang hay theo chiều dọc, gạch mosaic ngoại thất 225/viz này đều đem đến sức cuốn hút cho công trình với các họa tiết lượn sóng và vẻ ngoài gồ ghề, đẹp tự nhiên.Dòng Gạch 225/VIZ sử dụng công nghệ MicroGuard, là kỹ thuật mới nhất của Công ty gạch Inax với khả năng chống bám bẩn và tự làm sạch cao.',10,'https://media.bizwebmedia.net/sites/55916/data/Upload/2016/11/gach_inax_255_viz_10.jpg')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Gỗ lát sân vườn B12 nâu đen',1, 85000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/5616157thanh-gia-go-b12-den-jpeg.jpg?v=1595666821417', N'Gỗ lát sân vườn B12 Vĩnh Cửu còn được gọi là Thanh giả gỗ lát nền sân vườn B12. Sản phẩm có 2 tông màu chính là màu đen và màu nâu đất, với kích thước chuẩn 600x220x40 mm, độ dày 4cm được làm từ chất liệu bê tông xi măng cốt liệu... Đây là loại gạch lát nền sân vườn thường được sử dụng để thi công ốp lát trang trí sân vườn, ốp tường trang trí, tạo điểm nhấn cho sân vườn, lát lối đi công viên, bãi đậu xe, khu vui chơi công cộng...',19,'https://media.bizwebmedia.net/sites/55916/data/Upload/2017/2/go_lat_nen_san_vuon_b12_den.jpg')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Gạch ống Đại Hưng 6 lỗ nhỏ',2, 1500,'https://media.bizwebmedia.net/sites/55916/data/Upload/2016/11/gach_ong_6_lo_nho_dai_hung.jpg', N'Gạch ống 6 lỗ nhỏ Đại Hưng 75x115x175 mm là loại gạch xây dựng được làm bằng gốm đất sét nung chất lượng cao tại xã Đại Đồng, huyện Đại Lộc, tỉnh Quảng Nam. Gạch Đại Hưng được sản xuất trên dây chuyền thiết bị hiện đại và công nghệ tiên tiến hàng đầu của Châu Âu.',21,'https://media.bizwebmedia.net/sites/55916/data/Upload/2016/11/gach_ong_6_lo_nho_dai_hung.jpg')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Đá chẻ viên xây móng',2, 11600,'https://media.bizwebmedia.net/sites/55916/data/Upload/2016/3/da_che_vien_xay_mong.jpg', N'Công ty TNHH Vật Liệu Xây Dựng Hưng Gia Bình chúng tôi tự hào là nhà phân phối các loại đá xây dựng cho các công trình dân dụng và công nghiệp tại Đà Nẵng, hội An, Tam Kỳ, Quảng Nam như đá 1x2, đá 4x6, đá hộc, đá mi sàng, đá chẻ viên, bột đá, ...',2,'https://media.bizwebmedia.net/sites/55916/data/Upload/2016/3/da_che_vien_xay_mong.jpg')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Xi măng trắng SCG Thái Lan PCW50',2, 265000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0636500xi-mang-trang-scg-thai-lan-pcw-50-jpeg.jpg?v=1595666985817', N'Xi măng trắng SCG Thái Lan PCW 50.I là loại Xi măng Trắng Portland. Do đó, sản phẩm này dùng cho các công trình có độ bền chắc cao. Loại xi măng trắng này có thể được sử dụng trên sàn và tường nhà, các vật liệu trang trí đúc sẵn và các công trình kết cấu. Với độ trắng nổi bật, Xi măng trắng SCG PCW50 này có thể hoàn thiện trí tưởng tượng của bạn trên tất cả các loại bề mặt trang trí như Gạch đá mài, Bột trét, Sản phẩm trang trí và Bê tông Kiến trúc đổ khuôn...',2,'https://media.bizwebmedia.net/sites/55916/data/Upload/2019/12/xi_mang_trang_scg_thai_lan_pcw_50_i.jpg')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Bồn nước inox Tân Á Đại Thành 6000L',3, 16940000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2547397bon-nuoc-inox-tan-a-6000l-jpeg.jpg?v=1595666934033', N'Công ty Vật Liệu Xây Dựng Đà Nẵng | VLXD Hưng Gia Bình - Nhà phân phối bồn chứa nước Inox Tân Á Đại Thành, bồn chứa nước Toàn Mỹ, bồn nước Sơn Hà... uy tín chuyên nghiệp lớn nhất tại Đà Nẵng, Hội An, Quảng Nam và các tỉnh Miền Trung, Tây Nguyên.',90,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2547397bon-nuoc-inox-tan-a-6000l-jpeg.jpg?v=1595666934033')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Máy nước nóng NLMT Tân Á GOLD 180L',3,5550000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0525170may-nuoc-nong-nlmt-tan-a-dai-thanh-jpeg.jpg?v=1595666751837', N'Công ty VLXD Hưng Gia Bình - Nhà phân phối chính thức và thi công lắp đặt máy nước nóng năng lượng mặt trời Tân Á Đại Thành tại Đà Nẵng, Hội An, Quảng Nam, Quảng Ngãi, Huế, Quảng Trị... với 3 dòng sản phẩm chính là máy nước nóng NLMT SILVER, máy nước nóng NLMT GOLD và máy nước nóng NLMT DIAMOND...Sản phẩm máy nước nóng năng lượng mặt trời Tân Á GOLD 180L là dòng sản phẩm máy nước nóng rất được ưa chuộng và bán chạy nhất trên thị trường hiện nay, phù hợp với nhu cầu sử dụng và kính tế của đa số hộ tiêu dùng trên thị trường hiện nay.',20,'https://media.bizwebmedia.net/sites/55916/data/Upload/2016/8/may_nuoc_nong_nang_luong_mat_troi_ta_a_180l.jpg')
Insert Into HotProducts (HotProductName,CategoryId,HPPrice,HPAvatar,HPDescription,HPInStocks,img1)
values (N'Thép cuộn Việt Hàn',3, 40000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/2550748thep-cuon-viet-han-jpeg.jpg?v=1595666322233', N'Thép cuộn tròn của VPS được sản xuất theo tiêu chuẩn JIS G3505 (Nhật Bản) và tiêu chuẩn TCVN 1651 – 1985 (Việt Nam), kích cỡ của Thép cuộn tròn Việt Hàn gồm có: Φ5.5, Φ6, Φ8 và Φ10.Thép cuộn tròn Việt Hàn được sản xuất bằng dây chuyền 24 giá cán hoàn toàn tự động của Italia với tốc độ 60m/s và làm nguội trực tiếp bằng nước với áp lực lớn nên thép tròn cuộn của VPS có tiết diện tròn đều, bề mặt nhẵn bóng và có khả năng chống ôxy hoá.',89,'https://media.bizwebmedia.net/Sites/55916/Data/upload/2014/3/thep-cuon-viet-han.jpg')


--Products
--Gạch trang trí
Insert Into Products(ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch men lát nền giả gỗ GR05 150x800',1, 185000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-men-gia-go-gr-15805-150x800.jpg?v=1664867655653', N'Với nhiều năm kinh nghiệm trong lĩnh vực phân phối các loại gạch men, gạch granite bóng kinh, gạch porcelain, gạch trang trí, gạch lát nền, thiết bị vệ sinh, phòng tắm... Công ty Hưng Gia Bình cam kết sẽ mang đến cho Quý khách hàng những sản phẩm gạch ốp lát và thiết bị phòng tắm, spa chuyên nghiệp, hàng chất lượng với giá cạnh tranh nhất.',10,'https://bizweb.dktcdn.net/100/387/417/products/gach-men-gia-go-gr-15805-150x800.jpg?v=1664867655653')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch lát nền giả gỗ GR01 150x800',1, 180000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-lat-nen-gia-go-gr-15801-150x800.jpg?v=1664867182237', N'Với nhiều năm kinh nghiệm trong lĩnh vực phân phối các loại gạch men, gạch granite bóng kinh, gạch porcelain, gạch trang trí, gạch lát nền, thiết bị vệ sinh, phòng tắm... Công ty Hưng Gia Bình cam kết sẽ mang đến cho Quý khách hàng những sản phẩm gạch ốp lát và thiết bị phòng tắm, spa chuyên nghiệp, hàng chất lượng với giá cạnh tranh nhất.',10,'https://bizweb.dktcdn.net/100/387/417/products/gach-men-gia-go-gr-15805-150x800.jpg?v=1664867655653')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Gạch men giả đá granite trắng GL 19602',1, 125000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/gach-men-gia-da-granite-trang-gl-19602.jpg?v=1646380587090', N'Hưng Gia Bình - Nhà phân phối Gạch men giả đá granite trắng Glory GL 19602 và gạch men lát nền giá tốt nhất tại Đà Nẵng, Hội An, Quảng Nam... Giao hàng tận nơi với mọi số lượng',10,'https://bizweb.dktcdn.net/100/387/417/products/gach-men-gia-da-granite-trang-gl-19602.jpg?v=1646380587090')
--Vật liệu thô
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Cát tô trắng',2, 450,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1000097cat-trang-jpeg.jpg?v=1595666987453', N'Cát trắng không chỉ được sử dụng để làm kính, đúc khuôn mẫu mà nó còn là một loại nguyên liệu rất được ưu chuộng trong công tác xây tô, thi công xây dựng hiện nay.',10,'https://media.bizwebmedia.net/sites/55916/data/Upload/2019/12/cat_to_trang.jpg')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Lưới thép B40 mạ kẽm',2, 23500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/luoi-thep-b40-ma-kem.jpg?v=1645668573490', N'Lưới thép B40 là sản phẩm lưới thép hàng rào truyền thống có mặt trên thị trường khá sớm, với sự tiện lợi về giá thành rẻ, dễ vận chuyển, thi công lắp đặt dễ dàng, không rỉ sét... đem lại hiệu quả rất lớn và thiết thực cho các công trình xây dựng lớn nhỏ.',10,'https://bizweb.dktcdn.net/100/387/417/files/luoi-thep-b40.jpg?v=1645668624391')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Thép hình chữ H',2, 50000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/0639948hbeams-jpeg.jpg?v=1595666227043', N'Công dụng: Dùng trong công trình xây dựng cầu đường, xây dựng nhà xưởng, kết cấu nhà tiền chế, ngành cơ khí, …',10,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/51399892c-jpeg.jpg?v=1595666228833')
--Thiết bị nghành nước
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Máy bơm nước hồ bơi Emaux SB30',3, 11950000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/may-bom-nuoc-emaux-sb30.jpg?v=1636075493153', N'Máy bơm nước bể bơi Emaux SB 30 – Emaux model SB30 là một mẫu máy bơm nước hồ bơi được ưa chuộng nhất mang thương hiệu Emaux với lưu lượng cao và khả năng tiết kiệm năng lượng vượt trội, bơm thích hợp sử dụng cho bể bơi công nghiệp. Đầu kết nối ống nước 2 inch với nắp đậy trong suốt, dễ dàng quan sát thiết bị và rọ lọc. Thiết kế phốt không rỉ nước khi bơm hút nước và tối đa hóa hiệu quả hút.',10,'https://bizweb.dktcdn.net/100/387/417/files/may-bom-nuoc-ho-boi-emaux-sb30.jpg?v=1636705784082')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Bình nước nóng Rossi Saphir 22L ngang',3, 2250000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/3149542binh-nuoc-nong-rossi-saphir-22l-ngang-jpeg.jpg?v=1595667013713', N'Bình nước nóng Rossi Saphir 22L ngang là thương hiệu bình nước nóng cao cấp của Tập đoàn Tân Á Đại Thành. Sản phẩm mang phong cách thiết kế Ý và là sản phẩm bán chạy nhất trên thị trường hiện nay. Bình nước nóng Rossi tích hợp những tính năng hiện đại của một bình nước nóng thế hệ mới với mục tiêu mang đến cho khách hàng trải nghiệm cao cấp từ cuộc sống tiện nghi.',10,'https://media.bizwebmedia.net/sites/55916/data/Upload/2020/4/binh_nuoc_nong_rossi_saphir_22l_ngang.jpg')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Bồn Inox Tân Á Đại Thành 1500 lít',3,4640000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1542314bon-nuoc-tan-a-jpeg.jpg?v=1595666625917', N'Sản phẩm bồn inox Tân Á Đại Thành là loại buồn chứa nước nước inox rất được ưa chộng trên thị trường VLXD hiện nay, được nhiều khách hàng đối tác tin tưởng và sử dụng.',10,'https://media.bizwebmedia.net/sites/55916/data/Upload/2015/5/bon_nuoc_inox_dai_thanh_2000_lit.jpg')
--Ngói lợp nhà
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói tráng men Marusugi Eagle-Exa',4,45500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/ngoi-trang-men-marusugi-kent.jpg?v=1648955161637', N'Ngói tráng men Marusugi còn gọi là ngói Kent, là loại ngói tráng men cao cấp được nhập khẩu nguyên đai, nguyên kiện từ Nhật Bản. Sản phẩm được thiết kế tinh xảo với các gờ chắn nước, móc khóa ngói, lớp men cao cấp không phai màu.Ngói nhật nhập khẩu Marusugi Eagle Exa là loại ngói lợp nhà, vật liệu lợp mái nhập khẩu. Ngói Marusugi được thiết kế tinh xảo bằng các chốt lắp khóa để khóa ngói trên và ngói dưới một cách chắc chắn. Có khả năng chống thiên tai, để bảo vệ ngôi nhà của bạn khỏi vụ tốc mái.',10,'https://bizweb.dktcdn.net/100/387/417/files/ngoi-trang-men-marusugi-eagle-extra-mau-do.jpg?v=1648961172419')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói tráng men Mikado R15 màu xanh rêu',4,23500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/ngoi-trang-men-mikado-r15-xanh-reu.jpg?v=1601979547277', N'Ngói sóng tráng men cao cấp MIKADO là loại vật liệu xây dựng thân thiện với môi trường, được sản xuất trên dây chuyền hiện đại, với các nguyên liệu chất lượng cao, được nung ở nhiệt độ 1110 độ C -1180 độ C. Sản phẩm ngói tráng men Mikado đạt tiêu chuẩn TCVN 9133:2011 có độ bền cao, bề mặt bóng mịn, tự làm sạch khi mưa, không mất màu theo thời gian',1,'https://bizweb.dktcdn.net/100/387/417/files/ngoi-trang-men-mikado-r15-mau-xanh-reu.jpg?v=1601979090106')
Insert Into Products (ProductName,CategoryId,Price,Avatar,Description,InStocks,img1)
values (N'Ngói màu Ruby RD09 - Màu xanh đen',4,25500,'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/417/products/1649454ngoi-nhat-ruby-rd09-jpeg.jpg?v=1595666946813', N'Ngói Nhật Ruby RD09 màu xanh đen là dòng ngói bê tông màu cao cấp được sản xuất dựa trên hệ thống dây chuyền thiết bị sản xuất tự động hóa từ khâu cung cấp nguyên vật liệu, phối liệu cho đến việc tạo hình viên ngói nên đảm bảo độ chính xác cao. Cùng với công nghệ sơn hấp gia nhiệt theo chu trình khép kín qua hai buồng xử lý (2 sơn 3 hấp), với lớp phủ Acrylic tinh chất đặc chế theo công nghệ polyme tiên tiến, kết cấu tạo liên kết ngang cho bề mặt sơn rắn chắc, không bong tróc, không phai màu...',14,'https://media.bizwebmedia.net/sites/55916/data/Upload/2018/8/ngoi_nhat_ruby_rd09_mau_xanh_den.jpg')


--Brand Footer
Insert into Brands (BrandId, BrandName, BrandDescription, BrandImg)
values (1, N'Về chúng tôi', N'Sneaker Shop là cửa hàng chuyên cung cấp giày Sneaker nam nữ cho tất cả các bạn trẻ. Chúng tôi sẽ liên tục cập nhật những sản phẩm mới nhất, chất lượng nhất, hợp thời nhất giúp các bạn có những trải nghiệm tuyệt vời!', 'https://i.pinimg.com/originals/de/84/78/de847819dc8c0dcfea42e1f14faa5775.gif')
Insert into Brands (BrandId, BrandName, BrandDescription, BrandImg)
values (2, N'Hệ thống cửa hàng', N'Hệ thống cửa hàng chúng tôi trải dài trên khắp Việt Nam, mang trong mình thương hiệu được khách hàng tin tưởng trong suốt nhiều năm qua cùng với những dịch vụ tận tâm nhất. ', 'https://images.unsplash.com/photo-1577208288347-b24488f3efa5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXMlMjBzaG9wfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80')



--News
Insert into NewsCategories(NewCateName)
values(N'Tin tức vật liệu xây dựng')
Insert into NewsCategories(NewCateName)
values(N'Thông tin Tuyển dụng Nhân sự')
Insert into NewsCategories(NewCateName)
values(N'Kinh Nghiệm Xây Nhà Đẹp')


--Tin tức vật liệu xây dựng
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Thi công mái ngói tại Đà Nẵng, Hội An, Quy Nhơn - Hệ xà gồ Zacs Bluescope VN', N'Công ty TNHH Vật Liệu Xây Dựng Hưng Gia Bình chuyên cung cấp và tư vấn thi công mái ngói bằng hệ thanh kèo thép mạ hợp kim nhôm kẽm trọng lượng nhẹ mang thương hiệu Zacs BlueScope Lysaght Việt Nam...','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/thi-cong-lop-mai-ngoi-hung-gia-binh.jpg?v=1597131146467','https://vatlieuxaydung24h.vn/thi-cong-mai-ngoi-tai-da-nang-he-xa-go-zacs-bluescope-vn',1, N'Tin tức vật liệu xây dựng')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Giải pháp chống nóng cho sân thượng hiệu quả?', N'Giải pháp chống nóng cho sân thượng hiệu quả? Kinh nghiệm thi công sàn mái sân thượng. Vật Liệu Xây Dựng Đà Nẵng, VLXD Đà Nẵng.','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/chong-nong-san-thuong-hieu-qua.jpg?v=1655262958037','https://vatlieuxaydung24h.vn/giai-phap-chong-nong-cho-san-thuong-hieu-qua',1, N'Tin tức vật liệu xây dựng')
--Thông tin Tuyển dụng Nhân sự
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Tuyển dụng Nhân viên kinh doanh VLXD tại Đà Nẵng', N'Công ty TNHH Vật Liệu Xây Dựng Hưng Gia Bình cần tuyển dụng gấp Nhân viên kinh doanh Vật Liệu Xây Dựng tại Đà Nẵng tháng 06/2020','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/201461191110940.jpg?v=1588743399567','https://vatlieuxaydung24h.vn/tuyen-dung-nhan-vien-kinh-doanh-vlxd-tai-da-nang',2,N'Thông tin Tuyển dụng Nhân sự')
--Kinh nghiệm xây nhà đẹp
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Hướng dẫn từng bước thi công ốp gạch mosaic hồ bơi', N'Công ty TNHH VLXD Hưng Gia Bình xin giới thiệu bài viết “Hướng dẫn tường bước thi công ốp gạch mosaic, gạch hồ bơi” được đút kết từ quá trình thi công ốp gạch mosaic','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/201492316161796.jpg?v=1588743383770','https://vatlieuxaydung24h.vn/huong-dan-tung-buoc-thi-cong-op-gach-mosaic',3,N'Kinh Nghiệm Xây Nhà Đẹp')
Insert into News (NewTitle, NewComment, NewImg, NewLink, NewCategory, NewCategoryName)
values( N'Ngũ hành của vật liệu xây dựng theo phong thủy hiện đại', N'Hiểu được những boăn khoăn của khách hàng, công ty VLXD Hưng Gia Bình xin giới thiệu đến Quý khách hàng bài viết: “Ngũ hành của vật liệu xây dựng theo phong thủy hiện đại','https://bizweb.dktcdn.net/thumb/large/100/387/417/articles/2014121011432598.jpg?v=1588743384580','https://vatlieuxaydung24h.vn/ngu-hanh-cua-vat-lieu-xay-dung-theo-phong-thuy-hien-dai',3,N'Kinh Nghiệm Xây Nhà Đẹp')

--Founder
insert into Founders(FounderName, FounderImg, FounderComment)
values (N'Cường Chu - Founder', 'https://scontent.fdad3-5.fna.fbcdn.net/v/t1.6435-9/126217454_1534882196695741_5648368659554910574_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=174925&_nc_ohc=EKDfA2rCsMUAX-Ipw1k&tn=xKt1AG8JDbpebTqO&_nc_ht=scontent.fdad3-5.fna&oh=00_AT9NsbQODai4hxuhtsGnGOAfsRqOaSL-vr8LVEtodrAovw&oe=61EEC5AC', N'Lời đầu tiên,Sneaker Shop xin phép được gửi tới quý khách hàng lời chúc sức khỏe, thành đạt và hạnh phúc.' )
insert into Founders(FounderName, FounderImg, FounderComment)
values (N'Thịnh Hà - CoFounder', 'https://scontent.fdad3-4.fna.fbcdn.net/v/t1.15752-9/264093341_1236977680124008_6659438362288855389_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=ae9488&_nc_ohc=QDCaXbwxirAAX8Y8XG3&tn=xKt1AG8JDbpebTqO&_nc_ht=scontent.fdad3-4.fna&oh=03_AVKVCe5mHvgJsMgq_qWimsyZGwNZwJ_WqegLqJj7V_IBsg&oe=61EF2FFD', N'Hiện tại Sneaker Shop đang kinh doanh các mẫu giày Sneaker hot nhất các thương hiệu nổi tiếng như Adidas,Nike,Converse,Vans,..với chất lượng cải thiện liên tục để hoàn hảo nhất cho Quý Khách hàng của mình.' )
insert into Founders(FounderName, FounderImg, FounderComment)
values (N'Đạt Nguyễn - CoFounder', 'https://scontent.fdad3-4.fna.fbcdn.net/v/t1.6435-9/126513844_2790081497975764_7882114598137046604_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=abk4Gmu7Sd0AX8M8C3v&_nc_ht=scontent.fdad3-4.fna&oh=00_AT-gZPNTzCKM5pamGRVf-hacDKh85sJHs4JM99ZkL_mpHQ&oe=61E34466', N'Sau một thời gian hoạt động kinh doanh, những sản phẩm chúng tôi mang đến cho khách hàng đã tạo ra sự hài lòng,sự đánh giá tốt về chất lượng sản phẩm cũng như sự tư vấn nhiệt tình của cửa hàng. Sneaker Shop sẽ nỗ lực hơn nữa,sẽ luôn cập nhập những mẫu giày Sneaker hot nhất,thời trang nhất để đáp ứng nhu cầu những khách hàng thân yêu của mình.' )
insert into Founders(FounderName, FounderImg, FounderComment)
values (N'Lâm Võ - CoFounder', 'https://scontent-sin6-1.xx.fbcdn.net/v/t1.6435-9/107696389_181429943336568_4189917246555326764_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=174925&_nc_ohc=V_RYYismMjIAX9DTIsh&_nc_ht=scontent-sin6-1.xx&oh=00_AT_s9A4aT0hOHpLKr76VmfPfqoujeGukw6M88f9GBogiag&oe=61EDD828', N'Sneaker Shop tự tin là một trong những cửa hàng chất lượng nhất, đem đến cho khách hàng sự trải nghiệm sản phẩm tuyệt vời nhất. Sự ủng hộ và tin tưởng của quý khách sẽ trở thành nguồn cảm hứng lớn lao cho Sneaker Shop tiếp tục cố gắng và phụng sự quý vị.' )
insert into Founders(FounderName, FounderImg, FounderComment)
values (N'Phú Nguyễn - CoFounder', 'https://scontent.fdad3-4.fna.fbcdn.net/v/t1.15752-9/263360769_385088706747165_8413112806528853842_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=ae9488&_nc_ohc=fwurBh3xThAAX_1lvJD&tn=xKt1AG8JDbpebTqO&_nc_ht=scontent.fdad3-4.fna&oh=03_AVK4u00RpdrWYUPp_6UeP0Tfc-pVBUCssZKhCHCLRCCrfA&oe=61E40979', N'Xin cảm ơn sự tin tưởng và ủng hộ của quý khách trong thời gian qua. Trân trọng!' )

 
--chart
insert into Charts(ChartMonth,ChartSumOfBill)
values(N'Tháng 11 - 2021', 20)
insert into Charts(ChartMonth,ChartSumOfBill)
values(N'Tháng 12 - 2021', 30)
insert into Charts(ChartMonth,ChartSumOfBill)
values(N'Tháng 1 - 2022', 20)

--money chart
insert into MoneyCharts(MoneyChartMonth,ChartSumOfMoney)
values(N'Tháng 11 - 2021', 40)
insert into MoneyCharts(MoneyChartMonth,ChartSumOfMoney)
values(N'Tháng 12 - 2021', 30)
insert into MoneyCharts(MoneyChartMonth,ChartSumOfMoney)
values(N'Tháng 1 - 2022', 20)

--user chart
insert into UserCharts(UserChartMonth,ChartSumOfUser)
values(N'Tháng 11 - 2021', 40)
insert into UserCharts(UserChartMonth,ChartSumOfUser)
values(N'Tháng 12 - 2021', 30)
insert into UserCharts(UserChartMonth,ChartSumOfUser)
values(N'Tháng 1 - 2022', 20)

--trigger insert
create trigger giamsoluong_insert
on CartDetails
for insert
as
update Products
set products.InStocks=products.InStocks
-inserted.Quantity
from products inner join inserted
on products.ProductId=inserted.ProductId
