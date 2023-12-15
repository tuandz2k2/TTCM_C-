--CREATE DATABASE [BT_TTCM_WEB]
--USE [BT_TTCM_WEB]
GO
/****** Object:  Table [dbo].[tAnhChiTietSP]    Script Date: 10/4/2023 3:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tAnhChiTietSP](
	[MaChiTietSP] [char](250) NOT NULL,
	[TenFileAnh] [char](100) NOT NULL,
 CONSTRAINT [PK_tAnhChiTietSP] PRIMARY KEY CLUSTERED 
(
	[MaChiTietSP] ASC,
	[TenFileAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tAnhSP]    Script Date: 10/4/2023 3:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tAnhSP](
	[MaSP] [char](250) NOT NULL,
	[TenFileAnh] [char](100) NOT NULL,
 CONSTRAINT [PK_tAnhSP] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[TenFileAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tTinTuc]    Script Date: 10/4/2023 3:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
INSERT [dbo].[tTinTuc] ([MaTinTuc], [TieuDe],[NoiDung], [Anh]) VALUES (N'TT01', N'Cách trồng cây kim ngân để bàn đúng cách', N'Kim ngân là một trong những cây cảnh có nhiều tác dụng tuyệt vời đối với con người. Tuy nhiên, để cây có thể phát triển được một cách toàn diện bạn cần thực hiện quy trình trồng cây cho khoa học. Vậy cây Kim...',N'truc-phu-quy-tc-1-300x225.jpg')                                                                               
INSERT [dbo].[tTinTuc] ([MaTinTuc], [TieuDe],[NoiDung], [Anh]) VALUES (N'TT02', N'Hướng dẫn chăm sóc Sedum multiceps, loại sen đá bonsai cực đáng yêu
', N'Sen đá Sedum multiceps có nguồn gốc từ Algeria, là một loài cây bụi nhỏ, nhiều nhánh, cao từ 10-15cm. Ở đầu các nhánh cây có những chiếc lá màu xanh xám. Hoa của chúng có hình ngôi sao, màu vàng tươi. Loài cây này sẽ...
',N'3-1.jpg')                                                                               

INSERT [dbo].[tTinTuc] ([MaTinTuc], [TieuDe],[NoiDung], [Anh]) VALUES (N'TT03', N'Cách trồng và chăm sóc sen đá hoa hồng xanh', N'Sen đá hoa hồng xanh (Greenovia) loài thực vật mọng nước thường sống ở phía Tây Tenerife, quần đảo Canary thuộc Tây Ban Nha có hình dáng như những bông hoa hồng xanh tuyệt đẹp khiến nhiều người thích thú. Sen đá hoa hồng xanh...
',N'tieu-canh-hong-mon-800x800.jpg')                                                                               
INSERT [dbo].[tTinTuc] ([MaTinTuc], [TieuDe],[NoiDung], [Anh]) VALUES (N'TT04', N'Giới thiệu chung về xương rồng Gymnocalycium mihanovichii ‘Hibotan’- Ruby Ball
', N'Gymnocalycium mihanovichii ‘Hibotan’ gồm một nhóm lớn các loại cây xương rồng đột biến được ưa chuộng hiện nay, có màu đỏ đậm hoặc nhạt. Chúng thường có màu đỏ, da cam, tím than, vàng, thậm chí trắng (có 16 loại màu sắc được ghi...
',N'sen-da-dep.jpg')   
CREATE TABLE [dbo].[tTinTuc](
	[MaTinTuc] [char](250) NOT NULL,
	[TieuDe] [nvarchar](250) NULL,
	[NoiDung] [nvarchar](1500) NULL,
	[Anh][nvarchar](1500) NULL
 CONSTRAINT [PK_tTinTuc] PRIMARY KEY CLUSTERED 
(
	[MaTinTuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChiTietHDB]    Script Date: 10/4/2023 3:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietHDB](
	[MaHoaDon] [char](250) NOT NULL,
	[MaChiTietSP] [char](250) NOT NULL,
	[SoLuongBan] [int] NULL,
	[DonGiaBan] [money] NULL,
	[GiamGia] [float] NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_tChiTietHDB] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC,
	[MaChiTietSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChiTietSanPham]    Script Date: 10/4/2023 3:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
INSERT [dbo].[tChiTietSanPham] ([MaChiTietSP],[MaSP], [AnhDaiDien]        , [DonGiaBan], [SLTon]) VALUES 
						  (N'CT01', N'C01'  , N'cay-bang-nhat.jpg', 200.000,100)
						  INSERT [dbo].[tChiTietSanPham] ([MaChiTietSP],[MaSP], [AnhDaiDien]        , [DonGiaBan], [SLTon]) VALUES 
						  (N'CT02', N'C02'  , N'cay-bang-dai-loan.jpg                                                                               ', 200.000,100)
						  INSERT [dbo].[tChiTietSanPham] ([MaChiTietSP],[MaSP], [AnhDaiDien]        , [DonGiaBan], [SLTon]) VALUES 
						  (N'CT03', N'C03'  , N'Cay-truc-quan-tu.jpg                                                                                ', 400.000,100)
CREATE TABLE [dbo].[tChiTietSanPham](
	[MaChiTietSP] [char](250) NOT NULL,
	[MaSP] [char](250) NULL,
	[AnhDaiDien] [char](100) NULL,
	[DonGiaBan] [float] NULL,
	[GiamGia] [float] NULL,
	[SLTon] [int] NULL,
 CONSTRAINT [PK_tChiTietSanPham] PRIMARY KEY CLUSTERED 
(
	[MaChiTietSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDanhMucSP]    Script Date: 10/4/2023 3:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C28', N'Cây leo', N'TT02'  , NULL   , N'NCC01',NULL    , 2                , 'Cây đẹp', NULL   
						  , 'L02'   , N'Cay-binh-an.jpg                                                                                     ', 30.000, 40.000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C07', N'Chậu thủy tinh', N'TT02'  , NULL   , N'NCC01',NULL    , 2                , 'Chậu đẹp', NULL   
						  , 'L06'   , N'chau-thuy-tinh-tron-min.jpg', 35.000, 40.000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C08', N'Chậu gốm bình cao trắng', N'TT02'  , NULL   , N'NCC01',NULL    , 2                , 'Chậu đẹp', NULL   
						  , 'L06'   , N'chau-gom-nhat-binh-cao-trang.jpg', 100.000, 140.000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C09', N'Chậu gốm sứ', N'TT02'  , NULL   , N'NCC01',NULL    , 2                , 'Chậu đẹp', NULL   
						  , 'L06'   , N'chau-gom-su-hat-de.jpg', 20.000, 40.000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C10', N'Chậu gốm vân đá', N'TT02'  , NULL   , N'NCC01',NULL    , 2                , 'Chậu đẹp', NULL   
						  , 'L06'   , N'chau-gom-van-da-tru-tron.jpg', 20.000, 40.000)

INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C11', N'Sen đá giva', N'TT03'  , NULL   , N'NCC01',NULL    , 2                , 'Sen đá', NULL    , 
						  'L05'   , N'sen-da-giva.jpg', 40.000, 150.000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C12', N'Sen đá bánh bao', N'TT04'  , NULL   , N'NCC01',NULL    , 2                , 'Sen đá', NULL    
						  , 'L05'   , N'sen-da-banh-bao.jpg', 50.000, 56.000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C13', N'Sen đá kim cương', N'TT03'  , NULL   , N'NCC01',NULL    , 2                , 'Sen đá', NULL    , 
						  'L05'   , N'sen-da-kim-cuong.jpg', 40.000, 45.000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C26', N'Sen đá soi viền đỏ', N'TT04'  , NULL   , N'NCC01',NULL    , 2                , 'Sen đá', NULL    
						  , 'L03'   , N'sen-da-soi-vien-do.jpg', 25.000, 50.000)

INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C15', N'Cây bàng thạch cẩm', N'TT04'  , NULL   , N'NCC01',NULL    , 2                , 'Cây văn phòng', NULL    
						  , 'L04'   , N'cay-bang-cam-thach-la-tim.jpg', 200.000, 360.000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C16', N'Cây hạnh phúc', N'TT04'  , NULL   , N'NCC01',NULL    , 2                , 'Cây văn phòng', NULL    
						  , 'L04'   , N'cay-hanh-phuc-2-tang-dep.jpg', 500.000, 560.000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C17', N'Cây lưỡi hổ', N'TT04'  , NULL   , N'NCC01',NULL    , 2                , 'Cây văn phòng', NULL    
						  , 'L04'   , N'cay-luoi-ho-dai.jpg', 500.000, 560.000)

INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C18', N'Tượng', N'TT02'  , NULL   , N'NCC01',NULL    , 2                , 'phụ kiện', NULL    
						  , 'L08'   , N'co-dau-chu-re.jpg', 50.000, 56.000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C19', N'Cửa đá', N'TT02'  , NULL   , N'NCC01',NULL    , 2                , 'Phụ kiện', NULL    
						  , 'L08'   , N'cua-da.jpg', 50.000, 60.000)
						  INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C20', N'Biệt thự nhỏ', N'TT02'  , NULL   , N'NCC01',NULL    , 2                , 'Phụ kiện', NULL    
						  , 'L08'   , N'biet-thu-nho.jpg', 50.000, 60.000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C21', N'Xương rồng', N'TT02'  , NULL   , N'NCC01',NULL    , 2                , 'Phụ kiện', NULL    
						  , 'L07'   , N'xuong-rong-bong-vang-bui.jpg', 50.000, 60.000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C22', N'Xương rồng', N'TT02'  , NULL   , N'NCC01',NULL    , 2                , 'Phụ kiện', NULL    
						  , 'L07'   , N'xuong-rong-gymno-gai-trang.jpg', 50.000, 65.000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C23', N'Xương rồng', N'TT02'  , NULL   , N'NCC01',NULL    , 2                , 'Phụ kiện', NULL    
						  , 'L07'   , N'xuong-rong-khe-vang-bui.jpg', 50.000, 70.000)
INSERT [dbo].[tDanhMucSP] ([MaSP], [TenSP]         ,[MaTinTuc], [Model], [MaNCC],[Website], [ThoiGianBaoHanh], [GioiThieuSP], [ChietKhau], [MaLoai], [AnhDaiDien]        , [GiaNhoNhat], [GiaLonNhat]) VALUES 
						  (N'C25', N'Xương rồng', N'TT02'  , NULL   , N'NCC01',NULL    , 2                , 'Phụ kiện', NULL    
						  , 'L03'   , N'xuong-rong-tai-tho-xanh.jpg', 50.000, 60.000)
CREATE TABLE [dbo].[tDanhMucSP](
	[MaSP] [char](250) NOT NULL,
	[TenSP] [nvarchar](150) NULL,
	[MaTinTuc] [char](250) NULL,
	[Model] [nvarchar](55) NULL,
	[MaNCC] [char](250) NULL,
	[Website] [char](155) NULL,
	[ThoiGianBaoHanh] [float] NULL,
	[GioiThieuSP] [nvarchar](255) NULL,
	[ChietKhau] [float] NULL,
	[MaLoai] [char](250) NULL,
	[AnhDaiDien] [char](100) NULL,
	[GiaNhoNhat] [money] NULL,
	[GiaLonNhat] [money] NULL,
 CONSTRAINT [PK_tDanhMucSP] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tNhaCungCap]    Script Date: 10/4/2023 3:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC01', N'Vườn hoa sinh viên')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC02', N'Vườn hoa nông nghiệp')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC03', N'Nông trường')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC04', N'Vườn hoa nhà trồng')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC05', N'Vườn hoa của Tuấn')
CREATE TABLE [dbo].[tNhaCungCap](
	[MaNCC] [char](250) NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
	[MaNuocThuongHieu] [char](250) NULL,
 CONSTRAINT [PK_tNhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tHoaDonBan]    Script Date: 10/4/2023 3:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHoaDonBan](
	[MaHoaDon] [char](250) NOT NULL,
	[NgayHoaDon] [datetime] NULL,
	[MaKhachHang] [char](250) NULL,
	[MaNhanVien] [char](250) NULL,
	[TongTienHD] [money] NULL,
	[GiamGiaHD] [float] NULL,
	[PhuongThucThanhToan] [tinyint] NULL,
	[MaSoThue] [char](100) NULL,
	[ThongTinThue] [nvarchar](250) NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_tHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tKhachHang]    Script Date: 10/4/2023 3:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tKhachHang](
	[MaKhanhHang] [char](250) NOT NULL,
	[username] [char](100) NULL,
	[TenKhachHang] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[SoDienThoai] [char](15) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[LoaiKhachHang] [tinyint] NULL,
	[AnhDaiDien] [char](100) NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_tKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhanhHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tLoaiSP]    Script Date: 10/4/2023 3:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
INSERT [dbo].[tLoaiSP] ([MaLoai], [Loai]) VALUES (N'L01', N'Cây công trình')
INSERT [dbo].[tLoaiSP] ([MaLoai], [Loai]) VALUES (N'L02', N'Cây dây leo')
INSERT [dbo].[tLoaiSP] ([MaLoai], [Loai]) VALUES (N'L03', N'Cây để bàn')
INSERT [dbo].[tLoaiSP] ([MaLoai], [Loai]) VALUES (N'L04', N'Cây văn phòng')
CREATE TABLE [dbo].[tLoaiSP](
	[MaLoai] [char](250) NOT NULL,
	[Loai] [nvarchar](100) NULL,
 CONSTRAINT [PK_tLoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tNhanVien]    Script Date: 10/4/2023 3:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNhanVien](
	[MaNhanVien] [char](250) NOT NULL,
	[username] [char](100) NULL,
	[TenNhanVien] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[SoDienThoai1] [char](15) NULL,
	[SoDienThoai2] [char](15) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[ChucVu] [nvarchar](100) NULL,
	[AnhDaiDien] [char](100) NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_tNhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUser]    Script Date: 10/4/2023 3:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUser](
	[username] [char](100) NOT NULL,
	[password] [char](256) NOT NULL,
	[LoaiUser] [tinyint] NULL,
 CONSTRAINT [PK_tUser] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tAnhChiTietSP]  WITH CHECK ADD  CONSTRAINT [FK_tAnhChiTietSP_tChiTietSanPham] FOREIGN KEY([MaChiTietSP])
REFERENCES [dbo].[tChiTietSanPham] ([MaChiTietSP])
GO
ALTER TABLE [dbo].[tAnhChiTietSP] CHECK CONSTRAINT [FK_tAnhChiTietSP_tChiTietSanPham]
GO
ALTER TABLE [dbo].[tAnhSP]  WITH CHECK ADD  CONSTRAINT [FK_tAnhSP_tDanhMucSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[tDanhMucSP] ([MaSP])
GO
ALTER TABLE [dbo].[tAnhSP] CHECK CONSTRAINT [FK_tAnhSP_tDanhMucSP]
GO
ALTER TABLE [dbo].[tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tChiTietSanPham] FOREIGN KEY([MaChiTietSP])
REFERENCES [dbo].[tChiTietSanPham] ([MaChiTietSP])
GO
ALTER TABLE [dbo].[tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tChiTietSanPham]
GO
ALTER TABLE [dbo].[tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tHoaDonBan] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[tHoaDonBan] ([MaHoaDon])
GO
ALTER TABLE [dbo].[tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tHoaDonBan]
GO
ALTER TABLE [dbo].[tChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietSanPham_tDanhMucSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[tDanhMucSP] ([MaSP])
GO
ALTER TABLE [dbo].[tChiTietSanPham] CHECK CONSTRAINT [FK_tChiTietSanPham_tDanhMucSP]
GO
ALTER TABLE [dbo].[tDanhMucSP]  WITH CHECK ADD  CONSTRAINT [FK_tDanhMucSP_tTinTuc] FOREIGN KEY([MaTinTuc])
REFERENCES [dbo].[tTinTuc] ([MaTinTuc])
GO
ALTER TABLE [dbo].[tDanhMucSP] CHECK CONSTRAINT [FK_tDanhMucSP_tTinTuc]
GO
ALTER TABLE [dbo].[tDanhMucSP]  WITH CHECK ADD  CONSTRAINT [FK_tDanhMucSP_tNhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[tNhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[tDanhMucSP] CHECK CONSTRAINT [FK_tDanhMucSP_tNhaCungCap]
GO

ALTER TABLE [dbo].[tDanhMucSP]  WITH CHECK ADD  CONSTRAINT [FK_tDanhMucSP_tLoaiSP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[tLoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[tDanhMucSP] CHECK CONSTRAINT [FK_tDanhMucSP_tLoaiSP]
GO

ALTER TABLE [dbo].[tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tKhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[tKhachHang] ([MaKhanhHang])
GO
ALTER TABLE [dbo].[tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tKhachHang]
GO
ALTER TABLE [dbo].[tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tNhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[tNhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tNhanVien]
GO
ALTER TABLE [dbo].[tKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_tKhachHang_tUser] FOREIGN KEY([username])
REFERENCES [dbo].[tUser] ([username])
GO
ALTER TABLE [dbo].[tKhachHang] CHECK CONSTRAINT [FK_tKhachHang_tUser]
GO
ALTER TABLE [dbo].[tNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_tNhanVien_tUser] FOREIGN KEY([username])
REFERENCES [dbo].[tUser] ([username])
GO
ALTER TABLE [dbo].[tNhanVien] CHECK CONSTRAINT [FK_tNhanVien_tUser]
GO
CREATE TABLE [dbo].[tCart](
	[CartId] [char](250) NOT NULL,
	[MaChiTietSP] [char](250) NOT NULL,
	[TenSP] [nvarchar](150) NULL,
	[AnhDaiDien] [char](100) NULL,
	[GiaNhoNhat] [money] NULL,
	[SL] [int] NULL,
 CONSTRAINT [PK_tCart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
