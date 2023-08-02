CREATE DATABASE BanDienThoai_PHP
Go
USE BanDienThoai_PHP
Go

CREATE TABLE LoaiSP
(
	MaLoai int IDENTITY(1,1) primary key NOT NULL,
	TenLoai nvarchar(250) NOT NULL,
	TrangThai bit NOT NULL
)
GO
CREATE TABLE NhaSanXuat
(
	MaNSX int IDENTITY(1,1) primary key not null,
	TenNSX nvarchar(250) not null,
	MoTa ntext null
)
GO

CREATE TABLE DonViTinh
(
	MaDonViTinh int IDENTITY(1,1) primary key not null,
	TenDonViTinh nvarchar(100) not null
)
GO

CREATE TABLE SanPham
(
	MaSanPham int IDENTITY(1,1) primary key  NOT NULL,
	MaLoai int FOREIGN KEY REFERENCES LoaiSP(MaLoai) NOT NULL,
	TenSanPham nvarchar(max) NOT NULL,
	MoTaSanPham ntext NOT NULL,
	AnhDaiDien varchar(500) NOT NULL,
	MaNSX int FOREIGN KEY REFERENCES NhaSanXuat(MaNSX) NOT NULL ,
	MaDonViTinh int FOREIGN KEY REFERENCES DonViTinh(MaDonViTinh) NOT NULL,
	GiaBan float NOT NULL,
	NgayTao datetime NULL,
	NgaySua datetime NULL
)
GO
	

CREATE TABLE ChiTietAnh
(
	MaAnhChiTiet int IDENTITY(1,1) primary key NOT NULL,
	MaSanPham int FOREIGN KEY REFERENCES SanPham(MaSanPham) NULL,
	Anh varchar(500) NULL
)
Go

CREATE TABLE ThongSoKyThuat
(
	MaThongSo int IDENTITY(1,1) primary key NOT NULL,
	MaSanPham int FOREIGN KEY REFERENCES SanPham(MaSanPham) NULL,
	TenThongSo nvarchar(150) NULL,
	MoTa nvarchar(500) NULL
)
GO

CREATE TABLE GiamGia
(
	MaGiamGia int IDENTITY(1,1) primary key NOT NULL,
	MaSanPham int FOREIGN KEY REFERENCES SanPham(MaSanPham) NULL,
	PhanTram float NULL,
	ThoiGianBatDau datetime NULL,
	ThoiGianKetThuc datetime NULL,
	TrangThai bit NULL
)
GO

CREATE TABLE KhuyenMai
(
	MaKhuyenMai int IDENTITY(1,1) primary key NOT NULL,
	TenKhuyenMai nvarchar(250) NULL,
	MoTa ntext NULL
)
GO

CREATE TABLE ChiTietKhuyenMai
(
	MaChiTietKhuyenMai int IDENTITY(1,1) primary key NOT NULL,
	MaSanPham int FOREIGN KEY REFERENCES SanPham(MaSanPham) NOT NULL,
	NgayBatDau datetime NOT NULL,
	NgayKetThuc datetime NOT NULL,
	MaKhuyenMai int FOREIGN KEY REFERENCES KhuyenMai(MaKhuyenMai) NOT NULL,
	TrangThai bit NOT NULL
)
GO

CREATE TABLE NhaCungCap
(
	MaNhaCungCap int IDENTITY(1,1) primary key NOT NULL,
	TenNhaCungCap nvarchar(250) NULL,
	DiaChi nvarchar(500) NULL,
	SoDienThoai nvarchar(20) NULL,
	Email nvarchar(50) NULL
)
GO

CREATE TABLE NhanVien
(
	MaNhanVien int IDENTITY(1,1) primary key NOT NULL,
	HoTen nvarchar(250) NULL,
	NgaySinh datetime NULL,
	GioiTinh nvarchar(20) NULL,
	AnhDaiDien varchar(500) NULL,
	DiaChi nvarchar(1500) NULL,
	Email nvarchar(100) NULL,
	DienThoai char(20) NULL,
	TaiKhoan nvarchar(100) NULL,
	MatKhau nvarchar(100) NULL,
	TrangThai bit NULL,
	LoaiQuyen varchar(10) NULL
)
GO

CREATE TABLE HoaDonNhap
(
	MaHoaDonNhap int IDENTITY(1,1) primary key NOT NULL,
	NgayNhap datetime NOT NULL,
	MaNhanVien int FOREIGN KEY REFERENCES NhanVien(MaNhanVien) NOT NULL,
	MaNhaCungCap int FOREIGN KEY REFERENCES NhaCungCap(MaNhaCungCap) NOT NULL
)
GO

CREATE TABLE ChiTietHoaDonNhap
(
	MaChiTiet int IDENTITY(1,1) primary key NOT NULL,
	MaSanPham int FOREIGN KEY REFERENCES SanPham(MaSanPham) NULL,
	MaHoaDonNhap int FOREIGN KEY REFERENCES HoaDonNhap(MaHoaDonNhap) NULL,
	SoLuong int NULL,
	DonGiaNhap float NULL
)
GO

CREATE TABLE KhachHang
(
	MaKhachHang int IDENTITY(1,1) primary key NOT NULL,
	TenKhachHang nvarchar(250) NOT NULL,
	DiaChi nvarchar(1500) NULL,
	SoDienThoai varchar(20) NULL,
	Email varchar(50) NULL
)
GO

CREATE TABLE DonHang
(
	MaDonHang int IDENTITY(1,1) primary key NOT NULL,
	MaKhachHang int FOREIGN KEY REFERENCES KhachHang(MaKhachHang) NULL,
	NgayDat datetime NULL,
	TrangThaiDonHang int NULL
)
GO

CREATE TABLE ChiTietDonHang
(
	MaChiTietDonHang int IDENTITY(1,1) primary key NOT NULL,
	MaDonHang int FOREIGN KEY REFERENCES DonHang(MaDonHang) NOT NULL,
	MaSanPham int FOREIGN KEY REFERENCES SanPham(MaSanPham) NOT NULL,
	SoLuong int NOT NULL,
	GiaMua float NOT NULL
)
GO

CREATE TABLE HoaDonXuat
(
	MaHoaDonXuat int IDENTITY(1,1) primary key NOT NULL,
	NgayXuat datetime NULL,
	MaKhachHang int FOREIGN KEY REFERENCES KhachHang(MaKhachHang) NULL,
	MaNhanVien int FOREIGN KEY REFERENCES NhanVien(MaNhanVien) NULL
)
GO

CREATE TABLE ChiTietHoaDonXuat
(
	MaChiTietHoaDonXuat int IDENTITY(1,1) primary key NOT NULL,
	MaHoaDonXuat int FOREIGN KEY REFERENCES HoaDonXuat(MaHoaDonXuat) NOT NULL,
	MaSanPham int FOREIGN KEY REFERENCES SanPham(MaSanPham) NOT NULL,
	SoLuong int NOT NULL,
	GiaBan float NOT NULL,
	ChietKhau float NULL,
	TraLai int NULL
)
GO

CREATE TABLE Kho
(
	MaKho int IDENTITY(1,1) primary key NOT NULL,
	TenKho nvarchar(250) NOT NULL,
	DiaChi nvarchar(500) NOT NULL
)
GO

CREATE TABLE ChiTietKho
(
	MaChiTietKho int IDENTITY(1,1) primary key NOT NULL,
	MaKho int FOREIGN KEY REFERENCES Kho(MaKho) NULL,
	MaSanPham int FOREIGN KEY REFERENCES SanPham(MaSanPham) NULL,
	SoLuong int NULL
)
GO

CREATE TABLE KiemKho
(
	MaKiemKho int IDENTITY(1,1) primary key NOT NULL,
	MaNhanVien int FOREIGN KEY REFERENCES NhanVien(MaNhanVien) NULL,
	ThoiGianBatDau datetime NULL,
	ThoiGianKetThuc datetime NULL,
	TrangThaiKho bit NULL,
	MaKho int FOREIGN KEY REFERENCES Kho(MaKho) NULL,
	MoTa ntext NULL
)
GO

CREATE TABLE ChiTietKiemKho
(
	MaChiTietKiemKho int IDENTITY(1,1) primary key NOT NULL,
	MaSanPham int FOREIGN KEY REFERENCES SanPham(MaSanPham) NOT NULL,
	MaKiemKho int FOREIGN KEY REFERENCES KiemKho(MaKiemKho) NOT NULL,
	SoLuongDemDuoc int NULL,
	SoLuongTinhToan int NULL,
	SoLuongThayDoi int NULL
)
GO

CREATE TABLE Slide (
  MaSlide INT IDENTITY(1,1) PRIMARY KEY,
  Anh VARCHAR(255),
  Link VARCHAR(500),
  NgayTao DATETIME
);
GO
CREATE TABLE TinTuc (
  MaTinTuc INT IDENTITY(1,1) PRIMARY KEY,
  MaNhanVien INT FOREIGN KEY REFERENCES NhanVien(MaNhanVien),
  TieuDe NVARCHAR(255),
  TomTat NTEXT,
  Anh VARCHAR(255),
  NgayTao DATETIME
)
GO
CREATE TABLE ChiTietTinTuc (
  MaChiTietTinTuc INT IDENTITY(1,1) PRIMARY KEY,
  MaTinTuc INT FOREIGN KEY REFERENCES TinTuc(MaTinTuc),
  NoiDung NTEXT,
  NgayTao DATETIME,
)
GO

-----------------------------Thêm dữ liệu vào bảng-----------------------------
-----Slide-----
INSERT INTO Slide(Anh, Link, NgayTao) VALUES
('1.png', NULL, NULL),
('2.png', NULL, NULL),
('3.png', NULL, NULL),
('4.png', NULL, NULL),
('5.png', NULL, NULL),
('6.png', NULL, NULL),
('7.png', NULL, NULL),
('8.png', NULL, NULL);
-----Loại sản phẩm-----
INSERT INTO LoaiSP(TenLoai, TrangThai)
VALUES
(N'Ðiện thoại', 1),
(N'Tablet', 1),
(N'Tai Nghe', 1),
(N'Sạc dự phòng', 1),
(N'Loa Bluetooth', 1),
(N'Phụ kiện', 1);
GO

-----Nhà sản xuất-----
INSERT INTO NhaSanXuat(TenNSX, MoTa) VALUES
(N'Apple', NULL),
(N'Oppo', NULL),
(N'SamSung', NULL),
(N'Xiaomi', NULL),
(N'ViVo', NULL);
GO

-----Ðon Vị Tính-----
INSERT INTO DonViTinh (TenDonViTinh) VALUES
(N'Hộp'),
(N'Chiếc'),
(N'Tá');
GO

-----Sản phẩm-----
INSERT INTO SanPham(MaLoai, TenSanPham, MoTaSanPham, AnhDaiDien, MaNSX, MaDonViTinh, GiaBan, NgayTao, NgaySua) VALUES
(1, N'iPhone 11 64GB I Chính hãng VN/A', N'iPhone 11 sở hữu hiệu năng khá mạnh mẽ, ổn định trong thời gian dài nhờ được trang bị chipset A13 Bionic. Màn hình LCD 6.1 inch sắc nét cùng chất lượng hiển thị Full HD của máy cho trải nghiệm hình ảnh mượt mà và có độ tương phản cao. Hệ thống camera hiện đại được tích hợp những tính năng công nghệ mới kết hợp với viên Pin dung lượng 3110mAh, giúp nâng cao trải nghiệm của người dùng.\r\n\r\nTin tức mới nhất về điện thoại iPhone 11\r\n(Cập nhật ngày 08/02/2023)\r\n\r\nĐầu quý 1 năm 2023, thị trường công nghệ bắt đầu nhộn nhịp trở lại, các đại lý bán lẻ đặc biệt là CellphoneS tung ra nhiều chương trình ưu đãi giảm giá hấp dẫn. Trong đó không thể không nhắc đến chính là iPhone 11 giảm cực sốc so với thời điểm trước đó.\r\n\r\nCụ thể, giá iPhone 11 đã giảm về mức chỉ quanh 10-11 triệu đồng, khiến nhu cầu mua sắm tăng chóng mặt so với các tháng trước. Không những vậy, khách hàng còn nhận được ưu đãi hấp dẫn khi thu cũ lên đời tại CellphoneS, đồng thời còn được giảm giá thêm khi thanh toán qua ví Moca, VNPay hay thẻ tín dụng. \r\nƯu điểm nổi trội của iPhone 11 so với smartphone khác\r\nThời gian gần đây, thị trường smartphone đang có những bước chuyển mình mạnh mẽ với sự ra đời của hàng loạt những sản phẩm với các công nghệ hiện đại bậc nhất như: bộ vi xử lý Snapdragon 8 Gen 2, tấm nền màn hình QLED… Đó có thể là những bước tiến lớn nhưng nó không có nghĩa là dấu chấm hết cho những thiết bị đã được ra mắt trước đó như iPhone 11.\r\nMặc dù không còn giữ được sức nóng và độ hot như những ngày đầu mới được ra mắt nhưng ở thời điểm hiện tại, bạn khó có thể tìm được một sản phẩm nào sở hữu hiệu năng ổn định với mức giá thành siêu rẻ như iPhone 11. Với việc được hạ giá thành xuống thấp tới mức không thể nào hấp dẫn hơn, iPhone 11 sẽ tạo nên một con sốt trên thị trường smartphone thời điểm này.\r\n\r\nHiện tại, iPhone 11 vẫn được các chuyên gia đánh giá rất cao về độ ổn định của cấu hình trong thời gian dài sử dụng cũng như độ sắc nét mượt mà của màn hình trong các tác vụ như xem phim, chơi game. Về thiết kế bên ngoài, sản phẩm cũng vẫn luôn nhận được những phản hồi tích cực về sự bền bỉ, chắc chắn, cho cảm giác cầm nắm thoải mái, vừa tay.\r\nBên cạnh đó, iPhone 11 còn sở hữu hệ thống máy ảnh có độ phân giải cao, đem lại cho người sử dụng những trải nghiệm quay chụp có độ sắc nét và cực kỳ sống động. Điểm yếu của dòng sản phẩm này có lẽ nằm ở thời lượng Pin vẫn còn hạn chế, chưa mang lại trải nghiệm sử dụng tốt nhất. Tuy nhiên, điều này cũng đã được khắc phục thông qua công nghệ sạc nhanh 18W - Power Delivery 2.0 của Apple.\r\n\r\nĐánh giá iPhone 11 - Cấu hình vượt trội, giá thành hấp dẫn\r\nDù đã ra mắt được hơn 3 năm nhưng iPhone 11 vẫn là một trong những thiết bị smartphone đáng mua nhất ở thời điểm hiện tại. Hiệu năng, khả năng tính toán cùng chất lượng hiển thị của màn hình vẫn vô cùng sắc nét và người tiêu dùng đánh giá rất cao. Dưới đây là những thông số cấu hình chi tiết của iPhone thế hệ thứ 11 mà bạn có thể tham khảo.\r\n\r\nThiết kế hiện đại, nhỏ gọn, cho cảm giác cầm nắm thoải mái\r\nThiết kế bên ngoài của iPhone 11 được kế thừa và phát triển từ phiên bản tiền nhiệm đã được ra mắt trước đó là iPhone XR. Cụm camera của máy vẫn giữ nguyên thiết kế theo chiều dọc nhưng phần mô-đun chứa camera được mở rộng hơn đem tới những trải nghiệm hoàn toàn mới lạ cho người dùng. Phần viền thân máy và các góc cạnh của iPhone 11 được thiết kế dạng cong bo mềm mại.\r\nKết hợp với trọng lượng chỉ vỏn vẹn 194 gram cùng kích thước sản phẩm lần lượt là 150.9 x 75.7 x 8.3 mm, iPhone thế hệ thứ 11 sẽ mang tới cho bạn cảm giác cầm nắm cực kỳ thoải mái. Bạn có thể thoải mái sử dụng sản phẩm cả ngày dài mà không cảm thấy khó chịu hay đau mỏi phần cổ tay. Các phím, nút điều chỉnh âm lượng của thiết bị được bố trí quanh viền thân máy, thể hiện sự hoàn hảo trong thiết kế của sản phẩm.\r\n\r\nChất lượng hiển thị sắc nét với tấm nền IPS LCD hiện đại\r\nVề mặt hiển thị, iPhone 11 được người dùng đánh giá khá cao về độ chi tiết, sắc nét. Sản phẩm được ứng dụng công nghệ màn hình hiện đại HD Retina cùng tấm nền LCD kích thước 6.1 inch thế hệ mới, cho trải nghiệm hình ảnh chân thực và sống động tời từng điểm ảnh. \r\nĐộ phân giải hình ảnh mà iPhone 11 đem tới cho người dùng luôn đạt chất lượng Full HD với mật độ điểm ảnh lên tới 326 ppi. Bên cạnh đó, các thông số về độ trễ màn hình, tần số quét của máy cũng nằm ở mức ổn định, cho trải nghiệm mượt mà, mềm mại trên từng khung hình hiển thị. Độ chính xác màu của sản phẩm đạt ở mức tối đa, đưa người dùng đến với thế giới hình ảnh rực rỡ sắc màu.\r\n\r\nCấu hình mạnh mẽ, ổn định trong thời gian dài sử dụng\r\nKhông chỉ tạo được ấn tượng với người dùng thông qua thiết kế gọn nhẹ, cùng chất lượng hiển thị sắc nét, iPhone 11 còn tiếp tục ghi điểm với cấu hình mạnh mẽ, cho trải nghiệm sử dụng hết sức mượt mà. Cụ thể, máy được trang bị chip A13 Bionic cùng dung lượng RAM 4GB. So với các dòng chip khác của Apple thì A13 được đánh giá là có hiệu năng ổn định và tiết kiệm năng lượng tốt. \r\nDung lượng bộ nhớ trong của iPhone 11 bao gồm nhiều phiên bản khác nhau là 64GB, 128GB và 256GB. Với thông số này, người dùng có thể thoải mái lưu trữ ứng dụng, dữ liệu cá nhân mà không cần lo về vấn đề không đủ không gian lưu trữ.\r\n\r\nCụm camera sau chất lượng cao, đa dạng tính năng quay chụp khác nhau\r\nMột ưu điểm vượt trội khác của iPhone 11 rất được người dùng yêu thích là hệ thống máy ảnh có độ phân giải cao, cho chất lượng quay chụp cực kỳ sắc nét cùng dải màu động ấn tượng. Theo đó, mô-đun máy ảnh phía mặt lưng của iPhone 11 bao gồm: 1 camera chính, 1 camera góc rộng cùng 1 đèn flash. Cả camera chính và camera góc rộng của máy đều sở hữu độ phân giải cao lên tới 12MP.\r\n\r\nĐiểm khác biệt duy nhất giữa 2 camera chính, phụ của máy là camera chính sở hữu tiêu cự 28mm, khẩu độ f/1.8, có tính năng chống rung quang học, có Dual Pixel AF và được tích hợp chế độ Night Mode. Thông số này trên camera góc rộng của iPhone 11 chỉ là 13mm tiêu cự và không có chống rung và không có khả năng lấy nét ảnh.\r\nBên cạnh đó, hệ thống camera của máy còn sở hữu nhiều tính năng hiện đại khác như chụp ảnh HDR, quay phim 4K 60FPS, tự động lấy nét… đưa trải nghiệm quay chụp của người dùng lên một tầm cao mới. Khả năng xoá phông cũng dễ dàng và được tối ưu hơn so với những phiên bản trước đó nhờ sở hữu vi xử lý A13 Bionic hiện đại.\r\n\r\nCamera Selfie sắc nét, bắt kịp mọi khoảnh khắc tuyệt vời\r\nKhả năng quay chụp của iPhone 11 không chỉ bị giới hạn bởi cụm camera ở phía sau mà còn được thể hiện ở camera selfie cực kỳ sắc nét. Ống kính phía trước này của iPhone 11 sở hữu độ phân giải đạt 12MP, tiêu cự 22mm cùng khẩu độ f/2.2. \r\nĐồng thời, các tính năng hiện đại như chụp ảnh HDR, tự động nhận diện khuôn mặt, quay phim 4K với tốc độ khung hình đạt 60FPS và có thể đạt tới 120FPS ở chất lượng Full HD… cũng đều được trang bị trên camera selfie. Với ống kính “tự sướng” cực đỉnh này, người dùng có thể bắt trọn mọi khoảnh khắc đáng nhớ của mình bên cạnh gia đình, người thân.\r\n\r\nDung lượng Pin lớn, thoả sức trải nghiệm ngày dài\r\nSo với những phiên bản tiền nhiệm đã được ra mắt trước đó, iPhone 11 nhận được nhiều phản hồi tích cực hơn về thời lượng Pin mà máy sở hữu. Với dung lượng Pin lên tới 3110mAh, người dùng có thể thoải mái trải nghiệm các tác vụ đơn giản trong thời gian dài mà không cần nạp lại năng lượng cho máy.\r\nNgười dùng có thể thoải mái xem phim liên tục trong 17 giờ đồng hồ, nghe nhạc trong hơn 60 giờ, phát video trực tiếp hơn 10 giờ đồng hồ. Đặc biệt hơn, iPhone 11 còn hỗ trợ khả năng sạc không dây Qi cực kỳ tiện lợi với hiệu năng sạc lên tới hơn 50% chỉ trong vòng 30 phút với công suất sạc 20W.\r\n\r\nCông nghệ nhận diện TrueDepth, chống nước chuẩn IP68\r\niPhone 11 sở hữu công nghệ nhận diện khuôn mặt TrueDepth. Ngoài ra, khi thanh toán tại các cửa hàng, ứng dụng khác nhau hay trên trình duyệt web, bạn hoàn toàn có thể thanh toán bằng Face ID.\r\n\r\nBên cạnh đó, về khả năng chống nước và chống bụi, smartphone đến từ nhà Apple đạt xếp hạng IP68 theo chuẩ IEC 60529, tức là chịu nước ở độ sâu tối đa 2 mét trong vòng 30 phút.\r\n', 'products/iphon11.webp', 1, 3, 14990000, GETDATE(), NULL),
(1, N'iPhone 12 128GB I Chính hãng VN/A', N'Apple iPhone 12 128GB chính hãng (VN/A) phiên bản bộ nhớ 128GB lưu trữ thoải mái\r\niPhone 12 hiện nay là cái tên “sốt xình xịch” bởi đây là một trong 4 siêu phẩm vừa được ra mắt của Apple với những đột phá về cả thiết kế lẫn cấu hình. Phiên bản Apple iPhone 12 128GB chính là một trong những chiếc iPhone được săn đón nhất bởi dung lượng bộ nhớ khủng, cho phép bạn thoải mái với vô vàn ứng dụng.\r\n\r\nDung lượng bộ nhớ trong lên đến 128GB và chip Apple A14 độc quyền\r\niPhone 12 VN/A phiên bản bộ nhớ trong 128GB sẽ khiến bạn có thể vô tư với hàng tá ứng dụng, chứa rất nhiều ảnh, video và không cần lo lắng việc không đủ dung lượng sử dụng.\r\nChip A14 độc quyền từ Apple mang đến cho iPhone 12 hiệu năng mạnh mẽ, xử lí tác vụ nhanh chóng và giữ máy luôn ổn định.\r\n\r\nThiết kế độc đáo với viền vát phẳng mạnh mẽ và hỗ trợ sạc nhanh 20W\r\nKhông chỉ thế, thiết kế của iPhone 12 có sự đột phá với viền máy vát phẳng mạnh mẽ, cá tính. Không còn bo cong mềm mại như các thế hệ iPhone trước.\r\nNgoài ra, iPhone 12 128GB chính hãng (VN/A) còn hỗ trợ sạc nhanh lên đến 20W, tiết kiệm thời gian của bạn và có thể nhanh chóng tiếp tục sử dụng điện thoại của mình.\r\n\r\niPhone 12 128GB giá bao nhiêu?\r\nBên cạnh thiết kế, mẫu mã, hiệu năng và dung lượng pin thì iPhone 12 128GB giá bao nhiêu là điều được nhiều người quan tâm không kém. Giá ở hiện tại đã giảm đi rất nhiều so với thời điểm chiếc “Táo” này ra mắt. Nhờ vậy, việc sở hữu sản phẩm tốt giá hời nằm trong tầm tay của các tín đồ công nghệ, đặc biệt là iFan. Tại CellphoneS, iPhone 12 128GB hiện tại có mức giá từ 17.390.000 VND (giá có thể thay đổi tùy theo thời gian và chương trình khuyến mãi khác nhau). Như vậy bạn đã tiết kiệm đến hơn 20% so với giá ban đầu.\r\n', 'products/iphon12.webp', 1, 1, 21990000, GETDATE(), NULL),
(1, N'iPhone 13 128GB | Chính hãng VN/A', N'Đánh giá iPhone 13 - Flagship được mong chờ năm 2021\r\nCuối năm 2020, bộ 4 iPhone 12 đã được ra mắt với nhiều cái tiến. Sau đó, mọi sự quan tâm lại đổ dồn vào sản phẩm tiếp theo – iPhone 13. Vậy iP 13 sẽ có những gì nổi bật, hãy tìm hiểu ngay sau đây nhé!\r\n\r\nThiết kế với nhiều đột phá\r\nVề kích thước, iPhone 13 sẽ có 4 phiên bản khác nhau và kích thước không đổi so với series iPhone 12 hiện tại. Nếu iPhone 12 có sự thay đổi trong thiết kế từ góc cạnh bo tròn (Thiết kế được duy trì từ thời iPhone 6 đến iPhone 11 Pro Max) sang thiết kế vuông vắn (đã từng có mặt trên iPhone 4 đến iPhone 5S, SE).\r\n\r\nThì trên điện thoại iPhone 13 vẫn được duy trì một thiết kế tương tự. Máy vẫn có phiên bản khung viền thép, một số phiên bản khung nhôm cùng mặt lưng kính. Tương tự năm ngoái, Apple cũng sẽ cho ra mắt 4 phiên bản là iPhone 13, 13 mini, 13 Pro và 13 Pro Max.\r\nPhần tai thỏ trên iPhone 13 cũng có thay đổi so với thế hệ trước, cụ thể tai thỏ này được làm nhỏ hơn so với 20%, trong khi đó độ dày của máy vẫn được giữ nguyên. Điểm khác biệt nhất về thiết kế trên thế hệ iPhone 2021 này đó là camera chéo.\r\n\r\nMàu sắc trên mẫu iPhone mới này cũng đa dạng hơn, trong đó nổi bật là iPhone 13 màu hồng. Các màu sắc còn lại đề đã từng được xuất hiện trên các phiên bản trước đó như trắng, đen, đỏ, xanh blue.\r\nMàn hình màn hình Super Retina XDR độ sáng cao\r\nĐiện thoại iPhone 13 sẽ được sử dụng tấm nền OLED chất lượng cao và có kích thước 6.1 inch, lớn hơn iPhone 13 mini (5.4 inch). Với tấm nền này với công nghệ ProMotion giúp iPhone 13 tiết kiệm pin đến tối đa khi sử dụng. Người dùng cũng có thể dễ dàng điều chỉnh tốc độ làm tươi tùy theo ý thích.\r\nVề khả năng hiển thị, mang đến chất lượng hiển thị vượt trội với màn hình OLED độ phân giải cao, độ sáng lớn. Nhờ đó người dùng có thể nhìn rõ trong nhiều điều kiện sáng khác nhau, kể cả ngoài trời.\r\n\r\nCụ thể, màn hình Super Retina XDR với độ sáng cao lên đên 800 nits, và tối đa có thể lên tới 1200 nits cùng dải màu rộng P3, tỉ lệ tương phản lớn. Phía bên ngoài màn hình được phủ lớp oleophobic giúp chống bám vân tay. Nhờ đó hạn chế được các tình trạng bám bụi bẩn và mồ hôi trong quá trình sử dụng.\r\n\r\nCamera kép 12MP, hỗ trợ ổn định hình ảnh quang học\r\niPhone 13 có một sự thay đổi lớn về camera so với trên iPhone 12 Series. Cụ thể, iPhone có thể được trang bị ống kính siêu rộng mới giúp máy hiển thị được nhiều chi tiết hơn ở các bức hình thiếu sáng. Trong khi đó ống kính góc rộng có thể thu được nhiều sáng hơn, lên đến 47% giúp chất lượng bức ảnh, video được cải thiện hơn.\r\n\r\nCụm camera được trang bị tính năng ổn định hình ảnh quang học cùng cảm biến mới, nhờ đó bức hình chụp mang lại khả năng ổn định.\r\nSố ống kính trên iPhone 13 vẫn được giữ nguyên so với iPhone 12, chỉ khác về vị trí từng ống kinh. Cả hai ống kính vẫn sở hữu độ phân giải 12MP. Trong đó camera góc rộng được trang bị khẩu độ ƒ / 1.6 trong khi góc siêu rộng là ƒ / 2.4 cùng góc quay 120 độ.\r\n\r\nVới iP13, người dùng có thể quay phim chuyên nghiệp với chế độ điện ảnh. Cụm camera này cũng hỗ trợ người dùng chụp cùng lúc nhiều bức ảnh khác nhau mà không cần nhấc ngón tay. Đặc biệt với chế độ chân dung hỗ trợ làm mờ hậu cảnh chuyên nghiệp giúp toàn bức ảnh tập trung vào chủ thể mà người dùng hướng tới.\r\n\r\nỞ chế độ chụp Smart HDR 4, máy có thể nhận diện được tối đa bốn người khác nhau trong một khung hình. Sau đó sẽ tiến hành tối ưu hóa ánh sáng, độ tương phản và tone mày cho từng người, mang lại một bức ảnh chất lượng tốt nhất. Nếu sử dụng bên đêm để chụp các bức ảnh thiếu sáng, lúc này chế độ Deep Fusion kích hoạt và phân tích chế độ phơi sáng ở từng pixel. \r\nNhờ đó, ảnh chụp trên điện thoại hứa hẹn mang đến chất lượng như được chụp từ một máy ảnh chuyên nghiệp. Hình ảnh cho ra với chi tiết rõ, dải nhạy sáng cao, màu sắc chân thực. Khả năng chụp đêm trên 13 cũng được cải thiện với khả năng phơi sáng tốt hơn mang đến nhiêu chi tiết hơn.\r\n\r\nVề camera trước, điện thoại vẫn được trang bị camera đơn nằm trong notch tai thỏ với độ phân giải 12MP cùng khẩu độ ƒ / 2.2. Camera selfie này cũng được trang bị nhiều công nghệ chụp ảnh chuyên nghiệp như hiệu ứng bokeh, chế độ điện ảnh, Animoji và Memoji,... mang lại những bức hình selfie chất lượng.\r\nKhả năng quay video được cải thiện\r\nVề khả năng quay video, iPhone 13 có thể hỗ trợ quay video 4K ở tốc độ ở ba tốc độ khung hình khác nhau. Máy cũng hỗ trợ tính năng ổn định hình ảnh quang học cùng khả năng zoom 3x. Nhờ đó, hứa hẹn mang để khả năng quay phim chuyên nghiệp.\r\niPhone 13 cũng hỗ trợ nhiều công cụ tùy chỉnh nâng cao với công nghệ Dolby Vision cùng khả năng quay Video HDR với độ phân giải 4K. Đặc biệt, người dùng có thể làm mọi việc trên chiếc điện thoại này từ quay phim, chỉnh sửa đến render video một cách mượt mà.\r\n\r\nTốc độ 5G tốt hơn với nhiều băng tần\r\nThế hệ iPhone mới được cải thiện chất lượng 5G với nhiều băng tần hơn. Nhờ đó việc xem trực tuyến hay tải xuống dữ liệu diễn ra nhanh hơn. Đặc biệt với chế độ dữ liệu thông minh, thiết bị sẽ tự động phát hiện và giảm tải tốc độ khi không cần thiết kể tiết kiệm năng lượng.\r\nHiệu năng vượt trội với chip Apple A15\r\niPhone 13 Series sẽ được trang bị con chip Apple A15 Bionic, chip set được sản xuất trên quy trình 5nm. Theo nhà sản xuất, con chip Apple A15 Bionic cho CPU nhanh hơn 50% và GPU nhanh hơn 30% so với đối thủ.\r\nHiệu năng trên iPhone là một điều khỏi phải bàn cãi. Vẫn mang trọng mình một sức mạnh vượt trội nhờ con chip Apple A15 được tối ưu, hệ điều hành iOS tùy biến. iPhone 13 cũng có thể chiến tốt mọi tựa game mới nhất mới max cấu hình đồ họa, mang đến những trải nghiệm chơi game mượt mà.\r\n\r\nCông nghệ pin mới nâng cao thời gian sử dụng\r\nVới bộ vi xử lý mới được tối ưu, điện thoại iPhone 13 mang lại viên pin với thời gian sử dụng lâu dài hơn. Cũng như mọi năm, Apple không tiết lộ chính xác dung lượng pin cụ thể trên thiết bị của mình. Tuy hiên, theo hãng công bố thì thời lượng sử dụng pin trên iPhone 13 sẽ được gia tăng đáng kể lên khoảng 2,5 tiếng so với thế hệ trước đó.\r\nDung lượng bộ nhớ được mở rộng\r\niPhone 12 sở hữu bộ nhớ tiêu chuẩn 64GB và cao cấp nhất là 512GB. Nhưng sang iPhone 13 lại khác, iPhone 13 phiên bản cao cấp có thể sẽ loại bỏ phiên bản 64GB thay vào đó bản dung lượng bộ nhớ tiêu chuẩn là 128GB cùng tùy chọn dung lượng lớn nhất lên đến 512B.\r\nVề dung lượng RAM, chưa có thông tin chi tiết. Tuy nhiên, dự đoạn sẽ được trang bị bộ nhớ RAM từ 4-6GB. Với dung lượng này, người dùng có thể thoải mái đa nhiệm trong sử dụng hàng ngày.\r\n\r\nCách tính năng khác: thẻ sim, wifi, siri\r\nNgoài những điểm trên, iPhone 13 cũng vẫn được trang bị 2 sim (1 sim vật lý và 1 esim), tiếp tục hỗ trợ 5G như trên iPhone 12. Các kết nối không dây khác như wifi, bluetooth cũng được trang bị những công nghệ mới. Hey Siri cũng là một tính năng yêu thích của người dùng iPhone.\r\nMáy vẫn được trang bị công nghệ mở khóa và bảo mật Face ID - nhận đạng khuôn mặt với tốc độ nhanh hơn. Bên cạnh đó là chuẩn kháng nước và bụi bẩn IP68 theo chuẩn IEC 60529.\r\n', 'products/iphon13.webp', 1, 1, 24990000, GETDATE(), NULL),
(1, N'iPhone 14 Pro Max 128GB | Chính hãng VN/A\r\n', N'iPhone 14 Pro Max là mẫu flagship nổi bật nhất của Apple trong lần trở lại năm 2022 với nhiều cải tiến về công nghệ cũng như vẻ ngoài cao cấp, sang chảnh hợp với gu thẩm mỹ đại chúng. Những chiếc điện thoại đến từ nhà Táo Khuyết nhận được rất nhiều sự kỳ vọng của thị trường ngay từ khi chưa ra mắt. Vậy liệu những chiếc flagship đến từ công ty công nghệ hàng đầu thế giới này có làm bạn thất vọng? Cùng khám phá những điều thú vị về iPhone 14 Pro Max ở bài viết dưới đây nhé.\r\n\r\nƯu đãi hấp dẫn khi mua hàng - trả góp iPhone 14 series tại CellphoneS\r\nKhi lựa chọn mua iPhone 14 Series tại CellphoneS, quý khách hàng không chỉ nhận được sản phẩm chất lượng, chính hãng VN/A mmaf bên cạnh đó còn được trải nghiệm nhiều chương trình giảm giá hấp dẫn, trừ thẳng vào giá sản phẩm. Chi tiết ưu đãi cho khách hàng khi mua điện thoại iPhone 14 series tại CellphoneS như sau:\r\n\r\nƯu đãi khi mua trả góp 0% các sản phẩm iPhone 14 (thường/Plus/Pro/Pro Max):\r\n\r\n- Ưu đãi thành viên Smember\r\n- Giảm 5% khi thanh toán qua thẻ Kredivo (Tối đa 1 triệu)\r\n- Giảm ngay 1 triệu khi mua đơn hàng từ 20 triệu, thanh toán qua VNPAY-QR\r\n- Giảm ngay 1 triệu khi mua đơn hàng từ 19 triệu, thanh toán qua grab moca\r\n- Giảm 500.000 khi thanh toán qua thẻ tín dụng Home Credit\r\n- Trợ giá lên đời 500.000 đồng khi tham gia chương trình thu cũ đổi mới\r\n- Giảm ngay 1 triệu khi thanh toán qua thẻ tín dụng JCB, Viettinbank, mPOS, standardchartered, napas, VP Bank, OCB, VietCredit\r\n- Giảm ngay 2 triệu khi thanh toán qua thẻ tín dụng Citi, BIDV, Nam Á, Bản Việt, MSB, VIB\r\n- Nhận voucher 2 triệu khi mở thẻ tín dụng Citybank\r\n- Ưu đãi đến 6.6 triệu đồng khi mở thẻ TP Bank Evo\r\n\r\nLưu ý: Một số chương trình khuyến mãi có thể kết thúc trước hạn, quý khách vui lòng truy cập website hoặc liên hệ hotline 1800.2097 để được tư vấn.\r\niPhone 14 Pro Max cháy hàng ngay trong ngày đầu mở bán\r\n(Cập nhật ngày 15/10/2022)\r\n\r\nChỉ trong ngày đầu mở bán, lượng khách hàng đặt mua iPhone 14 Pro Max tăng đột biến. Trong đó, phiên bản iPhone 14 Pro Max bản 128GB chỉ trong thời gian ngắn nhanh chóng hết hàng, chỉ còn lại các bản 256GB, 512GB và 1TB. Nhiều khách hàng đăng ký sau phải chờ đến đợt giao hàng tiếp theo. Dự kiến tại Việt Nam sẽ xảy ra tình trạng khan hiếm hàng trong tuần đầu trả hàng. Tại CellphoneS, bạn hoàn toàn có thể nhận được ưu đãi cực khủng khi tham gia chương trình thu cũ đổi mới và nhận hoàn tiền từ các đối tác liên kết.\r\niPhone 14 Pro Max là smartphone có màn hình tốt nhất\r\n(Cập nhật ngày 26/9/2022)\r\n\r\nTheo nguồn thông tin đáng tin cậy, iPhone 14 Pro Max sở hữu màn hình được chấm điểm lên đến 149. Đây là điểm số cao nhất ở phân khúc sản phẩm cao cấp và là điểm số tốt trên thị trường. Chất lượng hiển thị được đánh giá cao, đặc biệt là khi sử dụng ở ngoài trời với độ sáng tối đa 2000 nit. Đồng thời, nhờ tần số quét cao mà màn hình cũng thích hợp để chơi game, xem phim, hoặc xem video HD.\r\nThêm vào đó, về mặt âm thanh DxOMark còn đánh giá siêu phẩm đến từ nhà Apple thích hợp để nghe nhạc kịch, hoà tấu, kịch nói, xem phim và chơi game. Trong các danh sách sản phẩm có chất lượng âm thanh tốt, iPhone 14 Pro Max xếp hạng nằm ở vị trí thứ 9 với 142 điểm.\r\n\r\nĐánh giá iPhone 14 Pro Max - Siêu phẩm khẳng định đẳng cấp\r\nNhững chiếc điện thoại iPhone 14 2022 được gọi tên trong hàng ngũ siêu phẩm smartphone thế hệ mới bởi công nghệ hàng đầu, thiết kế hoàn hảo cùng nhiều đột phá đáng kinh ngạc. Độ hoàn hảo của thế hệ Flagship mới nhất của Apple được tạo thành từ sự thống nhất giữa các yếu tố thiết kế, màn hình, cấu hình, hệ điều hành, camera, pin và các tính năng cải tiến.\r\n\r\nMàn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc\r\nSau nhiều thế hệ liên tiếp giữ thiết kế tai thỏ, cuối cùng Apple đã có đột phá trong thiết kế để chiều lòng người hâm mộ. Theo đó, ở mặt trước của những chiếc iPhone 14 Pro Max nơi có chiếc tai thỏ quen thuộc này đã được thay thế bằng thiết kế viên thuốc độc đáo. Viên thuốc trên màn hình iPhone 14 Pro Max là nơi chứa camera face ID và camera trước.\r\n\r\nĐánh giá màn hình iPhone 14 Pro Max\r\n\r\nThiết kế màn hình Dynamic Island mới này sẽ đưa các thông báo vào trong thiết kế viên thuốc để các hoạt động trên màn hình diễn ra liền mạch. Cụ thể các thông báo cuộc gọi, nghẹ sẽ được thích hợp vào trong thiết kế mới này và người dùng có thể thực hiện các thao tác chạm vuốt mở rộng, trở về trang chủ khi cần thiết.\r\n\r\nCảm biến tiện cậm được Apple thiết kế lại và di chuyển ra phía sau màn hình nhờ đó mang lại không gian hiển thị rộng hơn. Camera TrueDepth cũng được thiết kế nhỏ hơn tới 31% so với thế hệ tiền nhiệm.\r\n\r\nMàn hình Dynamic Island OLED 6,7 inch, hỗ trợ always-on display\r\nSự thành công của thiết kế màn hình đến từ những chiếc điện thoại iPhone 13 pro mã là điểm nhấn khiến sự chú ý dồn vào những chiếc điện thoại thế hệ mới của Apple. Những “quả táo chín” lần này đến từ công ty công nghệ hàng đầu thế giới có kích thước 6,7 inch và được trang bị tấm nền OLED M12 cực sắc nét. Đặc biệt, Apple còn trang bị cho màn hình iPhone 14 Pro Max tính năng tự động giảm sáng khi thiết bị được đút trong túi hoặc úp xuống mặt bàn để tiết kiệm pin.\r\n\r\nĐộ phân giải được ghi nhận của những chiếc điện thoại này đạt mức 2796 ‑ x 1290 pixel sẵn sàng cho ra những khung hình chất lượng đến từng micro micrometer. Tần số quét 120Hz ấn tượng vẫn được giữ nguyên trên tấm màn này cùng mật độ điểm ảnh cao khiến trải nghiệm lướt, quét trên iPhone 14 Pro Max diễn ra như một giấc mộng tuyệt vời.\r\n\r\nĐánh giá màn hình iPhone 14 Pro Max\r\n\r\nGóc nhìn cũng được tối ưu hơn ở những chiếc Flagship mới nhà “Táo Khuyết” khi thiết kế viên thuốc thay thế cho thiết kế tai thỏ. Bên cạnh đó là hàng loạt cải tiến tính năng màn hình cực ấn tượng khiến iPhone 14 Pro Max sẵn sàng càn quét trên mọi mặt trận.\r\n\r\nMàn hình được trang bị độ tương phản cao (2.000.000: 1) cùng độ sáng tối đa lên đến 2000 nits giúp hiển thị rõ nét trong mọi điều kiện ánh sáng, kể cả dưới trời nắng. Apple cũng trang bị cho màn hình lớp phủ oleophobic giúp chống bám vân tay hiệu quả.\r\n\r\niPhone 14 Pro Max sẽ được trang bị màn hình always-on display nhờ đó người dùng có thể xem nhanh các thông báo, lời nhắc hay thời tiết mà không cần mở khóa màn hình.\r\n\r\nCấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic\r\nChưa bao giờ Apple đặt ra giới hạn cho bản thân ở hiệu năng cho những thiết kế của mình. Chính bởi vậy nên những con chip A16 Bionic được trang bị cho iPhone 14 Pro Max là điều không có gì đáng ngạc nhiên. Dẫu vậy con chip này vẫn nhận được rất nhiều sự kỳ vọng về những tính năng cải tiến.\r\n\r\nCon chip Apple A16 Bionic với gần 6 tỷ bóng bán dẫn cũng CPU 6 nhân mang lại khả năng xử lý các tác vụ hiệu quả. Cùng với đó là GPU 5 nhân giúp tăng thêm 50% băng thông bộ nhớ mang lại khả năng xử lý các game đồ họa phức tạp. Con chip A16 Bionic cũng hỗ trợ tiết kiệm điện năng một cách hiệu quả cùng khả năng bảo mật dữ liệu nâng cao với Secure Enclave.\r\n\r\nCấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic\r\n\r\nTheo đo lường Antutu mức điểm đạt được của iPhone 14 Pro Max là 896.000, GPU tăng lên đến 35%, trong khi CPU cũng đạt mức tăng 42%. Số điểm lý tưởng này giúp những chiếc flagship đến từ Apple nhận được đánh giá tích cực từ giới game thủ. Nhiều bằng chứng cho thấy rằng những chiếc smartphone này sẽ trở thành 1 trong những chiếc điện thoại chơi game cực đẳng cấp. Đặc biệt là khi iPhone 14 Pro Max không chỉ sở hữu cấu hình khủng mà còn có màn hình xuất sắc để chơi mọi tựa game đồ họa khủng.\r\n\r\n>>> Bên cạnh đó có thể tham khảo thêm giá iPhone 14 ngay nhé!!!\r\n\r\nHệ điều hành iOS 16 bứt phá công nghệ\r\nNgay từ khi ra mắt trong sự kiện công nghệ WWDC 2022 hệ điều hành iOS 16 đã được giới thiệu cùng với những cải tiến cực lớn mang đậm bản sắc cá nhân hóa cho người sử dụng. Bởi vậy nên khi được trang bị hệ điều hành này, những chiếc điện thoại iPhone 14 Pro Max sẽ mang đến những trải nghiệm cực tối ưu với mỗi người dùng.\r\n\r\nĐánh giá hệ điều hành iOS 16\r\n\r\nTheo đó những chiếc điện thoại này sẽ được bổ sung nhiều tùy biến với màn hình khóa với đa dạng các font chữ (lên đến 12 font khác nhau) để người dùng tự tin thể hiện cá tính hơn. Widget ứng dụng cũng được thay đổi đôi chút đặc biệt ở hình nền trái đất. Lịch sẽ được tạm khóa các sự kiện để bảo mật thông tin của người dùng.\r\n\r\nBên cạnh đó những chiếc iPhone 14 Pro Max còn được bổ sung thêm các tính năng thông minh như tùy chỉnh màn hình khóa.\r\n\r\nCamera sau 48MP, cảm biến TOF sống động\r\nKhả năng chụp ảnh của những chiếc điện thoại iPhone luôn là niềm tự hào của Apple. Bước sang thế hệ flagship này Apple đã có một bước nhảy vọt cực lớn trong cảm biến của máy ảnh chính. Từ cảm biến 12MP ở những chiếc iPhone 13 Pro Max, những chiếc điện thoại thế hệ mới này được trang bị camera cảm biến chính là 48MP.\r\n\r\nCụ thể, thế hệ iPhone 14 Pro Max sẽ sở hữu camera chính 48MP với thấu kính bảy thành phần cùng tiêu cự 24mm, hỗ trợ ổn định hình ảnh quang học. Camera góc siêu rộng 13MP với tiêu cự 13 mm, thấu kính 6 thành phần, hỗ trợ góc chụp lên đến 120 độ. Cuối cùng là camera tele 2x 12MP với tiêu cự 48mm.\r\n\r\nĐánh giá camera iPhone 14 Pro Max\r\n\r\nVới sự cải tiến lớn ở độ phân giải những chiếc điện thoại iPhone 14 Pro Max đáp ứng tối đa nhu cầu quay video 4K cũng như hoàn thiện hơn khả năng chụp ảnh. Không chỉ có cho mình camera chính ưu việt hơn, hệ thống camera bổ trợ cũng phần nào khiến bức ảnh được ghi lại thêm phần sống động và sắc nét.\r\n\r\nNgoài thông số ấn tượng, camera sau của iPhone 14 Pro Max còn được trang bị công nghệ cảm biến TOF đem đến những bức ảnh có góc siêu rộng và độ sâu ấn tượng. Khả năng zoom quang học 3x ấn tượng vẫn được duy trì để mang đến những bức hình nét từ khoảng cách xa.\r\n\r\nCamera selfie góc rộng lưu giữ nhiều khoảnh khắc đáng nhớ\r\nVới sự thay đổi từ thiết kế tai thỏ sang viên thuốc, sự cải tiến trong công nghệ của camera selfie của iPhone 14 Pro Max là điều được chờ đón bậc nhất trong lần trở lại này của Apple. Theo đó những chiếc camera trước của những chiếc Flagship nhà táo có độ cảm biến lên đến 12MP cùng góc rộng  ƒ / 1.9.\r\n\r\nNhững chiếc camera selfie thế hệ mới của Apple sẽ có sự cải tiến vượt bậc và vượt trội nhất trong vài năm trở lại đây. Theo đó chúng sẽ được trang bị tính năng tự động lấy nét để hiệu quả hơn trong công cuộc ghi lại những khoảnh khắc đáng nhớ. Đồng thời ống kính này gồm 6 thành phần với khẩu độ lớn hơn hứa hẹn mang đến những khung hình nghệ thuật hơn.\r\n\r\nĐánh giá camera trước iPhone 14 Pro Max \r\n\r\nCùng với đó, iPhone 14 Pro Max cũng được trang bị nhiều chế độ chụp ảnh thông minh trên camera trước này như Animoji và Memoji, chế độ Apple ProRAW, chụp đêm, chụp phong cảnh, chụp chân dung với bokeh nâng cao,...\r\n\r\nPin liền lithium-ion kết hợp cùng công nghệ sạc nhanh cải tiến\r\nDung lượng pin chưa bao giờ là thế mạnh của những chiếc điện thoại đến từ Apple nhưng hiệu năng sử dụng năng lượng của iPhone lại là điều mà bất cứ chiếc smartphone nào cũng đều muốn sở hữu. Để so sánh về dung lượng Pin, những chiếc điện thoại iPhone 14 Pro Max sẽ được trang bị viên pin 4.352 mAh cho thời gian sử dụng đáng kinh ngạc.\r\n\r\nĐánh giá dung lượng pin điện thoại iPhone 14 Pro Max\r\n\r\nCụ thể, theo nhà sản xuất công bố, điện thoại cho thời gian phát lại video lên đến 29 giờ hoặc 95 giờ phát âm thanh.\r\n\r\nĐể nâng cao hiệu quả sử dụng, Apple đã trang bị cho iPhone 14 Pro Max công nghệ sạc nhanh công suất 20W (Củ sạc được bán riêng). Nhờ đó người dùng có thể bổ sung 50% dung lượng pin chỉ trong vòng 30 phút. Ngoài ra, thiết bị còn hỗ trợ sạc nhanh không dây MagSafe lên đến 15W và sạc không dây Qi với công suất lên đến 7,5W.\r\n\r\nKhông giống như nhiều đồn đoán loại bỏ hoàn toàn cổng sạc hay chuyển sang cổng sạc USB-C, iPhone 14 Pro Max vẫn sẽ sử dụng cổng sạc lightning quen thuộc.\r\n\r\niPhone 14 Pro Max đa dạng tính năng cải tiến: Face ID, chống nước…\r\nBên cạnh những cải tiến mang tầm dấu mốc kể trên thì những cải tiến trong tính năng cũng là điều dễ dàng nhận thấy ở những chiếc điện thoại nhà Táo. iPhone 14 Pro Max vẫn được trang bị Face ID được đặt trong phần viên thuốc ở mặt trước. Đồng thời tính năng này ở những chiếc flagship được nâng cấp lên với khả năng nhận diện khuôn mặt đa chiều hơn có thể nhận diện ngay cả khi sử dụng khẩu trang.\r\n\r\niPhone 14 Pro Max cũng được nâng cấp ở công nghệ chống bụi và nước chuẩn IP68. Theo đó, những chiếc điện thoại này sở hữu khả năng chống nước ở độ sâu khoảng 6 mét trong khoảng thời gian khoảng 30 phút.\r\n\r\nMột tính năng thông minh phải kể đến trên iPhone 14 Pro Max đó là cuộc gọi khẩn cấp qua vệ tinh. Theo đó, khi điện thoại không thể kết nối với các dịch vụ di động hoặc wifi, người dùng có thể gọi SOS khẩn cấp thông qua vệ tinh. Tuy nhiên, để tính năng có thể hoạt động ổn định người sử dụng cần ở ngoài trời với tầm nhìn thoáng đãng.\r\n\r\niPhone 14 Pro Max đa dạng tính năng cải tiến: Face ID, chống nước…\r\n\r\nTính năng màn hình luôn mở - Always On ở những chiếc điện thoại này giúp mọi thông báo được cập nhật dễ dàng các thông báo, tin nhắn hay cuộc gọi mà không cần mở màn hình khóa.\r\n\r\nKhả năng theo dõi sức khỏe sẽ được cải tiến lên với tính năng lịch sử rung nhĩ với khả năng ghi lại số lần cơ thể bị rung nhĩ (nhiễu loạn nhịp đập của tim) từ đó phát hiện bất thường về tim sớm hơn ngăn ngừa những nguy cơ sức khỏe nguy hiểm.\r\n\r\nTư động phát hiện sự cố và kêu gọi sự trợ giúp cũng là một tính năng đáng được chú ý trên iPhone 14 Pro Max. Theo đó, điện thoại sẽ phát hiện ra các vụ tai nạn nghiêm trọng dựa theo các thay đổi về vận tốc, áp suất, âm thanh,...\r\n\r\nNgoài ra, tại thị trường Mỹ, Apple cũng đã loại bỏ hoàn toàn khay sim vật lý để sử dụng esim 100%. Các thị trường khác, trong đó có Việt Nam vẫn sử dụng kết hợp sim vật lý và esim.\r\n\r\nĐiện thoại iPhone 14 Pro Max có mấy màu?\r\nChưa bao giờ flagship của Apple thôi tạo trend với các tông màu thời thượng và hiện đại. Trong lần trở lại với iPhone 14 Pro Max nhà Táo vẫn giữ cho mình bảng tùy chọn màu cực cuốn hút sẵn sàng để người dùng thể hiện cá tính khác biệt.\r\n\r\niPhone 14 Pro Max màu tím đậm\r\nMàu tím đậm là màu có nhiều người yêu thích nhất trên thế giới vậy nên không có gì ngạc nhiên khi những chiếc điện thoại iPhone 14 Pro Max tím đậm lại được nhiều người chờ đón đến vậy. Sự nhã nhặn, thanh lịch nhưng cũng trẻ trung, hiện đại của tone màu này đã phù phép cho những chiếc iPhone 14 Pro Max trở nên thu hút hơn.\r\n\r\niPhone 14 Pro Max màu tím đậm\r\n\r\niPhone 14 Pro Max màu vàng Gold\r\niPhone 14 Pro Max màu vàng gold toát lên sự sang trọng và đầy quyền lực cho người sở hữu. Những chiếc điện thoại thế hệ mới nhà Apple như được nâng tầm đẳng cấp khi khoác lên mình chiếc áo vàng quyền lực. Đây cũng là màu phong thủy được rất nhiều doanh nhân yêu thích vì nó đại diện cho sự trù phú, phát đạt.\r\n\r\niPhone 14 Pro Max màu đen không gian\r\nNhã nhặn, trưởng thành, huyền bí và đầy sức hút là những gì mà chúng ta lập tức nghĩ đến khi quan sát những chiếc iPhone 14 Pro Max màu đen đen. Không quá nổi bật như những tone màu còn lại trong bảng tùy chọn màu nhưng chiếc điện thoại này lại thể hiện sự cuốn hút theo cách riêng.\r\n\r\niPhone 14 Pro Max màu bạc\r\niPhone màu bạc gần như là điều không quá xa lạ với nhiều người và đây là 1 tùy chọn màu gốc được nhiều người yêu thích. iPhone 14 Pro Max màu bạc toát lên thần thái cao cấp, sang trọng, thanh lịch và cực hút mắt. Không mang quá nặng màu sắc cá nhân nhưng những chiếc điện thoại này lại thế hiện được sự trung hòa mọi cá tính và tôn nên đẳng cấp của người sở hữu.\r\n\r\nDung lượng iPhone 14 Pro Max bao nhiêu GB?\r\nĐể đáp ứng nhu cầu sử dụng của người dùng từ lưu trữ ít đến thả ga lưu dữ liệu, Apple đã có sự cải tiến vượt bậc trong dung lượng của những chiếc flagship thế hệ mới của mình. Như vậy iPhone 14 Pro Max không chỉ giới hạn trong những mốc dung lượng bộ nhớ quen thuộc. Thay vào đó, thế hệ này có tùy chọn bộ nhớ từ 128GB đến 1TB. Cụ thể: 128 GB, 256 GB, 512 GB, 1 TB\r\n\r\nNhư vậy đây là thế hệ smartphone đầu tiên của Apple sở hữu dung lượng bộ nhớ lên đến 1TB. Điều này phần nào giải tỏa được nhu cầu lưu trữ dữ liệu ngày càng lớn của người dùng trên những chiếc smartphone. Đồng thời mở ra kỷ nguyên cho những chiếc điện thoại nhà táo với dung lượng lưu trữ khủng như một thư viện cá nhân có thể mang theo tùy thân mọi lúc.\r\n\r\nĐiện thoại iPhone 14 Pro Max có mấy sim?\r\nĐể đảm bảo tính thẩm mỹ cho những chiếc điện thoại của mình, Apple chắc hẳn sẽ không tùy tiện nhét thêm 1 khe sim nữa cho iPhone 14 Pro Max. Nhưng điều này cũng chẳng đáng ngại bởi ngay từ thế hệ iPhone X series, nhà Táo đã hỗ trợ e-Sim cho điện thoại của mình. Điều này nâng cao tính đa nhiệm cho điện thoại đảm bảo nhu cầu của người dùng được thỏa mãn nhưng không ảnh hưởng đến kết cấu kỹ thuật của iPhone 14 Pro Max.\r\n\r\nNhư vậy chiếc flagship này của Apple vẫn có 2 sim gồm 1 sim vật lý truyền thống được đặt ở khe sim thông thường và 1 e-Sim ở thị trường ngoài Mỹ. Tại thị trường Mỹ, thiết bị sẽ được trang bị 2 esim.\r\n\r\nĐiện thoại iPhone 14 Pro Max có mấy sim?\r\n\r\nĐiện thoại iPhone 14 Pro Max giá bao nhiêu tiền 2022?\r\nVới những tính năng hấp dẫn trên thì điện thoại iPhone 14 Pro Max giá bao nhiêu tiền năm 2022? iPhone 14 Pro Max có khá nhiều tùy chọn màu, dung lượng bộ nhớ để người dùng lựa chọn. Vì vậy bảng giá của những chiếc flagship này khá đa dạng. Tùy vào sự lựa chọn của người dùng mà mức giá của iPhone 14 Pro Max sẽ có đôi chút thay đổi. Nhưng mức giá khởi điểm để sở hữu chiếc điện thoại iP 14 Pro Max này là 1,099 USD (khoảng gần 31 triệu đồng).\r\n\r\nTại CellphoneS, điện thoại iPhone 14 Pro Max có giá niêm yết 33,990,000 cho phiên bản cấu hình chuẩn và 49,990,000 cho phiên bản max cấu hình. Tuy nhiên, trong đợt mở bán đầu tiên, người dùng khi mua hàng tại CellphoneS sẽ nhận được ưu đãi khủng nhất khi trợ giá lên đời và các ưu đãi thanh toán.\r\n\r\nCụ thể giá bán iPhone 14 Pro Max các phiên bản dự kiến như sau:\r\n\r\n-       Điện thoại iPhone 14 Pro Max 128GB có giá bán: 27,990,000 đồng\r\n\r\n-Điện thoại iPhone 14 Pro Max 256GB có giá bán: 30,990,000 đồng\r\n\r\n-Điện thoại iPhone 14 Pro Max 512GB có giá bán: 36,990,000 đồng\r\n\r\n-Điện thoại iPhone 14 Pro Max 1TB có giá bán: 38,990,000 đồng\r\n\r\n(Lưu ý: Đây là mức giá đã trừ hết các khuyến mãi trong đợt mở bán đầu tiên tại CellphoneS, mức giá có thể thay đổi theo chương trình khuyến mãi cụ thể của từng thời điểm. Để biết giá bán  iPhone 14 Pro Max chính xác thời điểm hiện tại, truy cập website cellphones.com.vn hoặc liên hệ hotline miễn phí để được tư vấn)\r\n\r\nĐiện thoại iPhone 14 Pro Max giá bao nhiêu tiền 2022?\r\n\r\nĐiện thoại iPhone 14 Pro Max ra mắt khi nào?\r\niPhone 14 Pro Max sẽ có lịch ra mắt chung với các siêu phẩm khác trong cùng series iPhone 14 2020. Theo thông lệ truyền thống thế hệ Flagship này có thể sẽ ra mắt vào giữa tháng 9 năm 2022. Ngày cụ thể được cho là sẽ tổ chức sự kiện ra mắt được mong chờ nhất giới công nghệ này là ngày 08/09/2022.\r\n\r\nTại sao nên mua iPhone 14 Pro Max chính hãng VN/A?\r\nNhư thông lệ mỗi năm, những chiếc điện thoại iPhone 14 Pro Max dự kiến sẽ được bán trên thị trường dưới 2 hình thức VN/A và xách tay. Nếu hàng xách tay thường được lưu hành sớm hơn thì những chiếc điện thoại iPhone 14 Pro Max chính hãng lại khiến người dùng phải chờ đợi khá lâu. Vậy vì sao cần phải mua iPhone 14 Pro Max VN/A?\r\n\r\nTrên thực tế iPhone 14 Pro Max sẽ đảm bảo được nguồn gốc xuất xứ của sản phẩm từ đó đảm bảo người mua nhận được những chiếc điện thoại chính hãng từ Apple. Và chưa từng phải chịu can thiệp bên ngoài hay có nguy cơ bị làm giả như hàng xách tay.\r\n\r\nChính bởi đảm bảo về nguồn gốc xuất xứ nên những chiếc điện thoại này đảm bảo được chất lượng sản phẩm đến tay khách hàng. Điều này cũng đồng nghĩa rằng mọi chế độ hậu mãi khi mua iPhone 14 Pro Max sẽ được đảm bảo và bạn có thể được đổi, trả, sửa chữa miễn phí tại Apple store khi những chiếc điện thoại này gặp vấn đề.\r\n\r\nTại sao nên mua điện thoại iPhone 14 Series tại CellPhoneS\r\nCác sản phẩm điện thoại đến từ thương hiệu Apple, trong đó có iPhone 14 Series đều là sản phẩm cao cấp với giá bán cao. Do đó, khi chọn mua điện thoại iPhone 14 Series người dùng cần cân nhắc và lựa chọn điểm mua hàng uy tín. Vậy CellphoneS có phải là một địa điểm mua hàng uy tín khi chọn mua điện thoại iPhone 14 Series hay không, hãy cùng tìm hiểu qua các lý do sau.\r\n\r\nNhận hàng chính hãng sớm nhất tại Việt Nam\r\nCellphoneS là hệ thống ủy quyền chính hãng Apple Authorized Service Providers (AASP) tại Việt Nam. Do đó, khi khách hàng đặt cọc mua hàng tại hệ thống sẽ là một trong những người đầu tiên sở hữu điện thoại iPhone 14 Series chính hãng tại thị trường Việt Nam.\r\n\r\nSở hữu iPhone 14 series với giá sốc, ưu đãi bất ngờ\r\nKhi mua điện thoại iPhone 14 series tại hệ thống bán lẻ CellphoneS, ngoài việc được sở hữu thiết bị chính hãng VN/A mà khách hàng còn có cơ hội mua điện thoại chính hãng với mức giá rẻ bất ngờ với nhiều ưu đãi kèm theo.\r\n\r\nTrong đợt mở bán đầu tiên, khách hàng sẽ có cơ hội nhận voucher xịn lên đến 1,000,000 đồng khi tham gia mini game. Ngoài ra, khách hàng còn được giảm giá mua máy khi là thành viên Smember.\r\n\r\nHỗ trợ trợ giá khi thu cũ và lên đời\r\nVới người dùng đam mê trải nghiệm thì chương trình trợ giá thu cũ – lên đời sản phẩm mới sẽ giúp tối ưu chi phí cho khách hàng. Theo đó, hệ thống bán lẻ CellphoneS ngoài giá thu cũ còn hỗ trợ trợ giá cho khách hàng lên đời iPhone 14 series với số tiền lên đến 1,000,000 đồng. Nhờ đó, khi lên đời iPhone 14 mới tại CellphoneS, khách hàng không chỉ tiết kiệm được chi phí khi sở hữu mẫu flagship mới nhất trên thị trường mà còn giải quyết được điện thoại cũ không còn nhu cầu sử dụng.\r\n\r\nƯu đãi từ nhiều ngân hàng khi thanh toán\r\nNgoài những ưu đãi trên, khi khách hàng mua điện thoại iPhone 14 Series tại CellphoneS còn nhận được rất nhiều ưu đãi khác nhau khi thanh toán qua các ngân hàng như OCB, BIDV, VP Bank,... Các chương trình ưu đãi thanh toán đa dạng với mức giá ưu đãi lên đến 5%, theo đó khách hàng có thể tiết kiệm được từ 200,000 đến 1,000,000 đồng tùy từng phương thức thanh toán.', 'products/iphon14.webp', 1, 1, 34990000, GETDATE(), NULL),
(1, N'iPhone 14 Plus 128GB | Chính hãng VN/A', N'iPhone 14 Plus sở hữu màn hình Super Retina XDR OLED thiết kế tai thỏ, kích thước 6.7 inch, kết hợp công nghệ True Tone, HDR, Haptic Touch, Không chỉ vậy, sản phẩm còn trang bị chip A15 Bionic mạnh mẽ, RAM 6GB, bộ nhớ trong 128GB và chạy trên hệ điều hành iOS 16. Camera kép 12MP cải thiện khả năng chụp thiếu sáng, camera trước True Depth 12MP tự động lấy nét. Xem thêm chi tiết với thông tin sau đây!\r\n\r\nĐánh giá iPhone 14 Plus - Siêu phẩm khẳng định đẳng cấp\r\nNgoài ba phiên bản gồm iPhone 14 thường, bản Pro và Pro Max, năm nay Apple dự kiến sẽ cho ra thêm một phiên bản mới mang tên iPhone 14 Plus. Được tích hợp nhiều cải tiến nổi trội về phần cứng, iPhone 14 Plus hứa hẹn sẽ là siêu phẩm khẳng định đẳng cấp smartphone hiện đại.\r\n\r\nThiết kế sang trọng, kích thước lớn hơn\r\nDựa trên các rò rỉ nguyên mẫu gần đây, chúng ta sẽ thấy iPhone 14 Plus (cũng như toàn bộ series điện thoại iPhone 14) mang ngoại hình tương đồng với dòng iPhone 13 trước đó. Cụ thể, cạnh viền của máy sẽ được dát phẳng vuông vức và hoàn thiện từ thép không gỉ bền vững. Toàn bộ thân iPhone 14 Plus đều đạt chuẩn chống bụi và chống nước IP68, củng cố độ bền cao cấp cho thiết bị.\r\n\r\niPhone 14 Plus\r\n\r\nMột điều chú ý ở iPhone 14 Plus đó là chiếc máy được cho rằng sẽ lấp vào khoảng trống giữa bản Pro và Pro Max. Vì vậy kích thước tổng thể của iPhone 14 Plus lớn hơn so với iPhone 14 bản chuẩn. Sự bổ sung của iPhone 14 Plus được cho là thay thế phiên bản Mini.\r\n\r\nPhiên bản 5 màu sắc khác nhau mang đến cho người dùng nhiều sự lựa chọn: Blue, Purple, Starlight, Mid Night và Product Red.\r\n\r\nMàn hình notch tai thỏ\r\niPhone 14 Plus có những cải tiến so với phiên bản series 13 với màn hình kích thước lên đến 6.7 inch. Thiết kế notch “tai thỏ” phía trên màn hình ở thế hệ tiền nhiệm vẫn được giữ nguyên.\r\n\r\niPhone 14 Plus\r\n\r\nVề công nghệ màn hình, iPhone 14 Plus sử dụng tấm nền Super Retina XDR OLED mang lại độ tương phản màu sắc ấn tượng. Cùng với đó, độ phân giải 2778 x 1284 pixels cho hình ảnh và màu sắc chi tiết, độ chính xác cao, mang lại cho người dùng cảm giác chân thực và sắc nét.\r\n\r\nKhông chỉ vậy, thiết bị còn được tích hợp công nghệ True Tone hỗ trợ điều chỉnh ánh sáng theo môi trường, Dolby Vision (một tính năng phổ biến trong ngành điện ảnh) tối ưu chất lượng hình ảnh, HDR và Haptic Touch.\r\n\r\nCấu hình mạnh mẽ với chipset A15 Bionic\r\niPhone 14 Plus mới được trang bị chip và giữ nguyên cấu hình như trên 13 Pro và 13 Pro Max. Chi tiết hơn, Apple đã ứng dụng dòng CPU mang tên Apple A15 Bionic với 6 lõi 5 lõi GPU và CPU (2 lõi hiệu suất và 4 lõi) hiệu quả.\r\n\r\niPhone 14 Plus\r\n\r\nTuy nhiên, điều đáng chú ý ở đây đó là Apple chỉ mang chip A16 Bionic lên bản Pro, bản Pro Max. Tức là chỉ duy nhất iPhone 14 thường và iPhone 14 Plus vẫn sẽ sử dụng chip A15 Bionic - một yếu tố cho thấy tác động của chuỗi cung ứng đã ảnh hưởng lớn đến kế hoạch sản xuất của Apple năm nay.\r\n\r\nSản phẩm mới dự kiến cũng trang bị RAM lớn và bộ nhớ trong lên đến 128GB. Nhờ vậy, người dùng dễ dàng lưu trữ các thông tin, kho hình ảnh, video hoặc các tệp khác một cách thoải mái.\r\n\r\niPhone 14 Plus\r\n\r\nHệ điều hành iOS 16\r\niPhone 14 Plus vận hành trên iOS 16 - phiên bản mới nhất của hệ điều hành mà Apple phát triển. Đây được đánh giá là hệ điều hành di động cá nhân và an toàn nhất trên thế giới với các chức năng bảo mật quyền riêng tư và tính năng mạnh mẽ.\r\n\r\niPhone 14 Plus\r\n\r\nỞ iOS 16, bạn có thể dễ dàng tuỳ chỉnh màn hình khoá theo những cách riêng của bản thân, sắp xếp nổi bật, theo dõi hoạt động cá nhân và xem bản cập nhật ứng dụng yêu thích trực tiếp.\r\n\r\nCụm camera kép cải thiện khả năng chụp thiếu sáng\r\nTrước tiên iPhone 14 Plus sẽ được tái thiết kế với nhiều tiện ích cho người dùng. Về thông số, iPhone 14 Plus sẽ có hai camera sau nâng cấp khả năng chụp thiếu sáng với độ phân giải 12MP và điểm ảnh đạt 1.9 micron.\r\n\r\niPhone 14 Plus\r\n\r\n Với cảm biến mới, khả năng chụp thiếu sáng có thể cải tiến đến 49% và hỗ trợ phơi sáng vào ban đêm nhanh gấp 2 lần so với thế hệ 13 series. Không chỉ vậy, khả năng quay video được cải thiện thêm nhờ vào chế độ ổn định mới.\r\n\r\nVới khả năng quay video 4K 24fps và chế độ Cinematic, iPhone 14 Plus sẽ mang đến cho người dùng những video chuyên nghiệp, điện ảnh và đầy tính nghệ thuật hơn. Cụ thể với chế độ Cinematic, tiêu điểm sẽ tự động chuyển đến chủ thể quan trọng nhất trong một cảnh như trong các bộ phim.\r\n\r\niPhone 14 Plus\r\n\r\nCamera trước True Depth\r\nCamera trước iPhone 14 Plus được nâng cấp ống kính selfie với độ phân giải 12MP. Camera True Depth tăng cường khả năng lấy nét trong điều kiện thiếu sáng yếu. Như vậy, bạn sẽ dễ dàng bắt trọn các khoảnh khắc của mình hoặc bạn bè, người thân với các bức ảnh chi tiết sắc nét, đầy màu sắc nhất.\r\n\r\niPhone 14 Plus\r\n\r\nKèm theo đó là khẩu độ f/1.9 rộng hơn đi kèm với tính năng lấy nét tự động AF. Khẩu độ rộng hơn sẽ cho phép ánh sáng đi xuyên qua lens và đến được cảm biến để cho ra ảnh sắc nét hơn, đồng thời cho chiều sâu tốt hơn. Và hiển nhiên, khả năng lấy nét tự động cải tiến cũng hỗ trợ trình quay video và nghe gọi video call trên iPhone 14 Plus.\r\n\r\nTận hưởng với thời lượng pin tốt hơn\r\nTheo Apple đánh giá, thời lượng pin iPhen 14 Series là tốt nhất từ trước đến nay, có thể kéo dài trong cả ngày dài. Cụ thể, thời lượng pin có thể:\r\n\r\n- Lên đến 26 giờ nếu sử dụng để phát lại video.\r\n\r\n- Lên đến 20 giờ nếu phát lại video (phát trực tuyết)\r\n\r\n- Lên đến 100 giờ khi phát lại âm thanh\r\n\r\nThông số kỹ thuật\r\n\r\nNgoài ra, bạn có thể sạc nhanh hơn qua Magsafe với đế sạc không dây. Khả năng sạc nhanh đến 50% pin trong vòng 30 phút với Adapter 20W trở lên. Ngoài ra các chuẩn sạc hiện diện trên iPhone 14 Plus:\r\n\r\n- Sạc thông qua USB vào hệ thống máy tính hoặc bộ đổi nguồn\r\n\r\n- Sạc không dây Qi\r\n\r\n- Sạc không dây Magsafe\r\n\r\nKết nối điện thoại vệ tinh, phát hiện sự cố khẩn cấp\r\nVới tính năng mới này, người dùng hoàn toàn có thể kết nối ngay với các mạng vệ tinh để nhắn tin trong trường hợp khẩn cấp (không kết nối được mạng di động, Wifi). Như vậy, iPhone 14 Plus hỗ trợ hướng dẫn bạn đến gần với mạng lưới vệ tinh. Lúc này, khi gửi thông tin qua mạng lưới vệ tinh, tin nhắn sẽ hiển thị màu xám.\r\n\r\n iPhone 14 Plus\r\n\r\nĐiểm được đánh giá cao ở sản phẩm còn nằm ở khả năng phát hiện sự cố khẩn cấp như tai nạn ô tô nghiêm trọng, từ đó thiết bị sẽ hiển thị gọi số 911 và thông báo cho các liên hệ khẩn cấp.\r\n\r\nLoại bỏ khay SIM\r\nThiết bị mới sẽ loại bỏ hoàn toàn khay SIM. Có thể thấy người dùng có thể kích hoạt điện thoại hoặc gọi điện và nhắn tin một cách nhanh chóng nhờ eSIM mà không cần đến SIM vật lý. Điều này cho phép bạn lưu được nhiều liên hệ và sử dụng nhiều gói dữ liệu trên cùng một chiếc điện thoại. Đồng thời, ưu điểm của eSIM nằm ở việc dữ liệu không thể xoá nếu iPhone bị mất.\r\n\r\nThông số kỹ thuật\r\n\r\nĐiện thoại iPhone 14 Plus có mấy màu?\r\nKhông chỉ sở hữu ngoại hình cao cấp bền bỉ, iPhone 14 Plus được trình làng với một loạt phiên bản màu sắc đầy cuốn hút. Cụ thể:\r\n\r\nBlue\r\nPhiên bản Blue gần như đã trở thành trọng tâm của các đời iPhone mới đây. Và iPhone 14 series cũng sẽ là dòng kế tiếp có bản màu này. Cả iPhone 14 Plus và các biến thể khác sẽ có bản Blue tinh tế, sang trọng cho những ai yêu thích màu của biển và bầu trời.\r\n\r\nĐiện thoại iPhone 14 Plus có mấy màu?\r\n\r\nStarlight\r\nNgoài Blue thì màu Starlight cũng là phiên bản màu thanh lịch, hiện đại, thời thượng phù hợp cho nhiều người thuộc các lứa tuổi và sở thích khác nhau.\r\n\r\nMàu Midnight\r\nApple đã và đang thử nghiệm nhiều phiên bản màu tối khác nhau cho rất nhiều đời iPhone. Theo năm tháng, đã có những màu như Đen Bóng (Jet Black) và màu Xám Graphite xuất hiện trên các đời iPhone. Đến 14 Plus, bản màu Midnight với một chút thay đổi giúp phân biệt rõ ngoại hình nổi trội của chiếc máy.\r\n\r\nĐiện thoại iPhone 14 Plus có mấy màu?\r\n\r\nPurple\r\nPurple được xem là một trong những màu pastel mộng mơ, trang nhã. Phiên bản này rất thích hợp với phái nữ hoặc những người thích sự nhẹ nhàng. Nếu bạn đang có dự định tặng quà công nghệ thì không thể bỏ qua iPhone 14 Plus Purple này.\r\n\r\nRed\r\nLà một trong những màu sắc quen thuộc ở trên nhiều dòng iPhone từ trước, Red tiếp tục được Apple lựa chọn cho sản phẩm iPhone 14 Plus thế hệ mới. Phiên bản này mang mục đích nhân đạo bởi Apple hợp tác với tổ chữ gây quỹ hỗ trợ phòng chống AIDS (RED), một phần lợi nhuận khi bán ra sản phẩm này sẽ được ủng hộ vào quỹ.\r\n', 'products/iphon14T.webp', 1, 2, 27990000, GETDATE(), NULL),
(1, N'OPPO A57', N'OPPO A57 không chỉ sở hữu thiết kế trẻ trung, thời lượng sử dụng ấn tượng mà còn đồng thời sở hữu một ấu hình ở mức khá ổn, màn hình hiển thị đẹp mắt. Đặc biệt, mẫu điện thoại tầm trung giá rẻ của OPPO này còn sở hữu cụm camera chất lượng để đáp ứng nhu cầu sống ảo của người dùng trẻ.\r\n\r\nDù thuộc phân khúc giá rẻ nhưng OPPO A57 lại sở hữu những thông số hiệu năng vô cùng ấn tượng. Máy sở hữu bộ vi xử lý Helio G35 cùng vi xử lý đồ hoạ IMG GE8320 đem tới trải nghiệm vô cùng mượt mà. Tấm nền LCD 6.56 inch có tần số quét đạt 60Hz đem tới cho người dùng chất lượng hình ảnh cực kỳ sắc nét. Các thông số khác của máy như dung lượng pin 5000mAh cùng camera có độ phân giải 13MP rõ nét giúp nâng cao hiệu quả sử dụng của người dùng.\r\n\r\nĐánh giá điện thoại OPPO A57\r\n\r\nĐánh giá điện thoại OPPO A57 - Smartphone nổi trội nhất trong phân khúc giá rẻ\r\nDù đã có mặt trên thị trường được một thời gian nhưng sức nóng và độ hot của OPPO A57 vẫn không hề thay đổi kể từ lần đầu tiên được giới thiệu đến với người tiêu dùng. Smartphone A57 của OPPO thu hút được sự chú ý của người tiêu dùng khi là dòng sản phẩm thuộc phân khúc giá rẻ nhưng vẫn vô cùng mạnh mẽ về mặt hiệu năng. Cùng tìm hiểu một vài ưu điểm nổi trội của OPPO A57 trong bài viết này nhé!\r\n\r\nHiện tại, thị trường smartphone đang có những bước chuyển mình lớn khi liên tục đón nhận những siêu phẩm công nghệ hiện đại, và ngày càng được cải tiến tốt hơn cả về mặt thiết kế bên ngoài lẫn hiệu năng bên trong. Tuy nhiên, việc lựa chọn cho mình một thiết bị điện thoại cao cấp không phải là điều phù hợp với tất cả mọi người. Nhiều người đã chọn lựa những giải pháp tối ưu hơn, nhắm tới các thiết bị smartphone giá rẻ nhưng hiệu năng vẫn khá ổn định như OPPO A57.\r\n\r\nĐánh giá điện thoại OPPO A57\r\n\r\nTrước hết, việc sở hữu một thiết bị smartphone thuộc phân khúc giá rẻ như OPPO A57 sẽ giúp người dùng tiết kiệm được chi phí trong quá trình mua sắm. Nếu bạn là một người không quá dư giả và tài chính nhưng vẫn muốn tìm mua một chiếc điện thoại OPPO A series thông minh có thông số hiệu năng ổn định thì bạn thực sự không nên bỏ qua OPPO A57.\r\n\r\nBên cạnh đó, dù là thiết bị nằm trong phân khúc giá rẻ nhưng OPPO thế hệ A57 vẫn sở hữu cấu hình khá ổn định. Các thông số về mặt hiệu năng, hiển thị, dung lượng pin, camera của máy được các chuyên gia đánh giá cao, có thể đáp ứng được hầu hết nhu cầu của người dùng trong quá trình sử dụng.\r\n\r\nĐánh giá điện thoại OPPO A57\r\n\r\nNếu đem so sánh A57 với các thiết bị thuộc phân khúc giá tầm trung khác như: Samsung Galaxy A23, Xiaomi POCO M5s,… bạn có thể nhận thấy được rằng các sản phẩm trên dường như không có sự khác biệt quá lớn về mặt thông số. Do đó, việc bạn chọn mua OPPO A57 sẽ là một lựa chọn hoàn toàn hợp lý. Chỉ cần bỏ ra một số tiền không quá lớn là bạn đã có thể sở hữu ngay một thiết bị khá mạnh mẽ và ổn định trong thời gian dài sử dụng.\r\n\r\nĐánh giá cấu hình chi tiết của OPPO A57\r\nĐiện thoại OPPO A57 tạo được ấn tượng với người dùng khi sở hữu giá thành tương đối rẻ nhưng vẫn cực kỳ mượt mà, ổn định về mặt hiệu năng. Dưới đây là những thông số chi tiết về cấu hình của OPPO thế hệ A57 mà bạn có thể tham khảo.\r\n\r\nOPPO A57 sở hữu thiết kế khá gọn nhẹ, sang trọng\r\nĐiện thoại OPPO A57 có vẻ ngoài khá đơn giản, tinh tế nhưng vẫn thể hiện được nét thanh lịch, sang trọng của người sử dụng. Máy sở hữu trọng lượng chỉ khoảng 147 gram cùng các thông số kích thước khá khiêm tốn là 163.7 x 75 x 7.99 mm. Kết hợp với các đường cong bo hoàn hảo tại các vị trí góc cạnh, A57 sẽ mang lại cho người dùng cảm giác cầm nắm cực kỳ thoải mái.\r\n\r\nĐánh giá cấu hình chi tiết của OPPO A57\r\n\r\nĐồng thời, với thiết kế nhỏ gọn này, bạn hoàn toàn có thể bỏ điện thoại vào trong túi hay balo một cách dễ dàng. Phần mặt lưng của sản phẩm được phủ một lớp nhám nhẹ giúp máy tránh được tình trạng vân tay, mồ hôi bám lên máy trong quá trình sử dụng. Ngoài ra, cụm camera của smartphone tới từ OPPO này còn được đặt gọn trong một mô-đun nhỏ phía sau thân máy, mang tới sự cân đối hoàn hảo trong thiết kế của sản phẩm.\r\n\r\nChất lượng hiển thị sắc nét, sống động thông qua tấm nền LCD hiện đại\r\nVề khả năng hiển thị, OPPO A57 luôn mang tới cho người dùng chất lượng hình ảnh có độ chân thực và sắc nét tới từng chi tiết. Máy được trang bị tấm nền IPS LCD 6.56 inch hiện đại cùng độ phân giải màn hình đạt 720 x 1612 pixels (HD+). Qua đó, mọi trải nghiệm xem phim, chơi game của người sử dụng trên A57 đều cực kỳ mượt mà và có độ tương phản cao.\r\n\r\nĐánh giá cấu hình chi tiết của OPPO A57\r\n\r\nKhông những vậy, A57 còn ghi điểm với người dùng khi sở hữu tốc độ làm mới màn hình lên tới 60Hz cùng độ nhận diện màu sắc đạt tới con số 16 triệu màu. Kết hợp với mật độ điểm ảnh đạt 269 ppi, các chuyển động hình ảnh, khung hình của thiết bị sẽ mượt mà và nhạy bén hơn. Đồng thời, mọi thao tác vuốt, chạm của người dùng lên màn hình cũng sẽ được tối ưu và có tốc độ phản hồi tốt hơn.\r\n\r\nOPPO A57 sở hữu chipset Helio G35, cho cấu hình mạnh mẽ, ổn định\r\nBên cạnh thiết kế gọn nhẹ, sang trọng cùng chất lượng hình ảnh sắc nét, có chiều sâu, smartphone A57 của OPPO còn nhận được sự quan tâm của nhiều người khi sở hữu bộ vi xử lý khá hiện đại của MediaTek - Helio G35. Dù không quá thực sự mạnh mẽ như những con chip hàng đầu hiện nay nhưng G35 vẫn đáp ứng được mọi nhu cầu sử dụng cơ bản của người dùng.\r\n\r\nMọi tác vụ như xem phim, nghe nhạc hay chơi các game đồ hoạ nhẹ đều không thành vấn đề đối với A57. Máy cũng giảm thiểu được tối đa tình trạng giật, lag trong quá trình sử dụng, giúp nâng cao trải nghiệm của người dùng. Thiết bị cũng sẽ sở hữu bộ vi xử lý đồ hoạ GPU IMG GE8320 giúp nâng cao khả năng hiển thị của máy.\r\n\r\nOPPO A57 sở hữu chipset Helio G35\r\n\r\nNgoài ra, A57 còn sở hữu các thông số về bộ nhớ lần lượt là 4GB RAM và 64GB bộ nhớ trong (có thể được mở rộng tối đa lên tới 1TB bằng thẻ nhớ). Người dùng có thể thoải mái lưu trữ ứng dụng, dữ liệu cá nhân trong một không gian lưu trữ lớn và không cần lo về vấn đề thiếu hụt bộ nhớ. Các tiêu chí khác của máy như thời lượng pin 5000mAh cùng cụm camera sắc nét cũng sẽ giúp nâng cao trải nghiệm trong quá trình sử dụng của người dùng.\r\n\r\nĐiện thoại OPPO A57 khi nào ra mắt?\r\nSmartphone mang tên A57 của OPPO đã chính thức được ra mắt đến với người dùng trên toàn thế giới vào ngày 1 tháng 7 năm 2022 vừa qua. Với giá thành hấp dẫn cùng những ưu điểm nổi bật của mình, OPPO phiên bản A57 đã nhanh chóng thu hút được sự chú ý của người dùng và trở nên phổ biến trên thị trường trong thời gian ngắn.\r\n\r\nĐiện thoại OPPO A57 khi nào ra mắt?\r\n\r\nTrong lần ra mắt vừa rồi, OPPO đã ưu ái trang bị cho sản phẩm 2 tuỳ chọn màu sắc vô cùng bắt mắt là: Glowing Green và Glowing Black. Đây đều là 2 phiên bản màu sắc đặc biệt, thể hiện được sự sang trọng, quý phái của người sử dụng.\r\n\r\nĐiện thoại OPPO A57 giá bao nhiêu?\r\nDo là sản phẩm thuộc phân khúc giá rẻ nên giá thành của A57 chỉ dao động trong khoảng từ hơn 4 triệu cho tới 4.5 triệu VND. Và còn tùy thuộc vào phiên bản bộ nhớ và màu sắc sản phẩm sở hữu mà giá thành của thiết bị cũng sẽ có sự chênh lệch đôi chút. Cụ thể:\r\n\r\nĐiện thoại OPPO A57 64GB: 4.290.000 VND.\r\n\r\nĐiện thoại OPPO A57 128GB: 4.490.000 VND.\r\n\r\nVới mức giá vô cùng hấp dẫn, chỉ từ hơn 4 triệu VND, OPPO phiên bản A57 sẽ là thiết bị smartphone mà bạn không nên bỏ lỡ.\r\n\r\nMua điện thoại OPPO A57 chính hãng, giá rẻ tại cửa hàng CellphoneS\r\nĐể sở hữu được thiết bị nổi trội của tập đoàn OPPO này với mức giá ưu đãi nhất trên thị trường, bạn có thể tham khảo tại hệ thống cửa hàng CellphoneS. Tại đây, CellphoneS chuyên nhận phân phối, cung cấp các sản phẩm công nghệ chất lượng chính hãng cùng nhiều phần quà khuyến mãi vô cùng hấp dẫn khác.\r\n\r\nMột số câu hỏi thường gặp\r\nKhi có bất cứ câu hỏi nào về OPPO A57, quý khách đừng ngại ngần liên hệ ngay với CellphoneS qua số điện thoại 1800.2097, Fanpage CellphoneS hoặc nhắn tin trò truyện ngay trên Website với tư vấn viên để được giải đáp nhanh chóng nhất!\r\n\r\nOPPO A57 ra mắt khi nào?\r\nĐiện thoại OPPO A57 đã được hãng OPPO cho ra mắt tại nhiều thị trường vào ngày 2 tháng 7 vừa qua.\r\n\r\nOPPO A57 giá bao nhiêu?\r\nĐiện thoại OPPO A57 có giá bán chính thức khoảng gần 4,500,000 ₫. Tuy nhiên chỉ tại CellphoneS, Quý khách có thể mua OPPO A57 với mức giá 4.190.000 ₫ cùng với nhiều ưu đãi khác chỉ có tại CellphoneS.\r\n\r\nĐiện thoại OPPO A57 - Pin lớn, màn hình rộng đáp ứng giải trí\r\n\r\nOPPO A57 có chống thấm kháng nước không?\r\nOPPO A57 có chuẩn kháng nước, bụi IPX4 vì thế có thể chống thấm với giọt nước bắn vào điện thoại. Tuy nhiên, người dùng cũng cần hết sức cẩn thận khi sử dụng tránh để điện thoại rơi vào nước hoặc ngấm nước quá lâu.\r\n\r\nOPPO A57 có chơi game được không?\r\nOPPO A57 có hiệu năng tốt để chơi tựa game phổ biến hiện nay như: Liên Quân Mobile, PUBG Mobile,... khi được thiết lập mức đồ họa trung bình hoặc thấp trong thời gian dài. A57 được trang bị con chip Helio G35 của nhà MediaTek, vi xử lý 8 nhân có tốc độ tối đa 2.3 GHz, được xây dựng trên tiến trình 12 nm, sở hữu công nghệ HyperEngine giúp tối ưu hóa khả năng chơi game.\r\n\r\nĐiện thoại OPPO A57 - Pin lớn, màn hình rộng đáp ứng giải trí', 'products/oppoa57.webp', 2, 2, 4990000, GETDATE(), NULL),
(1, N'OPPO Reno7 4G (8GB - 128GB)', N'Oppo Reno7 quay trở lại ấn tượng với thiết kế đẹp mắt và những cải tiến nổi bật. Không những toả sáng với diện mạo bắt mắt, smartphone còn mang đến trải nghiệm ổn định ấn tượng hơn với chipset của Snapdragon 680, RAM 8 GB cùng bộ nhớ trong 128 GB. Cạnh đó,sự thay đổi của camera với độ phân giải lên đến 64 MP và nâng cấp nhiều ống kính hơn cũng mang đến những hình ảnh chất lượng hơn. Nếu bạn có nhu cầu sử dụng 5G thì có thể tham khảo dòng sản phẩm OPPO Reno7 5G tại CellphoneS!\r\n\r\nOppo Reno 7 4G\r\n\r\nOppo Reno7 - Mang đến những trải nghiệm ấn tượng\r\nOPPO Reno7 4G là chiếc điện thoại tiếp nối sự thành công của dòng smartphone Reno. Với những cải tiến mạnh mẽ về cấu hình, hiệu năng lẫn ngoại hình, Oppo Reno7 đã mang đến cho người dùng chiếc điện thoại với những trải nghiệm ấn tượng và tuyệt vời hơn. Cùng khám phá những điều mới mẻ mà Oppo Reno7 mang lại nhé!\r\n\r\nTự tin với camera chất lượng\r\nMặt sau của máy được trang bị cum camera 3 ống kính với các thông số nổi bật, lần lượt là camera chính với 64 MP và hai camera cảm biến cận cảnh và chân dung có độ phân giải 2 MP. Máy còn được trang bị với nhiều tính năng chụp ảnh đa dạng. Theo đó, mọi chế độ chụp ảnh như chụp HDR, chụp chuyên nghiệp, cảnh ban đêm, làm đẹp,... đều sẽ được Oppo Reno7 cân chỉnh hoàn hảo.\r\n\r\nNgoài ra, tính năng chụp tính năng chụp ảnh Bokeh Flare còn giúp cho người dùng có được những tác phẩm hình ảnh với khả năng xoá phông cực đỉnh. Dù trong điều kiện hay hoàn cảnh nào thì thiết bị cũng có thể mang đến những hình ảnh với độ sáng đầy đủ, chi tiết, màu sắc tươi mới và bắt mắt hơn.\r\n\r\nĐiện thoại Oppo Reno 7 4G\r\n\r\nVà điều giúp cho camera của Oppo Reno7 phải tự hào chính là camera trước 32 MP các tính năng đi kèm như camera mặt sau. Hơn thế, ống kính trước còn được trang bị cả cảm biến IMX709 của nhà Sony. Với sự tích hợp máy, thiết bị có thể điều chỉnh ánh sáng một cách thông minh và giúp cho những tấm hình chụp tay được trở nên tuyệt đẹp hơn bao giờ hết.\r\n\r\nVề tính năng quay, điện thoại cũng được hỗ trợ quay video chuẩn 4K. Tính năng khóa nét chủ thể được đi cùng cực kỳ có ích cho người dùng khi cần quay những thước phim chất lượng cao.\r\n\r\nĐiện thoại Oppo Reno 7 4G\r\n\r\nTạo ấn tượng với thiết kế vẻ ngoài đẹp mắt\r\nThiết kế vẻ ngoài của chiếc điện thoại Oppo Reno7 giúp tạo được ấn tượng nhiều hơn với người dùng. Mặt lưng được làm từ chất liệu giả da cao cấp với những thiết kế sợi da thuỷ tinh mang đến một cảm giác cầm nắm khá chắc tay. Đồng thời cũng hạn chế được tình trạng bám dấu vân tay hay mồ hôi một cách đáng kể. Chính thiết kế này cũng đã giúp cho chiếc điện thoại trở nên cao cấp và bắt mắt hơn.\r\n\r\nVề trọng lượng, máy đạt khối lượng tổng thể chỉ 175 g và tối ưu độ mỏng chỉ còn 7.49 mm, khi nhìn vào bất cứ ai cũng sẽ có cảm nhận được sự nhỏ gọn, thanh thoát và sang trọng. Việc cầm nắm điện thoại cũng trở nên nhẹ nhàng và thời trang hơn. Những tinh tế trong thiết kế cùng ứng dụng công nghệ độc quyền giúp cho smartphone trở nên nổi bật, bắt mắt và thu hút ánh nhìn.\r\n\r\nOppo Reno7 - Mang đến những trải nghiệm ấn tượng\r\n\r\nChất liệu nhựa phủ sơn kim loại được kết hợp cho bộ khung điện thoại Oppo Reno7 sẽ giúp cho thiết bị trở nên vuông vức và phù hợp với xu hướng. Lớp sơn cao cấp hỗ trợ smartphone hạn chế được tình trạng trầy xước khi có sự cố. Cạnh đó, chúng còn mang đến sự thoải mái khi phải sử dụng thiết bị trong một khoảng thời gian dài.\r\n\r\nĐiểm nổi bật nhất có thể kể đến chính là cụm camera với lối thiết kế kết hợp với mô đun và viền phát sáng. Nhờ đó mà khi nhìn vào mặt sau điện thoại, cụm camera kim loại vuông vắn và tone màu trắng - đen nổi bật trở thành điểm thu hút lớn nhất. Đồng thời, thiết bị còn tạo điểm ấn tượng với viền camera được phát sáng và giúp cho người dùng dễ dàng nhận biết những thông báo khi có tin nhắn hay cuộc gọi đến.\r\n\r\nTrải nghiệm ổn định, chiến game mượt mà với con chip Snapdragon 680 \r\nOppo Reno7 được các nhà sản xuất ưu ái cho sử dụng con chip Snapdragon 680 8 nhân với hiệu suất tối đa lên đến 2.4 GHz. Đây là con chip rất được ưa chuộng, nhất là đối với những sản phẩm điện thoại thuộc phân khúc tầm trung.\r\n\r\nCon chip này giúp cho điện thoại có thể chiến game một cách ổn định, đáp ứng tốt nhu cầu chơi game hằng ngày. Thậm chí với những game thịnh hành như Liên Quân Mobile và PUBG Mobile,... Oppo Reno7 sẽ mang đến những trải nghiệm ấn tượng với mức đồ hoạ mượt mà, tốc độ khung hình cực cao và hạn chế được tình trạng giật lag.\r\n\r\nHiệu năng vượt trội, chơi game mượt mà\r\n\r\nĐồng thời, điện thoại cũng được trang bị thêm 8GB RAM và có thể mở rộng thêm, giúp cho Oppo Reno7 có thể đạt đến dung lượng cao hơn. Nhờ đó mà thiết bị hoạt động được đa vụ, đa tác nhiệm, các ứng dụng cũng được mở một cách nhanh chóng và mượt mà hơn. Kết hợp cùng bộ nhớ trong 128GB giúp cho điện thoại có được không gian lưu trữ lớn, tải xuống mọi dữ liệu cho thiết bị.\r\n\r\nSử dụng lâu dài với tốc độ sạc cực nhanh\r\nĐiện thoại Oppo Reno7 chỉ được trang bị viên pin 4500 mAh. Nếu so với những chiếc điện thoại cùng phân khúc giá thì có lẽ đây là mức năng lượng không được đánh giá quá cao. Tuy nhiên, với những công nghệ đi kèm và dung lượng pin này, smartphone đã có thể đáp ứng khả năng sử dụng của người dùng lên đến nhiều tiếng. Số giờ sử dụng này đã giúp cho dùng hài lòng và tự tin sử dụng lâu dài. \r\n\r\nSử dụng lâu dài với tốc độ sạc cực nhanh\r\n\r\nCạnh đó, hãng cùng đã rất hào phóng khi trang bị cho chiếc điện thoại công nghệ sạc pin nhanh lên đến 33 W. Người dùng hoàn toàn có thể sạc nhanh, nạp đầy dung lượng pin và quay lại với công việc trên điện thoại một cách nhanh chóng. Cùng với đó là một củ sạc cùng công suất được tặng kèm, không những giúp cho quá trình sạc được rút ngắn một cách đáng kể mà còn hỗ trợ người dùng tiết kiệm được chi phí mua sạc nhanh.\r\n\r\nMàn hình chất lượng cho khả năng giải trí tốt hơn\r\nSmartphone được trang bị với kích thước 6.43 inch mang đến không gian trình chiếu rộng lớn. Cùng với đó là sự hỗ trợ của tấm nền AMOLED đạt độ phân giải Full HD+ (1080 x 2400 Pixels). Nhờ đó mà chiếc điện thoại có thể hiển với những sắc màu rực rỡ và bắt mắt.\r\n\r\nMàn hình AMOLED \r\n\r\nVới những chi tiết nhỏ được hiển thị rõ nét, người dùng có thể tự do khám phá những tựa game sinh tồn cùng những phát hiện chuyển động nhạy hơn. Tấm nền còn có thêm một ưu điểm là có thể hạn chế được ánh sáng xanh, giúp bảo vệ mắt người dùng khi phải dùng điện thoại thường xuyên hay lâu dài.\r\n\r\nCạnh đó, màn hình cũng được trang bị tần số quét 90 Hz giúp cho những thao tác vuốt chạm hằng ngày trở nên được mượt mà và trơn tru. Một điểm cộng nữa là màn hình được hỗ trợ với độ sáng tối đa đạt 600 nits, có thể sử dụng ở ngoài trời được tốt và rõ ràng, kể cả khi người dùng lướt web, đọc báo hay xem nội dung văn bản.\r\n\r\nĐiện thoại Oppo Reno7 khi nào ra mắt?\r\nĐiện thoại Oppo Reno7 trước đó đã được ra mắt một số thị trường và tạo được tiếng vang đáng kể. Cụ thể là vào ngày 25/11/2021, smartphone đã xuất hiện tại Trung Quốc và thu hút được nhiều sự chú ý. Chính vì thế mà người dùng Việt Nam đã không ngừng mong đợi về sự xuất hiện của chiếc điện thoại này.\r\n\r\nkhi nào ra mắt\r\n\r\nNgay sau đó, Oppo Reno7 cũng đã chính thức đến tay người tiêu dùng Việt Nam vào ngày 16/03/2022. Sự có mặt của điện thoại Oppo Reno7 với những thiết kế và nâng cấp cực kỳ ấn tượng đã không khiến cho những người mong đợi phải phải thất vọng.', 'products/opporeno7.webp', 2, 2, 6350000, GETDATE(), NULL),
(1, N'OPPO Reno8', N'OPPO Reno8 - chuyên gia chụp ảnh chân dung hàng đầu nhờ sự kết hợp giữa cảm biến cao cấp Sony IMX709(camera trước) và IMX766(camera sau) với ống kính Micro30x. Ngoài ra, phiên bản Reno 8 mang lại cho người dùng khả năng cân bằng cuộc sống theo khung giờ 8 tiếng giúp làm việc hiệu quả và nghỉ ngơi đầy đủ. Hiệu năng mà OPPO Reno 8 sở hữu 8GB RAM, 256GB bộ nhớ trong đi cùng với vi xử lý MediaTek Dimensity 1300 giúp tối ưu các tác vụ hiệu quả cùng hiệu năng chơi game đỉnh cao.\r\n\r\nTại sao nên chọn mua OPPO Reno8?\r\nCon số 8 bí ẩn - tận hưởng khoảnh khắc của riêng bạn\r\n\r\nVới thiết kế cụm camera số 8 nhấn mạnh 8 tiếng tận hưởng mỗi ngày. Thay vì sống một cuộc sống gò bó, chỉ tập trung vào công việc như một robot được lập trình sẵn, hay chia thời gian mỗi ngày thành 3 phần: 8 tiếng làm việc, 8 tiếng tận hưởng và 8 tiếng nghỉ ngơi.\r\n\r\nNgoài ra, OPPO Reno8 còn mang lại cho người dùng:\r\n\r\n- Thiết kế cạnh viền vuông vức cùng cụm camera tinh xảo và cao cấp\r\n\r\n- Chuyên gia chân dung đêm với bộ đôi cảm biến cao cấp Sony IMX709(camera trước) và IMX766(camera sau)\r\n\r\n- Khả năng xử lý được cải thiện lên đến 40% so với thế hệ tiền nhiệm, lưu trữ thoải mái với 256GB ROM Bộ nhớ\r\n\r\n- Sạc siêu nhanh hơn 10 phút đạt 50% với khả năng bảo vệ 5 lớp\r\n\r\nĐánh giá điện thoại OPPO Reno8 4G\r\n\r\nVới 8 tiếng làm việc, OPPO Reno8 hỗ trợ người dùng tập trung tối đa vào công việc, không có thời gian chờ với chip set mạnh mẽ, bộ nhớ RAM lớn giúp các tháo tác với google sheet, ppt mượt mà.\r\n\r\nSau thời gian làm việc hãy tập trung hoàn toàn cho các trải nghiệm cá nhân, tận hưởng các cuộc sống thú vị về ban đêm. OPPO Reno8 với camera siêu cảm biến giúp ghi lại những khoảng khắc đáng nhớ một cách rõ nét. Khung giờ cuối cùng là 8 tiếng để nghỉ ngơi, bổ sung năng lượng với chế độ sạc đêm an toàn.\r\n\r\nCHUYÊN GIA CHÂN DUNG: Bừng sáng khoảnh khắc đêm với Reno8\r\nReno8 khẳng định đẳng cấp chuyên gia chân dung đêm nhờ bộ đôi cảm biến cao cấp là Sony IMX709 (camera trước) và IMX766 (camera sau).\r\n\r\nChiếc điện thoại cũng đi kèm khả năng xử lý AI đem đến nhiều chế độ quay/chụp ấn tượng giúp bạn bừng sáng trong màn đêm.\r\n\r\nCHUYÊN GIA CHÂN DUNG: Bừng sáng khoảnh khắc đêm với Reno8\r\n\r\n*Lưu ý: Tính năng chuyên gia chân dung hiện chỉ hỗ trợ trên phiên bản OPPO Reno8 5G.\r\n\r\nDẪN ĐẦU XU HƯỚNG THIẾT KẾ 2022: Tinh xảo và cao cấp\r\nReno8 Series có ngôn ngữ thiết kế vuông vắn, cụm camera độc đáo, thân máy siêu mỏng và mặt lưng kính cao cấp tạo nên một chiếc điện thoại thông minh vừa ấn tượng về mặt thị giác vừa phù hợp để sử dụng hàng ngày.\r\n\r\n  - Nhẹ chỉ từ: 182g\r\n\r\n  - Mỏng chỉ từ: 7,66 mm\r\n\r\n  - Công nghệ phủ màu OPPO Glow\r\n\r\nGẤP ĐÔI HIỆU SUẤT, GẤP ĐỔI LƯU TRỮ: Hiệu năng dẫn đầu phân khúc\r\nKhả năng xử lý trên OPPO Reno8 được cải thiện lên đến 40% so với thế hệ tiền nhiệm. Xung nhịp chip tối đa lên đến 3.0Ghz cho khả năng vận hành với các tác vụ nặng một cách mượt mà nhất.\r\n\r\n  - Reno8 5G: Mediatek Dimensity 1300 5G\r\n\r\n  - Reno8 Z 5G: Qualcomm Snapdragon 695 5G\r\n\r\n  - Reno8: Qualcomm Snapdragon 680\r\n\r\nThêm vào đó, Reno8 cho phép lưu trữ thoải mái với 256GB ROM Bộ nhớ được nâng cấp gấp đôi so với thế hệ tiền nhiệm\r\n\r\nNHANH NHẤT, AN TOÀN NHẤT: Sạc siêu nhanh Super VOOC 80W\r\nReno8 5G thừa hưởng công nghệ sạc nhanh mới nhất từ ​​dòng Flagship của OPPO với công suất sạc lên đến 80W với công nghệ bảo vệ pin độc quyền giúp tăng tuổi thọ pin lên gấp 2 lần\r\n  -Hơn 10 phút sạc cho 50% pin\r\n\r\n  -Chơi game 2 giờ với 5 phút sạc (Dữ liệu được kiểm tra bởi TUV Rheinland, PUBG)\r\n\r\n  -Bảo vệ sạc 5 lớp', 'products/opporeo8.webp', 2, 2, 8990000, GETDATE(), NULL),
(1, N'OPPO Reno8 Pro 5G 12GB 256GB', N'OPPO Reno8 Pro: Đánh giá có thiết kế điện thoại trẻ trung, hiệu năng mạnh mẽ\r\n\r\nOPPO Reno8 Pro là một trong những sản phẩm thuộc series tiếp theo mà OPPO mong muốn mang tới cho người dùng. Mang trên mình thiết kế cực đỉnh cùng hiệu năng cực chất, bên cạnh đó là những nâng cấp cực chất về camera chắc chắn sẽ giúp người dùng có những trải nghiệm cực đã.\r\n\r\nĐánh giá điện thoại OPPO Reno8 Pro\r\n\r\nSiêu chip kép - Phần cứng mạnh mẽ từ Find Series\r\nĐiện thoại OPPO Reno8 Pro được trang bị chip kép cho hiệu năng vượt trội. Trong đó chip MediaTek Dimensity 8100-Max được sản xuất trên tiến trình 5nm với 8 nhân giúp hiệu năng được cải thiện vượt trội tới 12% CPU và 29% GPU, hiệu suất năng lượng cải thiện 50%. Con chip mạnh mã được chứng minh khi đo điểm hiệu năng Antutu Benchmark lên tới 827.026.\r\n\r\nVề hiệu năng, OPPO Reno8 Pro chắc chắn sẽ không làm cho người dùng phải cảm thấy thất vọng bởi chúng được trang bị chip Snapdragon7 Gen 1. Con chip này mang tới hiệu năng vô cùng ổn định và mạnh mẽ. Chúng được sản xuất trên quy trình 4 nm với bốn lõi Cortex-A710 mang tới tốc độ 2.4 GHz và đi kèm đó là bốn lõi Cortex-A510, GPU Adreno 662 cung cấp hiệu suất cho người dùng nhanh hơn tới 20% so với dòng cũ.\r\n\r\nOPPO Reno8 Pro\r\n\r\nBên cạnh chip kép ấn tượng, điện thoại OPPO Reno8 Pro còn được trang bị bộ nhớ RAM vượt trội với dung lượng lên đến 12GB cùng bộ nhớ lưu trữ lên đến 256GB. Ngoài ra, người dùng còn có thể mở rộng bộ nhớ RAM lên đến 7GB mang lại khả năng đa nhiệm vượt trội.\r\n\r\nVới những gì được trang bị, OPPO Reno8 Pro xử lý được mượt mà và nhanh chóng các tác vụ hằng ngày như lướt web, xe, mạng xã hội, học, họp online,... Cùng với đó là sự tối ưu mạnh mẽ giúp người dùng có thể trải nghiệm các tựa game mượt mà và ấn tượng.\r\n\r\nChuyên gia chân dung - quay video 4K siêu đêm\r\nOPPO không hổ danh là ông trùm trong làng selfie với những trang bị vô cùng đẳng cấp cho camera. Cụ thể, camera chính với độ phân giải 50MP, camera góc rộng 8MP với góc chụp rộng lên đến 112 độ. Cuối cùng là camera macro 2MP với khoảng cách lấy nét 4cm. Tất cả mang lại hình ảnh cực kỳ sáng và rõ nét hơn. Đặc biệt là vùng cảm quang có kích thước lớn. Điện thoại còn được trang bị cảm biến kép với Sony IMX709 và Sony IMX766 mang lại khả năng thu lại hình ảnh sắc nét và rõ ràng.\r\n\r\nNgoài ra, camera trước của máy lên tới 32 MP kết hợp với đó là những trang bị AI vô cùng hiện đại và tiện ích. Camera với cảm biến Sony IMX709 cùng hệ màu RGBW mang lại khả năng thu sáng tốt hơn tới 60%, khả năng khử nhiễu 35% cùng khả năng lấy nét tự động. Từ đó, người dùng có thể thoải mái sáng tạo cũng như lưu lại được những khoảnh khắc thú vị từ cuộc sống. \r\n\r\nOPPO Reno8 Pro\r\n\r\nVới bộ thông số trên, OPPO Reno8 Pro đã đủ để mang lại cho người dùng những bức ảnh vô cùng sịn sò. Tuy nhiên, OPPO Reno8 Pro còn sử dụng NPU Marisilicon X giúp thể hiện được đẳng cấp khác biệt. Những bức ảnh có khả năng cân bằng màu sắc vô cùng tốt và tạo nên một khí chất riêng nhà Oppo.\r\n\r\nĐiện thoại OPPO Reno8 Pro sở hữu khả năng quay video 4K Ultra Night , kết hợp bộ xử lý hình ảnh Marisilicon X iMaging NPU giúp các thước phim chi tiết cùng màu sắc sống động. Không chỉ hỗ trợ khả năng quay đêm, OPPO Reno8 Pro còn hỗ trợ ghi lại các ánh đèn, bình minh hay hoàng hôn.\r\n\r\nThiết kế OPPO Reno8 Pro bền bỉ, cực cuốn hút\r\nOPPO Reno8 Pro thuộc dòng điện thoại OPPO Reno với thiết kế đầy hấp dẫn có thể cuốn hút người dùng ngay từ cái nhìn đầu tiên. Cũng giống như phiên bản tiền nhiệm, trên phiên bản này, người dùng sẽ được trải nghiệm điện thoại cực chất với mặt lưng vô cùng bóng bẩy. Hiệu ứng gradient ở mặt lưng giúp mang lại cảm nhận màu sắc vô cùng thú vị. Từ đó mang tới phong cách và cá tính cho người sử dụng.\r\n\r\nOPPO Reno8 Pro\r\n\r\nĐiểm ấn tượng ở mặt lưng này nữa đó là chúng được hoàn thiện từ chất liệu cao cấp. Chúng không chỉ mang tới sự chắc chắn, bền bỉ mà thiết kế này còn giúp cho điện thoại trở nên sang trọng hơn cũng như hạn chế được tối đa bụi bẩn, dấu vân tay trong quá trình sử dụng.\r\n\r\nTrên thiết kế mới này, OPPO mang tới cho người dùng những tuỳ chọn màu sắc như: Slightly Drunk, Clear Sky Blue và Night Tour Black. Tất cả các màu đều vô cùng thời thượng, sang trọng và phù hợp với mọi lứa tuổi.\r\n\r\nMàn hình Reno8 Pro chất lượng cho trải nghiệm cực đã\r\nMang tới cho người dùng trải nghiệm chất lượng và vô cùng ấn tượng đó chính là công nghệ màn hình AMOLED hỗ trợ HDR 10+. Hình ảnh được hiển thị một cách vô cùng sinh động do có độ tương phản cao và tái tạo màu đen sâu.\r\n\r\nNgoài ra, OPPO Reno8 Pro còn sở hữu màn hình lớn, độ phân giải Full HD+ (1080 x 2400 Pixels) kết hợp với đó là viền màn siêu mỏng để cho ra một không gian hiển thị rộng lớn.\r\n\r\nOPPO Reno8 Pro\r\n\r\nĐặc biệt tần số quét lớn lên tới 120 Hz cho mọi thao tác đều trở nên vô cùng mượt mà. Hơn nữa độ sáng tối đa lên đến 1300 nits giúp mang lại khả năng sử dụng tốt hơn ở những nơi có điều kiện ánh sáng lớn như ngoài trời.\r\n\r\nHệ thống làm mát vượt trội\r\nĐiện thoại OPPO Reno8 Pro được trang bị hệ thống làm mát vượt trội. Với kích thước tấm tản nhiệt được gấp đôi diện tích lên đến 32928mm giúp hiệu suất cải thiện lên đến 45%. Nhờ đó điện thoại có thể giữ được nhiệt độ ổn định kể cả khi đang trải nghiệm các trò chơi.\r\n\r\nOPPO Reno8 Pro\r\n\r\nNgoài khả năng tản nhiệt ấn tượng, OPPO Reno8 Pro còn được trang bị động cơ tuyến trục X giúp mang lại các rung động xúc giác như thật giúp mang lại các trải nghiệm gaming ấn tượng.\r\n\r\nPin OPPO Reno8 Pro cực khủng, sạc nhanh SUPERVOOCTM 80W\r\nNgoài những ấn tượng về thiết kế, hiệu năng hay camera thì OPPO Reno8 Pro còn thu hút được sự chú ý của người dùng bởi được trang bị dung lượng pin 4.500 mAh. Đây được coi là mức pin vô cùng ổn kết hợp với sự tối ưu phần mềm nên người dùng có thể thoải mái sử dụng được trong thời gian dài.\r\n\r\nBên cạnh đó sạc nhanh 80 W được trang bị trên sản phẩm còn giúp tiết kiệm thời gian sạc rất nhiều. Người dùng chỉ mất 31 phút là đã có thể bổ sung đầy năng lượng để thoải mái trải nghiệm những tính năng vô cùng thú vị.\r\n\r\nPin OPPO Reno8 Pro cực khủng, sạc nhanh SUPERVOOCTM 80W\r\n\r\nĐẶT TRƯỚC RENO8 PRO 5G | NHẬN ƯU ĐÃI HƠN 3 TRIỆU ĐỒNG\r\nThời gian áp dụng: Từ ngày 05/10/2022 – 14/10/2022 và thời gian trả cọc từ 15/10/2022 – 21/10/2022\r\n\r\nKhuyến mãi: Khi mua OPPO Reno8 Pro, ngoài ưu đãi trả góp 0%, Quý Khách sẽ được nhận ngay máy lọc không khí Levoit Core Mini trị giá 2.490.000đ. Levoit Core Mini là sản phẩm máy lọc không khí được tối ưu khi sở hữu:\r\n\r\nThiết kế hiện đại, nhỏ gọn, chỉ khoảng 1kg.\r\nBộ lọc 3 lớp, lọc được bụi mịn PM0.3\r\nHoạt động êm ái cũng như tiết kiệm điện năng\r\nĐỘC QUYỀN KHI MUA RENO8 PRO TẠI CELLPHONES: Bảo hành mở rộng 1 đổi 12 tháng + Lên đời trợ giá 1 triệu + Ưu đãi 500k thanh toán.\r\n\r\nGiá bán chính thức OPPO Reno8 Pro (chưa áp dụng chương trình khuyến mãi khác): 18.990.000đ với Giá trị cọc trước: 500.000Đ\r\n\r\nĐẶT TRƯỚC RENO8 PRO 5G | NHẬN ƯU ĐÃI HƠN 3 TRIỆU ĐỒNG\r\n\r\nĐiện thoại OPPO Reno8 Pro khi nào ra mắt?\r\nVới nhiều tính năng thông minh, hiệu năng vượt trội, điện thoại OPPO Reno8 Pro được nhiều người tiêu dùng chú ý. OPPO Reno8 Pro sẽ được chính thức giới thiệu đến người tiêu dùng vào ngày 5/10/2022. Khi ra mắt, điện thoại sẽ được lên kệ với nhiều phiên bản màu sắc độc đáo gồm xanh lục bảo và đen thạch anh.\r\n\r\nĐiện thoại OPPO Reno8 Pro giá bán bao nhiêu tiền?\r\nĐiện thoại OPPO Reno8 Pro sẽ được lên kệ với giá bán từ 18 - 19 triệu đồng. Mức giá sẽ không có sự chênh lệnh quá nhiều giữa các phiên bản màu sắc.\r\n\r\nSo với giá bán thế hệ OPPO Reno7 Pro thì OPPO Reno8 Pro sẽ không có sự chênh lệch giá bán quá nhiều. Mức giá này sẽ cạnh tranh với iPhone 13, Asus rog phone 5, Samsung S22 Plus,...', 'products/opporeno8pro.webp', 2, 2, 18990000, GETDATE(), NULL),
(1, N'OPPO Reno8 T 5G (8GB - 128GB)', N'OPPO Reno8 T sở hữu thông số hiệu năng mạnh mẽ khi được trang bị bộ vi xử lý thế hệ mới của Snapdragon 695. Điện thoại OPPO mới này sở hữu tấm nền AMOLED 6.7 inch thế hệ mới mang lại chất lượng hình ảnh siêu sắc nét và sống động tới từng chi tiết.\r\n\r\nDung lượng Pin điện thoại Reno8 T 5G lên tới 4800mAh cùng thông số bộ nhớ đạt 8GB RAM và 128GB ROM giúp người dùng có thể thoải mái trải nghiệm mà không cần lo về vấn đề năng lượng hay bộ nhớ lưu trữ trong quá trình sử dụng.\r\nĐánh giá điện thoại OPPO Reno8 T - Thiết kế bắt mắt, cấu hình cực đỉnh\r\nNhắc tới thành công của tập đoàn OPPO, ta không thể không nhắc tới siêu phẩm OPPO Reno8 T chuẩn bị được ra mắt trong thời gian tới đây. Dù chưa chính thức trên thị trường nhưng Reno8 T vẫn luôn nhận được sự quan tâm sâu sắc từ phía người dùng nhờ sở hữu những ưu điểm vượt trội so với các sản phẩm cùng phân khúc khác. Vậy OPPO Reno8 T thông số kỹ thuật của Reno 8T 5G như thế nào và bao giờ được ra mắt?\r\n\r\nĐánh giá điện thoại OPPO Reno8 T - Thiết kế bắt mắt, cấu hình cực đỉnh\r\n\r\nOPPO Reno8 T 5G sở hữu thiết kế hiện đại nhưng cũng cực kỳ bắt mắt\r\nNgay từ ánh nhìn đầu tiên, OPPO Reno8 T đã thu hút được sự chú ý của người dùng khi sở hữu thiết kế sang trọng, hiện đại nhưng cũng vô cùng độc đáo, bắt mắt. Phần mặt lưng của máy được hiệu chỉnh đặc biệt với hiệu ứng chuyển màu cực kỳ linh hoạt theo từng góc độ khác nhau. Không những vậy, mặt sau của máy còn được phủ một lớp nhám nhẹ, giúp chống mồ hôi và vân tay xuất hiện trong quá trình sử dụng, tạo cảm giác thoải mái khi cầm nắm.\r\n\r\nĐánh giá điện thoại OPPO Reno8 T - Thiết kế bắt mắt, cấu hình cực đỉnh\r\n\r\nCác góc cạnh ở viền thân máy được bo tròn hoàn hảo kết hợp với trọng lượng nhẹ giúp người dùng có thể thoải mái sử dụng sản phẩm trong thời gian dài mà không hề cảm thấy mỏi, đau nhức ở phần cổ tay. Các phím nút điều chỉnh âm lượng cùng hệ thống loa và micro được bố trí đều quanh viền mang lại sự cân đối trong thiết kế của Reno8 T.\r\n\r\nChất lượng hiển thị sắc nét và có chiều sâu nhờ tấm nền AMOLED hiện đại\r\nKhông chỉ thu hút được sự chú ý của người dùng bằng thiết kế hiện đại, độc đáo, OPPO Reno 8T 5G còn tạo được ấn tượng tốt với người dùng khi được trang bị tấm nền AMOLED thế hệ mới. Nhờ sở hữu màn hình hiện đại AMOLED 6.7 inch, Reno8 T sẽ đem lại cho người dùng chất lượng hình ảnh siêu sống động và sắc nét không hề thua kém ngoài rạp chiếu phim.\r\n\r\nĐánh giá điện thoại OPPO Reno8 T - Thiết kế bắt mắt, cấu hình cực đỉnh\r\n\r\nVới độ phân giải lên tới Full HD+ cùng tốc độ làm mới màn hình đạt 120Hz, mọi trải nghiệm chơi game, xem phim giải trí thông qua Reno8 T đều cực kỳ rõ nét và mượt mà. Đồng thời, các thao tác vuốt chạm của người dùng lên màn hình thông qua tấm kính bảo vệ chất lượng cao cũng vô cùng nhạy bén và không hề có cảm giác rít, khó vuốt.\r\n\r\nHiệu năng Reno8 T 5G mạnh mẽ cùng không gian lưu trữ siêu khủng\r\nƯu điểm nổi trội nhất của OPPO Reno8 T 5G có lẽ nằm ở khả năng xử lý, tính toán siêu nhanh nhạy, đáp ứng được mọi yêu cầu về công việc cũng như giải trí của người dùng. Thông qua bộ vi xử lý mạnh mẽ được tích hợp trên sản phẩm - Snapdragon 695 5G 8 nhân, mọi tác vụ từ đơn giản cho tới phức tạp đều không thành vấn đề đối với OPPO Reno 8T. Tình trạng giật, lag trong quá trình sử dụng gần như không thể được bắt gặp trên thiết bị mạnh mẽ tới từ OPPO này.\r\n\r\nĐánh giá điện thoại OPPO Reno8 T - Thiết kế bắt mắt, cấu hình cực đỉnh\r\n\r\nĐi kèm với cấu hình siêu khủng này là thông số bộ nhớ lên tới 8GB RAM và 128GB ROM. Bằng việc trang bị cho Reno 8T một dung lượng bộ nhớ cực lớn, OPPO đã mang tới cho người dùng những trải nghiệm mượt mà với khả năng đa nhiệm hoàn hảo cùng không gian lưu trữ rộng lớn.\r\n\r\nĐiện thoại OPPO Reno8 T 5G khi nào được ra mắt?\r\nNếu so sánh với thời điểm ra mắt của các phiên bản tiền nhiệm trước đó thì OPPO Reno phiên bản 8T 5G sẽ được giới thiệu đến với người dùng trên toàn thế giới trong quý I năm 2023. Tại Việt Nam, OPPO Reno8 T 5G sẽ ra mắt vào 01/02/2023 và được bán chính hãng tại CellphoneS với nhiều ưu đãi hấp dẫn!\r\n\r\nkhi nào được ra mắt\r\n\r\nTrong lần ra mắt này, rất có thể OPPO Reno8 T sẽ sở hữu nhiều phiên bản màu sắc khác nhau đem lại cho người dùng nhiều lựa chọn hơn trong quá trình mua sắm.\r\n\r\nĐiện thoại OPPO Reno8 T giá bao nhiêu?\r\nGiá chính thức mở bán OPPO Reno8T tại Việt Nam có mức giá dự đoán như sau: OPPO RENO 8T 5G 8GB 128GB - Giá dự kiến: 9.990.000 đ\r\n\r\nDù được trang bị nhiều cải tiến vượt trội so với các sản phẩm trong cùng phân khúc khác nhưng Reno8 T lại sở hữu mức giá khá ưu đãi, dao động từ 8 cho tới 10 triệu VND. Mức giá này của Reno 8T là không thể nào ưu đãi hơn, nằm trong khả năng có thể chi trả được của người tiêu dùng Việt Nam.\r\n\r\ngiá bao nhiêu?\r\n\r\nTrong phân khúc giá này, OPPO Reno8 T sẽ là đối thủ cạnh tranh trực tiếp đến với các thiết bị smartphone của Apple, Samsung như: iPhone 11, Samsung Galaxy A73, Xiaomi Redmi Note 11 Pro Plus,…\r\n\r\nĐặt mua điện thoại OPPO Reno8 T chính hãng tại cửa hàng CellphoneS\r\nĐể sở hữu sản phẩm smartphone tới từ tập đoàn OPPO này với chất lượng chính hãng cùng mức giá siêu ưu đãi, bạn hoàn toàn có thể tham khảo tại hệ thống cửa hàng CellphoneS. Tại đây, CellphoneS chuyên cung cấp, phân phối các sản phẩm công nghệ hiện đại với nhiều ưu đãi, khuyến mãi vô cùng hấp dẫn.\r\n\r\nMột số câu hỏi thường gặp\r\nCellphoneS xin tiếp nhận tất cả các góp ý cũng như câu hỏi của Quý Khách hàng trong phần bình luận hoặc liên hệ tổng đài 1800.2097 để được giải đáp mọi thắc mắc nhanh nhất!\r\n\r\nOPPO Reno8 T có chống nước, kháng bụi không?\r\nReno8 T có sở hữu chuẩn kháng nước, kháng bụi  IPX4 - Bảo vệ khỏi nước xối từ mọi hướng với một lượng thể tích nhất định. Vì vậy người dùng hoàn toàn có thể yên tâm sử dụng khi đi ngoài trời hoặc vô tình làm đổ nước trúng điện thoại.\r\n\r\nReno 8T có đi kèm sạc không?\r\nĐiện thoại Reno 8T sẽ đi kèm hộp, Cáp USB Type C, Củ sạc superVOOC 67W, Dụng cụ lấy SIM, Miếng dán sẵn trên màn hình, Vỏ bảo vệ, Sách hướng dẫn.\r\n\r\ngiá bao nhiêu?\r\n\r\nReno8 T có sạc nhanh không?\r\nNhờ công nghệ sạc SuperVOOC 67W, tốc độ sạc trên Reno8 T 5G được rút ngắn 50% so với thế hệ trước. Ngoài ra, Reno8 T 5G cũng sở hữu RAM mở rộng dẫn đầu phân khúc, bổ sung 8GB + 8GB, sẵn sàng cho những trải nghiệm liền mạch cả ngày dài, đa tác vụ thả ga mà không lo giật lag.\r\n\r\nOPPO Reno8 T 5G chụp ảnh có đẹp không?\r\nNhờ sở hữu Camera chân dung 108MP cùng các thuật toán AI, Reno8 T 5G sẽ đem đến những bức ảnh chân dung không chỉ ấn tượng mà còn siêu nét, kể cả khi phóng to mọi góc độ.\r\n\r\nchụp ảnh có đẹp không\r\n\r\nMàn hình của OPPO Reno 8T có chất lượng không?\r\nNhờ sở hữu công nghệ màn hình 1 tỷ màu - Tần số 120Hz, Reno8 T 5G hứa hẹn mang đến trải nghiệm thị giác tuyệt vời nhất trong phân khúc. Đây hoàn toàn là những thông số chỉ có được ở các Flagship cao cấp tuy nhiên với Reno 8T bạn có thể sở hữu với mức giá phân khúc dưới 10 triệu.', 'opporeno8t.webp', 2, 2, 9990000, GETDATE(), NULL),
(1, N'Samsung Galaxy S22 Ultra (8GB - 128GB)\r\n', N'Đúng như các thông tin được đồn đoán trước đó, mẫu flagship mới của gả khổng lồ Hàn Quốc được ra mắt với tên gọi là Samsung Galaxy S22 Ultra với nhiều cải tiến đáng giá. Mẫu điện thoại cao cấp đến từ Samsung này có nhiều thay đổi từ thiết kế, cấu hình cho đến camera. Vậy siêu phẩm này có gì mới, giá bao nhiêu và có nên mua không? Hãy cùng tìm hiểu chi tiết ngay bên dưới nhé!\r\n\r\nDự kiến vào tháng 2 năm 2023, Samsung sẽ cho ra mắt siêu phẩm S23 Ultra mà có thể quý khách sẽ quan tâm! Click vào link để tìm hiểu thêm!\r\nĐánh giá Samsung Galaxy S22 Ultra 5G chi tiết\r\nNhững nâng cấp lớn về hiệu năng, dung lượng pin, và trên hết là camera sau chính là những điểm khiến nó trở thành siêu phẩm trong phân khúc cao cấp. Dưới đây là những thông tin cần biết về dòng điện thoại vừa ra mắt của Samsung. Dưới đây là thông số cấu hình của Samsung S22 Ultra vừa được gã khổng lồ Hàn Quốc giới thiệu.\r\n\r\nThiết kế nguyên khối - kính sang trọng với độ bền tối ưu\r\nSamsung Galaxy S22 Ultra đi theo ngôn ngữ thiết kế nguyên khối - kính cao cấp và sang trọng, vốn đã làm nên sự thành công của model tiền nhiệm. Chiếc máy có thiết kế mặt lưng đơn sắc tối giản nhưng không kém phần tinh tế, và màn hình tràn viền bao phủ gần như trọn mặt trước, tạo nên trải nghiệm quan sát rộng rãi trên một thiết bị di động nhỏ gọn vừa tay cầm.\r\n\r\nĐộ bền của máy được đảm bảo tối ưu không chỉ qua lớp vỏ nhôm nguyên khối Amor đánh bóng, mà còn qua kính cường lực Corning Gorilla Glass Victus+ bao phủ hai mặt trước và sau. Khung nhôm và kính hoạt động như bộ giáp bảo vệ điện thoại an toàn. Chiếc máy còn có khả năng chống bụi / nước đạt chuẩn IP68 giúp người dùng luôn an tâm khi dùng máy trong những điều kiện môi trường khác nhau.\r\n\r\nSamsung S22 Ultra 5G có thiết kế sang trọng với độ bền tối ưu\r\n\r\nỐng kính 108MP mang lại khả năng chụp ảnh không giới hạn\r\nỐng kính chính trên Samsung S22 Ultra với độ phân giải lên đến 108MP, với những khả năng chụp ảnh đêm, chụp chân dung, chụp góc siêu rộng, và zoom quang học 100x đều hiện diện. Chi tiết ảnh và màu sắc tốt nằm trong khoảng zoom 10x, có thể sử dụng zoom 30x trong điều kiện ánh sáng tốt, còn zoom 100x mang tính chất lưu lại thông tin. Camera chính và camera tele hỗ trợ công nghệ chống rung quang học OIS.\r\n\r\nĐánh giá Samsung Galaxy S22 Ultra 5G\r\n\r\nCụm camera sau cho phép người dùng sáng tạo ảnh chụp của mình không giới hạn. Hai ống kính còn lại là ống kính 12MP hỗ trợ chụp góc siêu rộng và ống kính tele 10MP. Người dùng có thể sử dụng S22 chụp ảnh macro với ống kính siêu rộng. Màu sắc và chi tiết ảnh cao hơn các model tầm trung, cho độ phân giải và cảm biến tốt hơn.\r\n\r\nCamera 108MP trên S22 Ultra mang lại khả năng chụp ảnh không giới hạn\r\n\r\nThiết bị được trang bị khả năng chụp ảnh chân dung ban đêm, trong điều kiện thiếu sáng ấn tượng với bộ xử lý hình ảnh AI kết hợp với camera góc rộng 108MP mang lại bức ảnh ban đêm sáng rõ. Với không gian không quá tối, chỉ với thao tác sử dụng chế độ tự động, AI sẽ tự xử lý cho ra hình ảnh sáng, đầy đủ chi tiết và không bị nhiễu. Trường hợp thiếu sáng, chế độ chụp đêm là sự lựa chọn hoàn hảo.\r\n\r\nTốc độ khung hình phát hiện ánh sáng và tự động chuyển sang tốc độ khung hình tối ưu. Samsung Galaxy S22 Ultra sử dụng bộ xử lý 4nm với công nghệ Super Night Solution giảm nhiễu hiệu quả.\r\n\r\nĐồng thời, người dùng có thể điều chỉnh được mức độ xóa phông sau khi chụp. Khi thực hiện quay video cần hiệu chỉnh phần hậu cảnh, người dùng có thể làm nổi bật chủ thể bằng cách sử dụng bộ lọc đổi phông thành đen trắng. Phần chuyển nét mượt mà và không có cảm giác bị lẹm.\r\n\r\nĐánh giá camera Samsung Galaxy S22 Ultra 5G\r\n\r\nKhông chỉ chụp ảnh, thiết bị còn mang lại khả năng quay phim chất lượng với khả năng chống rung và công nghệ AI mang lại những thước phim chuyển động nhanh mà vẫn đảm bảo rõ nét, zoom tốt hơn. Điện thoại còng được trang bị công nghệ Super HDR tốt với tất cả các ống kính mang lại những thước phim giàu chi tiết. Ấn tượng nhất trên camera của Samsung S22 Ultra đó chính là khả năng thu phóng 100 lần đầy ấn tượng.\r\n\r\nPhía trước máy là camera selfie đơn với độ phân giải lên đến 40 MP, khẩu độ f/2.2 với khả năng chụp góc rộng cho ra ảnh chụp selfie bắt mắt. Tính năng làm đẹp AI, gọi video call kép và HDR tự động sẽ giúp tăng cường trải nghiệm chụp ảnh trên chiếc flagship này.\r\n\r\nĐiểm nổi bật nữa của cụm camera nằm ở thời gian phơi sáng đến 6 giây nhưng bị rung nhòe kể cả không sử dụng chân đế!\r\n\r\nĐánh giá camera Samsung Galaxy S22 Ultra 5G - Ảnh 2\r\n\r\nMàn hình 6.8 inch 120 Hz tương thích bút S-Pen hiện đại\r\nVới Galaxy S22 Ultra thì Samsung đã cho ra đời loại màn hình phủ trọn mặt trước đầy ấn tượng. Chiếc màn hình điện thoại có kích thước 6.8 inch, độ phân giải Quad HD+ (3200 x 1440 pixels) và sử dụng tấm nền Dynamic AMOLED 2X với Vision Booster cho ra độ bão hòa màu sắc đầy chân thực.\r\n\r\nMàn hình của Samsung S22 Ultra còn được tích hợp những tính năng cao cấp đặc trưng của Samsung như Always on display, tốc độ làm tươi đến 120 Hz cho trải nghiệm gaming vượt trội và chứng nhận màu HDR10+. Bề mặt màn hình được bảo vệ bởi kính Gorilla Glass Victus chống xước hiệu quả.\r\n\r\nSamsung S22 Ultra có màn hình 6.8 inch 120 Hz tương thích bút S-Pen hiện đại\r\n\r\nVi xử lý Snapdragon 8 Gen 1 cùng pin lớn giúp giải trí hiệu quả\r\nVới Samsung S22 Ultra 5G, nhà sản xuất đã chế tạo nên bộ vi xử lý thế hệ mới mang tên Qualcomm Snapdragon 8 Gen 1. Hiệu năng trên Qualcomm Snapdragon 8 Gen 1 được cải tiến rất nhiều so với thế hệ trước nhằm mang lại hiệu năng mượt mà đáp ứng cả những tựa game nặng nhất, đồng thời chứa khả năng tiết kiệm năng lượng pin giúp người dùng yên tâm dùng máy dài lâu.\r\n\r\nĐánh giá Samsung Galaxy S22 Ultra 5G\r\n\r\nCon chip Qualcomm Snapdragon 8 Gen 1 được sản xuất trên tiến trình 4nm không chỉ mang lại một hiệu năng mạnh mẽ mà còn sở hữu sức mạnh AI mang lại trải nghiệm chụp đêm vượt trội.\r\n\r\nNói về pin, điện thoại được trang bị viên pin dung lượng 5000mAh sẽ cung cấp cho người dùng tới 81 giờ chơi nhạc. Công nghệ sạc nhanh siêu tốc 45W, cùng sạc không dây chuẩn Qi và sạc ngược sẽ giúp Galaxy S22 Ultra trở thành chiếc smartphone đa chức năng nổi bật trong phân khúc. Pin hỗ trợ tiết kiệm năng lượng, cho thời lượng sử dụng trong thời gian dài.\r\n\r\nĐánh giá hiệu năng Galaxy S22 Ultra với Snapdragon 8 Gen 1\r\n\r\nĐánh giá hiệu năng Samsung S22 Ultra với Snapdragon 8 Gen 1\r\n\r\nSau nhiều năm chạy chip Exynos thì S22 Ultra là mẫu điện thoại Samsung chính hãng hiếm hoi tại Việt Nam chạy Snapdragon 8 Gen 1. Trước khi đánh giá hiệu năng, cùng điểm lại một số thông số cấu hình nhé:\r\n\r\n- Vi xử lý: Snapdragon 8 Gen 1\r\n\r\n- Bộ nhớ RAM: 8GB hoặc 12GB.\r\n\r\n- Bộ nhớ trong: 128GB hoặc 256GB hoặc 512GB.\r\n\r\nSau đây là điểm số benchmark được các trang chuyên công nghệ thực hiện.\r\n\r\nĐiểm Geekbench 5 của S22 Ultra PCMag thực hiện:\r\n\r\n- Điểm đa nhân: 3.433 điểm \r\n\r\n- Điểm đơn nhân: 1.232\r\n\r\nĐiểm số này có sự khác biệt so với chip Snapdragon 888 được ra mắt nắm 2020. Cụ thể, điểm đơn lõi tăng 13% và đa lõi tăng 9%. Nhưng trên thang điểm chuẩn của GFXBench thì ở một số tác vụ nhất định, con chip này cho hiệu năng tốt hơn khoảng 20%.\r\n\r\nĐánh giá hiệu năng Galaxy S22 Ultra với Snapdragon 8 Gen 1 - Ảnh 2\r\n\r\nHỗ trợ bút S Pen tiện lợi\r\nTương tự như model tiền nhiệm, điện thoại thông minh Samsung Galaxy S22 Ultra cũng hoàn toàn tương thích với bút cảm ứng S-Pen qua điều khiển không day Air Actions - vốn là điểm đặc trưng của dòng Galaxy Note trước đây. Người dùng có thể dùng S-Pen cho những tác vụ thiết kế, ghi chú nhanh, và điều khiển từ xa với tính hiệu quả vượt trội.\r\n\r\nĐánh giá Samsung Galaxy S22 Ultra 5G\r\n\r\nĐộ chính xác bút S-Pen cao, giúp các ghi chú và tin nhắn của bạn trở nên sinh động, thú vị. Chữ viết tay thành văn bản nhanh chóng hoặc thêm hình ảnh động vào, nâng cao tính chuyên nghiệp và sáng tạo.\r\n\r\nSamsung đã trang bị khe cắm S Pen trên thiết bị giúp người dùng có thể tiện lợi khi sử dụng. Tuy nhiên khác với trước đó là S Pen sẽ có cùng màu với máy thì năm nay, S-Pen sẽ chỉ có màu đen. \r\n\r\nVới bút S Pen, giời đây người dùng Galaxy S22 Ultra có thể thoải mái ghi chú, điều khiển điện thoại như trên các dòng Samsung Note. Bút Spen mới này cũng được cải thiện độ trễ mang lại trải nghiệm dùng chân thực từ viết chữ, vẽ hay ghi chú. \r\n\r\nSamsung Galaxy S22 Ultra hỗ trợ bút S Pen tiện lợi\r\n\r\nKết nối dễ dàng với hệ sinh thái Galaxy\r\nỞ phiên bản điện thoại Samsung S22 Ultra mới, người dùng có thể kết nối với các thiết bị khác một cách dễ dàng thông qua hệ sinh thái Galaxy như Galaxy S22+, Galaxy Tab S8 Ultra, Galaxy Buds Pro, Galaxy Watch 4,…. Nhờ đó, người dùng có thể truy cập vào các ứng dụng trên điện thoại thông qua máy tính Samsung một cách dễ dàng.\r\n\r\nS22 Ultra kết nối dễ dàng với hệ sinh thái Galaxy\r\n\r\nBạn có thể kết nối với Galaxy Tab S8 Ultra, Samsung Notes được đồng bộ hóa cho phép chỉnh sửa. Ngoài ra, việc di chuyển từ màn hình S22 Ultra sang màn hình thiết bị khác thông qua ghép nối giúp người dùng có trải nghiệm màn hình kép.\r\n\r\nThêm vào đó là tính năng Smart Switch cho phpeps chuyển đổi dữ liệu qua thiết bị mới nhanh chóng kể cả các thiết bi cũ khác hệ điều hành.\r\n\r\nKết nối trực tuyến, bảo mật thông tin cá nhân\r\nNgười dùng có thể kết nối với nhau trực tuyến thông qua Google Duo, chia sẻ màn hình để xem video cùng nhau giống IRL. Bên cạnh đó, khi khởi động Samsung Knox, dữ liệu cá nhân của bạn sẽ được bảo mật an toàn.\r\n\r\nKnox Vault bảo vệ thông tin sinh trắc học, trong khi Thư mục bảo mật khóa dữ liệu riêng tư quan trọng. Trang tổng quan Sử dụng quyền mới cho phép xem ứng dụng đang chia sẻ dữ liệu hoặc đang theo dõi người dùng. Bạn cũng có thể cấp hoặc từ chối quyền truy cập theo điều khoản.', 'products/ssgalaxys22ultra.webp', 3, 2, 39990000, GETDATE(), NULL),
(1, N'Samsung Galaxy S23 Ultra 256GB', N'Đặt trước Samsung S23 Ultra nhận ngay nhiều ưu đãi hấp dẫn\r\nSau khi chính thức giới thiệu đến với người dùng vào rạng sáng 02/02 thì Samsung sẽ tiến hành cho người dùng đặt trước mẫu siêu phẩm này. Theo đó, khi người dùng đặt trước Samsung S23 Ultra tại CellphoneS sẽ nhận được nhiều ưu đãi hấp dẫn kèm theo.\r\n\r\nĐặt trước Samsung S23 Ultra nhận ngay nhiều ưu đãi hấp dẫn\r\n\r\nCụ thể như sau:\r\n\r\n- Thu cũ lên đời trợ giá 3 triệu đồng kèm phiếu mua hàng lên tới 5 triệu\r\n\r\n- Hoàn tiền khi thanh toán qua ví điện tử Moca, VNPay,... lên đến 2 triệu đồng\r\n\r\n- Tặng ngay ốp lưng Marvel cho 500 khách hàng đầu tiên (Chỉ có tại CellphoneS)\r\n\r\nĐặt trước Samsung S23 Ultra nhận ngay nhiều ưu đãi hấp dẫn\r\n\r\nĐiện thoại Samsung Galaxy S23 Ultra liệu có gì mới?\r\nSau sự đổ bộ thành công của Samsung Galaxy S22 những chiếc điện thoại dòng Flagship tiếp theo - Điện thoại Samsung Galaxy S23 Ultra là đối tượng được Samfans hết mực săn đón. Kiểu dáng thanh lịch sang chảnh kết hợp với những bước đột phá trong công nghệ đã kiến tạo nên siêu phẩm Flagship nhà Samsung.\r\n\r\nThiết kế cao cấp, đường nét thời thượng, tinh tế\r\nTiếp nối thiết kế từ những chiếc Samsung Galaxy S22 Ultra, những chiếc Galaxy S23 Ultra mang dáng vẻ thanh mảnh với những đường nét được gọt giũa chỉnh chu và cực kỳ tinh tế. Với màn hình tràn viền, tỷ lệ màn hình trên thân máy hơn 90% những chiếc điện thoại S23 Ultra hứa hẹn mang đến một thiết kế thời thượng thu hút mọi ánh nhìn.\r\n\r\nThiết kế Samsung Galaxy S23 Ultra\r\n\r\nVẫn là mặt lưng nguyên khối cùng cụm camera không viền được đặt ở góc trái trên cùng logo Samsung quen thuộc nằm góc dưới mặt lưng tạo cảm giác đơn giản nhưng không kém phần nổi bật cho thiết kế. Thanh lịch nhưng đặc biệt có sức hút, đơn giản mà toát lên sự cao cấp, những chiếc Samsung Galaxy S23 Ultra chắc chắn là sự lựa chọn hoàn hảo khi bình chọn những thiết kế đỉnh cao trong năm 2022.\r\n\r\nThiết kế Samsung Galaxy S23 Ultra\r\n\r\nDiện mạo của những chiếc Samsung Galaxy S23 Ultra có khả năng thu hút bất tận với chuỗi màu sắc đa dạng mà không kém phần thanh lịch, dòng điện thoại này ngay lập tức tạo nên định nghĩa vẻ đẹp công nghệ mới cho người dùng ngay khi chạm mắt.\r\n\r\nThiết kế Samsung Galaxy S23 Ultra\r\n\r\nBên cạnh đó, Samsung còn sử dụng vật liệu tái chế thân thiện với môi trường trên S23 Ultra. Theo đó các lớp kính phủ đến màu sơn đều là những điểm nhấn độc đáo trên mẫu flagship này.\r\n\r\nChipset Snapdragon 8 Gen 2, khả năng đa nhiệm đỉnh cao\r\nĐể phục vụ tốt nhu cầu đa nhiệm ngày càng nhiều của người tiêu dùng, những chiếc điện thoại Samsung ngày càng sở hữu cho mình chipset khủng và khả năng xử lý mạnh mẽ. Những chiến binh Samsung Galaxy S23 Ultra cũng không nằm ngoài xu hướng và để đảm bảo khả năng xử lý cho mình, Samsung Galaxy S23 Ultra sử dụng chipset Snapdragon 8 Gen 2 Mobile Platform for Galaxy. Chipset này hứa hẹn mang đến khả năng xử lý mạnh mẽ cân mọi thao tác đặc biệt có thể chạy nền cùng lúc nhiều ứng dụng mà không gây giật lag.\r\n\r\nHiệu năng Samsung Galaxy S23 Ultra\r\n\r\nRam 8GB đến 12GB được trang bị trên Samsung Galaxy S23 Ultra hứa hẹn mang đến sự đột phá cho thiết bị này và giúp xử lý dễ dàng mọi thao tác dù là ứng dụng chuyên nghiệp đòi hỏi dung lượng Ram lớn.\r\n\r\nDung lượng bộ nhớ tiêu chuẩn của dòng máy này là 256GB hứa hẹn mang đến khả năng lưu trữ tuyệt vời giúp người dùng như được trang bị thêm thư viện mini có thể mang theo mọi lúc mọi nơi mà không lo lắng về khả năng tràn bộ nhớ.\r\n\r\nMáy ảnh 200MP đột phá công nghệ nhiếp ảnh\r\nSiêu smartphone có khả năng nhiếp ảnh đỉnh cao vẫn đang là xu hướng và dự kiến sẽ còn là xu hướng trong tương lai bởi vậy các dòng smartphone ra mắt trên thị trường ngày càng quan tâm đến khả năng nhiếp ảnh. Samsung là cái tên đầu ngành với sự quan tâm đặc biệt đến lĩnh vực này, những chiếc flagship của công ty công nghệ hàng đầu Hàn Quốc này càng ngày càng có khả năng nhiếp ảnh vượt trội.\r\n\r\nCamera Samsung Galaxy S23 Ultra\r\n\r\nSamsung Galaxy S23 Ultra dường như bứt phá mọi giới hạn nhiếp ảnh điện thoại khi trang bị cho mình ống kính chính có độ phân giải lên đến 200 MP. Khả năng chụp đêm vượt trội cùng những khung hình góc siêu rộng vẫn được phát triển ở chiếc điện thoại này giúp người dùng có được những bức ảnh cực nghệ và có tính đương đại.\r\nDàn camera phụ cực chất có thêm các tính năng cảm biến độ rộng, cảm biến chiều sâu giúp bức ảnh chân thực và mang tính thời đại hơn. Camera selfie 12MP mang đến khả năng tự chụp ấn tượng và giúp bạn có những bức ảnh đẹp siêu thực mà không cần trải qua bộ lọc hay ứng dụng chỉnh sửa ảnh.\r\n\r\nCamera Samsung Galaxy S23 Ultra\r\n\r\nĐặc biệt, chế độ Expert RAW trên S23 Ultra hỗ trợ chụp ảnh với chi tiết cao. Với Expert RAW người dùng có thể sử dụng để chụp chồng hình, chụp thiên văn (chụp bầu trời, chùm sao) với độ sắc nét cao. Tính năng chụp chồng hình với khả năng chụp 9 tấm hình liên tiếp và kết hợp lại mang lại kết quả là những bức hình đậm chất nghệ thuật.\r\n\r\nMàn hình 6.8 inch – độ cong giảm nâng cao trải nghiệm hình ảnh\r\nSamsung S23 Ultra vẫn được trang bị một màn hình lớn với kích thước lên đến 6.8 inch. Tuy nhiên, thay vì làm cong như thế hệ S22 Ultra thì độ con màn hình trên S23 Ultra sẽ giảm bớt. Nhờ thiết kế này diện tích bề mặt phẳng trên màn hình sẽ gia tăng giúp mang lại những trải nghiệm hình ảnh tốt nhất cho người dùng.\r\n\r\nMàn hình Samsung Galaxy S23 Ultra\r\n\r\nMàn hình Samsung S23 Ultra với công nghệ Dynamic AMOLED 2X mang lại khả năng tái hiện lại các chi tiết một cách hoàn hảo kể cả khi người dùng điều chỉnh độ sáng ở mức cao hoặc thấp nhất. Màn hình với tần số quét 120Hz tối ưu trong các chuyển động cuộn mang lại trải nghiệm giải trí tuyệt vời.\r\n\r\nMàn hình Samsung Galaxy S23 Ultra\r\n\r\nPin 5000 mAh – cung cấp năng lượng bền bỉ\r\nĐiện thoại Samsung S23 Ultra sẽ được trang bị viên pin dung lượng lớn 5000 mAh. Mức dung lượng này tuy không có sự khác biệt so với người tiền nhiệm S22 Ultra nhưng với nhiều tùy biến về phần mềm cùng con chip mới giúp mang lại thời gian sử dụng bền bỉ.\r\n\r\nPin Samsung Galaxy S23 Ultra\r\n\r\nKhông chỉ với dung lượng lớn, điện thoại Samsung S23 Ultra còn được trang bị chế độ siêu tiết kiệm pin giúp kéo dài thời gian sử dụng, đặc biệt ở những trường hợp khẩn cấp.\r\n\r\nSamsung Galaxy S23 Ultra - chiếc điện thoại bền bỉ \r\nKhả năng kháng nước và chống va đập vẫn được trang bị trên Samsung Galaxy S23. Theo đó dòng điện thoại này và Spen đi cùng đều có khả năng kháng nước đạt chuẩn IP68. Combo giáp Armor Aluminum bao quanh khung viền máy kết hợp kính cường lực Corning® Gorilla® Glass Victus®+ hứa hẹn khiến Samsung Galaxy S23 Ultra trở thành 1 tanker với khả năng chống chịu cực bền bỉ.\r\n\r\nBên cạnh đó, SPen vẫn là công cụ phụ trợ không thể thiếu. Với độ nhạy bén và chính xác gần như tuyệt đối, SPen mang đến cho người dùng những quyền năng tối thượng để có thể tối ưu hóa mọi thao tác trên chiếc điện thoại này.\r\n\r\nSamsung Galaxy S23 Ultra - chiếc điện thoại bền bỉ  \r\n\r\nKhả năng điều khiển từ xa và đồng bộ hóa mọi dữ liệu đã tạo nên 1 hệ sinh thái Samsung cực đẳng cấp và xuyên suốt giúp bạn có thể làm việc, tiếp nhận thông tin từ mọi nơi chỉ cần có thiết bị điện tử samsung bên cạnh.\r\n\r\nBảng thông số cấu hình chi tiết các sản phẩm Samsung Galaxy S23 Series\r\nThông số\r\n\r\nSamsung Galaxy S23 Ultra\r\n\r\nSamsung Galaxy S23 Plus\r\n\r\nSamsung Galaxy S23\r\n\r\nKích thước màn hình\r\n\r\n6.8 inch\r\n\r\n6.6 inch\r\n\r\n6.1 inch\r\nMàu sắc\r\n\r\nXanh Botanic\r\n\r\nĐen Phantom\r\n\r\nTím Lilac\r\n\r\nKem Cotton\r\n\r\nXanh Botanic\r\n\r\nĐen Phantom\r\n\r\nTím Lilac\r\n\r\nKem Cotton\r\n\r\nXanh Botanic\r\n\r\nĐen Phantom\r\n\r\nTím Lilac\r\n\r\nKem Cotton\r\n\r\nMàu sắc đặc quyền\r\n\r\nXanh Lime\r\n\r\nXanh SkyBlue\r\n\r\nXám Graphite\r\n\r\nĐỏ Lychee\r\n\r\nXanh Lime\r\n\r\nXám Graphite\r\n\r\nXanh Lime\r\n\r\nXám Graphite\r\n\r\nCông nghệ màn hình\r\n\r\nDynamic AMOLED 2X\r\n\r\nDynamic AMOLED 2X\r\n\r\nDynamic AMOLED 2X\r\nĐộ phân giải\r\n\r\n3088 x 1440 (Edge Quad HD+)\r\n\r\n2340 x 1080 (Màn hình phẳng FHD+)\r\n\r\n2340 x 1080 (Màn hình phẳng FHD+)\r\nTần số màn hình\r\n\r\nTần số quét tương thích\r\n1~120Hz\r\n\r\nTần số quét tương thích\r\n48~120Hz\r\n\r\nTần số quét tương thích\r\n48~120Hz\r\n\r\nCamera sau\r\n\r\n200MP + 12MP + 10MP + 10MP\r\n\r\n50MP + 12MP + 10MP\r\n\r\n50MP + 12MP + 10MP\r\nCamera trước\r\n\r\n12MP	12MP	12MP\r\nBộ vi xử lý (CPU)\r\n\r\nSnapdragon 8 Gen 2	Snapdragon 8 Gen 2	Snapdragon 8 Gen 2\r\nBộ vi xử lý đồ hoạ (GPU)\r\n\r\nAdreno 740	Adreno 740	Adreno 740\r\nRAM\r\n\r\n8GB	8GB	8GB/ 12GB\r\nBộ nhớ trong\r\n\r\n256GB/512GB/1TB	256GB/512GB	128GB/ 256GB\r\nPin\r\n\r\n5000mAh	4700mAh	3900mAh\r\nCổng sạc\r\n\r\nUSB Type-C	USB Type-C	USB Type-C\r\nSố lượng thẻ Sim\r\n\r\n2 SIM (Nano SIM)	2 SIM	2 SIM (Nano SIM)\r\nCông nghệ NFC\r\n\r\nCó	Có	Có\r\nHỗ trợ mạng\r\n\r\n5G	5G	5G\r\nBluetooth\r\n\r\nWi-Fi 802.11 a/b/g/n/ac/6e\r\n\r\ntri-band\r\n\r\nWi-Fi Direct\r\n\r\nWi-Fi 802.11 a/b/g/n/ac/6e\r\n\r\ntri-band\r\n\r\nWi-Fi Direct\r\n\r\nWi-Fi 802.11 a/b/g/n/ac/6e\r\n\r\ntri-band\r\n\r\nWi-Fi Direct\r\n\r\nGPS\r\n\r\nCó	Có	GPS, GLONASS, BDS, GALILEO\r\nChỉ số kháng nước, bụi\r\n\r\nIP68	IP68	IP68\r\nKích thước\r\n\r\n163.4 x 78.1 x 8.9 mm	157.8 x 76.2 x 7.6 mm	146.3 x 70.9 x 7.6 mm\r\nGiá bán các phiên bản S23 Series\r\nVới những thông số kỹ thuật siêu đỉnh của mình, Samsung Galaxy S23 Series chắc chắn sẽ là thế hệ flagship tiếp theo của tập đoàn Samsung. Trong lần “hạ cánh” vào năm 2023 này, S23 Series được cho rằng sẽ tạo nên một cơn sốt trên thị trường smartphone, đem tới một sản phẩm công nghệ hiện đại, dẫn đầu xu thế điện thoại thông minh.\r\n\r\nDung lượng pin Samsung S23 Ultra không thay đổi\r\n\r\nSau khi chính thức được ra mắt vào rạng sáng 02/02 vừa qua thì giá bán chính thức các phiên bản của series S23 rất được nhiều người tiêu dùng quan tâm. Dưới đây là một vài thông tin về giá bán của Galaxy S23 Series tại thị trường Việt Nam mà bạn có thể tham khảo.\r\n\r\nSamsung S23 thường giá bao nhiêu tại Việt Nam?\r\nBản tiêu chuẩn của smartphone Samsung Galaxy S23 sẽ được chào bán với mức giá 799 USD trên thị trường quốc tế và có thể lên tới 1199 USD ở phiên bản max cấu hình. Tại Việt Nam, Galaxy S23 bản tiêu chuẩn sẽ có giá thành dự kiến tại các đại lý bán lẻ là 24.990.000 VND. So với phiên bản tiền nhiệm đã được ra mắt trước đó là S22 bản tiêu chuẩn thì dường như S23 có giá thành cao hơn một chút.\r\n\r\nSamsung S23 thường bao nhiêu tiền tại Việt Nam?\r\n\r\nĐiều đó cũng có thể dễ dàng được lý giải bởi những nâng cấp vượt trội mà Samsung đã tích hợp cho thiết bị này, đem tới những trải nghiệm vô cùng mượt mà, ấn tượng. Đối với một thiết bị cao cấp như Samsung Galaxy S23 thì đây là một mức giá hợp lý và nằm trong khả năng có thể chi trả được của người tiêu dùng Việt Nam.\r\n\r\nSamsung S23 Plus giá bao nhiêu tại Việt Nam?\r\nBên cạnh Samsung Galaxy S23 phiên bản tiêu chuẩn thì giá thành của Samsung S23 Plus tại Việt Nam cũng nhận được nhiều sự quan tâm của người dùng. Cụ thể, phiên bản Plus của S23 sẽ có mức giá 999 USD tại thị trường quốc tế ở phiên bản 256GB bộ nhớ trong. Tại Việt Nam, giá của S23 Plus sẽ khoảng 26.990.000 VND cho phiên bản cấu hình chuẩn.\r\n\r\nSamsung S23 Plus bao nhiêu tiền tại Việt Nam?\r\n\r\nChi tiết như sau:\r\n\r\n-   Samsung Galaxy S23 Plus 8GB – 256GB: 26.990.000 đồng\r\n-   Samsung Galaxy S23 Plus 8GB – 512GB: 29.990.000 đồng\r\nVới những ưu điểm vượt trội của mình cùng giá thành hợp lý, Samsung Galaxy S23 Plus sẽ là một trong những thiết bị smartphone đáng để lựa chọn nhất năm 2023.\r\n\r\nSamsung S23 Ultra giá bao nhiêu tiền tại Việt Nam?\r\nDanh sách báo giá này chắc chắn sẽ không thiếu sự góp mặt của Samsung Galaxy S23 Ultra. Thuộc phân khúc dòng sản phẩm cao cấp nhất của Samsung chuẩn bị được ra mắt trong năm 2023 này, tất nhiên S23 Ultra sẽ là đối tượng được quan tâm nhất cả về thiết kế, cấu hình lẫn giá khởi điểm.\r\n\r\nSamsung S23 Ultra bao nhiêu tiền tại Việt Nam?\r\n\r\nVề giá bán thì đây cũng là phiên bản sở hữu giá bán cao nhất. Theo đó Samsung S23 Ultra sẽ có mức giá 1199 USD trên thị trường quốc tế, tức là khoảng 31.990.000 VND tại thị trường Việt Nam. Dù là thiết bị cao cấp nhất của Samsung, sở hữu hàng loạt những cải tiến hiện đại nhưng giá thành của sản phẩm lại khá ưu đãi. So với Samsung S22 Ultra đã được ra mắt trước đó thì giá thành của S23 Ultra cũng không có sự chênh lệch là bao.\r\n\r\nTổng hợp đánh giá các chuyên gia về điện thoại Samsung S23 Ultra\r\nKhông chỉ nhận được lời khen từ người dùng cơ bản, Samsung S23 series cũng nhận được rất nhiều quan tâm của giới chuyên gia:\r\n\r\n- Huy NL (Giám đốc SChannel): “Galaxy S23 Ultra camera 200MP chụp đêm như ngày, hiệu năng siêu mạnh mẽ đi kèm bút S Pen đa năng. Máy được hoàn thiện từ vật liệu tái chế giúp bảo vệ môi trường, rất nhân văn\".\r\n\r\n- Tony Phùng (Tony Phung Studio): \"Galaxy S23 Ultra là thiết bị hoàn hảo nhất cho công việc ở thời điểm này. Hiệu năng mạnh mẽ, đa nhiệm tuyệt vời, S-Pen đỉnh cao hỗ trợ quá tốt. Đặc biệt hệ thống Camera xứng danh top 1 thế giới smartphone. Xuất sắc từ khả năng chụp hình và quay video trong những môi trường thiếu sáng\"\r\n\r\n- Rương Công Nghệ (Vat Vo Studio): \"Galaxy S23 Ultra là thiết bị mang đến cho mình trải nghiệm \"Ultra\" tốt nhất từ trước đến nay: Camera 200MP cho ảnh nhiều chi tiết, hiệu năng tốt, màn hình hiển thị xuất sắc, phần mềm ổn định hơn nhiều và pin khỏe đến không tưởng. Đây có thể coi là bước khởi đầu cho một kỷ nguyên S Ultra mới bùng nổ về sau\"\r\n\r\nTổng hợp đánh giá các chuyên gia về điện thoại Samsung S23 Ultra\r\n\r\n- Anh Tuấn Ngọc (Relab): “Galaxy S23 series, đặc biệt là phiên bản Ultra là những chiếc điện thoại hoàn thiện nhất của Samsung trong nhiều năm qua. Đây là một chiếc máy gần như không có điểm yếu từ thiết kế, màn hình, hiệu năng cho đến camera.”\r\n\r\n- Anh Huỳnh Thủy (Cộng Đồng SamsungViet): “Bên cạnh camera siêu phân giải 200MP, Galaxy S23 Ultra gây bất ngờ với Thời lượng sử dụng pin ấn tượng cũng như một cảm giác rất \"Note\". Trải nghiệm quay phim có sự thay đổi rõ rệt khiến một người từng không mấy mặn mà với quay phim mà phải quay xe với Galaxy S23 Ultra”\r\n\r\n- Siêu mẫu Thanh Hằng: “Galaxy S23 Ultra có bộ khung vuông vức, tạo cảm giác cho mọi người nhớ về dòng Note nhiều. Máy vuông vức, cầm rất là chắc, mạnh mẽ” \r\n\r\n- Anh Hưng Khúc: “Galaxy S23 Ultra là một trong những sản phẩm mình thấy rất xứng đáng để xuống tiền, vì những thứ mà anh em tiếp xúc nhiều nhất, như là thiết kế, camera, hiệu năng, thời lượng pin,…thì nó đã được Samsung tối ưu quá tốt.”\r\n\r\n- Chị Đan Anh: “Một chiếc điện thoại mà cầm lên mình sẽ luôn có đầy cảm hứng sáng tạo. Từ ống kính camera 200MP tạo ra những nội dung ấn tượng, chất lượng cho bộ ảnh và video của mình; cho đến chiếc bút S-Pen để mình hí hoáy mọi nơi, đặc biệt khi có ý tưởng ập đến ngay lúc đó.”', 'products/s23-ultra-tim.webp', 3, 2, 31990000, GETDATE(), NULL),
(1, N'Samsung Galaxy A73 (5G) 256GB', N'Năm 2022 hứa hẹn sẽ là một năm rất đáng trông đợi đối với những ai là fan của thương hiệu điện thoại Samsung. Mới đây, hãng sẽ tiếp tục cho ra mắt nhiều smartphone với sự cải tiến trong thiết kế và cấu hình, trong đó phải kể đến chiếc Samsung A73 với nhiều cải tiến so với thế hệ trước. Vậy sản phẩm có gì nổi bật, giá bao nhiêu và liệu có nên mua không? Tìm hiểu ngay nhé!\r\n\r\nTại sao nên mua Samsung Galaxy A73?\r\n5G thần tốc: mang cho bạn trải nghiệm đỉnh cao với tốc độ kết nối mạnh mẽ. Bạn có thể thoải mái tận hưởng và chia sẻ tức thì mọi nội dung giải trí cũng như kết nối với mọi người một cách nhanh chóng.\r\nKhả năng đa nhiệm được tối ưu: Được trang bị Snapdragon® 778G 5G, Galaxy A73 5G thay đổi hoàn toàn nâng tầm thói quen đa nhiệm với khả năng chơi game chuyên nghiệp. AI được tăng tốc để có hiệu suất thông minh hơn và trải nghiệm chụp ảnh cao cấp. Ngoài ra, khi bạn cần nhiều bộ nhớ hơn, RAM Plus  của A73 ngay lập tức cung cấp thêm RAM ảo.\r\nThoải mái lưu giữ mọi khoảnh khắc: Bạn có thể lưu giữ những khoảnh khắc quý giá của mình nhiều hơn nhờ bộ nhớ trong 128GB/256GB.\r\nMàn hình sắc nét: Công nghệ FHD+ Super AMOLED Plus với Màn hình Infinity-O 6,7\" mở rộng, các khung hình được chụp bằng máy ảnh Góc rộng 108MP giữ trọn vẹn các chi tiết sống động như thật. Người dùng có thể tận hưởng khả năng hiển thị ngoài trời sống động lên đến 800 nits¹ hoặc bảo vệ mắt tối ưu với chức năng giảm ánh sáng xanh Eye Comfort Shield². Bạn có thể thoả thích xem mọi nội dung nhờ tần số quét 120Hz công nghệ Super AMOLED Plus để tận hưởng những khung hình mượt mà, không mờ nhoè, siêu chi tiết và độ tương phản sắc nét.\r\nBộ Camera bắt nét tuyệt hảo: Camera Góc Rộng độ phân giải cực lớn 108MP thu được nhiều ánh sáng và chi tiết hơn để mang đến độ rõ nét chưa từng có. Chụp đám đông bằng Camera Góc Siêu Rộng, tùy chỉnh tiêu điểm bằng Camera Xoá Phông và chụp siêu chi tiết bằng Camera Macro.\r\nPin cực lớn, dùng đến 2 ngày: Pin 5.000mAh cho bạn thêm nhiều thời gian để livestream, chia sẻ, chơi game và nhiều hơn nữa. Galaxy A73 làm đầy pin với Sạc siêu nhanh đến 25W và khởi động tính năng thích ứng thói quen sử dụng để nâng cao hiệu suất của pin.\r\nTại sao nên mua Samsung Galaxy A73?\r\n\r\nGalaxy A73 5G được nâng cấp gì so với A72?\r\nSmartphone cao cấp nhất dòng Galaxy A series là điện thoại Samsung Galaxy A73 5G có nhiều cải tiến so với thế hệ tiền nhiệm đặc biệt là màn hình 120Hz và hệ thống camera sau 108MP ấn tượng cùng bộ vi xử lý mạnh mẽ hơn. Sau đây là bảng so sánh thông số cấu hình giữa hai điện thoại bạn có thể tham khảo:\r\n\r\nSamsung A73 5G\r\n\r\nSamsung A72\r\n\r\nGiá niêm yết\r\n\r\n12.990.000\r\n\r\n11.490.000\r\n\r\nMàu sắc\r\n\r\nĐen, trắng và xanh bạc hà\r\n\r\nTrắng, xanh, tím, đen\r\n\r\nTrọng lượng\r\n\r\n181 gam\r\n\r\n203g\r\n\r\nMàn hình\r\n\r\nSuper AMOLED\r\n\r\n 6.7 inch\r\n\r\nTần số quét 120Hz\r\n\r\nSuper AMOLED\r\n\r\n6.7 inches\r\n\r\nCamera sau\r\n\r\nCamera chính 108 MP\r\n\r\nCamera góc siêu rộng 12 MP\r\n\r\nCamera đo chiều sâu 5 MP\r\n\r\nCamera macro 5 MP\r\n\r\nCamera góc rộng: 64 MP\r\n\r\nCamera tele: 8 MP\r\n\r\nCamera góc siêu rộng: 12 MP\r\n\r\nCamere macro: 5 MP\r\n\r\nCamera trước\r\n\r\n32 MP\r\n\r\n32 MP\r\n\r\nHiệu năng\r\n\r\nSnapdragon 778G\r\n\r\nSnapdragon 720G\r\n\r\nPin\r\n\r\n5000 mAh, sạc nhanh 25W\r\n\r\nLi-Ion 5000 mAh, sạc nhanh 25W\r\n\r\nĐánh giá Samsung Galaxy A73 chi tiết\r\nĐiện thoại cao cấp nhất dòng Galaxy A series sở hữu nhiều nâng cấp đáng giá so với thế hệ trước, từ ngoại hình cho đến hiệu năng, đặc biệt là hệ thống camera. Sau đây là những đánh giá chi tiết về chiếc Samsung A73 giúp bạn có cái nhìn tổng quan nhất về chiếc smartphone cận cao cấp này.\r\n\r\nThiết kế Samsung A73 sang trọng, màn hình Super AMOLED\r\nTrước khi mua bất kỳ chiếc điện thoại nào, người dùng cũng sẽ quan tâm đến thiết kế sản phẩm trước. Với phiên bản A73, Samsung đã tạo nên một chiếc smartphone với vẻ ngoài mang đến cảm giác sang trọng và tinh tế.\r\n\r\nSamsung Galaxy A73 được thiết kế gọn nhẹ với tiêu chí đáp ứng khả năng mang theo để tiện đi lại cho người dùng. Giờ đây, bạn có thể mang theo chiếc smartphone bên cạnh đến bất cứ đâu, bất cứ lúc nào.\r\n\r\nThiết kế Samsung A73 sang trọng\r\n\r\nKích thước và trọng lượng của chiếc điện thoại rất vừa phải và dĩ nhiên sẽ không chiếm quá nhiều diện tích trong túi xách và có thể di chuyển dễ dàng.\r\n\r\nMáy được trang bị mặt lưng thiết kế nhám mờ sang trọng, khác biệt với thiết kế với các hiệu ứng đổi màu của các smartphone khác cùng phân khúc trên thị trường. Mặt lưng nhám này giúp A73 loại bỏ hiệu quả tình trạng bám mồ hôi và vân tay. Thiết kế cụm camera cũng có sự thay đổi khi tách bạch hoàn toàn với mặt lưng thông qua thiết kế nhô cao. Phần viền camera được thiết kế khá cách điệu mang lại cảm giác mềm mại.\r\n\r\nThiết kế Samsung A73 sang trọng\r\n\r\nMáy cũng sẽ được trang bị chuẩn kháng nước và bụi bẩn IP67 vô cùng tiện lợi. Và kể khả năng chống nước được tốt hơn, Samsung A73 cũng sẽ không được trang bị jack 3.5mm.\r\n\r\nVề màn hình, tương tự như đa số chiếc smartphone thế hệ mới sau này của hãng Samsung đã trang bị cho điện thoại một chiếc màn hình cảm ứng Super AMOLED với kích thước rất lớn lên đến 6,7 inch.\r\n\r\nSamsung A73 có thiết kế sang trọng, màn hình Super AMOLED\r\n\r\nVới kích thước này, chúng ta cũng có hình dung được màn hình của siêu phẩm Galaxy A73 sẽ được mở rộng không gian thêm rất nhiều. Tỷ lệ khung hình lên thân máy có thể đạt tới hơn 95% cho bạn thỏa mãn về khoản nhìn.\r\n\r\nNgoài ra, màn hình của Samsung A73 còn có độ phân giải cao Full HD+ 1080 x 2400 pixels cùng tỷ lệ khung hình 20:9, thêm vào đó là mật độ điểm ảnh là 393 pixels/inch, cho phép hình ảnh được cải thiện rõ rệt.\r\n\r\nMàn hình Galaxy A73 có độ phân giải cao Full HD+\r\n\r\nVới những điểm vượt trội trong thiết kế màn hình như trên, sẽ chẳng có gì ngạc nhiên khi người dùng có thể thưởng thức chất lượng khung hình siêu nét cũng như chuyển động mượt mà khi sử dụng phiên bản Samsung A73 của gã khổng lồ công nghệ Hàn Quốc.\r\n\r\nĐộ sâu cũng như mức độ chi tiết của hình ảnh là điều không cần phải bàn cãi. Thêm vào đó, màu sắc của hình ảnh hiển thị trên màn hình chiếc Galaxy A73 cũng được phản ánh một cách chân thực, giữ được đầy đủ độ tươi và sáng.\r\n\r\nHiệu năng mạnh mẽ với chip xử lý Snapdragon 778G\r\nVề hiệu năng, Samsung Galaxy A73 có thể hoạt động một cách mượt mà là nhờ vào chip xử lý Snapdragon 778G sản xuất bởi Qualcomm với bộ xử lý tám nhân Octa-core hiện đại.\r\n\r\nVới một chip xử lý như trên, chiếc điện thoại A73 của bạn có thể đảm nhiệm nhiều tác vụ cùng lúc, từ nhẹ đến nặng một cách thoải mái và trơn tru. Bộ xử lý đồ họa GPU Adreno được trang bị giúp cấu hình thêm mạnh mẽ.\r\n\r\nSamsung Galaxy A73 có hiệu năng mạnh mẽ với chip xử lý Snapdragon SDM675 730 \r\n\r\nSamsung A73 Benchmark\r\nKhi chấm điểm hiệu năng, Samsung Galaxy A73 cho hơn 470.000 điểm trên Benchmark, trong đó có 138818 điểm CPU và 155712 điểm GPU. Với mức cấu hình và độ họa này, máy cho trải nghiệm ổn ở các tựa game tầm trung. Ở một số phần mềm khác, điểm hiệu năng thu được lần lượng là GeekBench 5: 778 điểm đơn nhân và 2.871 điểm đa nhân, trên PCMark đạt 11.512 điểm.\r\n\r\nĐánh giá Samsung A73 - Hiệu năng mượt mà\r\n\r\nVới bài test kiểm tra khả năng xử lý đồ họa 3DMark Wild Life Extreme, điện thoại cho tổng điểm 692 và tốc độ khung hinhg là 4.10.\r\n\r\nSamsung A73 Benchmark\r\n\r\nTrong các trải nghiệm game thực thế, ở tựa game Play Together, cài đặt tốc độ khung cao cùng độ phân giải đề xuất thì thiết bị cho trải nghiệm chơi mượt, kể cả trong các phân cảnh đong người như đại sảnh. Đặc biệt, khi tiến vào khu vực Game Zone, Samsung A73 vẫn đạt tốc độ khung hình lên tới 120Hz.\r\n\r\nĐánh giá Samsung A73 - Hiệu năng mượt mà - Ảnh 2\r\n\r\nỞ tựa game quốc dân Liên Quân Mobile thì mọi thao tác từ di chuyển, múa skill đến tung chưởng đều có thể thực hiện một cách uyển chuyển, hầu như không sảy ra tình trạng trễ hay giật lag.\r\n\r\nĐánh giá Samsung A73 - Hiệu năng mượt mà - Ảnh 3\r\n\r\nKhi trải nghiệm Call Of Duty Mobile ở mức thiết lập độ họa cao cùng số khung hình tối đa, Samsung A73 vẫn mang lại trải nghiệm tối với các thao tác nhạy và mượt. Tuy nhiên, đôi khi thiết bị vẫn sảy ra các tình trạng giật nhẹ khung hình với mức FPS giao động từ 50 – 60.\r\n\r\nĐánh giá Samsung A73 - Hiệu năng mượt mà - Ảnh 4\r\n\r\nTuy nhiên với những game nặng như Genshin Impact thì thiết bị vẫn cho trải nghiệm chưa thực sự tốt.\r\n\r\nVề dung lượng, bạn sẽ có thêm nhiều không gian để lưu trữ và tải ứng dụng nặng khi bản Galaxy A73 được trang bị một RAM 8GB cũng như một bộ nhớ có dung lượng rất lớn 256GB, do đó không phải lo bộ nhớ dễ đầy.\r\n\r\nHệ thống camera ấn tượng\r\nMột điểm sáng nổi bật khi nói đến khả năng chụp ảnh của chiếc Samsung A73 là chiếc điện thoại được nhà sản xuất hỗ trợ một hệ thống camera gồm tới 4 bộ cảm biến ở phía sau với chất lượng độ phân giải khác nhau. So với Samsung A72, thiết bị đã lược bỏ ống kinh zoom quang 3x và tele, đồng thời thay thế bằng một cảm biến chiều sâu.\r\n\r\nSamsung A73 sở hữu hệ thống camera ấn tượng\r\n\r\nĐiện thoại thông minh Galaxy A73 sở hữu bộ bốn camera với độ phân giải lần lượt là camera chính 108MP, một cảm biến chụp góc rộng 12MP, một cảm biến macro 5MP, một cảm biến chiều sâu 5MP.\r\n\r\nCụm camera ở điều kiện đầy đủ sáng mang lại bức hình chất lượng với các chi tiết như vật thể, vùng trời, cỏ cây đều được tái hiện rõ ràng với đầy đủ màu sắc. Khi chụp ảnh ngược sáng các chi tiết vẫn mang lại chất lượng, chi tiết hình ảnh tốt.\r\n\r\nNgoài chụp ảnh sắc nét, Galaxy A73 còn hỗ trợ nhiều chế độ quay phim chất lượng cao như 4K, 1080p, 1080p. Camera trước 32 MP cho bạn những tấm ảnh selfie đẹp mắt và sống động.\r\n\r\nDung lượng pin 5000mAh, hỗ trợ mạng 5G\r\nSamsung Galaxy A73 còn được trang bị một chiếc pin dung lượng 5000mAh kèm theo chế độ sạc nhanh. Nhờ đó, bạn có thể rút ngắn thời gian chờ đợi một cách đáng kể khi chưa đầy 60 phút là điện thoại sẽ được sạc đầy ngay.\r\n\r\nCụ thể, thiết bị có 24% (tương được 4 giờ) cho trải nghiệm Youtube, 2 tiếng chơi  Liên Quân mát 15.7%, 2 tiếng chơi Genshin Impact mất thêm 34%. Nhìn một cách tổng thể, Samsung A73 cho thời gian sử dụng khá tốt. Nếu sử dụng liên tục với hỗn hợp các tác vụ, điện thoại cho thời lượng sử dụng lên đến 8 tiếng. Nếu sử dụng ở tần suất cơ bản, thỉnh thoảng chơi game hay nhắn thì thì việc sử dụng lên đến 2 ngày hoàn toàn có thể sảy ra.\r\n\r\nSamsung Galaxy A73 có dung lượng pin 4500mAh, hỗ trợ mạng 5G\r\n\r\nNgoài ra, phiên bản Galaxy A73 còn có hỗ trợ mạng 5G. Đây là mạng sẽ cho tốc độ truyền tải tốt hơn gấp nhiều lần so với 4G hiện tại. Thêm vào đó, mạng 5G còn có ưu điểm khác là độ trễ thấp, công suất lớn.\r\n\r\nCác câu hỏi thường gặp\r\nKhi có bất cứ câu hỏi nào về Samsung Galaxy A73 5G, quý khách đừng ngại ngần liên hệ ngay với CellphoneS qua số điện thoại 1800.2097, Fanpage CellphoneS hoặc nhắn tin trò truyện ngay trên Website với tư vấn viên để được giải đáp nhanh chóng nhất!\r\n\r\nĐiện thoại Samsung Galaxy A73 5G giá bao nhiêu?\r\nSamsung A73 giá bao nhiêu tiền có đắt không khi đây là sản phẩm thuộc phân khúc cận cao cấp của Samsung? Nhìn chung giá bán điện thoại Samsung A73 khá vừa phải so với cấu hình thiết bị mang mại, hiện Samsung A73 được bán với giá niêm yết khoảng 12.990.000 đồng. Tuy nhiên giá bán chính thức với nhiều ưu đãi cùng khuyến mãi chỉ còn khoảng gần 12 triệu đồng.\r\n\r\nGiá bán Samsung A73 chi tiết như sau:\r\n\r\nPhiên bản Samsung Galaxy A73 5G	\r\nGiá bán chính hãng\r\n\r\nGiá bán niêm yết\r\n\r\nSamsung Galaxy A73 128GB Xanh\r\n\r\nGiá chỉ từ 11.990.000 VND\r\n\r\n11.990.000 VND\r\n\r\nSamsung Galaxy A73 128GB Trắng\r\n\r\nGiá chỉ từ 11.990.000 VND\r\n\r\n11.990.000 VND\r\n\r\nSamsung Galaxy A73 128GB Xám\r\n\r\nGiá chỉ từ 11.990.000 VND\r\n\r\n11.990.000 VND\r\n\r\nSamsung Galaxy A73 (5G) 256GB Xanh\r\n\r\nGiá chỉ từ 11.990.000 VND\r\n\r\n12.990.000 VND\r\n\r\nSamsung Galaxy A73 (5G) 256GB Trắng\r\n\r\nGiá chỉ từ 11.990.000 VND\r\n\r\n12.990.000 VND\r\n\r\nSamsung Galaxy A73 (5G) 256GB Xám\r\n\r\nGiá chỉ từ 11.990.000 VND	12.990.000 VND\r\n* Lưu ý: Giá bán chỉ có tính chất tham khảo, có thể thay đổi liên tục theo từng chương trình khuyến mãi hiện hành.\r\n\r\nHiện tại CellphoneS đang có chương trình khuyến mãi giảm giá 12.990.000 ₫ chỉ còn 11.990.000 ₫ trong tháng 2/2023. Ngoài ra, CellphoneS cũng có nhiều chương trình khuyến mãi khác dành cho Samsung Galaxy A73 như:\r\n\r\nThu cũ đổi mới - Trợ giá đến 300.000đ\r\nƯu đãi combo grab mart trị giá 200.000đ\r\nGalaxy A73 giá bao nhiêu tiền?\r\n\r\nĐược định vị ở phân khúc cận cao cấp, do đó điện thoại Galaxy A73 sẽ có giá bán niêm yết là 11.99 và 12.99 triệu đồng lần lượt cho phiên bản 128GB và 256GB. Trong đó, phiên bản 256GB hiện đang được bán độc quyền tại hệ thống bán lẻ CellphoneS với mức giá cực kỳ ưu đãi.\r\n\r\nVới tầm giá trên 10 triệu, sản phẩm Samsung A73 sẽ cạnh tranh trực tiếp với các đối thủ nặng ký đến từ các thương hiệu đình đám khác như OPPO Reno7, Xiaomi 11T Pro hay iPhone 11 của Apple...\r\n\r\nGalaxy A73 có mấy màu, bao nhiêu phiên bản?\r\nNhư nhiều mẫu điện thoại trên thị trường thì Samsung A73 cũng được trang bị nhiều phiên bản cấu hình khác nhau. Cụ thể thì có hai phiên bản bộ nhớ trong đó là 128GB và 256GB. Trong đó phiên bản 256GB được bán chính hãng ĐỘC QUYỀN tại hệ thống bán lẻ di động CellphoneS.\r\n\r\nVề màu sắc, điện thoại cận cao cấp A73 5G của Samsung cũng sở hữu tới ba phiên bản màu lần lượt là Xanh, Trắng và Xám. Với nhiều phiên bản màu, người dùng có thể dễ dàng lựa chọn được một phiên bàn màu sắc yêu thích, phù hợp phong thủy.\r\n\r\nSamsung Galaxy A73 có mấy phiên bản? Màu sắc?\r\n\r\nĐiện thoại Samsung Galaxy A73 5G ra mắt khi nào?\r\nHiện tại, Samsung A73 5G đã chính thức được giới thiệu đến với người tiêu dùng. Cụ thể, Samsung đã giới thiệu sản phẩm cao cấp nhất dòng Galaxy A của mình vào ngày 17 tháng 3 năm 2022.\r\n\r\nPhiên bản Samsung A màn hình lớn cùng nhiều tính năng hấp dẫn này cũng đã được bán chính thức tại thị trường Việt Nam vào tháng 4 vừa qua với giá bán hấp dẫn.\r\n\r\nSamsung Galaxy A73 pin có trâu không?\r\nGalaxy A73 sử dụng viên pin 5000 mAh cho thời gian sử dụng hiệu quả lên đến 2 ngày liên tục. Khi chơi game Pin của Galaxy A73 được đánh giá như sau:\r\n\r\nPlay Together: 4 tiếng 32 phút.\r\nCall Of Duty Mobile: 5 tiếng 26 phút.\r\nLiên Quân Mobile: 5 tiếng 45 phút.\r\nPUBG Mobile: 6 tiếng 17 phút.\r\nSamsung Galaxy A73 có sạc nhanh không?\r\nGalaxy A73 cũng hỗ trợ sạc nhanh tối đa 25W cùng tính năng thích ứng thói quen sử dụng để tự động tối ưu hóa thời lượng sử dụng pin tốt hơn.\r\n\r\nSamsung A73 5G có chống nước không?\r\nSamsung A73 5G có chống nước đạt chuẩn IP67 cho khả năng chống nước và chống bụi, Galaxy A73 5G có thể nằm ở độ sâu 1,0 mét trong nước tối đa 30 phút. Với lớp bảo vệ Gorilla Glass 5 bổng sung, thiết bị của bạn giờ đây cứng cáp hơn và ít bị trầy xước hơn. Tuy nhiên đây chỉ là các thông số từ nhà cung cấp, người dùng không nên sử dụng ở bãi biển, hồ bơi hoặc nước có xà phòng vì chỉ an toàn với áp suất nước thấp.', 'products/samsung-galaxy-a73.webp', 3, 2, 12990000, GETDATE(), NULL),
(1, N'Samsung Galaxy A34 5G', N'Samsung Galaxy A34 là sản phẩm được đánh giá \"đáng đồng tiền bát gạo\" trong phân khúc tầm trung. Samsung A34 sở hữu màn hình Super AMOLED 6.6 inch với tần số quét lên đến 120Hz, độ sáng lên đến 1.000 nits. Thêm vào đó là dung lượng siêu bền bỉ 5.000mAh có thể sử dụng lên đến 2 ngày kết hợp với camera sắc nét tích hợp công nghệ chống rung OIS. Đặc biệt, thiết kế trẻ trung năng động, thời thượng với viền kim loại tinh giản và các góc được bo tròn mềm mại.\r\n\r\nSo sánh Samsung Galaxy A34 và Samsung Galaxy A14\r\nSamsung Galaxy A34 vừa trình làng đã được giới công nghệ quan tâm bởi nhiều tính năng và điểm nổi bật trong phân khúc tầm trung. Vậy sản phẩm này có điểm gì khác biệt so với Galaxy A14, xem ngay bảng so sánh sau đây nhé!\r\n\r\nThông số kỹ thuật\r\n\r\nSamsung Galaxy A34 5G\r\n\r\nSamsung Galaxy A14 5G\r\n\r\nMàn hình\r\n\r\nSuper AMOLED 6.6 inch\r\n\r\nPLS LCD 6.6 inch\r\n\r\nĐộ phân giải\r\n\r\n1080 x 2340 (FHD+)\r\n\r\n1080 x 2408 (FHD+)\r\n\r\nTần số quét\r\n\r\n120 Hz\r\n\r\n90 Hz\r\n\r\nChip xử lý\r\n\r\nMediaTek D1080\r\n\r\nOcta-core\r\n\r\nDung lượng RAM\r\n\r\n8GB\r\n\r\n4GB\r\n\r\nBộ nhớ trong\r\n\r\n128GB	128GB\r\nDung lượng pin\r\n\r\n5.000mAh	5.000mAh\r\nHỗ trợ 5G\r\n\r\nCó	Có\r\nCamera sau\r\n\r\n48.0 MP + 8.0 MP + 5.0 MP	50.0 MP + 2.0 MP + 2.0 MP\r\nCamera trước\r\n\r\n13.0 MP	13.0 MP\r\nMàu sắc\r\n\r\nBạc Bất Bại, Xanh Dũng Mãnh, Đen Chiến Binh	Đỏ Burgundy, Đen Midnight, Trắng Pearl\r\nCó thể thấy so với A14 5G, sản phẩm Samsung Galaxy A34 5G đã có những cải tiến vượt trội về công nghệ màn hình: Super AMOLED, tần số quét cao 120Hz cho màn hình sáng rõ, trải nghiệm lướt mượt mà ngay cả môi trường ngoài trời. Thêm vào đó, thiết kế viền kim loại tinh giản, thời thượng kết hợp camera tích hợp khả năng chống rung OIS tiên tiến. Dung lượng RAM cũng được nâng lên đến 8GB giúp đa nhiệm mượt mà và hạn chế tình trạng giật lag\r\n\r\nĐánh giá điện thoại Samsung Galaxy A34 - Cấu hình tốt cùng camera sắc nét\r\nSau thành công của mẫu điện thoại Samsung Galaxy A33, phiên bản kế tiếp là Samsung Galaxy A34 đã được phát triển với nhiều cải tiến để hướng tới đối tượng khách hàng phổ thông. Hãy cùng đánh giá chi tiết những điểm nổi bật của chiếc điện thoại này để bạn quyết định xem liệu sản phẩm này có phù hợp với nhu cầu sử dụng của mình không nhé.\r\n\r\nThiết kế mỏng, nhẹ\r\nSamsung Galaxy A34 vẫn sử dụng thiết kế nổi bật với màu sắc trẻ trung và mặt lưng nổi bật khi sở hữu cụm camera sau 3 ống kính. Tuy nhiên, phần cạnh viền lại được bo tròn để mang lại cảm giác mềm mại, thoải mái khi cầm, sử dụng điện thoại.\r\n\r\nĐánh giá điện thoại Samsung Galaxy A34 - Cấu hình tốt cùng camera sắc nét\r\n\r\nSamsung Galaxy được thiết kế mỏng, nhẹ với trọng lượng chỉ 199g và độ dày 8.2mm. Điện thoại sẽ bao gồm 3 phiên bản màu tại thị trường Việt nam là Bạc bất bại, Xanh dũng mãnh và Đen chiến binh.\r\n\r\nMàn hình sắc nét, sống động\r\nSản phẩm sở hữu màn hình Super AMOLED có kích thước 6.6 inch. Với độ phân giải Full HD+, điện thoại Galaxy A34 chắc chắn sẽ có khả năng hiển thị hình ảnh một cách sống động, chân thực và sắc nét.\r\n\r\nĐánh giá điện thoại Samsung Galaxy A34 - Cấu hình tốt cùng camera sắc nét\r\n\r\nLớp kính cường lực được sử dụng trên Samsung Galaxy A34 sẽ đảm bảo chắc chắn được độ bền, khả năng chống trầy xước của điện thoại mà không làm ảnh hưởng tới chất lượng hiển thị hình ảnh.\r\n\r\nSản phẩm cũng sử dụng loại màn có tần số quét 120Hz giống như trên phiên bản tiền nhiệm. Điều này sẽ giúp cho các thao tác kéo/thả, đóng/mở ứng dụng cũng như trải nghiệm chơi game trên chiếc điện thoại này luôn mượt mà.\r\n\r\nCấu hình tốt nhất trong phân khúc\r\nSamsung Galaxy A34 được trang bị bộ vi xử lý MT D1080 8 nhân tới từ chính thương hiệu này. Với bộ vi xử lý này, Galaxy A34 sẽ có hiệu năng thuộc hàng tốt nhất trong phân khúc điện thoại tầm trung để đảm bảo thiết bị hoạt động mượt mà.\r\n\r\nĐánh giá điện thoại Samsung Galaxy A34 - Cấu hình tốt cùng camera sắc nét\r\n\r\nĐi kèm với con chip MT D1080 là 8GB RAM và 128GB bộ nhớ trong để máy có thể thực hiện đa nhiệm một cách dễ dàng cũng như mang tới cho bạn một không gian lưu trữ thoải mái. Galaxy A34 còn có thể mở rộng bộ nhớ thông qua thẻ microSD nếu bạn lo lắng về vấn đề hết dung lượng.\r\n\r\nDung lượng pin lớn\r\nSamsung Galaxy A34 vẫn được trang bị viên pin có dung lượng 5000mAh tương tự như trên phiên bản A14 tiền nhiệm. Với dung lượng pin này, bạn sẽ hoàn toàn có thể sử dụng điện thoại một cách thoải mái trong ngày mà không lo về vấn đề hết pin.\r\n\r\nĐánh giá điện thoại Samsung Galaxy A34 - Cấu hình tốt cùng camera sắc nét\r\n\r\nNgoài ra, điện thoại Galaxy A34 cũng được trang bị công nghệ sạc giúp rút ngắn thời gian sạc pin để việc sử dụng không bị ảnh hưởng. Với công suất sạc này, Galaxy A34 sẽ có thể sạc đầy 100% pin chỉ trong thời gian ngắn.\r\n\r\nCamera có khả năng chụp ảnh cực đẹp\r\nTuy là một sản phẩm thuộc phân khung tầm trung nhưng Samsung Galaxy A34 lại sở hữu cum camera sau vô cùng chất lượng, với độ phân giải cao:\r\n\r\n-          Camera chính 48MP và khẩu độ f/1.8\r\n\r\n-          Camera góc rộng độ phân giải 8MP và khẩu độ f/2.2\r\n\r\n-          Camera macro độ phân giải 5MP và khẩu độ f/2.4\r\n\r\nCamera có khả năng chụp ảnh cực đẹp\r\n\r\nKhông chỉ được nâng cấp cụm camera sau mà khả năng chụp hình của camera selfie của Samsung Galaxy A34 cũng được cải thiện nhờ độ phân giải 13MP.\r\n\r\nĐồng thời, các tính năng chống rung quang học, chụp ban đêm, thuật toán làm đẹp AI,...được Samsung cải tiến và trang bị thêm vào điện thoại cũng sẽ góp phần không nhỏ vào việc nâng cấp khả năng chụp hình trong phân khúc tầm trung của Galaxy A34.', 'products/sm-a346_galaxy_a34_5g.webp', 3, 2, 8490000, GETDATE(), NULL),
(1, N'Samsung Galaxy A53 (5G)', N'Tiếp nối sự thành công của dòng điện thoại tầm trung – giá rẻ, gã khổng lồ Hàn Quốc lại cho ra mắt tiếp thế hệ tiếp theo mang tên Samsung Galaxy A53 với nhiều ưu điểm nổi bật. Sản phẩm mang hiệu suất tốt, sẵn sàng mang đến cho bạn những giây phút trải nghiệm chơi game, xem phim mượt mà. Vậy điện thoại này có gì hấp dẫn, giá bao nhiêu? Cùng tìm hiểu chi tiết nhé!\r\n\r\nĐánh giá Samsung A53 – Hiệu năng siêu đỉnh, viên pin siêu lâu\r\nĐúng như các nguồn tin rò rỉ trước đó, điện thoại Samsung A53 được nâng cấp đáng kể so với thế hệ tiền nhiệm. Sau đây là những đánh giá về thiết kế, màn hình, cấu hình, hiệu năng, camera, pin và tính năng để bạn có được cái nhìn chi tiết nhất về smartphone này trước khi quyết định có nên mua hay không nhé.\r\n\r\nNăm 2023, Samsung Galaxy A54 ra mắt với màn hình Super AMOLED 6.4 inch tràn viền vô cực Infinity-O, độ sáng đến 1000nits, tần số quét lên đến 120Hz. Kèm với đó là cụm 3 camera phân giải cao 50.0 MP + 12.0 MP + 5.0 MP với tính năng ổn định kỹ thuật số và Auto-framing kết hợp chống rung OIS.\r\n\r\nThiết kế bắt mắt, màn hình 6.5 inch tràn viền\r\nMặt lưng của điện thoại Galaxy A53 5G chỉ được hoàn thiện từ nhựa song lại mang đến cho điện thoại trọng lượng tối ưu giúp hỗ trợ cầm nắm thoải mái. Song vẻ ngoài không bị mất giá trị bởi thiết kế gradient chuyển màu nhẹ, kết hợp với những đường nét cắt bóng theo hiệu ứng ánh sáng sẵn sàng bắt mắt người dùng.\r\n\r\nSamsung Galaxy A53 thiết kế bắt mắt, màn hình tràn viền\r\n\r\nMàn hình Super AMOLED Infinity-O 6.5 inch độ phân giải Full-HD+ cho hình ảnh chân thực, rõ nét, sống động, giúp người dùng dễ dàng quan sát nhiều nội dung hơn trước. . Thêm vào đó, tần số quét 120Hz hỗ trợ trải nghiệm chuyển động mượt mà, trơn tru trong quá trình chơi game, lướt web, lướt Facebook,…\r\n\r\nĐánh giá Samsung Galaxy A53\r\n\r\nMặt trước điện thoại là tấm nền được trang bị lớp kính cường lực Gorilla Glass 5 hạn chế tác động từ ngoại lực làm nứt vỡ, giúp bạn an tâm hơn trong quá trình sử dụng.\r\n\r\nTrọng lượng nhẹ, kháng bụi kháng nước tốt\r\nSamsung Galaxy A53 có trọng lượng nhẹ nên dễ dàng để trong túi xách, ba lô, bỏ túi quần mang đi mà không cảm thấy nặng tay hay vướng víu.\r\n\r\nBên cạnh đó, thiết bị còn được trang bị công nghệ chống bụi nước IP67. Đây là cấp bảo vệ chống bụi hoàn toàn và chống nước khi ngâm thiết bị ở độ sâu 1m trong vòng nửa tiếng đồng hồ. Như vậy trong những ngày trời ẩm ướt, mưa, bạn cũng không còn quá lo lắng việc thiết bị sẽ bị hư hỏng.\r\n\r\nSamsung A53 có trọng lượng nhẹ, kháng bụi nước tốt\r\n\r\nHiệu suất tối đa với Exynos 1280, bộ nhớ lưu trữ lớn \r\nSamsung A53 5G mang đến cho người dùng một hiệu năng mạnh mẽ. Sức mạnh được cung cấp bởi chip vi xử lý Exynos 1280, được sản xuất trên tiến trình tiên tiến, mang đến tốc độ cực nhanh. Bên cạnh đó, GPU đồ họa phù hợp để chơi game 3D, hoặc để chỉnh sửa hình ảnh hay là đồ họa.\r\n\r\nGalaxy A53 cho hiệu suất tối đa với Exynos 1280\r\n\r\nBên cạnh đó, chiếc Galaxy A53 được trang bị RAM hỗ trợ hoạt động đa nhiệm, đảm bảo những ứng dụng không bị văng ra khi sử dụng. Và một bộ nhớ trong lên tới 128GB, mang đến không gian lưu trữ rộng lớn, không lo sợ bị hết dữ liệu giữa chừng khi đang quay video hay chụp ảnh.\r\n\r\nBộ 4 camera sau ấn tượng, chụp ảnh chuyên nghiệp\r\nSamsung A53 được trang bị đến tận ba camera AI, bao gồm một camera chính độ phân giải là 64MP, camera góc rộng 12MP và một camera macro 5MP, camera đo chiều sâu 5MP, đi kèm với đó là chế độ chụp ảnh chuyên nghiệp với một loạt những tính năng thú vị.\r\n\r\nNgoài ra, bạn cũng có thể thực hiện chụp ảnh sắc nét trong điều kiện thiếu sáng hay chụp những bức ảnh chân dung xóa phông hoàn hảo và chụp cận cảnh những vật nhỏ. Samsung Galaxy A53 khuyến khích bạn tạo nên những bức ảnh nghệ thuật sáng tạo từ chiếc máy của mình.\r\n\r\nĐiện thoại Samsung A53 sở hữu bộ 4 camera sau ấn tượng\r\n\r\nCamera selfie vẫn là thế mạnh của chiếc máy Samsung Galaxy A53 khi sở hữu độ phân giải 32MP hỗ trợ chụp góc rộng giúp sẵn sàng có được những bức ảnh đẹp cùng bạn bè và hỗ trợ chụp ảnh với bộ lọc AR. Kết hợp thêm tính năng làm đẹp AI, với khả năng tối ưu hóa và làm đẹp tự nhiên với thuật toán đã được dựng sẵn.\r\n\r\nBảo mật tối ưu, vượt trội\r\nSamsung A53 được trang bị nền tảng bảo mật đa lớp cấp quốc phòng Samsung Knox. Nhờ vậy, dữ liệu của người dùng sẽ được bảo vệ tối đa, ngăn chặn nguy cơ rò rỉ dữ liệu, cuộc tấn công dữ liệu hay các phần mềm độc hại.\r\n\r\nBảo mật tối ưu, vượt trội\r\n\r\nCác thư mục, hình ảnh, tệp, ứng dụng hay dữ liệu cá nhân sẽ được bảo vệ an toàn. Bạn có thể thêm dấu vân tay hoặc mật khẩu để tăng độ bảo mật.\r\n\r\nKết nối 5G tốt dẫn đầu xu thế, âm thanh đỉnh cao\r\nĐiểm mới ở Samsung Galaxy A53 là sản phẩm mở ra xu thế mới cho dòng Galaxy với tốc độ kết nối vượt trội. Như vậy việc chia sẻ video, phát trực tiếp mượt mà, tốc độ đáng kinh ngạc. Với bộ vi xử lý mạnh mẽ, chiếc smartphone này mang tới khả năng kết nối 5G và hiệu suất tốt hơn so với thế hệ A52 tiền nhiệm.\r\n\r\nĐiện thoại Samsung Galaxy A53 hỗ trợ kết nối 5G\r\n\r\nĐồng thời, Samsung Galaxy A53 kết hợp công nghệ âm thanh Dolby Atmos mang đến cho người dùng phút giây đắm chìm trong thế giới âm thanh sống động, nâng cao trải nghiệm chơi game, xem phim, nghe nhạc chuẩn điện ảnh.\r\n\r\nBên cạnh đó, chế độ Game Booster còn hỗ trợ điều hướng thân thiện, đem đến giao diện game chuyên dụng, tiết kiệm năng lượng, nhiệt độ cùng bộ nhớ.\r\n\r\nViên pin 5.000mAh, hỗ trợ sạc nhanh 25W\r\nỞ bên trong một thiết kế mỏng gọn lại là viên pin dung lượng khủng 5000 mAh. Từ đó, chiếc điện thoại thông minh Galaxy A53 giúp bạn thỏa sức sử dụng những tác vụ nặng kết hợp với cơ bản trọn vẹn có thể lên đến 2 ngày.\r\n\r\nSamsung A53 có viên pin 5.000mAh\r\n\r\nSamsung A53 còn hỗ trợ cả sạc nhanh công suất lên đến 25W. Và khi đó, bạn chỉ cần tốn ít thời gian sạc để có thêm năng lượng dùng. Bên cạnh đó khi bạn kích hoạt chế độ siêu tiết kiệm pin, để bạn luôn có nhiều thời gian hơn để sử dụng khi bạn đi ra ngoài mà không mang theo dây sạc.\r\n\r\nSamsung Galaxy A53 giá bao nhiêu? Ra mắt khi nào?\r\nTrong đầu năm 2022, Samsung đã tung ra hàng loạt sản phẩm từ phân khúc cao cấp đến tầm trung và giá rẻ. Không dừng lại ở đó, hãng công nghệ vẫn chưa dừng lại khi tiếp tục cho ra mắt sản phẩm Galaxy A53 với nhiều nâng cấp so với thế hệ trước.\r\n\r\nChiếc smartphone này đã được trình lang chính thức vào ngày 17 tháng 3 trong năm 2022. Giá bán niêm yết của Samsung A53 5G phiên bản 8GB/128GB là 9.990.000đ. Tuy nhiên, tại hệ thống bán lẻ CellphoneS thì sản phẩm đang có mức giá vô cùng hấp dẫn, chỉ hơn 8 triệu đồng.\r\n\r\nSản phẩm\r\n\r\nGiá bán tham khảo\r\n\r\nSamsung Galaxy A53 thời điểm mở bán \r\n\r\n9.990.000 đồng\r\n\r\nSamsung Galaxy A53 hiện tại\r\n\r\nChỉ từ 8.490.000 đồng\r\n\r\nTại sao nên mua Samsung A53 (5G) tại CellphoneS?\r\nHệ thống cửa hàng điện thoại CellphoneS hiện đang kinh doanh điện thoạiSamsung Galaxy A53 chính hãnggiá rẻ. Khi mua tại CellphoneS mang đến sản phẩm chính hãng, bảo hành 12 tháng dài lâu cùng nhiều ưu đãi tốt, hỗ trợ trả góp lãi suất 0%. Không những vậy, tại đây còn có chương trình thu cũ đổi mới trợ giá cực kì hấp dẫn cho những khách hàng muốn bán lại máy cũ và lên đời.\r\n\r\nKhi đến với CellphoneS, khách hàng hoàn toàn yên tâm bởi:\r\n\r\n- Giá cả sản phẩm cạnh tranh với các hệ thống bán lẻ điện thoại khác: Có nhiều khung giờ giảm giá, flash sale, đặc biệt là giảm giá những ngày lễ lớn trong năm, giúp khách hàng mua được sản phẩm tốt giá hời. Bên cạnh đó, nhiều phần quà hấp dẫn cùng chính sách giảm giá cho khách hàng thành viên Smember không thể bỏ qua. Đặc biệt khi tích lũy điểm càng nhiều, bạn sẽ có cơ hội trở thành thành viên VIP\r\n\r\n- Sản phẩm chính hãng: Một trong những điểm CellphoneS được đánh giá cao chính là chất lượng sản phẩm Samsung A53 chính hãng. Nhờ vậy mà bạn sẽ an tâm trong quá trình mua và sử dụng. Đặc biệt các thiết bị như điện thoại, máy tính, laptop,… có bảo hành tùy theo hãng, nếu xảy ra lỗi từ nhà sản xuất, người dùng sẽ được hỗ trợ đổi và sửa chữa không mất phí nếu đáp ứng đủ yêu cầu điều kiện.\r\n\r\nTại sao nên mua Samsung A53 (5G) tại CellphoneS?\r\n\r\n- Nhân viên tác phong chuyên nghiệp: Đội ngũ nhân viên CellphoneS được đào tạo bài bản, kỹ lưỡng về quy trình chăm sóc khách hàng. Khi bạn cần đến sự hỗ trợ hay tư vấn thông tin, chúng tôi sẵn lòng phục vụ. Bên cạnh đó, nếu trong quá trình sử dụng bạn gặp các vấn đề lỗi phần mềm, phần cứng chưa biết cách khắc phục, các kỹ thuật viên tay nghề cao tại CellphoneS sẽ hỗ trợ kiểm tra và đưa ra phương án xử lý.\r\n\r\n- Địa chỉ uy tín: Hệ thống cửa hàng CellphoneS từ Hà Nội, Hải Phòng, Thanh Hóa, Vĩnh Phúc, Hải Dương, Thái Nguyên cho đến các tỉnh thành miền Nam như Hồ Chí Minh, Bình Dương. Khách hàng có thể đến ngay trực tiếp tại cửa hàng để trải nghiệm dịch vụ, chất lượng sản phẩm.\r\n\r\n- Thanh toán linh hoạt: Bên cạnh hình thức trả bằng tiền mặt cho điện thoại Samsung A53 5G, bạn có thể thanh toán qua online như internet banking, thẻ ATM, Zalopay, thẻ tín dụng… Đối với mua trả góp, CellphoneS chấp nhận hơn 20 loại thẻ tín dụng, trả góp thông qua công ty tài chính.\r\n\r\n - Đặt hàng linh động: Ngoài việc đến cửa hàng trải nghiệm trực tiếp sản phẩm, người dùng có thể đặt hàng, nhận thông tin tư vấn qua website chính thức của CellphoneS: www.cellphones.com.vn hoặc gọi vào tổng đài miễn phí 18002097.', 'products/sm-a536_galaxy_a53.web', 3, 2, 9990000, GETDATE(), NULL),
(1, N'Samsung Galaxy S22 Ultra (8GB - 128GB)', N'Đúng như các thông tin được đồn đoán trước đó, mẫu flagship mới của gả khổng lồ Hàn Quốc được ra mắt với tên gọi là Samsung Galaxy S22 Ultra với nhiều cải tiến đáng giá. Mẫu điện thoại cao cấp đến từ Samsung này có nhiều thay đổi từ thiết kế, cấu hình cho đến camera. Vậy siêu phẩm này có gì mới, giá bao nhiêu và có nên mua không? Hãy cùng tìm hiểu chi tiết ngay bên dưới nhé!\r\n\r\nDự kiến vào tháng 2 năm 2023, Samsung sẽ cho ra mắt siêu phẩm S23 Ultra mà có thể quý khách sẽ quan tâm! Click vào link để tìm hiểu thêm!\r\n\r\nSamsung S22 Ultra được nâng cấp gì so với S21 Ultra\r\nTrước khi chính thức ra mắt cộng đồng những chiếc điện thoại Samsung S22 Series đã có thời gian được thai nghén khá dài để đảm bảo có những tính năng thực sự vượt trội so với phiên bản tiền nhiệm. Để có thể hình dung rõ ràng ta xét đến 2 mẫu Samsung S22 Ultra và S21 Ulta xem dòng flagship mới nhà Samsung có những nâng cấp nổi trội nào nhé!\r\n\r\nGalaxy S22 Ultra\r\n\r\nGalaxy S21 Ultra\r\n\r\nMàu sắc\r\n\r\nĐỏ Burgundy\r\n\r\nĐen Phantom\r\n\r\nXanh Zeta\r\n\r\nTrắng Phantom\r\n\r\nBạc Phantom\r\n\r\nĐen Phantom\r\n\r\nKích thước\r\n\r\n6.8 inch\r\n\r\n6.8 inch\r\n\r\nMàn hình\r\n\r\nDynamic AMOLED 2X\r\n\r\nDynamic AMOLED 2X\r\n\r\nĐộ phân giải\r\n\r\n2K+ (1440 x 3088 Pixels)\r\n\r\n2K+ (1440 x 3200 Pixels)\r\n\r\nCPU\r\n\r\nSnapdragon 8 Gen 1\r\n\r\nExynos 2100 8 nhân\r\n\r\nROM - Bộ nhớ trong\r\n\r\n128GB/256GB\r\n\r\n128GB/256GB/512GB\r\n\r\nRAM - Bộ nhớ đệm\r\n\r\n12GB\r\n\r\n12GB\r\n\r\nCamera trước\r\n\r\n40MP\r\n\r\n40 MP\r\n\r\nCamera sau\r\n\r\nChính: 108 MP\r\n\r\nGóc siêu rộng: 12MP\r\n\r\nTele: 10MP\r\n\r\nTele: 10MP\r\n\r\nZoom quang học: 3x, 10x\r\n\r\nChính: 108 MP\r\n\r\nGóc siêu rộng: 12MP\r\n\r\nTele: 10MP\r\n\r\nTele: 10MP\r\n\r\nZoom quang học: 10x\r\n\r\nDung lượng Pin\r\n\r\n5000 mAh\r\n\r\n5000 mAh\r\n\r\nKhả năng sạc nhanh\r\n\r\n45W\r\n\r\n25W\r\n\r\nĐánh giá Samsung Galaxy S22 Ultra 5G chi tiết\r\nNhững nâng cấp lớn về hiệu năng, dung lượng pin, và trên hết là camera sau chính là những điểm khiến nó trở thành siêu phẩm trong phân khúc cao cấp. Dưới đây là những thông tin cần biết về dòng điện thoại vừa ra mắt của Samsung. Dưới đây là thông số cấu hình của Samsung S22 Ultra vừa được gã khổng lồ Hàn Quốc giới thiệu.\r\n\r\nThiết kế nguyên khối - kính sang trọng với độ bền tối ưu\r\nSamsung Galaxy S22 Ultra đi theo ngôn ngữ thiết kế nguyên khối - kính cao cấp và sang trọng, vốn đã làm nên sự thành công của model tiền nhiệm. Chiếc máy có thiết kế mặt lưng đơn sắc tối giản nhưng không kém phần tinh tế, và màn hình tràn viền bao phủ gần như trọn mặt trước, tạo nên trải nghiệm quan sát rộng rãi trên một thiết bị di động nhỏ gọn vừa tay cầm.\r\n\r\nĐộ bền của máy được đảm bảo tối ưu không chỉ qua lớp vỏ nhôm nguyên khối Amor đánh bóng, mà còn qua kính cường lực Corning Gorilla Glass Victus+ bao phủ hai mặt trước và sau. Khung nhôm và kính hoạt động như bộ giáp bảo vệ điện thoại an toàn. Chiếc máy còn có khả năng chống bụi / nước đạt chuẩn IP68 giúp người dùng luôn an tâm khi dùng máy trong những điều kiện môi trường khác nhau.\r\n\r\nSamsung S22 Ultra 5G có thiết kế sang trọng với độ bền tối ưu\r\n\r\nỐng kính 108MP mang lại khả năng chụp ảnh không giới hạn\r\nỐng kính chính trên Samsung S22 Ultra với độ phân giải lên đến 108MP, với những khả năng chụp ảnh đêm, chụp chân dung, chụp góc siêu rộng, và zoom quang học 100x đều hiện diện. Chi tiết ảnh và màu sắc tốt nằm trong khoảng zoom 10x, có thể sử dụng zoom 30x trong điều kiện ánh sáng tốt, còn zoom 100x mang tính chất lưu lại thông tin. Camera chính và camera tele hỗ trợ công nghệ chống rung quang học OIS.\r\n\r\nĐánh giá Samsung Galaxy S22 Ultra 5G\r\n\r\nCụm camera sau cho phép người dùng sáng tạo ảnh chụp của mình không giới hạn. Hai ống kính còn lại là ống kính 12MP hỗ trợ chụp góc siêu rộng và ống kính tele 10MP. Người dùng có thể sử dụng S22 chụp ảnh macro với ống kính siêu rộng. Màu sắc và chi tiết ảnh cao hơn các model tầm trung, cho độ phân giải và cảm biến tốt hơn.\r\n\r\nCamera 108MP trên S22 Ultra mang lại khả năng chụp ảnh không giới hạn\r\n\r\nThiết bị được trang bị khả năng chụp ảnh chân dung ban đêm, trong điều kiện thiếu sáng ấn tượng với bộ xử lý hình ảnh AI kết hợp với camera góc rộng 108MP mang lại bức ảnh ban đêm sáng rõ. Với không gian không quá tối, chỉ với thao tác sử dụng chế độ tự động, AI sẽ tự xử lý cho ra hình ảnh sáng, đầy đủ chi tiết và không bị nhiễu. Trường hợp thiếu sáng, chế độ chụp đêm là sự lựa chọn hoàn hảo.\r\n\r\nTốc độ khung hình phát hiện ánh sáng và tự động chuyển sang tốc độ khung hình tối ưu. Samsung Galaxy S22 Ultra sử dụng bộ xử lý 4nm với công nghệ Super Night Solution giảm nhiễu hiệu quả.\r\n\r\nĐồng thời, người dùng có thể điều chỉnh được mức độ xóa phông sau khi chụp. Khi thực hiện quay video cần hiệu chỉnh phần hậu cảnh, người dùng có thể làm nổi bật chủ thể bằng cách sử dụng bộ lọc đổi phông thành đen trắng. Phần chuyển nét mượt mà và không có cảm giác bị lẹm.\r\n\r\nĐánh giá camera Samsung Galaxy S22 Ultra 5G\r\n\r\nKhông chỉ chụp ảnh, thiết bị còn mang lại khả năng quay phim chất lượng với khả năng chống rung và công nghệ AI mang lại những thước phim chuyển động nhanh mà vẫn đảm bảo rõ nét, zoom tốt hơn. Điện thoại còng được trang bị công nghệ Super HDR tốt với tất cả các ống kính mang lại những thước phim giàu chi tiết. Ấn tượng nhất trên camera của Samsung S22 Ultra đó chính là khả năng thu phóng 100 lần đầy ấn tượng.\r\n\r\nPhía trước máy là camera selfie đơn với độ phân giải lên đến 40 MP, khẩu độ f/2.2 với khả năng chụp góc rộng cho ra ảnh chụp selfie bắt mắt. Tính năng làm đẹp AI, gọi video call kép và HDR tự động sẽ giúp tăng cường trải nghiệm chụp ảnh trên chiếc flagship này.\r\n\r\nĐiểm nổi bật nữa của cụm camera nằm ở thời gian phơi sáng đến 6 giây nhưng bị rung nhòe kể cả không sử dụng chân đế!\r\n\r\nĐánh giá camera Samsung Galaxy S22 Ultra 5G - Ảnh 2\r\n\r\nMàn hình 6.8 inch 120 Hz tương thích bút S-Pen hiện đại\r\nVới Galaxy S22 Ultra thì Samsung đã cho ra đời loại màn hình phủ trọn mặt trước đầy ấn tượng. Chiếc màn hình điện thoại có kích thước 6.8 inch, độ phân giải Quad HD+ (3200 x 1440 pixels) và sử dụng tấm nền Dynamic AMOLED 2X với Vision Booster cho ra độ bão hòa màu sắc đầy chân thực.\r\n\r\nMàn hình của Samsung S22 Ultra còn được tích hợp những tính năng cao cấp đặc trưng của Samsung như Always on display, tốc độ làm tươi đến 120 Hz cho trải nghiệm gaming vượt trội và chứng nhận màu HDR10+. Bề mặt màn hình được bảo vệ bởi kính Gorilla Glass Victus chống xước hiệu quả.\r\n\r\nSamsung S22 Ultra có màn hình 6.8 inch 120 Hz tương thích bút S-Pen hiện đại\r\n\r\nVi xử lý Snapdragon 8 Gen 1 cùng pin lớn giúp giải trí hiệu quả\r\nVới Samsung S22 Ultra 5G, nhà sản xuất đã chế tạo nên bộ vi xử lý thế hệ mới mang tên Qualcomm Snapdragon 8 Gen 1. Hiệu năng trên Qualcomm Snapdragon 8 Gen 1 được cải tiến rất nhiều so với thế hệ trước nhằm mang lại hiệu năng mượt mà đáp ứng cả những tựa game nặng nhất, đồng thời chứa khả năng tiết kiệm năng lượng pin giúp người dùng yên tâm dùng máy dài lâu.\r\n\r\nĐánh giá Samsung Galaxy S22 Ultra 5G\r\n\r\nCon chip Qualcomm Snapdragon 8 Gen 1 được sản xuất trên tiến trình 4nm không chỉ mang lại một hiệu năng mạnh mẽ mà còn sở hữu sức mạnh AI mang lại trải nghiệm chụp đêm vượt trội.\r\n\r\nNói về pin, điện thoại được trang bị viên pin dung lượng 5000mAh sẽ cung cấp cho người dùng tới 81 giờ chơi nhạc. Công nghệ sạc nhanh siêu tốc 45W, cùng sạc không dây chuẩn Qi và sạc ngược sẽ giúp Galaxy S22 Ultra trở thành chiếc smartphone đa chức năng nổi bật trong phân khúc. Pin hỗ trợ tiết kiệm năng lượng, cho thời lượng sử dụng trong thời gian dài.\r\n\r\nĐánh giá hiệu năng Galaxy S22 Ultra với Snapdragon 8 Gen 1\r\n\r\nĐánh giá hiệu năng Samsung S22 Ultra với Snapdragon 8 Gen 1\r\n\r\nSau nhiều năm chạy chip Exynos thì S22 Ultra là mẫu điện thoại Samsung chính hãng hiếm hoi tại Việt Nam chạy Snapdragon 8 Gen 1. Trước khi đánh giá hiệu năng, cùng điểm lại một số thông số cấu hình nhé:\r\n\r\n- Vi xử lý: Snapdragon 8 Gen 1\r\n\r\n- Bộ nhớ RAM: 8GB hoặc 12GB.\r\n\r\n- Bộ nhớ trong: 128GB hoặc 256GB hoặc 512GB.\r\n\r\nSau đây là điểm số benchmark được các trang chuyên công nghệ thực hiện.\r\n\r\nĐiểm Geekbench 5 của S22 Ultra PCMag thực hiện:\r\n\r\n- Điểm đa nhân: 3.433 điểm \r\n\r\n- Điểm đơn nhân: 1.232\r\n\r\nĐiểm số này có sự khác biệt so với chip Snapdragon 888 được ra mắt nắm 2020. Cụ thể, điểm đơn lõi tăng 13% và đa lõi tăng 9%. Nhưng trên thang điểm chuẩn của GFXBench thì ở một số tác vụ nhất định, con chip này cho hiệu năng tốt hơn khoảng 20%.\r\n\r\nĐánh giá hiệu năng Galaxy S22 Ultra với Snapdragon 8 Gen 1 - Ảnh 2\r\n\r\nHỗ trợ bút S Pen tiện lợi\r\nTương tự như model tiền nhiệm, điện thoại thông minh Samsung Galaxy S22 Ultra cũng hoàn toàn tương thích với bút cảm ứng S-Pen qua điều khiển không day Air Actions - vốn là điểm đặc trưng của dòng Galaxy Note trước đây. Người dùng có thể dùng S-Pen cho những tác vụ thiết kế, ghi chú nhanh, và điều khiển từ xa với tính hiệu quả vượt trội.\r\n\r\nĐánh giá Samsung Galaxy S22 Ultra 5G\r\n\r\nĐộ chính xác bút S-Pen cao, giúp các ghi chú và tin nhắn của bạn trở nên sinh động, thú vị. Chữ viết tay thành văn bản nhanh chóng hoặc thêm hình ảnh động vào, nâng cao tính chuyên nghiệp và sáng tạo.\r\n\r\nSamsung đã trang bị khe cắm S Pen trên thiết bị giúp người dùng có thể tiện lợi khi sử dụng. Tuy nhiên khác với trước đó là S Pen sẽ có cùng màu với máy thì năm nay, S-Pen sẽ chỉ có màu đen. \r\n\r\nVới bút S Pen, giời đây người dùng Galaxy S22 Ultra có thể thoải mái ghi chú, điều khiển điện thoại như trên các dòng Samsung Note. Bút Spen mới này cũng được cải thiện độ trễ mang lại trải nghiệm dùng chân thực từ viết chữ, vẽ hay ghi chú. \r\n\r\nSamsung Galaxy S22 Ultra hỗ trợ bút S Pen tiện lợi\r\n\r\nKết nối dễ dàng với hệ sinh thái Galaxy\r\nỞ phiên bản điện thoại Samsung S22 Ultra mới, người dùng có thể kết nối với các thiết bị khác một cách dễ dàng thông qua hệ sinh thái Galaxy như Galaxy S22+, Galaxy Tab S8 Ultra, Galaxy Buds Pro, Galaxy Watch 4,…. Nhờ đó, người dùng có thể truy cập vào các ứng dụng trên điện thoại thông qua máy tính Samsung một cách dễ dàng.\r\n\r\nS22 Ultra kết nối dễ dàng với hệ sinh thái Galaxy\r\n\r\nBạn có thể kết nối với Galaxy Tab S8 Ultra, Samsung Notes được đồng bộ hóa cho phép chỉnh sửa. Ngoài ra, việc di chuyển từ màn hình S22 Ultra sang màn hình thiết bị khác thông qua ghép nối giúp người dùng có trải nghiệm màn hình kép.\r\n\r\nThêm vào đó là tính năng Smart Switch cho phpeps chuyển đổi dữ liệu qua thiết bị mới nhanh chóng kể cả các thiết bi cũ khác hệ điều hành.\r\n\r\nKết nối trực tuyến, bảo mật thông tin cá nhân\r\nNgười dùng có thể kết nối với nhau trực tuyến thông qua Google Duo, chia sẻ màn hình để xem video cùng nhau giống IRL. Bên cạnh đó, khi khởi động Samsung Knox, dữ liệu cá nhân của bạn sẽ được bảo mật an toàn.\r\n\r\nKnox Vault bảo vệ thông tin sinh trắc học, trong khi Thư mục bảo mật khóa dữ liệu riêng tư quan trọng. Trang tổng quan Sử dụng quyền mới cho phép xem ứng dụng đang chia sẻ dữ liệu hoặc đang theo dõi người dùng. Bạn cũng có thể cấp hoặc từ chối quyền truy cập theo điều khoản.\r\n\r\nS22 Ultra hỗ trợ kết nối trực tuyến, bảo mật thông tin cá nhân', 'products/ssgalaxys22ultra.web', 1, 2, 30990000, GETDATE(), NULL),
(1, N'vivo T1X', N'Tiếp tục là một sản phẩm smartphone đến từ thương hiệu Vivo mang tên Vivo T1X thuộc phân khúc tầm trung với nhiều công nghệ tiên tiến, thiết kế ấn tượng cùng hiệu năng mạnh mẽ, hứa hẹn đáp ứng tốt các nhu cầu sử dụng của người dùng.\r\n\r\nĐánh giá Vivo T1X – Thiết kế sang trọng, hiệu năng ổn định\r\nĐiện thoại Vivo T1X sở hữu ngoại hình trẻ trung hút mắt, màn hình 90Hz mượt mà, viên pin khỏe tích hợp sạc nhanh, hiệu năng ổn định, đây được dự đoán sẽ là 1 ứng cử viên sáng giá trong phân khúc. Cùng CellphoneS đánh giá chi tiết sản phẩm nhé!\r\n\r\nThiết kế mỏng nhẹ thời trang, nhiều màu sắc trang nhã\r\nVivo T1X được trang bị một thiết kế trang nhã, mỏng nhẹ. Cụ thể, máy với độ dày chỉ khoảng 8mm cùng trọng lượng chưa đến 182g. Các góc cạnh được hoàn thiện bo cong nhẹ mang trải trải nghiệm cầm nắm thoải mái.\r\n\r\nĐánh giá Vivo T1X – Thiết kế sang trọng, hiệu năng ổn định\r\n\r\nMặt lưng thiết bị được phủ nhám mờ giúp chống bám dính vân tay hiệu quả. Vivo T1X sẽ có nhiều phiên bản màu sắc khác nhau cho người dùng lựa chọn. Trong đó phiên bản Gravity Black độc đáo giữa sự pha trộn của sắc bạc và đen tuyền.\r\n\r\nT1X sắc nét với màn hình 6,58 inch cùng tần số quét 90Hz\r\nVề khả năng hiển thị, điện thoại Vivo T1X được trang bị màn hình kích thước 6,58 inch với khung viền siêu mỏng mang lại trải nghiệm thị giác ấn tượng. Cụ thể, màn hình có tỉ lệ hiển thị lên đến 90% cùng độ phủ màu cao tới 96% NTSC cho màu sắc hiển thị sống động.\r\n\r\nĐánh giá Vivo T1X – Thiết kế sang trọng, hiệu năng ổn định\r\n\r\nNgoài ra, màn hình trên Vivo T1X còn sở hữu tần số quét cao tới 90Hz giúp mang lại chuyển động mượt mà, đặc biệt trong các giải trí gaming.\r\n\r\nViên pin lớn, thoải mái sử dụng cả ngày dài cùng Vivo T1X\r\nĐiện thoại Vivo T1X được trang bị viên pin dung lượng lớn giúp máy có thể hoạt động liên tục trong nhiều giờ. CỤ thể, thiết bị được trang bị viên pin 5000 mah. Bên cạnh đó là công nghệ sạc nhanh 18W và Vivo Energy Guardian (VEG) giúp bổ sung năng lượng cho thiết bị nhanh chóng, người dùng không cần quá lo lắng khi smartphone báo pin yếu.\r\n\r\nĐánh giá Vivo T1X – Thiết kế sang trọng, hiệu năng ổn định\r\n\r\nHiệu năng ổn định với con chip Snapdragon 680, trải nghiệm không độ trễ\r\nVivo T1X được trang bị một cấu hình mạnh mẽ trong tầm giá. Máy chạy trên con chip Snapdragon 680 cùng bộ nhớ RAM lớn mang lại mộ trải nghiệm dùng không độ trễ. Đặc biệt, bộ nhớ RAM trên thiết bị còn có thể mở rộng, nhờ đó nâng cao khả năng đa nhiệm của thiết bị.\r\n\r\nĐánh giá Vivo T1X – Thiết kế sang trọng, hiệu năng ổn định\r\n\r\nĐể tối ưu hóa cho các trải nghiệm gaming, Vivo T1X được nhà sản xuất trang bị chế độ Multi-Turbo 5.0 cùng game Ultra. Trong đó, Multi-Turbo 5.0 giúp nâng cao hiệu suất cùng giải pháp làm mát bốn thành phần giúp thiết bị luôn giữ được mức nhiệt ổn định dù đang trong các trận đấu căng thẳng. Chế độ chơi game Ultra giúp nâng cao các trải nghiệm chơi game nhờ đó các trận chiến diễn ra thú vị hơn.\r\n\r\nTrải nghiệm nhiếp ảnh đỉnh cao với camera chính 50MP\r\nĐiện thoại Vivo T1X được trang bị cụm camera chất lượng. Trong đó camera chính với độ phân giải 50MP giúp ghi lại những khoảnh khắc sống động trong cuộc sống. Ống kính Bokeh giúp tạo các bức ảnh chiều sâu với chất lượng nghệ thuật cao. Cuối cùng là ống kính Macro với tiêu cự 4cm.\r\n\r\nTrải nghiệm nhiếp ảnh đỉnh cao với camera chính 50MP\r\n\r\nVề khả năng selfie, Vivo T1X được trang bị camera 8MP hỗ trợ chụp ảnh Super Night hiệu quả. Khi chụp ảnh trong điều kiện thiếu sáng, máy hỗ trợ chụp ảnh chất lượng HD mang lại những bức ảnh chân dung tự nhiên và rõ ràng.\r\n\r\nBên cạnh khả năng chụp ảnh chất lượng thì điện thoại Vivo T1X máy còn hỗ trợ khả năng quay video chất lượng. T1X có thể tạo nên các video phong cách giúp bạn tự tin chia sẻ lên các trang mạng xã hội.\r\n\r\nHai phương thức mở khóa tiện lợi và an toàn của Vivo T1X\r\nVivo T1X còn được trang bị hai công nghệ mở khóa máy thông minh đó là vân tay và gương mặt. Trong đó bảo mật vân tay được trang bị trên nút nguồn của thiết bị giúp người dùng mở khóa nhanh chóng. Ngoài ra, người dùng cũng có thể sử dụng công nghệ Face Wake giúp mở khóa trong nháy mắt.\r\n\r\nHai phương thức mở khóa tiện lợi và an toàn\r\n\r\nĐiện thoại Vivo T1X giá bao nhiêu? Khi nào ra mắt?\r\nVivo T1X chính thức được giới thiệu đến với người tiêu dùng vào tháng 4 năm 2022. Khi ra mắt, máy được lên kệ với giá bán 699 Ringgit, khoảng gần bốn triệu đồng.\r\n\r\nVới mức giá này, điện thoại Vivo T1X sẽ cạnh tranh trực tiếp với các đối thủ đến từ các thương hiệu lớn như Samsung Galaxy A13, Xiaomi Redmi Note 11, OPPO A55...', 'products/vivot1.webp', 5, 2, 4490000, GETDATE(), NULL),
(1, N'vivo V23e', N'Đánh giá Vivo V23e - Smartphone mạnh mẽ, sang trọng\r\nTiếp nối sự thành công của các phiên bản trước đó, Vivo tiếp tục cho ra mắt mẫu smartphone tầm trung mang tên Vivo V23e. Với thiết kế mỏng nhẹ, hiệu năng ấn tượng cùng camera chất lượng và dung lượng pin khủng đây là chiếc điện thoại thông minh mang đến cho người dùng những trải nghiệm vô cùng tuyệt vời. Chắc chắn đây là sản phẩm mà rất nhiều người đang tìm kiếm.\r\n\r\nTham khảo ngay điện thoại Vivo V23 5G với hệ thống camera và cấu hình ấn tượng.\r\n\r\nThiết kế mỏng nhẹ, cảm biến vân tay quang học cao cấp\r\nĐiện thoại Vivo V23e sở hữu thiết kế tương tự như phiên bản tiền nhiệm của chúng. Với vẻ ngoài mỏng, nhẹ cùng phần khung máy cứng cáp mang lại cảm giác sang trọng và cao cấp. Mặt lưng của máy được phủ lớp kính giúp cầm nắm được êm tay đồng thời chống trầy xước và mồ hôi một cách hiệu quả.\r\n\r\nĐánh giá Vivo V23e\r\n\r\nMáy được trang bị cảm biến vân tay quang học ẩn dưới màn hình. Công nghệ bảo mật thông minh này sẽ giúp bạn có thể mở khóa máy nhanh hơn so với các loại cảm biến truyền thống được thiết kế ở mặt lưng điện thoại thông thường.\r\n\r\nMàn hình AMOLED 6.4 inch, chuyển động mượt mà\r\nVivo V23e được trang bị màn hình kích thước 6.44 inch. Kết hợp với đó là thiết kế tràn viền mang đến khả năng hiển thị rộng hơn. Người dùng thoải mái để trải nghiệm giải trí xem video hay đắm chìm trong những tựa game đồ hoạ hấp dẫn.\r\n\r\nĐánh giá Vivo V23e\r\n\r\nNgoài ra, màn hình của máy có độ phân giải Full HD+ . Tấm nền với công nghệ màu sắc cho hình ảnh chân thật và đẹp mắt. Tốc độ làm tươi cao giúp chuyển động ảnh trở nên mượt mà và không hề ngắt quãng.\r\n\r\nMediaTek G96 ấn tượng, mạnh mẽ\r\nVivo V23e mang đến cho người dùng sức mạnh vượt trội do được trang bị con chip MediaTek G96. Đây là con chip được sản xuất trên tiến trình 7nm kết hợp với 8 nhân xử lý đến 2.4 GHz, mang đến tốc độ vận hành mượt mà, nhanh chóng đáp ứng tối đa nhu cầu làm việc đa nhiệm lẫn khả năng chơi game hiệu quả.\r\n\r\nĐánh giá Vivo V23e\r\n\r\nHỗ trợ cho hiệu năng đó là mức RAM 8 GB. Người dùng có thể mở rộng RAM thêm 4GB, giúp cho smartphone thực hiện công việc đa nhiệm mượt mà, hiệu quả và không giật lag. Dung lượng ROM lên tới 128 GB cũng tạo nên không gian lưu trữ cực khủng cho hình ảnh, ứng dụng và tài liệu.\r\n\r\nGiống như các phiên bản trước đó, điện thoại Vivo V23e vận hành nền tảng Funtouch OS 12 dựa trên hệ điều hành Android 11 với giao diện bắt mắt và dễ dùng. Bên cạnh đó, thiết kế chuyên nghiệp mang đến trải nghiệm vô cùng tuyệt vời.\r\n\r\nChụp ảnh ấn tượng với cảm biến tới 64MP\r\nVivo V23e mang đến cho người dùng trải nghiệm chụp ảnh không giới hạn. Cụm 3 camera sau có cảm biến lần lượt là 64MP, 8MP, 2MP. Bên cạnh đó là khả năng quay video ở độ phân giải cao cho chất lượng siêu nét. Công nghệ chống rung OIS cùng khả năng chụp đêm tuyệt vời sẽ giúp bạn có những bức ảnh không thể ưng ý hơn.\r\n\r\nĐánh giá Vivo V23e\r\n\r\nNgoài ra, điện thoại cũng sở hữu camera selfie cực kỳ chất với cảm biến lên tới 50 MP. Máy sẽ mang đến những bức ảnh selfie vô cùng chân thực rõ nét. Đặc biệt tính năng lấy nét tự động cùng công nghệ chống rung sẽ giúp nhận diện chủ thể chính xác hơn.\r\n\r\nViên pin 4050mAh, sạc nhanh 44W\r\nVới viên pin dung lượng 4050 mAh Vivo V23e đáp ứng được nhu cầu sử dụng cả ngày dài. Bạn sẽ thỏa sức làm việc hay lướt web hoặc là chơi game gần như cả ngày mà không phải lo lắng về thời lượng pin.\r\n\r\nĐánh giá Vivo V23e\r\n\r\nNgoài ra, Vivo cũng không quên trang bị cho máy công nghệ sạc tốc độ nhanh 44W. Đây là yếu tố góp phần làm nên trải nghiệm hoàn hảo trên thiết bị.\r\n\r\nĐiện thoại Vivo V23e giá bao nhiêu? Ra mắt khi nào?\r\nTheo thông tin được cung cấp thì Vivo V23e dự kiến sẽ được bán với giá khoảng 8 đến 9 triệu đồng. Đây là mức giá vô cùng ấn tượng cho một chiếc smartphone độc đáo và chất lượng ở phân khúc tầm trung này.\r\n\r\nHiện tại, chưa có thông tin về thời gian ra mắt của chiếc smartphone này. Tuy nhiên Vivo chắc chắn sẽ không để người dùng phải chờ lâu.\r\n\r\nĐánh giá Vivo V23e', 'products/vivov23.webp', 5, 2, 6490000, GETDATE(), NULL),
(1, N'vivo V25 Pro 8GB 128GB', N'Vivo V25 Pro nổi bật với mức giá phải chăng, ngoại hình đẹp mắt đã thu hút rất nhiều sự quan tâm từ phía người dùng kể từ thời điểm ra mắt. Chiếc smartphone đi kèm với dung lượng pin lớn 4.830 mAh, tốc độ sạc nhanh chóng với công suất 66W và màn hình với tần số quét đạt đến 120Hz cùng độ sáng ấn tượng 1300 nits.\r\n\r\nVivo V25 Pro - Khả năng chụp ảnh ấn tượng\r\nVivo V25 Pro là phiên bản smartphone thuộc phân khúc tầm trung mới nhất của Vivo V trong năm nay. Chiếc điện thoại sẽ tiếp nối những ưu điểm vượt trội hơn các thế hệ đời trước ở phần thiết kế bắt mắt, ngoại hình mỏng, màn hình sống động. Không dừng lại ở đó, thiết bị còn được cải tiến ở những bộ phận khác như dung lượng pin, camera,... và được cải tiến từ Vivo V25.\r\n\r\nThiết kế Vivo V25 Pro mỏng nhẹ với màu sắc sống động\r\nVivo V25 Pro được đánh giá là chiếc smartphone có ngoại hình bắt mắt nhất thuộc phân khúc điện thoại tầm trung. Thiết bị cung cấp cho người dùng hai phiên bản màu là đen và xanh dương. Đặc biệt hơn hết, mặt lưng của chiếc smartphone này có thể thay đổi màu sắc khi tiếp xúc với từng điều kiện ánh sáng khác nhau, mang đến ngoại hình rực rỡ cho thiết bị.\r\n\r\nVivo V25 Pro \r\n\r\nSmartphone được thiết kế với màn hình cong và mặt lưng nhám mang đến cảm giác cầm nắm thoải mái và chắc chắn. Ngoài ra tổng khối lượng của Vivo V25 Pro cũng rất nhẹ khi chỉ dừng ở mức 190g. Chắc chắn bạn sẽ không gặp phải tình trạng mỏi tay khi sử dụng smartphone này trong thời gian dài.\r\n\r\nMàn hình Vivo V25 Pro cho khả năng hiển thị hình ảnh sắc nét, chân thực\r\nDòng Vivo V25 Pro đi kèm với chiếc màn hình có kích thước 6.56 inch, một tấm nền AMOLED phủ ở phía trước và độ phân giải Full HD+. Bên cạnh đó chiếc smartphone còn được tối ưu kích thước hiển thị hình ảnh khi có phần viền màn hình rất mỏng và thiết kế màn hình theo kiểu đục lỗ.\r\n\r\nVivo V25 Pro \r\n\r\nVivo V25 Pro là chiếc smartphone có màn hình đẹp nhất trong phân khúc tầm trung. Ngoài những thông số kể trên, màn hình còn có độ sáng cao, cho phép bạn sử dụng ngoài trời và không ảnh hưởng đến trải nghiệm thị giác. Sản phẩm còn có tần số quét ấn tượng 120Hz và khả năng tự động thay đổi tần số làm tươi phù hợp với từng loại nội dung.\r\n\r\nXử lý những tác vụ nặng mượt mà và thời lượng pin ấn tượng\r\nBộ vi xử lý Mediatek Dimensity 1300 5G được tích hợp trên dòng Vivo V25 Pro này có khả năng xử lý những dòng game với mức đồ họa cao mượt mà. Hơn nữa bộ vi xử lý này còn sở hữu phiên bản RAM là 8GB và bộ nhớ trong 128GB. Người dùng có thể chuyển đổi nhanh chóng giữa những ứng dụng và đa nhiệm cùng lúc nhiều tác vụ.\r\n\r\nChiếc smartphone đi kèm với viên pin đạt mức dung lượng 4.830 mAh với khả năng kéo dài thời lượng dùng đến một ngày với những tác vụ nhẹ như đọc báo, lướt mạng xã hội. Con số này sẽ rút ngắn nếu bạn sử dụng để chơi game.\r\n\r\nVivo V25 Pro \r\n\r\nNgoài ra điện thoại còn gây ấn tượng bởi bộ sạc nhanh với công suất ấn tượng đạt 66W. Theo đó smartphone có thể nạp đầy năng lượng từ 0% đến 71% chỉ trong vòng 30 phút.\r\n\r\nKhả năng chụp ảnh sắc nét, chân thực\r\nDòng Vivo V25 Pro này được trang bị hệ thống 3 camera ở mặt sau với cảm biến chính đạt 64MP và đi kèm với tính năng chống rung quang học và hỗ trợ chụp ảnh vào ban đêm. Theo đó thiết bị có khả năng bắt được những khoảnh khắc một cách rõ ràng dù đang trong điều kiện thiếu ánh sáng.\r\n\r\nNgoài camera chính, smartphone cũng đi kèm với một cảm biến chụp ảnh góc rộng 8MP và một camera macro 2MP. Bên cạnh đó là hàng loạt các tính năng hữu ích khác như HDR, chế độ xóa phông,... Tất cả những thông số này chắc chắn sẽ mang đến cho người dùng những bức ảnh rõ nét và ấn tượng nhất.\r\n\r\nVivo V25 Pro \r\n\r\nỞ mặt trước, điện thoại được tích hợp với một chiếc camera selfie với độ phân giải đạt đến 32MP. Bên cạnh đó thiết bị còn được tích hợp thêm tính năng tự động lấy nét, giúp bạn có được những bức ảnh selfie tuyệt vời.\r\n\r\nMột số câu hỏi thường gặp\r\nCellphoneS tự hào là hệ thống bán lẻ điện thoại, laptop, thiết bị công nghệ uy tín và chất lượng hiện nay. Các cửa hàng trải dài trên các tỉnh thành phố lớn như Hà Nội, Hồ Chí Minh, Đà Nẵng, Bình Dương, Hải Phòng,… mang đến sự thuận tiện trong việc đi lại và trải nghiệm dịch vụ cho khách hàng. Nếu quý khách có bất kỳ câu hỏi nào thêm về Vivo V25 Pro hãy liên hệ ngay với tư vấn viên của CellphoneS nhé!\r\n\r\nVivo V25 Pro khi nào ra mắt?\r\nV25 Pro là dòng smartphone tạo được khá nhiều điểm nhấn với khách hàng dù chỉ thuộc phân khúc giá tầm trung. Vivo V25 Pro được ra mắt tại một sự kiện của Vivo vào ngày 17 tháng 8 năm 2022.\r\n\r\nVivo V25 Pro \r\n\r\nVivo V25 Pro giá bao nhiêu?\r\nMức giá khởi điểm của Vivo V25 Pro dành cho phiên bản cơ bản 8GB RAM và 128GB bộ nhớ trong là ₹35,999, tương đương 10,6 triệu đồng. Vivo V25 Pro sẽ cạnh tranh với những đối thủ cùng phân khúc là OnePlus Nord 2T, Nothing Phone 1,...', 'products/vivov25.webp', 5, 2, 13990000, GETDATE(), NULL),
(1, N'vivo Y22S 8GB 128GB', N'Vivo Y22s là sản phẩm điện thoại Vivo giá rẻ sở hữu màn hình kích thước 6.55 inches với tần số quét 90Hz hiển thị rõ nét cùng mặt lưng họa tiết lông vũ thời trang. Bên trong máy là một cấu hình ổn định với con chip Snapdragon 680 cùng bộ nhớ RAM lên đến 8GB (có thể mở rộng) giúp mang lại trải nghiệm dùng ổn định. Vivo Y22s cũng đáp ứng tốt các trải nghiệm nhiếp ảnh với camera chính 50MP.\r\n\r\nĐánh giá Y22s 8gb 128gb – Thiết kế hiện đại, hiệu năng mạnh mẽ\r\nY22s thuộc phân khúc tầm trung xứng đáng với những gì sản phẩm mang đến cho người dùng. Nếu là fan nhà Vivo Y22s thì nhanh tay \"order\" để có thể là một trong số người dùng đón đầu xu hướng mới.\r\n\r\nThiết kế Y22s hiện đại\r\nVivo Y22s mang thiết kế hiện đại, đường viền mỏng nhẹ, tạo màn hình lớn hơn khi sử dụng, các góc cạnh tinh tế càng tăng tính thẩm mỹ cho thương hiệu bạn đàn dùng khi sở hữu màu sắc sang trọng, tạo đẳng cấp người dùng, mặt lưng bóng loáng có cụm camera nhỏ gọn tạo tổng thể đẹp mắt về giao diện sản phẩm.\r\n\r\nMặt lưng Vivo Y22s của nhà Vivo khá khác biệt so với thiết kế gradian đổi màu theo hiệu ứng ánh sáng được nhiều mẫu điện thoại trang bị. Thay vào đó mặt lưng máy sở hữu họa tiết lông vũ khá độc đáo. Thiết kế này khi nghiêng người dùng sẽ thấy được hai màu sắc rõ rệt là xanh biển và vàng. Thiết kế nhám cũng là điểm nổi bật khi mang lại khả năng chống bán mồ hôi và vân tay hiệu quả.\r\n\r\nĐánh giá điện thoại Vivo Y22S – Thiết kế hiện đại, hiệu năng mạnh mẽ\r\n\r\nVivo Y22s có trọng lượng gọn nhẹ, người dùng có thể mang đi đến nơi làm việc, trường học, chất liệu cao cấp, điều đó sẽ giúp tăng độ bền cho máy. Các nút bấm logic, dễ dàng khởi động kể cả sử dụng lần đầu.\r\n\r\nMàn hình Vivo Y22s nhanh nhạy\r\nVivo Y22s sẽ mang đến trải nghiệm ấn tượng, các thao tác trên màn hình vô cùng mượt mà, tốc độ làm tươi nhanh chóng nên không lo bị chớp nháy màn hình khi sử dụng. Với độ rộng 6.55 inch giúp tạo không gian lớn hơn để xem phim.\r\n\r\nMàn hình vivo Y22s\r\n\r\nMàn hình với độ phân giải HD+ có thể đáp ứng tốt nhu cầu sử dụng hàng ngày của người dùng như lướt web, xem phim. Bên cạnh đó, màn hình còn sở hữu tần số quét lớn lên đến 90Hz. Tuy không phải con số ấn tượng 120Hz hay 144Hz trên các flagship cao cấp nhưng con số 90Hz trên một mẫu điện thoại giá rẻ như Vivo Y22s đủ để mang lại những thao tác chạm vuốt một cách mượt mà. Cùng với đó là một độ sáng vừa phải 530 nits giúp người dùng có trải nghiệm nhìn tốt trong điều kiện trong nhà.\r\n\r\nNgười dùng có thể bảo vệ dế yêu Vivo Y22s thông qua cài mật khẩu cho máy, giúp máy luôn an toàn khi dùng, tránh trường hợp xấu xảy ra. Mặt kính giúp hạn chế trầy xước khi vô tình làm rơi, chất liệu giảm thiếu bám vân tay, giúp người dùng không cần phải thường xuyên vệ sinh màn hình như trước đây nữa.\r\n\r\nĐánh giá điện thoại Vivo Y22S – Thiết kế hiện đại, hiệu năng mạnh mẽ\r\n\r\nNgoài ra, Vivo Y22s còn hiển thị lên đến triệu màu sắc rực rỡ, người dùng có trải nghiệm chiến game bùng nổ nhờ hiệu ứng hình ảnh, giật gân với những bộ phim hành động gây cấn. Kết hợp với âm thanh sẽ tăng cảm giác người dùng lên nhiều lần.\r\n\r\nCụm camera điện thoại Y22s Vivo ấn tượng\r\nVivo Y22s trang bị cụm camera sắc nét, người dùng sẽ dễ dàng ghi lại những khoảnh khắc đáng nhớ qua camera trước, bức ảnh sẽ có chiều sâu và độ rộng hơn. Chế độ quay video ghi những chuyển động một cách mượt mà.\r\n\r\nĐiện thoại Vivo Y22s với thông số camera chính lên tới 50MP bên cạnh đó là sự hỗ trợ của một cảm biến lớn giúp thu nhận ánh sáng một cách tốt hơn. Điều này giúp những bức ảnh chụp đêm trên Vivo Y22s cải thiện hơn so với các thế hệ trước.\r\n\r\nĐánh giá điện thoại Vivo Y22S – Thiết kế hiện đại, hiệu năng mạnh mẽ\r\n\r\nBên cạnh đó, để thỏa sức đam mê người dùng có thể sử dụng chế độ selfie qua camera trước, ống kính được Y22s Vivo có chế độ làm mịn da. Bộ lọc nhiều màu sắc, tạo bức ảnh đẹp mắt hơn mà không cần qua nhiều app khác nhau như trước đây nữa.\r\n\r\nHiệu năng của Vivo Y22s mạnh mẽ\r\nVivo Y22s chạy hệ điều hành Android 12, với con chipset mạnh mẽ, giúp mọi hoạt đồng ổn định, mượt mà. Với không gian lưu trữ lớn lên đến 8GB+128GB, người dùng có thể lưu các game nặng ký, tải ứng dụng hay tài liệu về máy mà không lo đầy nhanh chóng.\r\n\r\nĐánh giá điện thoại Vivo Y22S – Thiết kế hiện đại, hiệu năng mạnh mẽ\r\n\r\nĐánh giá khả năng chơi game trên Vivo Y22s với con chip Qualcomm Snapdragon 680 cho ra mức điểm tương đối ấn tượng ở cả hai phần mềm là GeekBench 5 và PCMark. Cụ thể:\r\n\r\nĐiểm hiệu năng Vivo Y22s trên GeekBench 5 cho 376 điểm đơn nhân và 1471 điểm đa nhân.\r\n\r\nĐiểm hiệu năng Vivo Y22s trên Antutu Benchmark: 285000 điểm.\r\n\r\nHiệu năng vivo Y22s\r\n\r\nBên cạnh đó, khi test đồ họa với 3DMark Wild Life Extreme thì kết quả Vivo Y22s cho ra khá khả quan với điểm số 124 cùng FPS trung bình là 0.,7. Trong suốt quá trình test, dung lượng pin không bị tụt quá sâu và nhiệt độ máy không quá nóng.\r\n\r\nĐánh giá chung với mức cấu hình của Vivo Y22s thì bên cạnh khả năng xử lý tốt các tác vụ như đọc báo, xem phim, lướt facebook,.. thì thiết bị còn có thể chiến tốt một số tựa game với mức đồ họa trung bình.\r\n\r\nPin dung lượng 5000 mh – hỗ trợ sạc nhanh 18W\r\nLượng pin của Vivo Y22s khá ấn tượng, 5000mAh sử dụng lướt web, xem phim nhiều giờ liền mà không lo hết pin giữa chừng. Máy có kết nối Bluetooth với các thiết bị khác nhau, để tăng trải nghiệm khi sử dụng.\r\n\r\nPin vivo Y22s\r\n\r\nBên cạnh một viên pin dung lượng lớn, điện thoại còn được trang bị sạc nhanh công suất lớn tới 18W. Qua một số bài test được thực hiện thì dung lượng pin trên Vivo Y22s sẽ cho thời gian chơi liên quan khoảng 7 tiếng.\r\n\r\nVivo Y22s ra mắt khi nào?\r\nVivo Y22s hiện vẫn chưa có thông tin liên quan đến ngày ra mắt và giá bán của sản phẩm, tuy nhiên theo một số bài báo, sản phẩm này có thể sẽ cao hơn nhưng sẽ không chênh lệch quá nhiều so với bản tiền nhiệm trước đó. Sản phẩm được nâng cấp nhưng lại có thiết kế và hiệu năng đáng kinh ngạc, nên chắc chắn sẽ là sản phẩm được quan tâm nhất trong thời điểm ra mắt sắp tới đây.\r\n\r\nMột số sản phẩm cạnh tranh cùng phân khúc với Vivo Y22s trong năm nay: OPPO A55, Xiaomi Redmi Note 11,…\r\n\r\nVivo Y22S 8GB 128GB\r\n\r\nĐiện thoại Vivo Y22s giá bao nhiêu tiền?\r\nSau khi được ra mắt vào cuois tháng 8 năm 2022 thì Vivo Y22s chính hãng cũng nhanh chóng được bán chính hãng tại thị trường Việt Nam. Khi mở bán, điện thoại Vivo Y22s có giá bán khoảng gần 6 triệu đồng. Tuy nhiên, sau một thời gian ra mắt, điện thoại cũng đã có sự giảm nhẹ trong gia bán, cụ thể như sau:\r\n\r\nVivo Y22s 8GB – 128GB bộ nhớ xanh đen: Giá bán khoảng 5.290.000 VND\r\n\r\nVivo Y22s 8GB – 128GB bộ nhớ xanh vàng: Giá bán khoảng 5.290.000 VND\r\n\r\nVivo Y22s 4GB – 128GB bộ nhớ xanh đen: Giá bán khoảng 4.990.000 VND\r\n\r\nVivo Y22s 4GB – 128GB bộ nhớ xanh vàng: Giá bán khoảng 4.990.000 VND\r\n\r\n(Lưu ý giá bán sẽ thay đổi liên tục tùy theo từng chương trình khuyến mãi)', 'products/vivoy22s.webp', 5, 2, 5990000, GETDATE(), NULL),
(1, N'Xiaomi Redmi 12C 4GB 64GB', N'Xiaomi Redmi 12C là mẫu điện thoại mới sắp được hãng cho ra mắt thị trường. Mang tới cho người dùng hiệu năng ổn định với con chip MediaTek Helio G85. Cùng với đó là thiết kế ấn tượng, vượt trội. Đặc biệt dung lượng pin siêu khủng tới 5000 mAh cùng sạc nhanh 10W. Đây chắc chắn sẽ là mẫu điện thoại nổi bật nhất trong phân khúc giá rẻ mà bất kỳ ai cũng không thể bỏ qua.\r\n\r\nĐánh giá Xiaomi Redmi 12C\r\n\r\nSo sánh điện thoại Xiaomi Redmi 12C với Xiaomi Redmi 10C, có gì nâng cấp\r\nLà phiên bản nâng cấp của điện thoại Xiaomi Redmi 10C vậy mẫu điện thoại Xiaomi Redmi 12C có nâng cấp gì nổi trội không. Nếu đang phân vân giữa hai thế hệ điện thoại này thì nên chọn sản phẩm nào phù hợp, hãy cùng tìm hiểu ngay qua bảng so sánh sau:\r\n\r\nThông số	\r\nXiaomi Redmi 12C\r\n\r\nXiaomi Redmi 10C\r\n\r\nMàn hình\r\n\r\nLCD 6.7 inch HD+\r\n\r\nĐộ sáng tối đa 500 nits\r\n\r\nIPS LCD 6.7 inch HD+\r\n\r\nĐộ sáng tối đa 400 nits\r\n\r\nMàu sắc\r\n\r\nShadow Black\r\n\r\nSea Blue\r\n\r\nMint Green\r\n\r\nLavender\r\n\r\nCaribbean Green\r\n\r\nPacific Blue\r\n\r\nMidnight Black\r\n\r\nCPU\r\n\r\nMediaTek Helio G85\r\n\r\n8 nhân\r\n\r\nGPU Mali-G52 MP2\r\n\r\nRAM LPDDR4X\r\n\r\nSnapdragon 680\r\n\r\nTiến trình 6nm\r\n\r\nGPU Qualcomm Adreno 610\r\n\r\nLPDDR4X + UFS 2.2\r\n\r\nRAM - ROM\r\n\r\n4GB - 64GB\r\n\r\n4GB - 128GB\r\n\r\n6GB - 128GB\r\n\r\n4GB - 64GB\r\n\r\n4GB - 128GB\r\n\r\nCamera trước\r\n\r\n5MP\r\n\r\n5MP\r\n\r\nCamera sau\r\n\r\nCamera chính 50MP\r\n\r\nCamera chính 50MP\r\n\r\nCảm biến độ sâu 2MP\r\n\r\nPin\r\n\r\n5000 mAh\r\n\r\nSạc nhanh 10W\r\n\r\n5000mAh\r\n\r\nSạc nhanh 18W\r\n\r\nBảo mật\r\n\r\nVân tay mặt sau\r\n\r\nVân tay mặt sau\r\n\r\nXiaomi Redmi 12C với nhiều màu sắc cùng nhiều lựa chọn cấu hình hơn giúp người dùng có đa dạng sự lựa chọn, phù hợp với từng nhu cầu và sở thích khác nhau.\r\n\r\nXiaomi Redmi 12C pin siêu khủng, hiệu năng ấn tượng\r\nRealme 12C là phiên bản nâng cấp của Realme 9C và 10C. Với trang bị ấn tượng từ thiết kế tới hiệu năng cùng với đó là dung lượng pin lớn. Chiếc điện thoại mới nhất nhà Xiaomi này sẽ mang tới cho người dùng trải nghiệm cực đã. Dưới đây là chi tiết các thông số về model mới này.\r\n\r\nThiết kế nổi bật, chống vân tay độc đáo\r\nRedmi 12C được thiết kế nguyên khối với lớp vỏ ngoài được hoàn thiện bằng nhựa cao cấp. Chúng không chỉ giúp điện thoại sử dụng thiết kế nguyên khối giúp máy trở nên bền bỉ và chắc chắn hơn. Hơn thế mặt lưng được phủ lớp carbon khá nổi bật và giúp hạn chế bám vân tay được tốt hơn.\r\n\r\nXiaomi Redmi 12C pin siêu khủng, hiệu năng ấn tượng\r\n\r\nTrên các cạnh của điện thoại được bo cong mềm mại. Chúng không chỉ mang đến nét thẩm mỹ mà còn giúp người dùng có thể cầm nắm được dễ dàng hơn.\r\n\r\nMàn hình sắc nét, chất lượng trọn vẹn\r\nXiaomi Redmi 12C được trang bị màn hình chất lượng giúp cho chất lượng hiển thị trở nên hoàn hảo nhất cho người dùng. Với tấm nền LCD kết hợp với độ phân giải HD+ và kích thước lớn. Mọi chi tiết trên thiết bị sẽ được hiển thị ổn nhất, góc nhìn ấn tượng và màu sắc hài hoà.\r\n\r\nXiaomi Redmi 12C pin siêu khủng, hiệu năng ấn tượng\r\n\r\nĐể bảo vệ cho màn hình là lớp kính cường lực Corning Gorilla Glass 3. Chúng không chỉ giảm thiểu tác động do va đập mà còn giúp hạn chế vết xước để giữ cho bề mặt của điện thoại luôn mới.\r\n\r\nHiệu năng ổn định với chip MediaTek Helio G85\r\nCung cấp sức mạnh cho Xiaomi Redmi 12C là con chip MediaTek Helio G85. Được sản xuất trên tiến trình 8 nhân, chip mang tới sức mạnh ổn định đảm bảo các thao tác được mượt mà nhanh chóng.\r\n\r\nXiaomi Redmi 12C pin siêu khủng, hiệu năng ấn tượng\r\n\r\nHơn thế nữa, điện thoại còn được trang bị RAM 4GB chuẩn LPDDR4X với bộ nhớ trong tới 64GB. Trang bị này không chỉ đáp ứng được nhu cầu đa nhiệm mà chúng còn đáp ứng được nhu cầu lưu trữ của người dùng.\r\n\r\nCamera ấn tượng, trải nghiệm bất tận\r\nXiaomi đã trang bị cho Redmi 12C cụm camera sau chất lượng, độc đáo để người dùng có được trải nghiệm bất tận và hoàn hảo nhất. Cụ thể, với camera chính độ phân giải 50MP cùng chế độ chụp HDR giúp mang lại những bức ảnh chất lượng với độ chi tiết cao.\r\n\r\nXiaomi Redmi 12C pin siêu khủng, hiệu năng ấn tượng\r\n\r\nCamera selfie với độ phân giải 5MP cho bạn thỏa sức selfie, giải trí. Đặc biệt các tính năng xoá phông ảo diệu cùng rất nhiều công nghệ AI hiện đại, đẳng cấp giúp bạn có được những tấm hình lung linh để thoải mái chia sẻ với bạn bè.\r\n\r\nNgoài ra, camera cũng được tích hợp rất nhiều tính năng hiện đại như: các chế độ chụp ảnh chân dung, chế độ chụp toàn cảnh, xoá phông, bộ lọc màu,... Hay những tính năng ấn tượng khi quay video. Từ đó bạn có được trải nghiệm trọn vẹn nhất và hoàn hảo nhất ngay trên thiết bị di động của mình.\r\n\r\nPin khổng lồ 5000 mAh cùng chế độ siêu tiết kiệm năng lượng\r\nVới Xiaomi Redmi 12C bạn có thể thoải mái trải nghiệm rất nhiều giờ liên tục nhờ viên pin dung lượng khổng lồ tới 5000 mAh. Đặc biệt, chế độ siêu tiết kiệm pin ấn tượng cho phép 6 ứng dụng quan trọng nhất được hoạt động. Nhờ tính năng này mà bạn có thể sử dụng tới nhiều giờ tiếp theo khi điện thoại chỉ còn 5% pin.\r\n\r\nPin khổng lồ 5000 mAh cùng chế độ siêu tiết kiệm năng lượng\r\n\r\nBên cạnh đó là chế độ sạc nhanh công suất lớn trên thiết bị. Chắc chắn những trang bị này sẽ giúp người dùng cảm thấy vô cùng giá trị cho một chiếc điện thoại giá rẻ.\r\n\r\nGiá Xiaomi Redmi 12C bao nhiêu?\r\nVề giá bán: mặc dù Xiaomi Redmi 12C sắp được ra mắt thị trường nhưng giá bán của chúng vẫn là một ẩn số. Tuy nhiên, theo dự đoán của các chuyên gia, mẫu điện thoại này sẽ có giá tương tự như phiên bản tiền nhiệm của chúng. Mức giá mà người dùng có thể sở hữu chiếc điện thoại sang trọng, độc đáo và vô cùng ấn tượng sẽ ở khoảng mức giá từ 2 đến hơn 3 triệu đồng.\r\n\r\nChi tiết dự kiến như sau:\r\n\r\nXiaomi Redmi 12C\r\n\r\nGiá bán ra mắt\r\n\r\nGiá bán tham khảo\r\n\r\nXiaomi Redmi 12C 4GB RAM + 64GB bộ nhớ trong\r\n\r\n699 NDT\r\n\r\nKhoảng 2.4 triệu đồng\r\n\r\nXiaomi Redmi 12C 4GB RAM + 128GB bộ nhớ trong\r\n\r\n799 NDT\r\n\r\nKhoảng 2.7 triệu đồng\r\n\r\nXiaomi Redmi 12C 6GB RAM + 128GB bộ nhớ trong\r\n\r\n899 NDT\r\n\r\nKhoảng 3.1 triệu đồng\r\n\r\nbao giờ ra mắt\r\n\r\nCó thể thấy rằng với thiết kế hiện đại, trang bị ấn tượng, hiệu năng hấp dẫn mẫu điện thoại mới này sẽ mang tới cho người dùng trải nghiệm bất tận khó quên. Đây được coi là mức giá vô cùng phù hợp với những trang bị chất lượng mà hãng đã đầu tư trên phiên bản lần này.', 'products/xiaomi12c.webp', 4, 2, 3590000, GETDATE(), NULL),
(1, N'Xiaomi 12T', N'Xiaomi 12T là sản phẩm được nhiều tín đồ công nghệ đánh giá cao với màn hình AMOLED 6.67 inch độ phân giải cao, tần số quét 120Hz, chip MediaTek Dimensity 8100-Ultra, RAM 8GB và bộ nhớ trong 128GB. Thêm vào đó camera chính 108MP hỗ trợ chống rung OIS và sạc nhanh 120W cho trải nghiệm sử dụng cực chất. \r\n\r\nXiaomi-Mi-12T\r\n\r\nĐiện thoại Xiaomi Mi 12T - Smartphone nổi trội chứa cấu hình \"khủng\"\r\nSau sự thành công của bộ đôi siêu phẩm Xiaomi 12 và Xiaomi 12 Pro thì phân khúc smartphone cận cao cấp vừa chứng kiến sự ra mắt của Xiaomi Mi 12T - với màn hình 120 Hz độ phân giải cao, camera 108 MP cùng vi xử lý tối tân sẽ làm nên smartphone tuyệt đỉnh cho tác vụ giải trí tuyệt mượt.\r\n\r\nThiết kế Xiaomi Mi 12T nổi bật, màn hình bắt mắt\r\nĐiện thoại Xiaomi Mi 12T sở hữu thân máy bóng bẩy quyến rũ với mặt lưng cong viền phủ kính bền cứng. Phần khung máy chế tạo từ chất liệu cao cấp giúp tăng thêm độ bền cho thân máy. Thiết kế mỏng nhẹ giúp cho bạn luôn cầm nắm Xiaomi Mi 12T một cách êm vừa tay.\r\n\r\nXiaomi Mi 12T\r\n\r\nĐiện thoại Xiaomi Mi 12T trang bị màn hình thiết kế viền mỏng tối giản đẹp mắt. Màn hình Xiaomi Mi 12T có độ phân giải cao cho hình ảnh trở nên sắc nét và sống động hơn. Mi 12T còn được tích hợp tần số quét lên đến tận 120 Hz cho những trải nghiệm giải trí tuyệt đỉnh, khả năng vuốt chạm mượt mà, trơn tru. Ngoài ra màn hình Xiaomi Mi 12T còn sở hữu màn hình CrystalRes AMOLED cho chất lượng ảnh hoàn mỹ.\r\n\r\nBên cạnh độ phân giải cao, sản phẩm còn tích hợp nhiều công nghệ hiện đại nhằm nâng cao trải nghiệm người dùng. Một trong những điểm nổi bật là cảm biến vân tay dưới màn hình thay vì vân tay cạnh bên như ở thế hệ trước.\r\n\r\nXiaomi Mi 12T - \r\n\r\nXiaomi 12T sở hữu camera 108 MP ấn tượng\r\nĐiện thoại Xiaomi Mi 12T nổi bật thu hút ở cụm camera chụp ảnh chuyên nghiệp. Trong đó, camera chính có độ phân giải tận 108 MP với thuật toán thông minh (AI) giúp xử lý chi tiết môi trường tốt hơn để cho ra ảnh chụp đầy đủ trọn vẹn. Hơn nữa, camera 108 MP giúp Xiaomi Mi 12T chụp ảnh ban đêm, chụp ảnh thiếu sáng với kết quả vô cùng ấn tượng.\r\n\r\nHai camera còn lại trên Xiaomi Mi 12T hỗ trợ tính năng góc siêu rộng 8MP và chụp macro 2MP. Ngoài ra hệ thống camera sau trên Xiaomi Mi 12T cho phép bạn quay video với chất lượng lên đến 4K.\r\n\r\nXiaomi Mi 12T - \r\n\r\nCamera 20 MP khẩu độ f/2.25 chính là camera selfie trên Xiaomi Mi 12T. Camera này giúp bạn thỏa sức selfie với chế độ Chân dung đẹp mắt, cũng như cho phép quay video chất lượng Full HD cho những video đăng tải đầy bắt mắt.\r\n\r\nNhờ những công nghệ camera được cải tiến, Mi 12T đáp ứng hầu hết các nhu cầu quay phim, chụp hình của người dùng. Đồng thời, hình ảnh và video cho chất lượng cao không kém cạnh so với những chiếc smartphone phân khúc tầm trung khác trên thị trường. \r\n\r\nXiaomi Mi 12T - \r\n\r\nVi xử lý Mediatek Dimensity 8100-Ultra mạnh mẽ\r\nMột điểm thu hút khác ở Xiaomi Mi 12T chính là hiệu năng. Trang bị bộ vi xử lý Mediatek Dimensity hỗ trợ mạng 5G, Xiaomi Mi 12T chứa đựng sức mạnh đủ để bạn thoải mái chiến game mọi lúc với tần số quét đến 120 Hz mà không lo giật lag. Cùng với tùy chọn 8 GB RAM và lên đến 128 GB ổ cứng, thiết bị sẽ đáp ứng nhu cầu dùng máy đa dạng và linh hoạt.\r\n\r\nXiaomi Mi 12T - \r\n\r\nĐa số các tín đồ công nghệ đánh giá cao con chip này bởi khả năng tương thích tốt, ổn định cao với nhiều ứng dụng và các game đồ hoạ nặng. Thêm vào đó, bạn có thể tham gia, tải, thiết lập và “chiến” game nặng ở mức đồ hoạ cao nhất.\r\n\r\nXiaomi Mi 12T vận hành trên giao diện riêng của Xiaomi - giao diện MIUI 13 trên nền Android 12. Ngoài công nghệ 5G, máy còn hỗ trợ chuẩn Bluetooth 5.3, cổng USB-C và WiFi 6. Phương thức bảo mật vân tay vẫn góp mặt trên chiếc 12T - với vị trí cảm biến đặt tại phím cạnh của thân máy.\r\n\r\nVị trí \r\n\r\nSản phẩm vận hành trên giao diện riêng của Xiaomi - giao diện MIUI 13 trên nền Android 12. Tính năng mới trên hệ điều hành này phải kể đến:\r\n\r\n- Chuyển đổi linh hoạt chủ đề theo hình nền\r\n\r\n- Chế độ 1 tay\r\n\r\n- Tính năng chạm nhanh độc đáo\r\n\r\n- Chia sẻ trực tiếp nhanh chóng từ menu tổng quan\r\n\r\n- Bảo vệ quyền riêng tư với hệ thống lại các quyền ứng dụng\r\n\r\n- Làm mờ màn hình\r\n\r\n- Tiện ích hội thoại\r\n\r\n- Chụp ảnh màn hình cuộn\r\n\r\nXiaomi Mi 12T - \r\n\r\nPin \"khủng\" dung lượng lớn kèm sạc tốc độ cao\r\nĐiện thoại Xiaomi Mi 12T phục vụ thao tác giải trí và liên lạc của bạn suốt ngày dài nhờ trang bị nguồn năng lượng pin dồi dào bên trong. Viên pin bên trong Xiaomi Mi 12T thuộc chuẩn pin an toàn cao, với dung lượng 5.000mAh sẽ cung cấp cả ngày chiến game, nghe nhạc, lướt web và giữ liên lạc cùng người thân.\r\n\r\nXiaomi Mi 12T - \r\n\r\nĐiện thoại Xiaomi Mi 12T còn tích hợp thêm công nghệ sạc pin tốc độ cao. Công suất sạc nhanh đến 120W sẽ giúp giảm thời gian sạc pin cho máy, từ đó đảm bảo thiết bị luôn đạt mức đầy 100% pin chỉ trong vòng chưa chưa đến 20 phút sạc để bạn thỏa sức dùng máy mọi lúc và mọi ngày.\r\n\r\nKhi nào Xiaomi Mi 12T ra mắt?\r\nCuối năm là thời gian nhiều sản phẩm đến từ các thương hiệu lớn đồng loạt ra mắt, Xiaomi cũng không là ngoại lệ. Điện thoại Xiaomi Mi 12T dự kiến sẽ được ra mắt vào ngày 04/10/2022, sau đó sẽ được mở bán tại nhiều thị trường châu Á. Sự kiện này thu hút sự chú ý của không ít các tín đồ công nghệ và MiFan bởi nhiều cải tiến, công nghệ đột phá so với các thế hệ trước. Hứa hẹn đây sẽ là một trong những sản phẩm cháy hàng đến từ ông lớn công nghệ Xiaomi.\r\n\r\nKhi nào Xiaomi Mi 12T ra mắt?\r\n\r\nĐiện thoại Xiaomi Mi 12T có giá bán bao nhiêu?\r\nĐiện thoại Xiaomi Mi 12T dự kiến có mức giá khởi điểm từ 500USD (tương đương khoảng 11.3 triệu đồng) hoặc từ 600USD (tương đương khoảng 13.6 triệu đồng). Ở mỗi quốc gia khác nhau, giá có thể thay đổi ít nhiều.\r\n\r\nTại Việt Nam, giá bán Xiaomi 12T phiên bản 8GB +128GB khoảng 12.500.000 đồng, phiên bản 8GB +256GB giá bán khoảng 13.000.000 đồng. Với một chiếc điện thoại sở hữu cấu hình mạnh mẽ, thiết kế hiện đại, camera sắc nét và nhiều tính năng cải tiến thì đây sẽ là mức giá siêu hời dành cho bạn.', 'products/xiaomi12t.webp', 4, 2, 12490000, GETDATE(), NULL),
(1, N'Xiaomi 13 8GB 256GB', N'Xiaomi 13 là sản phẩm mới được trang bị màn hình OLED kích thước 6.36 inch cùng tần số quét lên đến 120Hz. Bên trong Xiaomi 13 là con chip Snapdragon 8 Gen 2 mới nhất cùng bộ nhớ RAM 8GB vượt trội. Điện thoại cũng đáp ứng tốt khả năng nhiếp ảnh với camera Leica 50MP.\r\n\r\nXiaomi 13\r\n\r\nTại sao nên mua điện thoại Xiaomi 13 thay vì Xiaomi 12 Pro ở thời điểm này\r\nXiaomi 13 là mẫu điện thoại cao cấp mới của Xiaomi với mức giá nhỉnh hơn một chút so với Xiaomi 12 Pro. Vậy ở thời điểm này thì nên nâng cấp Xiaomi 13 với nhiều tính năng mới hay mua Xiaomi 12 Pro với mức giá rẻ hơn, hãy cùng tìm hiểu ngay sau đây.\r\n\r\nThông số\r\n\r\nXiaomi 13\r\n\r\nXiaomi 12 Pro\r\n\r\nMàn hình\r\n\r\n6.36 OLED, 120Hz\r\n\r\n6.73 inches 120Hz\r\n\r\nMàu sắc\r\n\r\nĐen\r\n\r\nTrắng ( độc quyền tại CPS )\r\n\r\nXanh ô liu\r\n\r\nXám\r\n\r\nXanh\r\n\r\nTím\r\n\r\nChip\r\n\r\nSnapdragon 8 Gen 2 4nm\r\n\r\nQualcomm SM8450 Snapdragon 8 Gen1\r\n\r\nBộ nhớ RAM\r\n\r\n8GB, 12GB	8GB, 12GB\r\nCamera\r\n\r\n Camera chính (Leica): Cảm biến 50MP, f/1.8, HyperOIS\r\n\r\nCamera Tele: 10 MP, f/2.0\r\n\r\nCamera góc rộng: 12 MP, f/2.2\r\n\r\nCamera trước : 32 MP\r\n\r\nCamera góc rộng: 50 MP, f/1.9, Dual Pixel PDAF, OIS\r\n\r\nCamera tele: 50 MP, f/1.9, PDAF, 2x optical zoom\r\n\r\nCamera góc siêu rộng: 50 MP, f/2.2, 115˚\r\n\r\nCamera trước 32 MP\r\n\r\nDung lượng pin\r\n\r\n4500 mah\r\n\r\nSạc nhanh 67W\r\n\r\nPower Delivery 3.0 Quick Charge 4+\r\n\r\n4600 mAh\r\n\r\nSạc nhanh 120W\r\n\r\nSạc nhanh không dây 50W\r\n\r\nSạc không dây ngược 10W\r\n\r\nPower Delivery 3.0 Quick Charge 4+\r\n\r\nĐánh giá Xiaomi 13: Thiết kế sang trọng, hiệu năng mạnh mẽ\r\nXiaomi 13 được đánh giá cao về giao diện cho đến hiệu năng của sản phẩm, nhờ sự luôn luôn đổi mới, bắt kịp nhu cầu người dùng, nên sản phẩm này đang được tìm kiếm thông tin nhiều nhất. Xiaomi 13 chắc chắn sẽ không khiến người dùng thất vọng về những gì mà điện thoại này mang lại.\r\n\r\nReview thiết kế vuông vắn sang trọng của Xiaomi 13\r\nXiaomi 13 mang giao diện ưa nhìn, mang nét sang trọng, pha một chút thanh lịch, với các chi tiết được hoàn thiện tỉ mỉ đẹp mắt. Các góc cạnh vuông tinh tế, mặt lưng từ chất liệu polymer silicon kết hợp công nghệ nano-skin giúp chống trầy xước, bụi bẩn. Đồng thời mặt sau thiết kế cụm camera ở góc trên cùng bên trái màn hình.\r\n\r\nXiaomi 13 – Thiết kế sang trọng, hiệu năng mạnh mẽ\r\n\r\nXiaomi 13 có nút khởi động và âm lượng thuận tiện, người dùng dễ dàng khởi động máy, các thao tác trên điện thoại đơn giản, kể cả người mới sử dụng lần đầu. Bên cạnh đó, máy còn thiết lập mật khẩu để người dùng có độ bảo mật cao nhất, tránh các trường hợp kẻ xấu lấy cắp thông tin quan trọng.\r\n\r\nMàn hình OLED rực rỡ, bốn viền siêu mỏng\r\nXiaomi 13 có màn hình OLED rộng lên đến 6.36 inch, độ phân giải FHD+ người dùng sẽ có trải nghiệm ấn tượng khi xem phim, chơi game trên điện thoại. Máy còn có trọng lượng khá nhẹ, sẽ như người bạn đồng hành cùng người dùng trong những chuyến đi xa.\r\n\r\nXiaomi 13 – Thiết kế sang trọng, hiệu năng mạnh mẽ\r\n\r\nĐiện thoại Xiaomi 13 có tần số quét 120Hz giúp hình ảnh hiển thị luôn rõ nét, không bị lỗi mờ khi sử dụng. Sở hữu hàng triệu sắc màu được hiển thị khi trải nghiệm chiến game, xem phim, giúp người dùng có những phút giây thăng hoa với nghệ thuật sắc màu.\r\n\r\nỐng kính siêu rộng Leica, chụp ảnh chuyên nghiệp\r\nXiaomi 13 trang bị cụm camera có độ phân giải lớn, dành cho khách hàng có niềm yêu thích chụp hình, thỏa sức sáng tạo khi chụp ảnh. Camera chính Sony IMX800 có độ phân giải lên đến 50MP, camera góc siêu rộng 12MP và camera tele độ phân giải 10MP. Nhờ vậy, người dùng sẽ ghi lại những bức hình, video sống động, chân thực đến từng chi tiết nhỏ trong khung hình.\r\n\r\nXiaomi 13 – Thiết kế sang trọng, hiệu năng mạnh mẽ\r\n\r\nCamera trước selfie 16MP rõ nét, có chế độ làm mịn da, người dùng không cần phải qua nhiều app chỉnh sửa, mà chỉ cần chỉnh theo ý muốn qua bộ lọc của điện thoại. Sau đó, có thể chia sẻ hình ảnh những khoảnh khắc cùng người thân lên mạng xã hội ngay.\r\n\r\nHiệu năng mạnh mẽ với Snapdragon 8 Gen 2\r\nXiaomi 13 có bộ nhớ lưu trữ nhiều dữ liệu khác nhau, hay các tựa game nặng ký, nhưng vẫn còn chỗ trống trong máy. Kết hợp với con chip mạnh mẽ Snapdragon 8 Gen 2 , RAM 8GB và bộ nhớ trong 128GB, máy của người dùng sẽ luôn hoạt động mượt mà, các tác vụ trở nên dễ dàng, hạn chế tình trạng giật lag khi sử dụng.\r\n\r\nXiaomi 13 – Thiết kế sang trọng, hiệu năng mạnh mẽ\r\n\r\nDung lượng pin của điện thoại lên đến 4500mAh, do đó đáp ứng nhu cầu sử dụng thời gian dài người dùng. Xiaomi 13 có công nghệ sạc cực nhanh đến 67W đây là công suất đáng kinh ngạc khi chỉ cần cắm sạc, pin sẽ đầy một cách nhanh chóng.', 'products/xiaomi13.webp', 4, 2, 22990000, GETDATE(), NULL),
(1, N'Xiaomi Redmi Note 11 128GB', N'Xiaomi Redmi Note 11 phiên bản 4GB/128GB được trang bị bộ vi xử lý Snapdragon 680 cùng viên pin 5.000 mAh sạc nhanh 33W. Điện thoại sở hữu bộ tứ camera bao gồm cảm biến chính độ phân giải 50MP, ống kính góc siêu rộng 8MP, camera macro 2MP và cảm biến đo độ sâu trường ảnh 2MP.\r\n\r\nNgoài ra, Redmi Note 11 còn được trang bị màn hình AMOLED với kích thước 6.43 inch hỗ trợ độ phân giải Full HD+ và tần số quét 90Hz. Mặt trước có thiết kế đục lỗ theo xu hướng smartphone hiện nay.', 'products/xiaominote11.webp', 4, 2, 4990000, GETDATE(), NULL),
(1, N'Xiaomi POCO M5 4GB 64GB', N'Mới đây, Xiaomi đã giới thiệu chính thức sản phẩm Xiaomi POCO M5, mẫu điện thoại giá rẻ được thiết kế để mang tới trải nghiệm vượt trội khi chơi game. Điện thoại Xiaomi mới này sở hữu một màn hình Full HD+ lớn có tần số quét 90Hz, CPU và GPU được tối ưu hóa để hỗ trợ cả các tựa game nặng cùng thời lượng pin dài kèm hỗ trợ sạc nhanh.\r\n\r\nĐánh giá Xiaomi POCO M5 – Hiệu năng ổn định, chơi game mượt mà\r\nMẫu điện thoại Xiaomi POCO M5 mới đây đã được Xiaomi chính thức cho ra mắt với mục tiêu mang tới trải nghiệm chơi game vượt trội trong phân khúc giá rẻ. Chiếc điện thoại của Xiaomi đã được cải tiến những gì? Liệu những nâng cấp này có khiến POCO M5 thực sự khác biệt so với những mẫu điện thoại thoại giá rẻ khác?\r\n\r\nThoải mái cầm nắm với thiết kế phẳng\r\nXiaomi POCO M5 sở hữu một thiết kế đặc trưng với phần khung viền được vát phẳng và bo cong ở các cạnh nhằm mang tới sự thoải mái khi cầm nắm điện thoại trong thời gian dài. Phần mặt lưng còn được đặc biệt làm hơi cong nhẹ để tạo sự ôm tay và chắc chắn.\r\n\r\nMẫu điện thoại này sẽ bao gồm ba màu sắc ấn tượng, cá tính là Icy Blue, Poco Yellow, Power Black để bạn thoải mái lựa chọn và gây ấn tượng với mọi người xung quanh.\r\n\r\nĐánh giá Xiaomi POCO M5 – Hiệu năng ổn định, chơi game mượt mà\r\n\r\nXiaomi POCO M5 vẫn giữ nguyên thiết kế đặc trưng của dòng sản phẩm này đó là cụm camera lớn và nổi bật nhờ chiếm một phần lưng của điện thoại. Phần mặt lưng của POCO M5 còn được làm giả da nhằm mang tới cảm giác cao cấp cho chiếc điện thoại này.\r\n\r\nĐồng thời, việc làm giả da cũng là một giải pháp không đi theo lối mòn của Xiaomi trong việc loại bỏ tình trạng bám mồ hôi, vân tay trên mặt lưng điện thoại.\r\n\r\nMàn hình sắc nét với tần số quét và tốc độ lấy mẫu cao\r\nMặt trước của Xiaomi POCO M5 là một màn hình 6,58 inch có độ phân giải Full HD+. Nhờ đó mà không có gì quá ngạc nhiên khi POCO M5 lại sở hữu khả năng hiển thị với độ chi tiết cao và màu sắc sống động. Máy cũng có thêm các tính năng khác như Sunlight nhằm hỗ trợ người chơi có thể sử dụng thoải mái ở nhiều điều kiện ánh sáng.\r\n\r\nĐánh giá Xiaomi POCO M5 – Hiệu năng ổn định, chơi game mượt mà\r\n\r\nBên cạnh đó, POCO M5 còn được trang bị tần số quét 90Hz và tốc độ lấy mẫu cảm ứng ở mức 240Hz. Với tần số quét và tốc độ lấy mẫu cảm ứng vượt trội trong tầm giá, trải nghiệm chơi game cùng các chuyển động của hình ảnh sẽ luôn đảm bảo được tốc độ cao, sự mượt mà, uyển chuyển.\r\n\r\nXiaomi POCO M5 còn được trang bị công nghệ Dynamic Switch Display, cho phép điện thoại tuỳ chỉnh tần số quét sao cho phù hợp nhất với ứng dụng đang hoạt động. Từ đó giúp tối ưu điện năng mà điện thoại tiêu thụ.\r\n\r\nHiệu suất dẫn đầu cuộc chơi\r\nXiaomi POCO M5 sử dụng con chip MediaTek G99 Octa-Core có xung nhịp tối đa lên tới 2,2GHz. Con chip này sẽ giúp cho POCO M5 dẫn đầu cuộc chơi nhờ mang tới trải nghiệm game vô cùng mượt mà, ổn định. Khi kết hợp với GPU ARM Mali G57, mẫu điện thoại mới của Xiaomi còn có thể thoải mái cân cả những tựa game nặng hoặc yêu cầu đồ hoạ cao.\r\n\r\nDung lượng RAM 4 - 6GB đảm bảo cho các tác vụ đa nhiệm trên điện thoại có thể hoạt động một cách mượt mà, êm ái cũng như không xảy ra các hiện tượng giật, lag, crash ứng dụng,...\r\n\r\nĐánh giá Xiaomi POCO M5 – Hiệu năng ổn định, chơi game mượt mà\r\n\r\nĐể hiệu quả chơi game được cải thiện một cách rõ rệt, tính năng Game Turbo 5.0 đã được tạo ra và trang bị lên trên điện thoại POCO M5 của Xiaomi. Tính năng này có khả năng kiểm soát sau đó tối ưu CPU, GPU cũng như bộ nhớ nhằm giảm hoạt động của các ứng dụng chạy nền, từ đó tăng tính ổn định và sự tập trung cho người chơi.\r\n\r\nTương tự như các dòng điện thoại giá rẻ khác, Xiaomi POCO M5 cũng sử dụng viên pin có dung lượng lớn. Với dung lượng 5000mAh,bạn có thể sử dụng POCO M5 một cách thoải mái cả ngày mà không lo tới việc cạn pin. Ngoài ra, điện thoại còn hỗ trợ sạc nhanh 18W để rút ngắn thời gian chờ đợi thiết bị được sạc đầy pin của người dùng.\r\n\r\nĐánh giá Xiaomi POCO M5 – Hiệu năng ổn định, chơi game mượt mà\r\n\r\nĐiện thoại Xiaomi POCO M5 khi nào ra mắt?\r\nMẫu điện thoại Poco mới với tên gọi Xiaomi Poco M5 được hãng điện thoại Xiaomi giới thiệu trực tuyến đến với người tiêu dùng vào 20:00 (GMT+8) tại Ấn Độ ngày 5/9 năm 2022, tức 7h tối (19h:00) theo giờ Việt Nam.\r\n\r\nKhi ra mắt, điện thoại Xiaomi Poco M5 được trang bị ba phiên bản màu sắc lựa chọn là đen, xanh và vàng. Cùng với đó là ba phiên bản cấu hình:\r\n\r\n-   Xiaomi Poco M5 4GB – 64GB bộ nhớ trong\r\n\r\n-   Xiaomi Poco M5 4GB – 128GB bộ nhớ trong\r\n\r\n-   Xiaomi Poco M5 6GB – 64GB bộ nhớ trong\r\n\r\nkhi nào ra mắt?', 'products/xiaomipocom5.webp', 4, 2, 4290000, GETDATE(), NULL),
(2, N'iPad Air 5 (2022) 64GB I Chính hãng Apple Việt Nam', N'Thông tin mới nhất về iPad Air 5 năm 2022\r\n\r\nMỗi khi một chiếc iPad mới vừa ra lò như một cơn chấn động thật sự bùng nổ. Đến năm 2022, chúng ta lại tiếp tục bùng nổ với chiếc iPad mới mang tên iPad Air 5 với nhiều cải tiến đáng giá. Thế hệ thứ 5 này mang đến cho bạn những điểm gì vượt trội hay có gì sáng giá để sở hữu, hãy để lại phần bình luận ở bên dưới nhé.\r\n\r\niPad Air 5 được nâng cấp gì so với iPad Air 4?\r\nSo với thế hệ iPad Air 4 hồi năm 2020 thì chiếc iPad Air 2022 được mong đợi sẽ có nhiều cải tiến, trong đó nổi bật là màn hình, vi xử lý, dung lượng pin, bộ nhớ trong. Dưới đây là bảng so sánh thông số kỹ thuật dự kiến của iPad Air 2020 và 2022 bạn có thể tham khảo:\r\n\r\niPad Air 5\r\n\r\niPad Air 4\r\n\r\nMàn hình\r\n\r\nIPS Led-backlit Multi-Touch 10.9 inch\r\n\r\nIPS LCD 10.9 inch\r\n\r\nChip xử lý\r\n\r\nApple M1\r\n\r\nA14 Bionic\r\n\r\nDung lượng RAM\r\n\r\n8GB\r\n\r\n4GB\r\n\r\nBộ nhớ trong\r\n\r\n64GB (bản tiêu chuẩn)\r\n\r\n64GB (bản tiêu chuẩn)\r\n\r\nThời lượng pin\r\n\r\n10 giờ\r\n\r\n10 giờ\r\n\r\nHỗ trợ 5G\r\n\r\nCó\r\n\r\nCó\r\n\r\nCamera\r\n\r\n12MP\r\n\r\n12MP\r\n\r\niPad Air 5 khi nào ra mắt?\r\nTheo các tin đồn trong thời gian qua thì dự kiến máy tính bảng iPad Air 2022 dự kiến sẽ được Apple ra mắt vào ngày 8 tháng 3 sắp tới đây. Mặc dù rất khó để có sự thay đổi lớn tuy nhiên chúng ta có thể mong đợi chiếc iPad mới sẽ được cải tiến nhiều hơn và giá bán cũng sẽ hấp dẫn hơn.\r\n\r\nĐánh giá iPad Air 2022 dựa vào các tin đồn rò rỉ\r\n\r\nTrong sự kiện này, Apple được cho là có thể trình làng dòng Macbook Air hoặc Macbook Pro mới với chip M2 mạnh mẽ. Cùng không loại trừ khả năng, \"Táo khuyết\" cũng sẽ giới thiệu chiếc iPad Pro thế hệ mới.\r\n\r\niPad Air 5 giá bao nhiêu?\r\nCho đến thời điểm hiện tại chúng ta vẫn chưa có thông tin chính thức về giá bán của sản phẩm. Tuy nhiên theo nguồn tin rò rỉ mới đây cho hay, Apple sẽ không tăng giá của iPad Air 5 lên quá nhiều so với thế hệ tiền nhiệm trước đó mà vẫn sẽ giữ cho sản phẩm của mình vẫn trong tầm giá này.\r\n\r\niPad Air 5 giá bao nhiêu?\r\n\r\nNhiều khả năng, giá bán của iPad Air M1 năm 2022 phiên bản 64GB dự kiến sẽ có mức giá khởi điểm từ 599 USD, trong khi đó phiên bản 256GB bộ nhớ trong sẽ có giá bán từ 749 USD. Phiên bản có hỗ trợ mạng 5G sẽ có mức giá cao hơn 150 USD.\r\n\r\nĐánh giá iPad Air 2022 dựa vào các tin đồn rò rỉ\r\nDựa vào các nguồn thông tin rò rỉ xuất hiện trên khắp các trang mạng trong thời gian gần đây, chúng ta cũng đã có được cái nhìn tổng quan về dòng iPad Air 5 sắp ra mắt trong năm 2022.\r\n\r\nThiết kế tinh tế, màn hình Liquid Retina 10.9 inch\r\niPad Air 5 2022 với thiết kế màn hình cảm ứng đa điểm có đèn nền LED kích thước 10.9 inch IPS.  Độ phân giải 2360x1640, màn hình màu rộng cùng công nghệ màn hình True Tone cho hình ảnh chân thực, mượt mà, sống động và sắc nét. \r\n\r\nĐánh giá iPad Air 2022 dựa vào các tin đồn rò rỉ\r\n\r\nBên cạnh đó, lớp phủ chống phản xạ, lớp phủ oleophobic chống bám vân tay giúp nâng cao trải nghiệm người dùng. Hiển nhiên tần số quét giúp người dùng có thể dễ dàng quan sát được các chuyển động hình ảnh mượt mà. Nhờ đó, những thước phim hành động và tựa game được thể hiện một cách tuyệt vời. iPad Air vẫn hỗ trợ Apple Pencil 2, Touch ID ở nút nguồn, Smart Keyboard Folio hoặc bàn phím Magic Keyboard.\r\n\r\nHiệu năng ấn tượng: Apple M1, 8GB RAM\r\nĐáp ứng với nhu cầu về hiệu năng, chiếc iPad Air 2022 cũng nối gót với iPhone 13 sắp ra mắt và sử dụng con chip mới là Apple M1 mang đến hiệu năng xử lý vượt trội, nhanh chóng hơn và đảm bảo nhờ 8GB RAM mang đến sức mạnh không hề thua kém với một chiếc PC.\r\n\r\nDĩ nhiên là bạn có thể làm mọi điều với nó, như chơi game hiệu năng, chỉnh sửa ảnh. Bên cạnh đó, chiếc iPad Air 5 sẽ hỗ trợ kết nối với bàn phím Magic Keyboard để biến máy thành một chiếc laptop ấn tượng.\r\n\r\niPad Air 5 (2022) 64GB I Chính hãng Apple Việt Nam\r\n\r\nChiếc iPad Air M1 sẽ được tích hợp sẵn iPadOS 15 sau khi được xuất xưởng. Tính năng tuyệt vời của hệ điều hành này nằm ở việc ghi chú lại thông qua Quick Note, sử dụng SharePlay để kết nối với bạn bè, gia đình hoặc thực hiện gọi, tra cứu chỉ đường hoặc gửi mail qua Live Text chỉ bằng mọt thao tác chạm.\r\n\r\nTừ các ứng dụng của App Store, iPad Air có thể biến tấu trở thành lớp học hoặc nơi sáng tạo. Bên cạnh đó, các ứng dụng đi kèm như Swift Playgrounds hỗ trợ xây dựng và gửi ứng dụng lên App Store ngay trên thiết bị.\r\n\r\nCamera sắc nét 12MP, tính năng Smart HDR nổi bật\r\nTuy không phải điểm mạnh của sản phẩm này bởi người dùng sử dụng để chụp ảnh là rất ít, nên Apple cũng không quá chú trọng. Tuy nhiên, iPad Air 5 vẫn đáp ứng được khả năng bắt hình ảnh sắc nét. Với camera chính 12MP và tính năng Smart HDR hỗ trợ cho ra những bức ảnh sống động và cả quay phim chất lượng 4K tuyệt vời.\r\n\r\niPad Air 5 khi nào ra mắt?\r\n\r\nPhía trước của iPad Air 5 là một camera selfie với độ phân giải 12 MP Ultra Wide hỗ trợ quay phim 1080p, video call chất lượng cao. Dĩ nhiên bạn có thể sử dụng nó như một chiếc máy ảnh quay phim về vlog để chia sẻ cho bạn bè và người thân.\r\n\r\nDung lượng cao, sử dụng thời gian dài\r\niPad Air 5 tích hợp pin lithium – polymer có thể sạc lại 28.6 W/ giờ. Sạc pin thông qua USB Type C hoặc bộ đổi nguồn vào hệ thống máy tính.\r\n\r\nThời lượng pin có thể lên đến 10 giờ lướt web hoặc xem video qua wifi hoặc 9 giờ nếu sử dụng bằng mạng dữ liệu di động. Người dùng càng yên tâm hơn khi sử dụng thiết bị suốt cả ngày dài mà không lo hết pin.', 'products/1_253_3.webp', 1, 2, 16990000, GETDATE(), NULL),
(2, N'iPad mini 6 WiFi 64GB | Chính hãng Apple Việt Nam', N'Máy tính bảng iPad Mini 6 – Tablet nhỏ gọn, hiệu năng vượt trội\r\nVới sự thành công của các thế hệ iPad mini trước iPad mini 6 là sản phẩm kế nhiệm mới với nhiều tính năng hiện kèm nhiều sự nâng cấp đáng chú ý dành cho người dùng trong năm nay. Nếu bạn đang có nhu cầu mua cho mình một chiếc máy tính bảng iPad để phục vụ cho nhu cầu sử dụng thì iPad Mini 6 sẽ là sự lựa chọn hoàn hảo cho bạn vào thời điểm này cho nhu cầu sử dụng tablet kích thước vừa phải.\r\n\r\nThiết kế nhỏ gọn, kích thước màn hình 8.3 inch\r\niPad Mini 6 được Apple thiết kế với hình dáng nhỏ gọn cân đối chiều dài và ngang giúp bạn có thể mang theo bên mình mọi lúc mọi nơi để hỗ trợ cho quá trình học tập, làm việc hay giải trí một cách dễ dàng.\r\n\r\nMáy tính bảng iPad Mini 6 \r\n\r\nMáy tính bảng này cũng được Apple trang bị các gam màu truyền thống giống như các phiên bản trước giúp người dùng dễ dàng lựa chọn màu sắc phù hợp với độ tuổi và cá tính của bạn. Hơn thế thiết bị còn được thiết kế khung kim loại giúp cho máy tính bảng chắc chắn hơn trong quá trình sử dụng.\r\n\r\nBảo mật Touch ID, dung lượng pin sử dụng nhiều giờ\r\n\r\nMột trong những thay đổi lớn nhất về ngoại hình của iPad Mini 6 đó là kích thước màn hình sẽ lớn hơn nhiều với những thế hệ trước đây. Cụ thể là màn hình của iPad Mini 6 có kích thước lên đến 8,3 inch hỗ trợ True Tone. Màn hình rộng này giúp người dùng thoải mái sử dụng trong thời gian lâu mà không lo bị mỏi mắt. Cùng với độ phân giải cao sẽ hỗ trợ iPad hiển thị những hình ảnh sắc nét và tự nhiên nhất đến mắt người dùng khi sử dụng.\r\n\r\nTrang bị chipset A15 Bionic, dung lượng RAM lớn\r\nTính tới thời điểm hiện đại iPad Mini 6 được xem là chiếc iPad Mini cao cấp nhất trong dòng Mini nên vì thế chiếc máy tính bảng Mini thế hệ 6 này sẽ sở hữu một cấu hình mạnh mẽ. Cụ thể iPad Mini 6 được trang bị vi xử lý chipset A15 Bionic cùng với dung lượng RAM giúp tốc độ xử lý diễn ra nhanh chóng và mượt mà.  \r\n\r\nMáy tính bảng iPad Mini 6\r\n\r\nNgoài ra, Apple còn trang bị cho iPad Mini 6 bộ nhớ trong 64GB giúp bạn có thể lưu trữ được nhiều dữ liệu như những khoảnh khắc vui vẻ cùng với gia đình và bạn bè thông qua hình ảnh hay video. Bạn cũng có thể tải những tựa game nặng để chơi giúp lưu trữ được nhiều thứ hơn trong một chiếc iPad nhỏ gọn.  \r\n\r\nBảo mật Touch ID, dung lượng pin sử dụng nhiều giờ\r\nVề bảo mật, Apple đã trang bị trên chiếc iPad Mini 6 công nghệ bảo mật Touch ID ngay trên nút nguồn. Công nghệ bảo mật sinh trắc học này không chỉ giúp mở khóa nhanh chóng mà còn nâng cao độ bảo mật cho thiết bị cá nhân của bạn.\r\n\r\nBảo mật Touch ID, dung lượng pin sử dụng nhiều giờ\r\n\r\nApple đã nâng cấp cho iPad Mini 6 nhiều tính năng hiện đại, bên cạnh cấu hình mạnh thì dung lượng pin cũng được nâng cao cho thời gian sử dụng dài hơn. Cho phép người dùng thoải mái sử dụng trong nhiều tiếng đồng hồ mà không lo hết pin và gián đoạn quá trình sử dụng.\r\n\r\nBảo mật Touch ID, dung lượng pin sử dụng nhiều giờ\r\n\r\nVề khả năng kết nối, iPad Mini 6 hỗ trợ kết nối 5G cho phép truyền – tải dữ liệu nhanh và công nghệ wifi 6 mới nhất thời điểm hiện tại.\r\n\r\nHỗ trợ Apple Pencil 2, camera 12MP sắc nét\r\nNếu thế hệ iPad Mini 5 là thế hệ nổi bật bởi có sự kết hợp với Apple Pencil thế hệ đầu. Thì đến với thế hệ iPad Mini 6 sẽ tiếp tục được hỗ trợ Apple Pencil 2. Apple Pencil 2 với khả năng gắn từ tính và sạc nhanh không dây giúp người dùng sử dụng một cách tiện lợi. Chiếc bút ngày người dùng có thể thiết kế, vẽ, hay ghi chú lại công việc tiện lợi. Nhìn chung cho thấy, iPad Mini 6 với Apple Pencil 2 là bộ đôi công cụ đắc lực hỗ trợ cho bạn hoàn thành công việc nhanh chóng và thoải mái khi giải trí.\r\n\r\nMáy tính bảng iPad Mini 6 \r\n\r\nTuy người dùng không yêu cầu cao về camera trên chiếc máy tính bảng nhưng Apple cũng tinh tế trang bị cho iPad Mini 6 camera với độ phân giải 12MP sắc nét. Với camera này, người dùng có thể trò chuyện video với bạn bè một cách rõ nét. Phía trước thiết bị cũng được trang bị một camera 12MP với góc nhìn rộng 122 độ.', 'products/3_229.webp', 1, 2, 14990000, GETDATE(), NULL),
(2, N'iPad Gen 10 10.9 inch 2022 Wifi 64GB I Chính hãng Apple Việt Nam', N'Sản phẩm được đón chờ nhất năm nay chính là chiếc iPad 10.9 inch, thế hệ máy tính bảng iPad gen 10 mới sở hữu vô số điểm mạnh nổi bật. Bạn có thể chơi game, xem phim, sử dụng bút Apple Pencil để thao tác vẽ viết nhanh chóng tiện lợi. Cùng xem chiếc iPad gen 10 2022 này có đáng sở hữu không, giá thế nào và các điểm đáng chú ý khác trong bài viết nhé!\r\n\r\niPad gen 10 2022 – Thiết kế sang trọng, màu sắc đa dạng\r\niPad gen 10 2022 (iPad 10.9 inch) là chiếc máy tính bảng mới nhất sở hữu sức mạnh vô song từ con chip A14 Bionic chạy trên hệ điều hành iPadOS 16. Với thiết kế tối giản đã cải thiện các đường nét để hình ảnh luôn hợp thời trang, chiếc iPad này sẽ cho bạn quãng thời gian trải nghiệm tuyệt vời nhất. Cùng xem ưu thế mạnh mẽ của iPad 10.9 inch 2022 này đến từ đâu nhé!\r\n\r\nPhong cách thiết kế iPad Gen 10 hoàn toàn mới lạ\r\nMáy tính bảng iPad 10.9 inch 2022 được thiết kế lại hoàn toàn với bộ tứ màu sắc đậm hơn gây ấn tượng mạnh hơn. Các đường nét tinh tế được đẽo gọt cẩn thận với những đường cong hoàn hảo, mặt sau logo Apple nổi bật thể hiện rõ phong cách truyền thống của Apple. \r\n\r\nĐánh giá iPad gen 10\r\n\r\niPad 2022 được tích hợp thêm bút viết Apple Pencil giúp linh hoạt thay đổi các thao tác viết, tô và vẽ tự nhiên như một cây bút chì thực thụ. Bạn có thể hoàn thành mọi công việc trong cùng một thiết bị như ghi chú, vẽ biểu đồ, lên lịch, học ngoại ngữ,... vô cùng nhanh chóng tiện lợi và đơn giản như cách viết lên một tờ giấy.\r\n\r\nVật liệu chế tạo iPad gen 10 là năng lượng tái chế, hoàn toàn không thải khí carbon thân thiện với môi trường.\r\n\r\niPad 10.9 inch nhấn mạnh thiết kế vào sự bảo mật và riêng tư để cho người dùng những trải nghiệm được tôn trọng bậc nhất. Tích hợp thêm bàn di chuột với thiết kế hai mảnh linh hoạt của Magic Keyboard để bạn có thể thao tác soạn thảo văn bản ở bất cứ đâu.\r\n\r\nHiệu năng iPad 10.9 inch mạnh mẽ tha hồ khám phá\r\niPad 10.9 inch được cung cấp nguồn sức mạnh từ con chip A14 Bionic, mạnh mẽ ổn định và tiết kiệm năng lượng. Bạn có thể chạy nhiều ứng dụng nặng song song, chỉnh sửa và chia sẻ ảnh người khác, truy cập tệp nhanh chóng dễ dàng.\r\n\r\nĐánh giá hiệu năng iPad gen 10\r\n\r\nMáy tính bảng chạy trên iPadOS giúp mọi thứ trở nên mượt mà, load cực nhanh. iPad còn hỗ trợ các thao tác đồ họa chuyên sâu, chỉnh sửa video clip 4K trong iMovie, chơi game tựa nặng thả ga cùng bạn bè.\r\n\r\nMàn hình iPad 10.9 inch chuẩn sắc nét trong từng pixels\r\niPad 10.9 inch 2022 được tích hợp màn hình Liquid Retina kích thước 10.9 inch vừa phải, cho màu sắc hình ảnh vô cùng sống động, bắt mắt người xem. Công nghệ True Tone tinh chỉnh màu sắc, ánh sáng để bạn dễ dàng theo dõi các dạng nội dung trong mọi điều kiện ánh sáng.\r\n\r\nĐánh giá màn hình iPad gen 10\r\n\r\nCamera trước, sau của iPad Gen 10 sở hữu 12MP\r\niPad 10.9 inch 2022 được tích hợp camera sau rộng 12MP, cho phép lưu giữ hình ảnh đẹp với nội dung 4K. Các công nghệ kèm theo hỗ trợ chụp và chỉnh sửa ảnh rõ ràng sắc nét nhất.\r\n\r\nCamera trước siêu rộng 12MP cho khung hình trở nên hoàn hảo hơn khi thực hiện Facetime, quay video tự sướng. Máy ảnh sẽ tự động điều chỉnh để nhân vật chính nằm chính giữa ảnh với công nghệ Center Stage.\r\n\r\nĐánh giá camera iPad gen 10\r\n\r\nKho ứng dụng quyền lực\r\niPad gen 10 2022 sở hữu các ứng dụng mạnh mẽ như ảnh, bản đồ, tin nhắn, Mall, Safari, Apple News,... Bạn có thể tìm thấy bất cứ điều gì bạn muốn với hơn một triệu ứng dụng trên App Store. \r\n\r\nĐánh giá kho ứng dụng\r\n\r\nBạn cũng có thể bắt đầu quản lý dự án với Trello, cộng tác với canvas không giới hạn, sử dụng Microsoft word cho bất cứ việc gì cần nhanh chóng và hiệu quả. \r\n\r\nMáy tính bảng iPad gen 10 giá bao nhiêu?\r\nMức giá của dòng iPad 10.9 inch 2022 được hãng Apple công bố không quá cao, tùy thuộc vào từng phiên bản dữ liệu mà mức giá có sự thay đổi khác biệt. \r\n\r\nMáy tính bảng iPad gen 10 giá bao nhiêu?\r\n\r\n-  Với tùy chọn bộ nhớ trong 64GB , có wifi mức giá sẽ khoảng 499 USD tức khoảng 10.9 triệu đồng tiền Việt.\r\n\r\n-  Với tùy chọn bộ nhớ trong 256GB, có wifi mức giá sẽ khoảng 599 USD, tức khoảng 14.6 triệu tiền Việt.\r\n\r\nKhi so sánh với hiệu năng, pin, các tính năng tiện ích thì con số này không hề cao, thậm chí là rất phải chăng nên sở hữu.', 'products/ipad-2022-hero-silver-wifi-select.webp', 1, 3, 12990000, GETDATE(), NULL),
(2, N'iPad Pro 11 inch 2022 M2 Wifi 128GB I Chính hãng Apple Việt Nam', N'iPad Pro 11 inch 2022 M2 Wifi 128GB - Nâng cấp lớn hơn, trải nghiệm hiện đại hơn\r\nSự thay đổi lớn về thiết kế và cấu hình chính là những yếu tố giúp cho iPad Pro 2022 chiếc máy tính bảng mới nhất từ Apple - hứa hẹn sẽ là một trong những mẫu máy tính bảng cực kỳ hấp dẫn trong năm 2022.\r\n\r\nThiết kế sang trọng, hiện đại\r\nThiết kế của mặt sau iPad và các chi tiết khác được làm từ chất liệu cao cấp. Bên cạnh đó, cụm camera và cảm biến Lidar được đặt nhau. Các thao tác sử dụng như dùng Apple Pencil vẽ, sáng tạo dễ dàng hơn với chế độ ngang và khi dùng với Magic Keyboard.\r\n\r\niPad Pro 11 inch 2022 M2 Wifi 128GB\r\n\r\nCông nghệ Mini LED cho hình ảnh cao cấp\r\nMột trong những nâng cấp lớn - và cũng là nâng cấp đáng chú ý trên đời iPad Pro M2 mới của Apple - chính là sự hiện diện của công nghệ Mini LED. Nếu bạn chưa biết, Mini LED chính là công nghệ do Apple phát triển và dự kiến sẽ đưa lên các dòng thiết bị iPad và MacBook của hãng - mà iPad Pro 11 inch đời 2022 là một trong những thiết bị đầu tiên áp dụng công nghệ này.\r\n\r\nTất nhiên, chất lượng màu sắc và độ phân giải mà Mini LED mang đến sẽ tốt hơn rất nhiều so với tấm nền LCD trước đó (vốn xuất hiện trên iPad Pro 11 inch từ 2021 trở xuống). Vì vậy đây được xem là nâng cấp lớn đầu tiên mà iPad Pro 2022 có được.\r\n\r\niPad Pro 11 inch 2022 M2 Wifi 128GB\r\n\r\nNgoài tùy chọn 11 inch được ưa chuộng, màn hình Liquid Retina trên iPad Pro 2022 cũng sẽ có phiên bản 12.9 inch đáp ứng nhu cầu từng người dùng. Những tính năng màn hình được yêu thích như tần số quét 120 Hz, công nghệ HDR, Promotion, True Tone cùng dải màu rộng P3 cũng sẽ hiện diện để tăng cường khả năng hiển thị của thiết bị. Và toàn bộ chiếc iPad Pro 11 inch 2022 cũng sẽ có thân máy nguyên khối kèm kính cường lực cao cấp.\r\n\r\niPad Pro 11 inch 2022 M2 Wifi 128GB\r\n\r\nCamera chuyên nghiệp hỗ trợ quay phim\r\nNâng cấp kế tiếp xuất hiện trên iPad Pro thế hệ mới chính là hệ thống camera - và cũng là nâng cấp đáng chú ý không kém nếu bạn yêu thích điện ảnh. iPad Pro M2 (2022) sẽ trang bị hệ thống camera: camera chính 12 MP, camera góc siêu rộng 10 MP với khả năng chụp góc siêu rộng và cảm biến LiDAR; cùng với đèn flash kép phục vụ chụp ảnh đêm. Tính năng như HDR vẫn hiện diện trên chiếc iPad Pro mới này.\r\n\r\nVà đặc biệt, khả năng làm phim của iPad Pro 11 inch 2022 cho phép người dùng . Từ tính năng quay phim ProRes chỉnh sửa chuyên nghiệp, cho đến công nghệ HDR và khả năng ghi hình chất lượng đến 4K, đây sẽ là chiếc máy tính bảng hỗ trợ tối ưu công việc sáng tạo nội dung vốn đang phổ biến hiện nay.\r\n\r\niPad Pro 11 inch 2022 M2 Wifi 128GB \r\n\r\nĐồng thời, nhờ chip M2 mạnh mẽ hỗ trợ Smart HDR 4 mà khả năng chụp ảnh trên iPad sống động, chân thật hơn. Không chỉ vậy, cảm biến LiDAR có khả năng đo thời gian ánh sáng phản xạ lại từ vật thể, nhờ vậy bạn có thể chiêm ngưỡng không gian với bản đồ độ sâu độc đáo và thú vị. ISP mạnh mẽ còn hỗ trợ lấy nét cao, chính xác hơn khi quay video hay chụp ảnh trong điều kiện thiếu sáng.\r\n\r\nCamera trước siêu rộng với cảm biến 12MP và trường nhìn 122 độ cho phép người dùng quay video và chụp ảnh hoàn hảo. Đồng thời, bạn có thể tiến hành gọi Facetime với tính năng Center Stage hoặc mở khoá bằng Face ID an toàn.\r\n\r\niPad Pro 11 inch 2022 M2 Wifi 128GB \r\n\r\nVi xử lý đời mới cùng dung lượng lưu trữ cao\r\nMáy tính bảng iPad Pro 2022 sẽ mang trong mình bộ chip M2 hoàn toàn mới đến từ Apple. Vi xử lý Apple đời M2 - vốn dự kiến sẽ xuất hiện đầu tiên trên dòng MacBook (cả Air lẫn Pro) đời 2022 - sẽ được chọn thay thế cho chip Apple đời M1 trước đó. Không chỉ mang lại hiệu suất cao hơn đời M1, chip M2 còn hỗ trợ thêm mạng 5G và hỗ trợ thuật toán xử lý thông minh hiện đại hơn cho iPad Pro 11 2022.\r\n\r\nTrong đó, CPU 8 nhân mang đến hiệu suất nhanh hơn 15%, GPU 10 nhân mang đến hiệu suất nhanh hơn đến 35%. Thêm vào đó, công nghệ Neural Engine còn hỗ trợ tăng tốc tác vụ nhanh hơn 40% và băng thông bộ nhớ lớn hơn 50%. Do đó, người dùng dễ dàng thiết kế 3D ở các phần mềm đồ hoạ nặng, xây dựng mô hình AR hay chiến game mượt mà với tốc độ khung hình cao.\r\n\r\niPad Pro 11 inch 2022 M2 Wifi 128GB\r\n\r\nCác tùy chọn bộ nhớ có trên iPad Pro 11 inch 2022 cũng sẽ không khác biệt với đời 2021. Cụ thể, máy tính bảng iPad Pro M2 sẽ được ra mắt với các lựa chọn bộ nhớ lưu trữ sau:\r\n\r\n-  Bản 128 GB.\r\n\r\n-  Bản 256 GB.\r\n\r\n-  Bản 512 GB.\r\n\r\n-  Bản 1 TB.\r\n\r\n-  Bản 2 TB.\r\n\r\nTrong khi đó, với RAM, iPad Pro 2022 cũng sẽ có hai mức chính là 8 GB RAM và 16 GB RAM. Tùy chọn 8 GB RAM vốn được ưa chuộng bởi người dùng iPad phổ thông yêu thích giải trí, và bản 16 GB được chọn làm thiết bị công việc khá phổ biến. Nên việc Apple vẫn giữ nguyên tùy chọn RAM - ROM cho iPad Pro 11 inch 2022 là hoàn toàn hiểu được.\r\n\r\niPad Pro 11 inch 2022 M2 Wifi 128GB\r\n\r\nHệ điều hành iPadOS 16 với nhiều tính năng hoàn toàn mới\r\nPhiên bản iPadOS 16 được trang bị trên iPad Pro 2022 mang đến nhiều tính năng nổi bật, nâng cao trải nghiệm người dùng. Cụ thể hơn, Apple đã cải tiến các tính năng:\r\n\r\n- Chế độ Reference Mode: Tuỳ vào tác vụ và mục đích sử dụng, màn hình có thể thay đổi profile màu sắc cho phù hợp\r\n\r\n- Stage Manager: Tối đa hoá được tiến độ công việc với khả năng đa nhiệm nhiều cửa sổ cùng lúc.\r\n\r\n- Ứng dụng thiết kế phù hợp cho máy tính để bàn: Người dùng có thể thực hiện một số các tác vụ như Redo, Undo, cải thiện khả năng tương thích của công cụ hoặc đổi đuôi tệp tin.\r\n\r\nThêm vào đó, bạn còn có thể kết nối màn hình bên ngoài độ phân giải 6K nhằm tạo thêm không gian thực hiện nhiều tác vụ cùng lúc.\r\n\r\niPad Pro 11 inch 2022 M2 Wifi 128GB\r\n\r\nKết nối không dây nhanh chóng, trải nghiệm thú vị với Apple Pencil thế hệ mới\r\nSản phẩm mới đến từ Apple hỗ trợ kết nối Wifi 6E, cho khả năng tải dữ liệu nhanh chóng. Cụ thể, tốc độ tải chỉ 2.4Gb/s, nhanh gấp đôi với phiên bản trước. Bên cạnh đó, phiên bản Wifi +Cellular 5G đã hỗ trợ mạng 5G khắp thế giới. Như vậy, bạn nhanh chóng sao lưu dữ liệu, trao đổi qua video call, truy cập các tệp chỉ trong nháy mắt.\r\n\r\nNhờ trang bị sức mạnh ưu việt đến từ chip thế hệ mới, việc di chuyển trỏ chuột với Apple Pencil 2 cho người dùng trải nghiệm mới lạ. Màn hình hoàn toàn có thể phát hiện ra Apple Pencil khi ở mức 12mm, do đó, việc xem trước thao tác đánh dấu là điều cực kỳ dễ dàng.\r\n\r\nTrải nghiệm thú vị với Apple Pencil thế hệ mới\r\n\r\nKhông chỉ vậy, sự cải tiến mới này còn mang đến khả năng phác thảo và minh hoạ chính xác cao, thực hiện các tác vụ đơn giản. Như ở Scribble, khi Apple Pencil đến gần màn hình, trường văn bản mở rộng một cách tự động, chữ viết tay cũng nhanh chóng được chuyển thành văn bản chỉ trong tích tắc.\r\n\r\niPad Pro 11 inch 2022 M2 Wifi 128GB\r\n\r\niPad Pro 2022 giá bao nhiêu tiền? Khi nào ra mắt?\r\nMáy tính bảng iPad Pro 11 inch 2022, cùng với mẫu 12.9 inch, được Apple giới thiệu vào tháng 10 năm 2022. Khi ra mắt, thiết bị hứa hẹn sẽ được trang bị phần cứng mang lại hiệu năng sử dụng vượt trội. Khi ra mắt, iPad Pro 2022 sẽ có hai phiên bản kích thước màn hình là 11 inch và 12.9 inch. Vậy giá bán hai phiên bản kích thước màn hình này ra sao, tiếp tục tìm hiểu sau đây.\r\n\r\nGiá bán iPad Pro 2022 sẽ cao hơn so với phiên bản tiền nhiệm do sử dụng màn hình Mini-LED. Cụ thể, giá bán dự kiến iPad Pro 11 inch 2022 bản 128GB Wifi sẽ có giá bán khoảng 23.900.000 đồng, bản 5G có giá khoảng 27.900.000 đồng và iPad Pro 12.9 inch 2022 sẽ có giá khởi điểm từ 31.900.000 đồng.', 'products/ipad-pro-13-select-wifi-spacegray-202210-02.webp', 1, 3, 23990000, GETDATE(), NULL),
(2, N'iPad 10.2 2021 WiFi 64GB | Chính hãng Apple Việt Nam', N'iPad Gen 9 (10.2 inch) 2021 - Hiệu năng đỉnh với mức giá sinh viên\r\nSau sự thành công của chiếc iPad Gen 8 cùng với iPad Air 4, Apple lại tiếp tục rục rịch cho ra mắt thêm sản phẩm mới. Thiết bị mang tên iPad Gen 9, kế thừa đặc trưng của dòng nhưng được nâng cấp thêm về hiệu năng cũng như camera.\r\n\r\nNăm 2022, Apple vừa cho ra mắt sản phẩm iPad Gen 10 mà bạn không nên bỏ qua!\r\n\r\nThiết kế mỏng nhẹ, màn hình kích thước 10.2 inches\r\niPad 10.2 inch 2021 vẫn mang thiết kế đặc trưng bởi sự mỏng và nhẹ, giúp người dùng dễ thao tác, cầm nắm trong hàng giờ liền mà không hề cảm thấy bị mỏi hay khó chịu. Thiết kế nguyên khối đã là nét đặc trưng của dòng sản phẩm iPad giúp mang lại vẻ sang trọng khi sử dụng tên tay.\r\n\r\n29095\r\n\r\nMàn hình của iPad 10.2 inch 2021 kích thước lớn cùng khả năng hiển thị sống động. Màn hình True Tone trên iPad 10.2 inch còn hỗ trợ điều chỉnh màn hình theo nhiệt độ màu.\r\n\r\nCấu hình mạnh mẽ bởi chip A13 Bionic, bộ nhớ trong dung lượng lớn\r\niPad Gen 9 được cung cấp sức mạnh bởi con chip A13 Bionic. Đây là con chip được sán xuát trên tiến trình 7nm+, cho phép xử lý hiệu suất cao gấp 6 lần so với thế hệ trước.\r\n\r\n29095\r\n\r\nChưa hết, củng cố thêm sức mạnh cho chiếc iPad Gen 9 đó là dung lượng RAM lớn, hỗ trợ hoạt động đa nhiệm tốt. Bên cạnh đó, người dùng có thêm sự lựa chọn đến từ bộ nhớ trong 64GB. Ngoài ra, thiết bị còn nhiều phiên bản bộ nhớ khác tùy vào nhu cầu sử dụng của người dùng.', 'products/x_mmas.webp', 1, 3, 10990000, '2023-03-30 15:54:30', NULL);
GO

-----Giảm giá-----
INSERT INTO GiamGia(MaSanPham, PhanTram, ThoiGianBatDau, ThoiGianKetThuc, TrangThai) VALUES
(1, 27, GETDATE(), DATEADD(MONTH, 3,GETDATE()), 1),
(2, 28, GETDATE(), DATEADD(MONTH, 3,GETDATE()), 1),
(3, 29, GETDATE(), DATEADD(MONTH, 3,GETDATE()), 1),
(4, 21, GETDATE(), DATEADD(MONTH, 3,GETDATE()), 1),
(5, 19, GETDATE(), DATEADD(MONTH, 3,GETDATE()), 1)
GO


-----Chi tiết ảnh-----
INSERT INTO chitietanh (MaSanPham, Anh) VALUES
(1, 'products/iphon11_ct.webp'),
(1, 'products/iphon11_ct_2.webp'),
(1, 'products/iphon11_ct_3.webp'),
(2, 'products/iphon12_ct.webp'),
(2, 'products/iphon12_ct_2.webp'),
(2, 'products/iphon12_ct_3.webp'),
(4, 'products/iphon14_ct.webp'),
(4, 'products/iphon14_ct_2.webp'),
(4, 'products/iphon14_ct_3.webp');
GO

-----Nhà cung cấp-----
INSERT NhaCungCap (TenNhaCungCap, DiaChi, SoDienThoai, Email) VALUES 
(N'Nhà cung cấp 1', N'Hải Dương', '0123456789','nhacungcap1@gmail.com'),
(N'Nhà cung cấp 2', N'Hà Nội', '0246813579','nhacungcap2@gmail.com')
GO

-----Nhân viên-----
INSERT NhanVien (HoTen, NgaySinh, GioiTinh, AnhDaiDien, DiaChi, Email, DienThoai, TaiKhoan, MatKhau, TrangThai, LoaiQuyen) VALUES 
(N'Ðỗ Ðình Diệm', '2002-02-28', N'Nam', 'parallax-content.png', N'Hải Dương', N'dodinhdiem2802@gmail.com', '0936849738', 'dodinhdiem2802', 'dodiem2k2', 1, N'Quản trị'),
(N'Hà Thu Thảo', '2000-09-23', N'Nữ', 'parallax-content.png', N'Hải Dương', N'hathuthao2309@gmail.com', N'0936541223','hathuthao2309', 'thuthao2909',  1, N'Nhân viên'),
(N'Vũ Quỳnh Anh','2003-06-07', N'Nữ', 'parallax-content.png', N'Hải Dương', N'vuquynhanh0706@gmail.com', N'0936541223','vuquynhanh0706', 'quynhanh0706', 1, N'Nhân viên')
GO

-----Khách hàng-----
INSERT KhachHang (TenKhachHang, DiaChi, SoDienThoai, Email) VALUES 
(N'Diệm', N'Hảii Dương', N'0936849738', N'dodinhdiem2802@gmail.com'),
(N'Thảo', N'Hải Dương', N'0123999999', N'hathuthao2309@gmail.com'),
(N'Quỳnh Anh', N'Hải Dương', N'0936666666', N'vuquynhanh2003@gmail.com')
GO

-----Ðơn hàng-----
INSERT DonHang (MaKhachHang, NgayDat, TrangThaiDonHang) VALUES 
(1, GETDATE(), 1),
(2, GETDATE(), 1),
(3, GETDATE(), 1)
GO

-----Chi tiếtt don hàng-----
INSERT ChiTietDonHang (MaDonHang, MaSanPham, SoLuong, GiaMua) VALUES 
(1, 1, 1, 10942700),
(1, 12, 1, 31990000),
(2, 3, 1, 17742900),
(2, 10, 1, 9990000),
(3, 6, 1, 4990000),
(3, 15, 1, 9990000);
GO

-----Hóa đơn xuất-----
INSERT HoaDonXuat (NgayXuat, MaKhachHang, MaNhanVien) VALUES 
(GETDATE(), 1, 2),
(GETDATE(), 2, 1),
(GETDATE(), 3, 1)
GO

-----Chi tiết hóa đơn xuất-----
INSERT ChiTietHoaDonXuat (MaHoaDonXuat, MaSanPham, SoLuong, GiaBan, ChietKhau, TraLai) VALUES 
(1, 1, 1, 10942700, NULL, NULL),
(1, 12, 1, 31990000, NULL, NULL),
(2, 3, 1, 17742900, NULL, NULL),
(2, 10, 1, 9990000, NULL, NULL),
(3, 6, 1, 4990000, NULL, NULL),
(3, 15, 1, 9990000, NULL, NULL)
GO

-----Khuyến mại-----
INSERT INTO KhuyenMai (TenKhuyenMai, MoTa) VALUES 
('Khuyến mãi hè 2023', 'Giảm giá 20% cho các sản phẩm mùa hè')

-----Chi tiết khuyến mại-----
INSERT INTO ChiTietKhuyenMai (MaSanPham, NgayBatDau, NgayKetThuc, MaKhuyenMai, TrangThai) VALUES 
(1, '2023-06-01', '2023-06-30', 1, 1)

-----------------------------Câu lệnh PROCEDURE-----------------------------

---------PROCEDURE Trang Chủ---------
--Lấy sản phẩm theo loại
CREATE PROCEDURE sp_home_loai_id
@MaLoai int 
AS
BEGIN
	SELECT
		sp.MaSanPham,
		sp.MaLoai,
		sp.TenSanPham,
		sp.AnhDaiDien,
		sp.GiaBan,
		(sp.GiaBan - sp.GiaBan*ISNULL(gg.PhanTram,0)/100) as GiaGiam , 
		ISNULL(gg.PhanTram,0) as PhanTram
	FROM SanPham sp
		left join GiamGia gg on gg.MaSanPham = sp.MaSanPham and gg.PhanTram > 0
	WHERE sp.MaLoai = @MaLoai
END
GO


--Lấy sản phẩm theo mã sản phẩm
CREATE PROCEDURE sp_home_sanpham_id
(@MaSanPham int)
AS
    BEGIN
        SELECT 
			sp.MaSanPham,
			sp.TenSanPham,
			sp.MoTaSanPham,
			sp.AnhDaiDien,
			sp.GiaBan,
		    (sp.GiaBan - sp.GiaBan*ISNULL(gg.PhanTram,0)/100) as GiaGiam , 
			ISNULL(gg.PhanTram,0) as PhanTram,
			(
			SELECT 
				cta.MaAnhChiTiet,
				cta.MaSanPham,
				cta.Anh
			FROM ChiTietAnh AS cta
			left join SanPham sp on cta.MaSanPham = sp.MaSanPham
			WHERE cta.MaSanPham = @MaSanPham FOR JSON PATH
			) AS listjson_chitietanh,
			(
			SELECT 
				tskt.MaThongSo,
				tskt.MaSanPham,
				tskt.TenThongSo,
				tskt.MoTa
			FROM ThongSoKyThuat AS tskt
			left Join SanPham sp on tskt.MaSanPham = sp.MaSanPham
			WHERE tskt.MaSanPham = @MaSanPham FOR JSON PATH
			) AS listjson_thongsokythuat
		FROM SanPham sp
		left join GiamGia gg on gg.MaSanPham = sp.MaSanPham and gg.PhanTram > 0
		where  sp.MaSanPham = @MaSanPham;
    END;
GO

--Lấy sản phẩm tương tự
CREATE PROC sp_home_sanpham_tuongtu
@MaSanPham int,
@MaLoai int
AS
BEGIN
	SELECT TOP 3 
		sp.MaSanPham,
		sp.TenSanPham,
		sp.AnhDaiDien,
		sp.GiaBan,
		(sp.GiaBan - sp.GiaBan*ISNULL(gg.PhanTram,0)/100) as GiaGiam , 
		ISNULL(gg.PhanTram,0) as PhanTram
	FROM SanPham sp
		left join GiamGia gg on gg.MaSanPham = sp.MaSanPham and gg.PhanTram > 0
	WHERE sp.MaLoai = @MaLoai AND sp.MaSanPham != @MaSanPham
END
GO


--Lấy sản phẩm bán chạy
CREATE PROCEDURE sp_home_banchay
@SoLuong int
AS
BEGIN
    SELECT TOP (@SoLuong)
		sp.MaSanPham,
		sp.TenSanPham,
		sp.AnhDaiDien,
		sp.GiaBan,
		(sp.GiaBan - sp.GiaBan*ISNULL(gg.PhanTram,0)/100) as GiaGiam , 
		ISNULL(gg.PhanTram,0) as PhanTram,
        COUNT(*) AS Total
    FROM 
        SanPham sp
        JOIN ChiTietDonHang ct ON sp.MaSanPham = ct.MaSanPham 
		left join GiamGia gg on gg.MaSanPham = ct.MaSanPham and gg.PhanTram > 0
    GROUP BY 
        sp.MaSanPham,
		sp.TenSanPham,
		sp.AnhDaiDien,
		sp.GiaBan,
		(sp.GiaBan - sp.GiaBan*ISNULL(gg.PhanTram,0)/100), 
		ISNULL(gg.PhanTram,0)
    ORDER BY 
        Total DESC
END
GO


--Lấy ra sản phẩm mới
CREATE PROCEDURE sp_home_moi
@SoLuong int
AS
BEGIN
	SELECT TOP (@SoLuong)
    sp.MaSanPham,
    sp.TenSanPham,
    sp.AnhDaiDien,
	sp.GiaBan,
	(sp.GiaBan - sp.GiaBan*ISNULL(gg.PhanTram,0)/100) as GiaGiam , 
	ISNULL(gg.PhanTram,0) as PhanTram
	FROM SanPham sp
		left join GiamGia gg on gg.MaSanPham = sp.MaSanPham and gg.PhanTram > 0
	WHERE 
		NgayTao <= GETDATE()
	ORDER BY 
		NgayTao DESC
END
GO


--Lấy sản phẩm giảm giá
CREATE PROCEDURE sp_home_giamgia
	@SoLuong int
AS
BEGIN
	SELECT TOP (@SoLuong)
		sp.MaSanPham,
		sp.TenSanPham, 
		sp.AnhDaiDien, 
		sp.GiaBan,
		(sp.GiaBan - sp.GiaBan*gg.PhanTram/100) as GiaGiam , 
		gg.PhanTram
	FROM SanPham sp
		INNER JOIN GiamGia gg ON gg.MaSanPham = SP.MaSanPham
	WHERE gg.TrangThai = '1' AND GG.PhanTram = (
    SELECT MAX(PhanTram)
		FROM GiamGia
		WHERE MaSanPham = SP.MaSanPham )
	GROUP BY 
        sp.MaSanPham,
		sp.TenSanPham,
		sp.AnhDaiDien,
		sp.GiaBan,
		gg.PhanTram
END
GO

--Thêm đơn hàng
CREATE PROCEDURE sp_donhang_create
(@khach      NVARCHAR(MAX),  
 @listchitiet NVARCHAR(MAX)
)
AS
    BEGIN
	 IF(@khach IS NOT NULL)
	 Begin
	   INSERT INTO KhachHang
                (TenKhachHang, 
                 DiaChi, 
                 SoDienThoai,
				 Email
                )
		 SELECT JSON_VALUE(@khach, '$.tenKhachHang'), 
				JSON_VALUE(@khach, '$.diaChi'), 
				JSON_VALUE(@khach, '$.soDienThoai') ,
				JSON_VALUE(@khach, '$.email')    
	 end;
	 DECLARE @MaKhachHang INT = SCOPE_IDENTITY();
	 IF(@listchitiet IS NOT NULL)
	 Begin
	    -- Thêm bảng đơn hàng
		INSERT INTO DonHang
        (MaKhachHang, 
            NgayDat, 
            TrangThaiDonHang               
        )
        VALUES
			(@MaKhachHang, 
			 GETDATE(), 
			 1
        );
		DECLARE @MaDonHang INT = SCOPE_IDENTITY();
		-- Thêm bảng chi tiết đơn hàng
        INSERT INTO ChiTietDonHang
                (   MaDonHang, 
                    MaSanPham, 
                    SoLuong, 
                    GiaMua                       
                )
        SELECT 
			@MaDonHang,		
			JSON_VALUE(p.value, '$.maSanPham'), 
			JSON_VALUE(p.value, '$.soLuong'), 
			JSON_VALUE(p.value, '$.giaMua')    
        FROM OPENJSON(@listchitiet) AS p;
	end;
    SELECT '';
   END;
GO

--Tìm kiếm sản phẩm
CREATE PROCEDURE sp_home_search
    @page_index INT,
    @page_size INT,
    @product_name NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @RecordCount BIGINT;

    IF @page_size <> 0
    BEGIN
        SELECT (ROW_NUMBER() OVER (ORDER BY TenSanPham ASC)) AS RowNumber,
				sp.MaSanPham,
				sp.MaLoai,
				sp.TenSanPham,
				sp.AnhDaiDien,
				sp.GiaBan,
				(sp.GiaBan - sp.GiaBan*ISNULL(gg.PhanTram,0)/100) as GiaGiam , 
				ISNULL(gg.PhanTram,0) as PhanTram
        INTO #Results1
        FROM SanPham sp
		left join GiamGia gg on gg.MaSanPham = sp.MaSanPham and gg.PhanTram > 0
        WHERE sp.TenSanPham LIKE '%' + @product_name + '%';

        SELECT @RecordCount = COUNT(*)
        FROM #Results1;

        SELECT *,
               @RecordCount AS RecordCount
        FROM #Results1
        WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
            AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
            OR @page_index = -1;

        DROP TABLE #Results1;
    END
    ELSE
    BEGIN
        SELECT (ROW_NUMBER() OVER (ORDER BY TenSanPham ASC)) AS RowNumber,
               sp.MaSanPham,
               sp.MaLoai,
               sp.TenSanPham,
               sp.AnhDaiDien,
               sp.GiaBan,
			   (sp.GiaBan - sp.GiaBan*ISNULL(gg.PhanTram,0)/100) as GiaGiam , 
				ISNULL(gg.PhanTram,0) as PhanTram
        INTO #Results2
        FROM SanPham sp
		left join GiamGia gg on gg.MaSanPham = sp.MaSanPham and gg.PhanTram > 0
        WHERE TenSanPham LIKE '%' + @product_name + '%';

        SELECT @RecordCount = COUNT(*)
        FROM #Results2;

        SELECT *,
               @RecordCount AS RecordCount
        FROM #Results2;

        DROP TABLE #Results2;
    END
END
GO

---------PROCEDURE Loại Sản Phẩm---------
--Lấy all loại sản phẩm
CREATE PROCEDURE sp_loai_full
AS
BEGIN
	SELECT*
	FROM LoaiSP
	WHERE TrangThai = '1'
END
GO

--Lấy theo mã loại
CREATE PROCEDURE sp_loai_id
(@MaLoai int)
AS
    BEGIN
        SELECT *                         
        FROM LoaiSP
      WHERE  MaLoai = @MaLoai;
    END;
GO

--Thêm loại sản phẩm
CREATE PROCEDURE sp_loai_create
(
@TenLoai nvarchar(255),
@TrangThai bit
)
AS
    BEGIN
		INSERT INTO LoaiSP(
		TenLoai,
		TrangThai
		)
		VALUES
		(
			@TenLoai,
			@TrangThai
		);
        SELECT '';
    END;
GO


--Sửa loại sản phẩm
CREATE PROCEDURE sp_loai_update
(
	@MaLoai int,
	@TenLoai nvarchar(255),
	@TrangThai bit
)
AS
BEGIN
	UPDATE LoaiSP SET 
	TenLoai = @TenLoai,
	TrangThai = @TrangThai
	WHERE MaLoai = @MaLoai;
	SELECT '';
END
GO

--Xóa loại sản phẩm
CREATE PROCEDURE sp_loai_delete
@MaLoai int
AS
BEGIN
	DELETE FROM LoaiSP WHERE MaLoai = @MaLoai;
	SELECT '';
END
GO

--Tìm kiếm tên loại
CREATE PROCEDURE sp_loai_search
    @page_index INT,
    @page_size INT,
    @category_name NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @RecordCount BIGINT;

    IF @page_size <> 0
    BEGIN
        SELECT 
		(ROW_NUMBER() OVER (ORDER BY MaLoai ASC)) AS RowNumber,
		*
		 
        INTO #Results1
        FROM LoaiSP
        WHERE TenLoai LIKE '%' + @category_name + '%';

        SELECT @RecordCount = COUNT(*)
        FROM #Results1;

        SELECT *,
               @RecordCount AS RecordCount
        FROM #Results1
        WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
            AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
            OR @page_index = -1;

        DROP TABLE #Results1;
    END
    ELSE
    BEGIN
        SELECT (ROW_NUMBER() OVER (ORDER BY MaLoai ASC)) AS RowNumber
        INTO #Results2
        FROM LoaiSP
        WHERE TenLoai LIKE '%' + @category_name + '%';

        SELECT @RecordCount = COUNT(*)
        FROM #Results2;

        SELECT *,
               @RecordCount AS RecordCount
        FROM #Results2;

        DROP TABLE #Results2;
    END
END
GO


---------PROCEDURE Nhà sản xuất---------
--Lấy all nhà sản xuất
CREATE PROCEDURE sp_nhasanxuat_full
AS
BEGIN
	SELECT*
	FROM NhaSanXuat
END
GO
--Lấy thông tin nhà sản xuất theo mã
CREATE PROCEDURE sp_nhasanxuat_id
	@MaNSX int
AS
BEGIN
	SELECT *
	FROM NhaSanXuat
	WHERE MaNSX = @MaNSX;
END
GO

--Thêm nhà sản xuất
CREATE PROCEDURE sp_nhasanxuat_create
(
	@TenNSX nvarchar(250),
	@MoTa ntext NULL
)
AS
BEGIN
	INSERT INTO NhaSanXuat(
		TenNSX, 
		MoTa
	)
	VALUES 
	(
		@TenNSX, 
		@MoTa
	);
END
GO

--Cập nhật thông tin nhà sản xuất
CREATE PROCEDURE sp_nhasanxuat_update
(
	@MaNSX int,
	@TenNSX nvarchar(250),
	@MoTa ntext
)
AS
BEGIN
	UPDATE NhaSanXuat SET
		TenNSX = @TenNSX,
		MoTa = @MoTa
	WHERE MaNSX = @MaNSX;
END
GO

--Xóa  nhà sản xuất
CREATE PROCEDURE sp_nhasanxuat_delete
@MaNSX int
AS
BEGIN
	DELETE FROM NhaSanXuat WHERE MaNSX = @MaNSX;
	SELECT '';
END
GO

--Tìm kiếm nhà sản xuất theo tên
CREATE PROCEDURE sp_nhasanxuat_search
(
	@page_index int,
	@page_size int,
	@producer_name nvarchar(max)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RecordCount bigint;

	IF @page_size <> 0
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaNSX ASC)) AS RowNumber,
			*
		INTO #Results1
		FROM NhaSanXuat
		WHERE TenNSX LIKE '%' + @producer_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results1;

		SELECT *,
			   @RecordCount AS RecordCount
		FROM #Results1
		WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
			AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
			OR @page_index = -1;

		DROP TABLE #Results1;
	END
	ELSE
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaNSX ASC)) AS RowNumber
		INTO #Results2
		FROM NhaSanXuat
		WHERE TenNSX LIKE '%' + @producer_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results2;

		SELECT *,
			   @RecordCount AS RecordCount
		FROM #Results2;

		DROP TABLE #Results2;
	END
END
GO

---------PROCEDURE Đơn Vị Tính---------
--Lấy all nhà sản xuất
CREATE PROCEDURE sp_donvitinh_full
AS
BEGIN
	SELECT*
	FROM DonViTinh
END 
GO
--Lấy thông tin đơn vị tính theo mã
CREATE PROCEDURE sp_donvitinh_id
	@MaDonViTinh int
AS
BEGIN
	SELECT *
	FROM DonViTinh
	WHERE MaDonViTinh = @MaDonViTinh;
END
GO

--Thêm đơn vị tính
CREATE PROCEDURE sp_donvitinh_create
	@TenDonViTinh nvarchar(100)
AS
BEGIN
	INSERT INTO DonViTinh 
	(
		TenDonViTinh
	)
	VALUES
	(
		@TenDonViTinh
	);
END
GO

--Cập nhật thông tin đơn vị tính
CREATE PROCEDURE sp_donvitinh_update
(
	@MaDonViTinh int,
	@TenDonViTinh nvarchar(100)
)
AS
BEGIN
	UPDATE DonViTinh SET
	TenDonViTinh = @TenDonViTinh
	WHERE MaDonViTinh = @MaDonViTinh;
END
GO

--Xóa đơn vị tính
CREATE PROCEDURE sp_donvitinh_delete
	@MaDonViTinh int
AS
BEGIN
	DELETE FROM DonViTinh WHERE MaDonViTinh = @MaDonViTinh;
	SELECT '';
END
GO

--Tìm kiếm đơn vị tính theo tên
CREATE PROCEDURE sp_donvitinh_search
(
	@page_index int,
	@page_size int,
	@unit_name nvarchar(max)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RecordCount bigint;
	IF @page_size <> 0
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaDonViTinh ASC)) AS RowNumber,
			*
		INTO #Results1
		FROM DonViTinh
		WHERE TenDonViTinh LIKE '%' + @unit_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results1;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results1
		WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
			AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
			OR @page_index = -1;

		DROP TABLE #Results1;
	END
	ELSE
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaDonViTinh ASC)) AS RowNumber
		INTO #Results2
		FROM DonViTinh
		WHERE TenDonViTinh LIKE '%' + @unit_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results2;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results2;

		DROP TABLE #Results2;
	END
END
GO

---------PROCEDURE Sản phẩm---------
--Lấy ra tất cả sản phẩm
CREATE PROCEDURE sp_sanpham_full
AS
	BEGIN
		SELECT 
		sp.MaSanPham, 
		sp.TenSanPham,
		GiaBan,
		(sp.GiaBan - sp.GiaBan*ISNULL(gg.PhanTram,0)/100) as GiaGiam 
		FROM SanPham sp
		left join GiamGia gg on gg.MaSanPham = sp.MaSanPham and gg.PhanTram > 0
	END
GO

--Lấy sản phẩm theo mã sản phẩm
CREATE PROCEDURE sp_sanpham_id
	(@MaSanPham int)
AS
    BEGIN
        SELECT 
			sp.MaSanPham,
			sp.MaLoai,
            sp.TenSanPham,
            sp.MoTaSanPham,
            sp.AnhDaiDien,
            sp.MaNSX,
            sp.MaDonViTinh,
            sp.GiaBan,
			(
			SELECT 
				cta.MaAnhChiTiet,
				cta.MaSanPham,
				cta.Anh
			FROM ChiTietAnh AS cta
			left join SanPham sp on cta.MaSanPham = sp.MaSanPham
			WHERE cta.MaSanPham = @MaSanPham FOR JSON PATH
			) AS listjson_chitietanh,
			(
			SELECT 
				tskt.MaThongSo,
				tskt.MaSanPham,
				tskt.TenThongSo,
				tskt.MoTa
			FROM ThongSoKyThuat AS tskt
			left Join SanPham sp on tskt.MaSanPham = sp.MaSanPham
			WHERE tskt.MaSanPham = @MaSanPham FOR JSON PATH
			) AS listjson_thongsokythuat
		FROM SanPham sp
		WHERE  sp.MaSanPham = @MaSanPham;
    END;
GO

--Thêm sản phẩm
CREATE PROCEDURE sp_sanpham_create
(
    @MaLoai INT,
	@TenSanPham NVARCHAR(MAX),
	@MoTaSanPham NTEXT,
	@AnhDaiDien VARCHAR(500),
	@MaNSX INT,
	@MaDonViTinh INT,
	@GiaBan float,
    @listjson_chitietanh NVARCHAR(MAX),
    @listjson_thongsokythuat NVARCHAR(MAX)
)
AS
BEGIN
    BEGIN
        INSERT INTO SanPham
        (
            MaLoai,
            TenSanPham,
            MoTaSanPham,
            AnhDaiDien,
            MaNSX,
            MaDonViTinh,
			GiaBan,
            NgayTao
        )
        VALUES(
           	@MaLoai,
			@TenSanPham,
			@MoTaSanPham,
			@AnhDaiDien,
			@MaNSX,
			@MaDonViTinh,
			@GiaBan,
            GETDATE()
			);
		DECLARE @MaSanPham INT = SCOPE_IDENTITY();
        IF (@listjson_chitietanh IS NOT NULL)
        BEGIN
            INSERT INTO ChiTietAnh
            (
                MaSanPham,
                Anh
            )
            SELECT
				@MaSanPham,
                JSON_VALUE(p.value, '$.anh')
            FROM OPENJSON(@listjson_chitietanh) AS p;
        END;

        IF (@listjson_thongsokythuat IS NOT NULL)
        BEGIN
            INSERT INTO ThongSoKyThuat
            (
                MaSanPham,
                TenThongSo,
                MoTa
            )
            SELECT
                @MaSanPham,
                JSON_VALUE(p.value, '$.tenThongSo'),
                JSON_VALUE(p.value, '$.moTa')
            FROM OPENJSON(@listjson_thongsokythuat) AS p;
        END;
    END;

    SELECT '';
END;
GO

--Sửa sản phẩm
CREATE PROCEDURE sp_sanpham_update
(
    @MaSanPham INT,
    @MaLoai INT,
	@TenSanPham NVARCHAR(MAX),
	@MoTaSanPham NTEXT,
	@AnhDaiDien VARCHAR(500),
	@MaNSX INT,
	@MaDonViTinh INT,
	@GiaBan float,
    @listjson_chitietanh NVARCHAR(MAX) = NULL,
    @listjson_giasanpham NVARCHAR(MAX) = NULL ,
    @listjson_thongsokythuat NVARCHAR(MAX) = NULL
)
AS
BEGIN
    BEGIN
        UPDATE SanPham SET
            MaLoai = @MaLoai,
            TenSanPham = @TenSanPham,
            MoTaSanPham = @MoTaSanPham,
            AnhDaiDien = @AnhDaiDien,
            MaNSX = @MaNSX,
            MaDonViTinh = @MaDonViTinh,
			GiaBan = @GiaBan,
			NgaySua = GETDATE()
        WHERE MaSanPham = @MaSanPham;

        IF (@listjson_chitietanh IS NOT NULL)
        BEGIN
            DELETE FROM ChiTietAnh
            WHERE MaSanPham = @MaSanPham;

            INSERT INTO ChiTietAnh
            (
                MaSanPham,
                Anh
            )
            SELECT
				@MaSanPham,
                JSON_VALUE(p.value, '$.anh')
            FROM OPENJSON(@listjson_chitietanh) AS p;
        END;

        IF (@listjson_thongsokythuat IS NOT NULL)
        BEGIN
            DELETE FROM ThongSoKyThuat
            WHERE MaSanPham = @MaSanPham;

            INSERT INTO ThongSoKyThuat
            (
                MaSanPham,
                TenThongSo,
                MoTa
            )
            SELECT
                @MaSanPham,
                JSON_VALUE(p.value, '$.tenThongSo'),
                JSON_VALUE(p.value, '$.moTa')
            FROM OPENJSON(@listjson_thongsokythuat) AS p;
        END;
    END;

    SELECT '';
END;
GO

--Xóa sản phẩm
CREATE PROCEDURE sp_sanpham_delete
	@MaSanPham int
AS
	BEGIN
		DELETE FROM ChiTietAnh WHERE MaSanPham = @MaSanPham
		DELETE FROM ThongSoKyThuat WHERE MaSanPham = @MaSanPham
		DELETE FROM SanPham WHERE MaSanPham = @MaSanPham;
	END
GO

--Tìm kiểm sản phẩm
CREATE PROCEDURE sp_sanpham_search
(
@page_index int,
@page_size int,
@product_name nvarchar(max)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RecordCount bigint;
	IF @page_size <> 0
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaSanPham ASC)) AS RowNumber,
			sp.*,
			(
				SELECT 
					cta.MaAnhChiTiet,
					cta.MaSanPham,
					cta.Anh
				FROM ChiTietAnh AS cta
				WHERE cta.MaSanPham = sp.MaSanPham FOR JSON PATH
			) AS listjson_chitietanh,
			(
				SELECT 
					tskt.MaThongSo,
					tskt.MaSanPham,
					tskt.TenThongSo,
					tskt.MoTa
				FROM ThongSoKyThuat AS tskt
				WHERE tskt.MaSanPham = sp.MaSanPham FOR JSON PATH
			) AS listjson_thongsokythuat
		INTO #Results1
		FROM SanPham AS sp
		WHERE sp.TenSanPham LIKE '%' + @product_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results1;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results1
		WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
			AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
			OR @page_index = -1;

		DROP TABLE #Results1;
	END
	ELSE
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaSanPham ASC)) AS RowNumber,
			sp.*
		INTO #Results2
		FROM SanPham AS sp
		WHERE sp.TenSanPham LIKE '%' + @product_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results2;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results2;

		DROP TABLE #Results2;
	END
END
GO

---------PROCEDURE ---------
--Lấy khuyến mại theo mã 
CREATE PROCEDURE sp_khuyenmai_id
	(@MaKhuyenMai int)
AS
    BEGIN
        SELECT 
			km.MaKhuyenMai,
			km.TenKhuyenMai,
			km.MoTa,
			(
			SELECT 
				ctkm.MaChiTietKhuyenMai,
				ctkm.MaSanPham,
				ctkm.NgayBatDau,
				ctkm.NgayKetThuc,
				ctkm.TrangThai
			FROM ChiTietKhuyenMai AS ctkm
			left join KhuyenMai km on ctkm.MaKhuyenMai = km.MaKhuyenMai
			WHERE ctkm.MaKhuyenMai = @MaKhuyenMai FOR JSON PATH
			) AS listjson_chitietkhuyenmai
		FROM KhuyenMai km
		WHERE  km.MaKhuyenMai = @MaKhuyenMai
    END;
GO
--Thêm khuyến mại
CREATE PROCEDURE sp_khuyenmai_create
(
	@TenKhuyenMai nvarchar(250),
	@MoTa ntext,
	@listjson_chitietkhuyenmai NVARCHAR(MAX)
)
AS
BEGIN
	BEGIN
		INSERT INTO KhuyenMai
		(
			TenKhuyenMai,
			MoTa
		)
		VALUES(
			@TenKhuyenMai,
			@MoTa
		);
		DECLARE @MaKhuyenMai INT = SCOPE_IDENTITY();
		IF (@listjson_chitietkhuyenmai IS NOT NULL)
		BEGIN
		INSERT INTO ChiTietKhuyenMai
		(
			MaSanPham,
			NgayBatDau,
			NgayKetThuc,
			MaKhuyenMai,
			TrangThai								
		)
		SELECT
			JSON_VALUE(p.value, '$.maSanPham'),
			JSON_VALUE(p.value, '$.ngayBatDau'),
			JSON_VALUE(p.value, '$.ngayKetThuc'),
			@MaKhuyenMai,
			JSON_VALUE(p.value, '$.trangThai')
		FROM OPENJSON(@listjson_chitietkhuyenmai) AS p;
		END;
	END;
	SELECT '';
END;
GO

--Sửa khuyến mại
CREATE PROCEDURE sp_khuyenmai_update
(	
	@MaKhuyenMai int,
    @TenKhuyenMai nvarchar(250),
	@MoTa ntext,
	@listjson_chitietkhuyenmai NVARCHAR(MAX)
)
AS
BEGIN
    BEGIN
        UPDATE KhuyenMai SET
			TenKhuyenMai = @TenKhuyenMai,
			MoTa = @MoTa
        WHERE MaKhuyenMai = @MaKhuyenMai;

        IF (@listjson_chitietkhuyenmai IS NOT NULL)
        BEGIN
            DELETE FROM ChiTietKhuyenMai
            WHERE MaKhuyenMai = MaKhuyenMai;

           	INSERT INTO ChiTietKhuyenMai
		(
			MaSanPham,
			NgayBatDau,
			NgayKetThuc,
			MaKhuyenMai,
			TrangThai								
		)
		SELECT
		JSON_VALUE(p.value, '$.maSanPham'),
		JSON_VALUE(p.value, '$.ngayBatDau'),
		JSON_VALUE(p.value, '$.ngayKetThuc'),
		@MaKhuyenMai,
		JSON_VALUE(p.value, '$.trangThai')
        FROM OPENJSON(@listjson_chitietkhuyenmai) AS p;
        END;        
    END;

    SELECT '';
END;
GO

--Xóa khuyến mại
CREATE PROCEDURE sp_khuyenmai_delete
	@MaKhuyenMai int
AS
	BEGIN
		DELETE FROM ChiTietKhuyenMai WHERE MaKhuyenMai = @MaKhuyenMai 
		DELETE FROM KhuyenMai WHERE MaKhuyenMai = @MaKhuyenMai;
	END
GO

--Tìm kiếm khuyến mại
CREATE PROCEDURE sp_khuyenmai_search
(
@page_index int,
@page_size int,
@promotion_name nvarchar(max)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RecordCount bigint;
	IF @page_size <> 0
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaKhuyenMai ASC)) AS RowNumber,
			km.*,
			(
			SELECT 
				ctkm.MaChiTietKhuyenMai,
				ctkm.MaSanPham,
				ctkm.NgayBatDau,
				ctkm.NgayKetThuc,
				ctkm.TrangThai
			FROM ChiTietKhuyenMai AS ctkm
			WHERE ctkm.MaKhuyenMai = km.MaKhuyenMai FOR JSON PATH
			) AS listjson_chitietkhuyenmai
		INTO #Results1
		FROM KhuyenMai AS km
		WHERE km.TenKhuyenMai LIKE '%' + @promotion_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results1;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results1
		WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
			AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
			OR @page_index = -1;

		DROP TABLE #Results1;
	END
	ELSE
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaKhuyenMai ASC)) AS RowNumber
		INTO #Results2
		FROM KhuyenMai AS km
		WHERE km.TenKhuyenMai LIKE '%' + @promotion_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results2;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results2;

		DROP TABLE #Results2;
	END
END
GO

---------PROCEDURE Nhà xung cấp---------
--Lấy ra tất cả thông tin nhà cung cấp
CREATE PROCEDURE sp_nhacungcap_full
AS
	BEGIN
		SELECT 
			MaNhaCungCap,
			TenNhaCungCap
		FROM
			NhaCungCap
	END
GO
--Lấy thông tin nhà cung cấp theo ID
CREATE PROCEDURE sp_nhacungcap_id
	@MaNhaCungCap int
AS
BEGIN
	SELECT *
	FROM NhaCungCap
	WHERE MaNhaCungCap = @MaNhaCungCap;
END
GO

--Thêm nhà cung cấp
CREATE PROCEDURE sp_nhacungcap_create
	@TenNhaCungCap nvarchar(250),
	@DiaChi nvarchar(500),
	@SoDienThoai char(20),
	@Email char(50)
AS
BEGIN
	INSERT INTO NhaCungCap
	(
		TenNhaCungCap,
		DiaChi,
		SoDienThoai,
		Email
	)
	VALUES
	(
		@TenNhaCungCap,
		@DiaChi,
		@SoDienThoai,
		@Email
	);
END
GO

--Cập nhật thông tin nhà cung cấp
CREATE PROCEDURE sp_nhacungcap_update
(
	@MaNhaCungCap int,
	@TenNhaCungCap nvarchar(250),
	@DiaChi nvarchar(500),
	@SoDienThoai char(20),
	@Email char(50)
)
AS
BEGIN
	UPDATE NhaCungCap SET
		TenNhaCungCap = @TenNhaCungCap,
		DiaChi = @DiaChi,
		SoDienThoai = @SoDienThoai,
		Email = @Email
	WHERE MaNhaCungCap = @MaNhaCungCap;
END
GO

--Xóa nhà cung cấp
CREATE PROCEDURE sp_nhacungcap_delete
	@MaNhaCungCap int
AS
BEGIN
	DELETE FROM NhaCungCap WHERE MaNhaCungCap = @MaNhaCungCap;
END
GO

--Tìm kiếm nhà cung cấp
CREATE PROCEDURE sp_nhacungcap_search
(
	@page_index int,
	@page_size int,
	@supplier_name nvarchar(max)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RecordCount bigint;
	IF @page_size <> 0
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaNhaCungCap ASC)) AS RowNumber,
			*
		INTO #Results1
		FROM NhaCungCap
		WHERE TenNhaCungCap LIKE '%' + @supplier_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results1;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results1
		WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
			AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
			OR @page_index = -1;

		DROP TABLE #Results1;
	END
	ELSE
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaNhaCungCap ASC)) AS RowNumber,
			*
		INTO #Results2
		FROM NhaCungCap
		WHERE TenNhaCungCap LIKE '%' + @supplier_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results2;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results2;

		DROP TABLE #Results2;
	END
END
GO

---------PROCEDURE Nhân viên---------
--Lấy ra tất cả thông tin nhân viên
CREATE PROCEDURE sp_nhanvien_full
AS
	BEGIN
		SELECT 
			MaNhanVien,
			HoTen
		FROM
			NhanVien
	END
GO
		
-- Lấy thông tin một nhân viên theo mã
CREATE PROCEDURE sp_nhanvien_id
	@MaNhanVien int
AS
BEGIN
	SELECT *
	FROM NhanVien
	WHERE MaNhanVien = @MaNhanVien;
END
GO

-- Thêm một nhân viên
CREATE PROCEDURE sp_nhanvien_create
	@HoTen nvarchar(250),
	@NgaySinh datetime,
	@GioiTinh nvarchar(20),
	@AnhDaiDien varchar(500),
	@DiaChi nvarchar(1500),
	@Email nvarchar(100),
	@DienThoai char(20),
	@TaiKhoan varchar(100),
	@MatKhau varchar(100),
	@TrangThai bit,
	@LoaiQuyen varchar(10)
AS
BEGIN
	INSERT INTO NhanVien
	(
		HoTen,
		NgaySinh,
		GioiTinh,
		AnhDaiDien,
		DiaChi,
		Email,
		DienThoai,
		TaiKhoan,
		MatKhau,
		TrangThai,
		LoaiQuyen
	)
	VALUES
	(
		@HoTen,
		@NgaySinh,
		@GioiTinh,
		@AnhDaiDien,
		@DiaChi,
		@Email,
		@DienThoai,
		@TaiKhoan,
		@MatKhau,
		@TrangThai,
		@LoaiQuyen			
	);
END
GO

-- Cập nhật thông tin một nhân viên
CREATE PROCEDURE sp_nhanvien_update
(
	@MaNhanVien int,
	@HoTen nvarchar(250),
	@NgaySinh datetime,
	@GioiTinh nvarchar(20),
	@AnhDaiDien varchar(500),
	@DiaChi nvarchar(1500),
	@Email nvarchar(100),
	@DienThoai char(20),
	@TaiKhoan varchar(100),
	@MatKhau varchar(100),
	@TrangThai bit,
	@LoaiQuyen varchar(10)
)
AS
BEGIN
	UPDATE NhanVien SET
		HoTen = @HoTen,
		NgaySinh = @NgaySinh,
		GioiTinh = @GioiTinh,
		AnhDaiDien = @AnhDaiDien,
		DiaChi = @DiaChi,
		Email = @Email,
		DienThoai = @DienThoai,
		TaiKhoan = @TaiKhoan,
		MatKhau = @MatKhau,
		TrangThai = @TrangThai,
		LoaiQuyen = @LoaiQuyen
	WHERE MaNhanVien = @MaNhanVien;
END
GO

-- Xóa một nhân viên
CREATE PROCEDURE sp_nhanvien_delete
	@MaNhanVien int
AS
BEGIN
	DELETE FROM NhanVien WHERE MaNhanVien = @MaNhanVien;
	SELECT '';
END
GO

-- Tìm kiếm nhân viên theo tên
CREATE PROCEDURE sp_nhanvien_search
(
@page_index int,
@page_size int,
@staff_name nvarchar(max)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RecordCount bigint;
	IF @page_size <> 0
	BEGIN
		SELECT
			(ROW_NUMBER() OVER (ORDER BY MaNhanVien ASC)) AS RowNumber,
			*
		INTO #Results1
		FROM NhanVien
		WHERE HoTen LIKE '%' + @staff_name + '%'
		SELECT @RecordCount = COUNT(*)
		FROM #Results1;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results1
		WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
			AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
			OR @page_index = -1;

		DROP TABLE #Results1;
	END
	ELSE
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaNhanVien ASC)) AS RowNumber
		INTO #Results2
		FROM NhanVien
		WHERE HoTen LIKE '%' + @staff_name + '%'
		SELECT @RecordCount = COUNT(*)
		FROM #Results2;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results2;

		DROP TABLE #Results2;
	END
END
GO

--Nhập tài khoản mật khẩu lấy thông tin
CREATE PROCEDURE sp_nhanvien_username_password
(
	@TaiKhoan varchar(30),
	@MatKhau varchar(60)
)
AS
    BEGIN
        SELECT   
			MaNhanVien,
			HoTen,
            GioiTinh,
			AnhDaiDien,
			TaiKhoan,
			MatKhau,
            LoaiQuyen

        FROM NhanVien
      where  TaiKhoan = @TaiKhoan and MatKhau = @MatKhau and TrangThai = '1' ;
    END;
GO


---------PROCEDURE Hóa đơn nhập---------
--Lấy hóa đơn nhập theo mã 
CREATE PROCEDURE sp_hoadonnhap_id
	(@MaHoaDonNhap int)
AS
    BEGIN
        SELECT 
			hd.MaHoaDonNhap,
			hd.NgayNhap,
			hd.MaNhanVien,
			(
			SELECT 
				cthd.MaChiTiet,
				cthd.MaSanPham,
				cthd.MaHoaDonNhap,
				cthd.SoLuong,
				cthd.DonGiaNhap
			FROM ChiTietHoaDonNhap AS cthd
			left join HoaDonNhap hd on cthd.MaHoaDonNhap = hd.MaHoaDonNhap
			WHERE cthd.MaHoaDonNhap = @MaHoaDonNhap FOR JSON PATH
			) AS listjson_chitiethoadonnhap
		FROM HoaDonNhap hd
		WHERE  hd.MaHoaDonNhap = @MaHoaDonNhap
    END;
GO

--Thêm hóa đơn nhập
CREATE PROCEDURE sp_hoadonnhap_create
(
	@MaNhanVien int,
	@MaNhaCungCap int,
	@listjson_chitiethoadonnhap NVARCHAR(MAX)
)
AS
BEGIN
	BEGIN
		INSERT INTO HoaDonNhap
		(
			NgayNhap,
			MaNhanVien,
			MaNhaCungCap
		)
		VALUES(
			GETDATE(),
			@MaNhanVien,
			@MaNhaCungCap
		);
		DECLARE @MaHoaDonNhap INT = SCOPE_IDENTITY();
		IF (@listjson_chitiethoadonnhap IS NOT NULL)
		BEGIN
		INSERT INTO ChiTietHoaDonNhap
		(
			MaSanPham,
			MaHoaDonNhap,
			SoLuong,
			DonGiaNhap
		)
		SELECT
			JSON_VALUE(p.value, '$.maSanPham'),
			@MaHoaDonNhap,
			JSON_VALUE(p.value, '$.soLuong'),
			JSON_VALUE(p.value, '$.donGiaNhap')
		FROM OPENJSON(@listjson_chitiethoadonnhap) AS p;
		END;
	END;
	SELECT '';
END;
GO

--Sửa hóa đon nhập
CREATE PROCEDURE sp_hoadonnhap_update
(	
	@MaHoaDonNhap int,
	@MaNhanVien int,
	@MaNhaCungCap int,
	@listjson_chitiethoadonnhap NVARCHAR(MAX)
)
AS
BEGIN
    BEGIN
        UPDATE HoaDonNhap SET
			MaNhanVien = @MaNhanVien,
			MaNhaCungCap = @MaNhaCungCap
        WHERE MaHoaDonNhap = @MaHoaDonNhap;

        IF (@listjson_chitiethoadonnhap IS NOT NULL)
        BEGIN
            DELETE FROM ChiTietHoaDonNhap
            WHERE MaHoaDonNhap = MaHoaDonNhap;

           	INSERT INTO ChiTietHoaDonNhap
		(
			MaSanPham,
			MaHoaDonNhap,
			SoLuong,
			DonGiaNhap
		)
		SELECT
			JSON_VALUE(p.value, '$.maSanPham'),
			@MaHoaDonNhap,
			JSON_VALUE(p.value, '$.soLuong'),
			JSON_VALUE(p.value, '$.donGiaNhap')
		FROM OPENJSON(@listjson_chitiethoadonnhap) AS p;
        END;        
    END;

    SELECT '';
END;
GO

--Xóa hóa đơn nhập
CREATE PROCEDURE sp_hoadonnhap_delete
	@MaHoaDonNhap int
AS
	BEGIN
		DELETE FROM ChiTietHoaDonNhap WHERE MaHoaDonNhap = @MaHoaDonNhap
		DELETE FROM HoaDonNhap WHERE  MaHoaDonNhap = @MaHoaDonNhap;
	END
GO

--Tìm kiếm khuyến mại
CREATE PROCEDURE sp_hoadonnhap_search
(
	@page_index int,
	@page_size int,
	@menuized_id nvarchar(max)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RecordCount bigint;
	IF @page_size <> 0
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaHoaDonNhap ASC)) AS RowNumber,
			hd.*,
			(
			SELECT 
				cthd.MaChiTiet,
				cthd.MaSanPham,
				cthd.MaHoaDonNhap,
				cthd.SoLuong,
				cthd.DonGiaNhap
			FROM ChiTietHoaDonNhap AS cthd
			 WHERE cthd.MaHoaDonNhap = hd.MaHoaDonNhap FOR JSON PATH
			) AS listjson_chitiethoadonnhap
		INTO #Results1
		FROM HoaDonNhap AS hd
		WHERE hd.MaHoaDonNhap LIKE '%' + @menuized_id + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results1;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results1
		WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
			AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
			OR @page_index = -1;

		DROP TABLE #Results1;
	END
	ELSE
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaHoaDonNhap ASC)) AS RowNumber
		INTO #Results2
		FROM HoaDonNhap AS hd
		WHERE hd.MaHoaDonNhap LIKE '%' + @menuized_id + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results2;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results2;

		DROP TABLE #Results2;
	END
END
GO


---------PROCEDURE Khách hàng---------
--Lấy ra tất cả thông tin khách hàng
CREATE PROCEDURE sp_khachhang_full
AS
	BEGIN
		SELECT 
			MaKhachHang,
			TenKhachHang
		FROM
			KhachHang
	END
GO
-- Lấy thông tin khách hàng bằng Mã khách hàng
CREATE PROCEDURE sp_khachhang_id
(
	@MaKhachHang int
)
AS
BEGIN
	SELECT *
	FROM KhachHang
	WHERE MaKhachHang = @MaKhachHang;
END
GO

-- Thêm khách hàng mới
CREATE PROCEDURE sp_khachhang_create
(
	@TenKhachHang nvarchar(250),
	@DiaChi nvarchar(1500),
	@SoDienThoai varchar(20),
	@Email varchar(50)
)
AS
BEGIN
	INSERT INTO KhachHang (
		TenKhachHang, 
		DiaChi,	
		SoDienThoai, 
		Email
		)
	VALUES (
		@TenKhachHang, 
		@DiaChi, 
		@SoDienThoai, 
		@Email);
END
GO

-- Cập nhật thông tin khách hàng
CREATE PROCEDURE sp_khachhang_update
(
	@MaKhachHang int,
	@TenKhachHang nvarchar(250),
	@DiaChi nvarchar(1500),
	@SoDienThoai varchar(20),
	@Email varchar(50)
)
AS
BEGIN
	UPDATE KhachHang
		SET TenKhachHang = @TenKhachHang, 
		DiaChi = @DiaChi, 
		SoDienThoai = @SoDienThoai, 
		Email = @Email
	WHERE MaKhachHang = @MaKhachHang;
SELECT '';
END
GO

-- Xóa khách hàng
CREATE PROCEDURE sp_khachhang_delete
(
	@MaKhachHang int
)
AS
BEGIN
	DELETE FROM KhachHang WHERE MaKhachHang = @MaKhachHang;
	SELECT ''; 
END
GO

--Tìm kiếm tên khách hàng
CREATE PROCEDURE sp_khachhang_search
(
	@page_index INT,
	@page_size INT,
	@customer_name NVARCHAR(MAX)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RecordCount BIGINT;

	IF @page_size <> 0
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaKhachHang ASC)) AS RowNumber,
			*
		INTO #Results1
		FROM KhachHang
		WHERE TenKhachHang LIKE '%' + @customer_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results1;

		SELECT *,
			   @RecordCount AS RecordCount
		FROM #Results1
		WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
			AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
			OR @page_index = -1;

		DROP TABLE #Results1;
	END
	ELSE
	BEGIN
		SELECT (ROW_NUMBER() OVER (ORDER BY MaKhachHang ASC)) AS RowNumber
		INTO #Results2
		FROM KhachHang
		WHERE TenKhachHang LIKE '%' + @customer_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results2;

		SELECT *,
			   @RecordCount AS RecordCount
		FROM #Results2;

		DROP TABLE #Results2;
	END
END
GO

---------PROCEDURE Đơn hàng---------
--Lấy hóa đơn nhập theo mã 
CREATE PROCEDURE sp_donhang_id
	(@MaDonHang int)
AS
    BEGIN
        SELECT 
			dh.MaKhachHang,
			dh.NgayDat,
			dh.TrangThaiDonHang,
			(
			SELECT 
				ctdh.MaChiTietDonHang,
				ctdh.MaDonHang,
				ctdh.MaSanPham,
				ctdh.SoLuong,
				ctdh.GiaMua
			FROM ChiTietDonHang AS ctdh
			left join HoaDonNhap hd on ctdh.MaDonHang = dh.MaDonHang
			WHERE ctdh.MaDonHang = @MaDonHang FOR JSON PATH
			) AS listjson_chitietdonhang
		FROM DonHang dh
		WHERE  dh.MaDonHang = @MaDonHang
    END;
GO


--Sửa hóa đon nhập
CREATE PROCEDURE sp_donhang_update
(	
	@MaDonHang int,
	@MaKhachHang int,
	@TrangThai int,
	@listjson_chitietdonhang NVARCHAR(MAX)
)
AS
BEGIN
    BEGIN
        UPDATE DonHang SET
			MaKhachHang = @MaKhachHang,
			TrangThaiDonHang = @TrangThai
        WHERE MaDonHang = @MaDonHang;

        IF (@listjson_chitietdonhang IS NOT NULL)
        BEGIN
            DELETE FROM ChiTietDonHang
            WHERE MaDonHang = MaDonHang;

           	INSERT INTO ChiTietDonHang
		(
			MaDonHang,
			MaSanPham,
			SoLuong,
			GiaMua
		)
		SELECT
			@MaDonHang,
			JSON_VALUE(p.value, '$.maSanPham'),
			JSON_VALUE(p.value, '$.soLuong'),
			JSON_VALUE(p.value, '$.giaMua')
		FROM OPENJSON(@listjson_chitietdonhang) AS p;
        END;        
    END;

    SELECT '';
END;
GO

--Tìm kiếm đơn hàng
CREATE PROCEDURE sp_donhang_search
(
	@page_index int,
	@page_size int,
	@order_id nvarchar(max)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RecordCount bigint;
	IF @page_size <> 0
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaDonHang ASC)) AS RowNumber,
			dh.*,
			(
			SELECT 
				ctdh.MaChiTietDonHang,
				ctdh.MaDonHang,
				ctdh.MaSanPham,
				ctdh.SoLuong,
				ctdh.GiaMua
			FROM ChiTietDonHang AS ctdh
			left join HoaDonNhap hd on ctdh.MaDonHang = dh.MaDonHang
			WHERE ctdh.MaDonHang = dh.MaDonHang FOR JSON PATH
			) AS listjson_chitietdonhang
		INTO #Results1
		FROM DonHang AS dh
		WHERE dh.MaDonHang LIKE '%' + @order_id + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results1;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results1
		WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
			AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
			OR @page_index = -1;

		DROP TABLE #Results1;
	END
	ELSE
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaDonHang ASC)) AS RowNumber
		INTO #Results2
		FROM DonHang AS dh
		WHERE dh.MaDonHang LIKE '%' + @order_id + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results2;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results2;

		DROP TABLE #Results2;
	END
END
GO

---------PROCEDURE Hóa đơn xuất---------
--lấy theo mã hóa đơn xuất
CREATE PROCEDURE sp_hoadonxuat_id
	(@MaHoaDonXuat int)
AS
    BEGIN
        SELECT 
			hd.MaHoaDonXuat,
			hd.NgayXuat,
			hd.MaKhachHang,
			hd.MaNhanVien,
			(
			SELECT 
				cthd.MaChiTietHoaDonXuat,
				cthd.MaHoaDonXuat,
				cthd.MaSanPham,
				cthd.SoLuong,
				cthd.GiaBan,
				cthd.ChietKhau,
				cthd.TraLai
			FROM ChiTietHoaDonXuat AS cthd
			WHERE cthd.MaHoaDonXuat = hd.MaHoaDonXuat FOR JSON PATH
			) AS listjson_chitiethoadonxuat
		FROM HoaDonXuat hd
		WHERE  hd.MaHoaDonXuat = @MaHoaDonXuat
    END;
GO

--Thêm hóa đơn xuất
CREATE PROCEDURE sp_hoadonxuat_create
(
	@MaKhachHang int,
	@MaNhanVien int,
	@listjson_chitiethoadonxuat NVARCHAR(MAX)
)
AS
BEGIN
	BEGIN
		INSERT INTO HoaDonXuat
		(
			NgayXuat,
			MaKhachHang,
			MaNhanVien
		)
		VALUES(
			GETDATE(),
			@MaKhachHang,
			@MaNhanVien
		);
		DECLARE @MaHoaDonXuat INT = SCOPE_IDENTITY();
		IF (@listjson_chitiethoadonxuat IS NOT NULL)
		BEGIN
		INSERT INTO ChiTietHoaDonXuat
		(
			MaHoaDonXuat,
			MaSanPham,
			SoLuong,
			GiaBan,
			ChietKhau,
			TraLai
		)
		SELECT
			@MaHoaDonXuat,
			JSON_VALUE(p.value, '$.maSanPham'),
			JSON_VALUE(p.value, '$.soLuong'),
			JSON_VALUE(p.value, '$.giaBan'),
			JSON_VALUE(p.value, '$.chietKhau'),
			JSON_VALUE(p.value, '$.traLai')
		FROM OPENJSON(@listjson_chitiethoadonxuat) AS p;
		END;
	END;
	SELECT '';
END;
GO

--Sửa hóa đơn xuất
CREATE PROCEDURE sp_hoadonxuat_update
(	
	@MaHoaDonXuat int,
	@MaKhachHang int,
	@MaNhanVien int,
	@listjson_chitiethoadonxuat NVARCHAR(MAX)
)
AS
BEGIN
    BEGIN
        UPDATE HoaDonXuat SET
			MaKhachHang = @MaKhachHang,
			MaNhanVien = @MaNhanVien
        WHERE MaHoaDonXuat = @MaHoaDonXuat;

        IF (@listjson_chitiethoadonxuat IS NOT NULL)
        BEGIN
            DELETE FROM ChiTietHoaDonXuat
            WHERE MaHoaDonXuat = MaHoaDonXuat;

           INSERT INTO ChiTietHoaDonXuat
			(
				MaHoaDonXuat,
				MaSanPham,
				SoLuong,
				GiaBan,
				ChietKhau,
				TraLai
			)
		SELECT
			@MaHoaDonXuat,
			JSON_VALUE(p.value, '$.maSanPham'),
			JSON_VALUE(p.value, '$.soLuong'),
			JSON_VALUE(p.value, '$.giaBan'),
			JSON_VALUE(p.value, '$.chietKhau'),
			JSON_VALUE(p.value, '$.traLai')
		FROM OPENJSON(@listjson_chitiethoadonxuat) AS p;
        END;        
    END;

    SELECT '';
END;
GO

--Xóa hóa đơn xuất
CREATE PROCEDURE sp_hoadonxuat_delete
	@MaHoaDonXuat int
AS
	BEGIN
		DELETE FROM ChiTietHoaDonXuat WHERE MaHoaDonXuat = @MaHoaDonXuat 
		DELETE FROM HoaDonXuat WHERE MaHoaDonXuat = @MaHoaDonXuat;
	END
GO

--Tìm kiếm hóa đơn xuất
CREATE PROCEDURE sp_hoadonxuat_search
(
	@page_index int,
	@page_size int,
	@exportinvoice_id nvarchar(max)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RecordCount bigint;
	IF @page_size <> 0
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaHoaDonXuat ASC)) AS RowNumber,
			hd.*,
			(
			SELECT 
				cthd.MaChiTietHoaDonXuat,
				cthd.MaHoaDonXuat,
				cthd.MaSanPham,
				cthd.SoLuong,
				cthd.GiaBan,
				cthd.ChietKhau,
				cthd.TraLai
			FROM ChiTietHoaDonXuat AS cthd
			WHERE cthd.MaHoaDonXuat = hd.MaHoaDonXuat FOR JSON PATH
			) AS listjson_chitiethoadonxuat
		INTO #Results1
		FROM HoaDonXuat AS hd
		WHERE hd.MaHoaDonXuat LIKE '%' + @exportinvoice_id + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results1;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results1
		WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
			AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
			OR @page_index = -1;

		DROP TABLE #Results1;
	END
	ELSE
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaHoaDonXuat ASC)) AS RowNumber
		INTO #Results2
		FROM HoaDonXuat AS hd
		WHERE hd.MaHoaDonXuat LIKE '%' + @exportinvoice_id + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results2;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results2;

		DROP TABLE #Results2;
	END
END
GO

---------PROCEDURE Kho---------
--Lấy thông tin kho theo mã 
CREATE PROCEDURE sp_kho_id
	(@MaKho int)
AS
    BEGIN
        SELECT 
			kh.TenKho,
			kh.DiaChi,
			(
			SELECT 
				ctkh.MaChiTietKho,
				ctkh.MaKho,
				ctkh.MaSanPham,
				ctkh.SoLuong
			FROM ChiTietKho AS ctkh
			WHERE ctkh.MaKho = @MaKho FOR JSON PATH
			) AS listjson_chitiekho
		FROM Kho kh
		WHERE  kh.MaKho = @MaKho
    END;
GO

--Thêm kho
CREATE PROCEDURE sp_kho_create
(
	@TenKho nvarchar(250),
	@DiaChi nvarchar(500),
	@listjson_chitietkho NVARCHAR(MAX)
)
AS
BEGIN
	BEGIN
		INSERT INTO Kho
		(
			TenKho,
			DiaChi
		)
		VALUES(
			@TenKho,
			@DiaChi
		);
		DECLARE @MaKho INT = SCOPE_IDENTITY();
		IF (@listjson_chitietkho IS NOT NULL)
		BEGIN
		INSERT INTO ChiTietKho
		(
			MaKho,
			MaSanPham,
			SoLuong
		)
		SELECT
			@MaKho,
			JSON_VALUE(p.value, '$.maSanPham'),
			JSON_VALUE(p.value, '$.soLuong')
		FROM OPENJSON(@listjson_chitietkho) AS p;
		END;
	END;
	SELECT '';
END;
GO

--Sửa kho
CREATE PROCEDURE sp_kho_update
(	
	@MaKho int,
	@TenKho nvarchar(250),
	@DiaChi nvarchar(500),
	@listjson_chitietkho NVARCHAR(MAX)
)
AS
BEGIN
    BEGIN
        UPDATE Kho SET
			TenKho = @TenKho,
			DiaChi = @DiaChi
        WHERE MaKho = @MaKho;

        IF (@listjson_chitietkho IS NOT NULL)
        BEGIN
            DELETE FROM ChiTietKho
            WHERE MaKho = MaKho;

           INSERT INTO ChiTietKho
			(
				MaKho,
				MaSanPham,
				SoLuong
			)
			SELECT
				@MaKho,
				JSON_VALUE(p.value, '$.maSanPham'),
				JSON_VALUE(p.value, '$.soLuong')
			FROM OPENJSON(@listjson_chitietkho) AS p;
        END;        
    END;

    SELECT '';
END;
GO

--Xóa kho
CREATE PROCEDURE sp_kho_delete
	@MaKho int
AS
	BEGIN
		DELETE FROM ChiTietKho WHERE MaKho = @MaKho
		DELETE FROM Kho WHERE MaKho = @MaKho;
	END
GO

--Tìm kiếm Kho
CREATE PROCEDURE sp_kho_search
(
	@page_index int,
	@page_size int,
	@warehouse_name nvarchar(max)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RecordCount bigint;
	IF @page_size <> 0
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaKho ASC)) AS RowNumber,
			kh.*,
			(
			SELECT 
				ctkh.MaChiTietKho,
				ctkh.MaKho,
				ctkh.MaSanPham,
				ctkh.SoLuong
			FROM ChiTietKho AS ctkh
			left join Kho kh on ctkh.MaKho = kh.MaKho
			WHERE ctkh.MaKho = kh.MaKho FOR JSON PATH
			) AS listjson_chitiekho
		INTO #Results1
		FROM Kho AS kh
		WHERE kh.TenKho LIKE '%' + @warehouse_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results1;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results1
		WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
			AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
			OR @page_index = -1;

		DROP TABLE #Results1;
	END
	ELSE
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaKho ASC)) AS RowNumber
		INTO #Results2
		FROM Kho AS kh
		WHERE kh.TenKho LIKE '%' + @warehouse_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results2;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results2;

		DROP TABLE #Results2;
	END
END
GO
---------PROCEDURE Kiểm kho---------
--Lấy thông tin kiểm kho theo mã 
CREATE PROCEDURE sp_kiemkho_id
	(@MaKiemKho int)
AS
    BEGIN
        SELECT 
			kk.MaNhanVien,
			kk.ThoiGianBatDau,
			kk.ThoiGianKetThuc,
			kk.TrangThaiKho,
			kk.MaKho,
			kk.MoTa,
			(
			SELECT 
				ctkk.MaChiTietKiemKho,
				ctkk.MaSanPham,
				ctkk.MaKiemKho,
				ctkk.SoLuongDemDuoc,
				ctkk.SoLuongTinhToan,
				ctkk.SoLuongThayDoi
			FROM ChiTietKiemKho AS ctkk
			WHERE ctkk.MaKiemKho = @MaKiemKho FOR JSON PATH
			) AS listjson_chitietkiemkho
		FROM KiemKho kk
		WHERE  kk.MaKiemKho = @MaKiemKho
    END;
GO

--Thêm kiểm kho
CREATE PROCEDURE sp_kiemkho_create
(
	@MaNhanVien int,
	@ThoiGianBatDau datetime,
	@ThoiGianKetThuc datetime,
	@TrangThaiKho bit, 
	@MaKho int, 
	@MoTa ntext,
	@listjson_chitietkiemkho NVARCHAR(MAX)
)
AS
BEGIN
	BEGIN
		INSERT INTO KiemKho
		(
			MaNhanVien,
			ThoiGianBatDau,
			ThoiGianKetThuc,
			TrangThaiKho, 
			MaKho,
			MoTa
		)
		VALUES(
			@MaNhanVien,
			@ThoiGianBatDau,
			@ThoiGianKetThuc,
			@TrangThaiKho,
			@MaKho,
			@MoTa
		);
		DECLARE @MaKiemKho INT = SCOPE_IDENTITY();
		IF (@listjson_chitietkiemkho IS NOT NULL)
		BEGIN
		INSERT INTO ChiTietKiemKho
		(
			MaSanPham,
			MaKiemKho,
			SoLuongDemDuoc,
			SoLuongTinhToan,
			SoLuongThayDoi
		)
		SELECT
			JSON_VALUE(p.value, '$.maSanPham'),
			@MaKiemKho,
			JSON_VALUE(p.value, '$.soLuongDemDuoc'),
			JSON_VALUE(p.value, '$.soLuongTinhToan'),
			JSON_VALUE(p.value, '$.soLuongThayDoi')
		FROM OPENJSON(@listjson_chitietkiemkho) AS p;
		END;
	END;
	SELECT '';
END;
GO

--Sửa kho
CREATE PROCEDURE sp_kiemkho_update
(	
	@MaKiemKho int,
	@MaNhanVien int,
	@ThoiGianBatDau datetime,
	@ThoiGianKetThuc datetime,
	@TrangThaiKho bit, 
	@MaKho int, 
	@MoTa ntext,
	@listjson_chitietkiemkho NVARCHAR(MAX)
)
AS
BEGIN
    BEGIN
        UPDATE KiemKho SET
			MaNhanVien = @MaNhanVien,
			ThoiGianBatDau = @ThoiGianBatDau,
			ThoiGianKetThuc = @ThoiGianKetThuc,
			TrangThaiKho = @TrangThaiKho,
			MoTa = @MoTa
        WHERE MaKiemKho = @MaKiemKho;

        IF (@listjson_chitietkiemkho IS NOT NULL)
        BEGIN
            DELETE FROM ChiTietKiemKho
            WHERE MaKiemKho = MaKiemKho;

			INSERT INTO ChiTietKiemKho
			(
				MaSanPham,
				MaKiemKho,
				SoLuongDemDuoc,
				SoLuongTinhToan,
				SoLuongThayDoi
			)
			SELECT
				JSON_VALUE(p.value, '$.maSanPham'),
				@MaKiemKho,
				JSON_VALUE(p.value, '$.soLuongDemDuoc'),
				JSON_VALUE(p.value, '$.soLuongTinhToan'),
				JSON_VALUE(p.value, '$.soLuongThayDoi')
			FROM OPENJSON(@listjson_chitietkiemkho) AS p;	
        END;        
    END;

    SELECT '';
END;
GO

--Xóa kho
CREATE PROCEDURE sp_kiemkho_delete
	@MaKiemKho int
AS
	BEGIN
		DELETE FROM ChiTietKiemKho WHERE MaKiemKho = @MaKiemKho;
		DELETE FROM KiemKho WHERE MaKiemKho = @MaKiemKho;
	END
GO

--Tìm kiếm Kho
CREATE PROCEDURE sp_kiemkho_search
(
	@page_index int,
	@page_size int,
	@inventory_id nvarchar(max)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RecordCount bigint;
	IF @page_size <> 0
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaKiemKho ASC)) AS RowNumber,
			kk.*,
			(
			SELECT 
				ctkk.MaChiTietKiemKho,
				ctkk.MaSanPham,
				ctkk.MaKiemKho,
				ctkk.SoLuongDemDuoc,
				ctkk.SoLuongTinhToan,
				ctkk.SoLuongThayDoi
			FROM ChiTietKiemKho AS ctkk
			WHERE ctkk.MaKiemKho = kk.MaKiemKho FOR JSON PATH
			) AS listjson_chitietkiemkho
		INTO #Results1
		FROM KiemKho AS kk
		WHERE kk.MaKiemKho LIKE '%' + @inventory_id + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results1;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results1
		WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
			AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
			OR @page_index = -1;

		DROP TABLE #Results1;
	END
	ELSE
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaKiemKho ASC)) AS RowNumber
		INTO #Results2
		FROM KiemKho AS kk
		WHERE kk.MaKiemKho LIKE '%' + @inventory_id + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results2;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results2;

		DROP TABLE #Results2;
	END
END
GO

---------PROCEDURE Slide---------
--Lấy all slide
CREATE PROCEDURE sp_slide_full
AS
BEGIN
	SELECT*
	FROM Slide
END
GO

--Lấy thông tin slide theo ID
CREATE PROCEDURE sp_slide_id
	@MaSlide int
AS
BEGIN
	SELECT *
	FROM Slide
	WHERE MaSlide = @MaSlide;
END
GO

--Thêm slide
CREATE PROCEDURE sp_slide_create
(
	@Anh varchar(255),
	@Link varchar(500)
)
AS
BEGIN
	INSERT INTO Slide
	(
		Anh,
		Link,
		NgayTao
	)
	VALUES
	(
		@Anh,
		@Link,
		GETDATE()
	);
END
GO

--Cập nhật slide
CREATE PROCEDURE sp_slide_update
(
	@MaSlide int,
	@Anh varchar(255),
	@Link varchar(500)
)
AS
BEGIN
	UPDATE Slide SET
		Anh = @Anh,
		Link = @Link
	WHERE MaSlide = @MaSlide;
END
GO

--Xóa slide
CREATE PROCEDURE sp_slide_delete
	@MaSlide int
AS
BEGIN
	DELETE FROM Slide WHERE MaSlide = @MaSlide;
	SELECT '';
END
GO

--Tìm kiếm slide
CREATE PROCEDURE sp_slide_search
(
	@page_index int,
	@page_size int,
	@slide_id nvarchar(max)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RecordCount bigint;
	IF @page_size <> 0
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaSlide ASC)) AS RowNumber,
			*
		INTO #Results1
		FROM Slide
		WHERE MaSlide LIKE '%' + @slide_id + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results1;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results1
		WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
			AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
			OR @page_index = -1;

		DROP TABLE #Results1;
	END
	ELSE
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaSlide ASC)) AS RowNumber,
			*
		INTO #Results2
		FROM Slide
		WHERE MaSlide LIKE '%' + @slide_id + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results2;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results2;

		DROP TABLE #Results2;
	END
END
GO


---------PROCEDURE Tin tức---------
--Lấy thông tin tin tức theo mã 
CREATE PROCEDURE sp_tintuc_id
	(@MaTinTuc int)
AS
    BEGIN
        SELECT 
			tt.MaNhanVien,
			tt.TieuDe,
			tt.TomTat,
			tt.Anh,
			(
			SELECT 
				cttt.MaChiTietTinTuc,
				cttt.MaTinTuc,
				cttt.NoiDung
			FROM ChiTietTinTuc AS cttt
			WHERE cttt.MaTinTuc = @MaTinTuc FOR JSON PATH
			) AS listjson_chitiettintuc
		FROM TinTuc tt
		WHERE  tt.MaTinTuc = @MaTinTuc
    END;
GO

--Thêm tin tức
CREATE PROCEDURE sp_tintuc_create
(
	@MaNhanVien int,
	@TieuDe nvarchar(255),
	@TomTat ntext,
	@Anh varchar(255),
	@listjson_chitiettintuc NVARCHAR(MAX)
)
AS
BEGIN
	BEGIN
		INSERT INTO TinTuc
		(
			MaNhanVien,
			TieuDe,
			TomTat,
			Anh,
			NgayTao
		)
		VALUES(
			@MaNhanVien,
			@TieuDe,
			@TomTat,
			@Anh,
			GETDATE()
		);
		DECLARE @MaTinTuc INT = SCOPE_IDENTITY();
		IF (@listjson_chitiettintuc IS NOT NULL)
		BEGIN
		INSERT INTO ChiTietTinTuc
		(
			MaTinTuc,
			NoiDung,
			NgayTao
			
		)
		Select
			@MaTinTuc,
			JSON_VALUE(p.value, '$.noiDung'),
			GETDATE()
		FROM OPENJSON(@listjson_chitiettintuc) AS p;
		END;
	END;
	SELECT '';
END;
GO

--Sửa tin tức
CREATE PROCEDURE sp_tintuc_update
(	
	@MaTinTuc int,
	@MaNhanVien int,
	@TieuDe nvarchar(255),
	@TomTat ntext,
	@Anh varchar(255),
	@listjson_chitiettintuc NVARCHAR(MAX)
)
AS
BEGIN
    BEGIN
        UPDATE TinTuc SET
			MaNhanVien = @MaNhanVien,
			TieuDe = @TieuDe,
			TomTat = @TomTat,
			Anh = @Anh
        WHERE MaTinTuc = @MaTinTuc;

        IF (@listjson_chitiettintuc IS NOT NULL)
        BEGIN
            DELETE FROM ChiTietTinTuc
            WHERE MaTinTuc = MaTinTuc;

			INSERT INTO ChiTietTinTuc
			(
				MaTinTuc,
				NoiDung,
				NgayTao
			
			)
			Select
				@MaTinTuc,
				JSON_VALUE(p.value, '$.noiDung'),
				GETDATE()
			FROM OPENJSON(@listjson_chitiettintuc) AS p;
        END;        
    END;

    SELECT '';
END;
GO

--Xóa tin tức
CREATE PROCEDURE sp_tintuc_delete
	@MaTinTuc int
AS
	BEGIN
		DELETE FROM ChiTietTinTuc WHERE  MaTinTuc = @MaTinTuc;
		DELETE FROM TinTuc WHERE @MaTinTuc = MaTinTuc;
	END
GO

--Tìm kiếm Kho
CREATE PROCEDURE sp_tintuc_search
(
	@page_index int,
	@page_size int,
	@news_name nvarchar(max)
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RecordCount bigint;
	IF @page_size <> 0
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaTinTuc ASC)) AS RowNumber,
			tt.*,
			(
			SELECT 
				cttt.MaChiTietTinTuc,
				cttt.MaTinTuc,
				cttt.NoiDung
			FROM ChiTietTinTuc AS cttt
			left join TinTuc tt on cttt.MaTinTuc = tt.MaTinTuc
			WHERE cttt.MaTinTuc = tt.MaTinTuc FOR JSON PATH
			) AS listjson_chitiettintuc
		INTO #Results1
		FROM TinTuc AS tt
		WHERE tt.TieuDe LIKE '%' + @news_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results1;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results1
		WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1
			AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
			OR @page_index = -1;

		DROP TABLE #Results1;
	END
	ELSE
	BEGIN
		SELECT 
			(ROW_NUMBER() OVER (ORDER BY MaTinTuc ASC)) AS RowNumber
		INTO #Results2
		FROM TinTuc AS tt
		WHERE tt.TieuDe LIKE '%' + @news_name + '%';

		SELECT @RecordCount = COUNT(*)
		FROM #Results2;

		SELECT *,
				@RecordCount AS RecordCount
		FROM #Results2;

		DROP TABLE #Results2;
	END
END
GO











