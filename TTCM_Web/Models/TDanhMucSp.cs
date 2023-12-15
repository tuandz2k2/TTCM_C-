using System;
using System.Collections.Generic;

namespace TTCM_Web.Models;

public partial class TDanhMucSp
{
    public string MaSp { get; set; } = null!;

    public string? TenSp { get; set; }

    public string? MaTinTuc { get; set; }

    public string? Model { get; set; }

    public string? MaNcc { get; set; }

    public string? Website { get; set; }

    public double? ThoiGianBaoHanh { get; set; }

    public string? GioiThieuSp { get; set; }

    public double? ChietKhau { get; set; }

    public string? MaLoai { get; set; }

    public string? AnhDaiDien { get; set; }

    public decimal? GiaNhoNhat { get; set; }

    public decimal? GiaLonNhat { get; set; }

    public virtual TLoaiSp? MaLoaiNavigation { get; set; }

    public virtual TNhaCungCap? MaNccNavigation { get; set; }

    public virtual TTinTuc? MaTinTucNavigation { get; set; }

    public virtual ICollection<TAnhSp> TAnhSps { get; set; } = new List<TAnhSp>();

    public virtual ICollection<TChiTietSanPham> TChiTietSanPhams { get; set; } = new List<TChiTietSanPham>();
}
