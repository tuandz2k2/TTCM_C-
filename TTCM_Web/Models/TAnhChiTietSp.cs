using System;
using System.Collections.Generic;

namespace TTCM_Web.Models;

public partial class TAnhChiTietSp
{
    public string MaChiTietSp { get; set; } = null!;

    public string TenFileAnh { get; set; } = null!;

    public virtual TChiTietSanPham MaChiTietSpNavigation { get; set; } = null!;
}
