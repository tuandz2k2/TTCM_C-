using System;
using System.Collections.Generic;

namespace TTCM_Web.Models;

public partial class TTinTuc
{
    public string MaTinTuc { get; set; } = null!;

    public string? TieuDe { get; set; }

    public string? NoiDung { get; set; }

    public string? Anh { get; set; }

    public virtual ICollection<TDanhMucSp> TDanhMucSps { get; set; } = new List<TDanhMucSp>();
}
