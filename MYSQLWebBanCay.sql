CREATE TABLE `TinTuc` (
    `MaTinTuc` CHAR(250) NOT NULL,
    `TieuDe` VARCHAR(250),
    `NoiDung` VARCHAR(1500),
    `LoaiTinTuc` VARCHAR(200),
    `Anh` VARCHAR(200),
    PRIMARY KEY (MaTinTuc)
);

CREATE TABLE `ChiTietHDB` (
    `MaHoaDon` CHAR(250) NOT NULL,  
    `MaCTHD` CHAR(250) NOT NULL,
    `MaSP` CHAR(250) NOT NULL,
    `SoLuong` INT,
    PRIMARY KEY (MaHoaDon, MaSP)
);
-- SanPham table
CREATE TABLE `SanPham` (
    `MaSP` CHAR(250) NOT NULL,
    `TenSP` VARCHAR(150) NULL,
    `GhiChu` VARCHAR(150) NULL, 
    `MaTinTuc` CHAR(250) NULL,
    `ThoiGianBH` DECIMAL(10, 2) NULL,
    `GioiThieuSP` VARCHAR(255) NULL,
    `AnhDaiDien` VARCHAR(100) NULL,
    `MoTaSP` VARCHAR(250) NULL,
    `DonGiaBan` DECIMAL(10, 2) NULL,
    `NgayNhap` DATETIME NULL,
    `SLTon` INT,
    `MaNCC` CHAR(250) NULL,
    `MaLoai` CHAR(250) NULL,
    PRIMARY KEY (MaSP)
);

-- NhaCungCap table
CREATE TABLE `NhaCungCap` (
    `MaNCC` CHAR(250) NOT NULL,
    `TenNCC` VARCHAR(100) NULL,
    PRIMARY KEY (MaNCC)
);
CREATE TABLE `HoaDonBan` (
    `MaHoaDon` CHAR(250) NOT NULL,
    `NgayTao` DATETIME NULL,
    `TongTienHD` DECIMAL(19, 2) NULL,
    `MaSoThue` CHAR(100) NULL,
    `PhuongThucThanhToan` CHAR(100) NULL,
    `GhiChu` VARCHAR(100) NULL,
    `TrangThai` VARCHAR(100) NULL,
    `GiamGiaHD` FLOAT NULL,
    `MaNV` CHAR(250) NULL,
    `MaKH` CHAR(250) NULL,
    PRIMARY KEY (MaHoaDon)
);
CREATE TABLE KhachHang (
    `MaKH` CHAR(250) NOT NULL,
    `TenKH` VARCHAR(100) NULL,
    `email` VARCHAR(100) NULL, 
    `Phone` CHAR(100) NULL,
    `GioiTinh` CHAR(100) NULL,
    `NgaySinh` DATE NULL,
    `DiaChi` VARCHAR(150) NULL,
    `AnhDaiDien` CHAR(100) NULL,
    `GhiChu` VARCHAR(100) NULL,
    `username` CHAR(100) NULL,
    PRIMARY KEY (MaKH)
);
CREATE TABLE LoaiSP (
    `MaLoai` CHAR(250) NOT NULL,
    `Loai` VARCHAR(100) NULL,
    PRIMARY KEY (MaLoai)
);

CREATE TABLE NhanVien (
    `MaNV` CHAR(250) NOT NULL,
    `TenNV` VARCHAR(100) NULL,
    `Phone` CHAR(15) NULL,
    `NgaySinh` DATE NULL,
    `GioiTinh` CHAR(100) NULL,
    `ChucVu` VARCHAR(100) NULL,
    `DiaChi` VARCHAR(150) NULL,
    `SoCCCD` VARCHAR(150) NULL,
    `SoTaiKhoanNH` VARCHAR(150) NULL,
    `AnhDaiDien` CHAR(100) NULL,
    `username` CHAR(100) NULL,
    PRIMARY KEY (MaNV)
);

CREATE TABLE User (
    `username` CHAR(100) NOT NULL,
    `password` CHAR(100) NOT NULL,
    `LoaiUser` TINYINT NULL,
    PRIMARY KEY (username)
);
-- ChiTietHDB table
ALTER TABLE ChiTietHDB ADD CONSTRAINT FK_ChiTietHDB_SanPham 
    FOREIGN KEY (MaSP) 
    REFERENCES SanPham (MaSP)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- ChiTietHDB table
ALTER TABLE ChiTietHDB ADD CONSTRAINT FK_ChiTietHDB_HoaDonBan 
    FOREIGN KEY (MaHoaDon) 
    REFERENCES HoaDonBan (MaHoaDon)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- SanPham table
ALTER TABLE SanPham ADD CONSTRAINT FK_SanPham_NhaCungCap 
    FOREIGN KEY (MaNCC) 
    REFERENCES NhaCungCap (MaNCC)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

-- SanPham table
ALTER TABLE SanPham ADD CONSTRAINT FK_SanPham_LoaiSP 
    FOREIGN KEY (MaLoai) 
    REFERENCES LoaiSP (MaLoai)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- HoaDonBan table
ALTER TABLE HoaDonBan ADD CONSTRAINT FK_HoaDonBan_KhachHang 
    FOREIGN KEY (MaKH) 
    REFERENCES KhachHang (MaKH)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- HoaDonBan table
ALTER TABLE HoaDonBan ADD CONSTRAINT FK_HoaDonBan_NhanVien 
    FOREIGN KEY (MaNV) 
    REFERENCES NhanVien (MaNV)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- KhachHang table
ALTER TABLE KhachHang ADD CONSTRAINT FK_KhachHang_User 
    FOREIGN KEY (username) 
    REFERENCES User (username)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- NhanVien table
ALTER TABLE NhanVien ADD CONSTRAINT FK_NhanVien_User 
    FOREIGN KEY (username) 
    REFERENCES User (username)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
