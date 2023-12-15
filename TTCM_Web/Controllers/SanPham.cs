using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using TTCM_Web.Models;

namespace TTCM_Web.Controllers
{
    public class SanPham : Controller
    {
        BtTtcmWebContext db=new BtTtcmWebContext();
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var taikhoan = db.TUsers.Find(HttpContext.Session.GetString("Username"));
            if (taikhoan != null)
            {
                var khachhang = db.TKhachHangs.FirstOrDefault(x => x.Username == HttpContext.Session.GetString("Username"));
                if (khachhang != null)
                {
                    ViewBag.MaKH = khachhang.MaKhanhHang;
                    ViewBag.TenKH = khachhang.TenKhachHang;
                   
                }
            }
            base.OnActionExecuting(filterContext);
        }
        [Route("SanPham")]
        public IActionResult Index()
        {
            var lstSanPham=db.TDanhMucSps.ToList();
            return View(lstSanPham);
        }
        public IActionResult SanPhamTheoLoai(string maLoai)
        {
            var lstSanPham=db.TDanhMucSps.Where(x=>x.MaLoai==maLoai).ToList();
            return View(lstSanPham);
        }
        [Route("ChiTietSanPham")]
        public IActionResult ChiTietSanPham(string maSp)
        {
            var sanPham=db.TDanhMucSps.Find(maSp);    
            
            return View(sanPham);
        }
        [HttpPost]
        public IActionResult TKSanPham(string sTuKhoa)
        {
            var lstSP = db.TDanhMucSps.Where(n => n.TenSp.Contains(sTuKhoa));

            return View(lstSP.OrderBy(n=>n.TenSp));
        }

    }
}
