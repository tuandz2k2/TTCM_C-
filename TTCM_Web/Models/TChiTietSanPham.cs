using System;
using System.Collections.Generic;

namespace TTCM_Web.Models;

public partial class TChiTietSanPham
{
    public string MaChiTietSp { get; set; } = null!;

    public string? MaSp { get; set; }

    public string? AnhDaiDien { get; set; }

    public double? DonGiaBan { get; set; }

    public double? GiamGia { get; set; }

    public int? Slton { get; set; }

    public virtual TDanhMucSp? MaSpNavigation { get; set; }

    public virtual ICollection<TAnhChiTietSp> TAnhChiTietSps { get; set; } = new List<TAnhChiTietSp>();

    public virtual ICollection<TChiTietHdb> TChiTietHdbs { get; set; } = new List<TChiTietHdb>();
}
