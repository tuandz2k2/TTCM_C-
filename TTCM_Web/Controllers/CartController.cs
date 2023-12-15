using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TTCM_Web.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Newtonsoft.Json;
using System.Linq;
using System.Net;
using System.Web;
using TTCM_Web.Extention;
using Microsoft.AspNetCore.Mvc.Filters;

namespace TTCM_Web.Controllers
{
    public class CartController : Controller
    {

       BtTtcmWebContext db=new BtTtcmWebContext();
        public List<CartItem> Carts
        {
            get
            {
                var data = HttpContext.Session.Get<List<CartItem>>("GioHang");
                if (data == null)
                {
                    data = new List<CartItem>();
                }
                return data;
            }
        }
        // [Route("Cart/Index")]
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
        public IActionResult Index()
        {

            var khachhang = db.TKhachHangs.FirstOrDefault(x => x.Username == HttpContext.Session.GetString("Username"));
            var hd = db.THoaDonBans.FirstOrDefault(x => x.MaKhachHang == khachhang.MaKhanhHang);
            var hoadonban = db.TChiTietHdbs.Where(x=>x.MaHoaDon==hd.MaHoaDon).ToList();
            return View(hoadonban);
        }
        [Route("hoadonban")]
        [HttpGet]
        public IEnumerable<THoaDonBan> GetHoaDonBan()
        {
            var hoadonban = db.THoaDonBans.ToList();
            return hoadonban;
        }



        [HttpGet]
        [Route("thongtingiohang")]
        public IEnumerable<TChiTietHdb> GetThongTinGioHang()
        {

            var chitiethdb = db.TChiTietHdbs.ToList();
            return chitiethdb;


        }

      
        public int splitId(string id)
        {
            //KH002 
            string res = id.Substring(3, id.Length - 3);
            return int.Parse(res);
        }
       
       
        [HttpDelete]
        public bool XoaChiTietSP(string machitietsp, string mahdb)
        {
            var chitiethdb = db.TChiTietHdbs.Find(machitietsp, mahdb);
            if (chitiethdb == null) { return false; }
            db.TChiTietHdbs.Remove(chitiethdb);
            db.SaveChanges();
            return true;
        }

        [HttpPut]
        public dynamic CapNhatGioHang(string maHDB, string machitietSP, int soluongCTSP, int check)
        {

            var chitiethdb = db.TChiTietHdbs.FirstOrDefault(x => x.MaHoaDon == maHDB && x.MaChiTietSp == machitietSP);
            var chitietsp = db.TChiTietSanPhams.FirstOrDefault(x => x.MaChiTietSp == machitietSP);
            var sanpham = db.TDanhMucSps.FirstOrDefault(x => x.MaSp == chitietsp.MaSp);


            if (check == 1)
                chitiethdb.SoLuongBan = soluongCTSP - 1;
            else if (check == 2)
                chitiethdb.SoLuongBan = soluongCTSP;
            else
                chitiethdb.SoLuongBan = soluongCTSP + 1;

            if (chitiethdb.SoLuongBan <= 0)
            {
                chitiethdb.SoLuongBan = 0;
                
            }
           
            db.SaveChanges();
            dynamic result = new System.Dynamic.ExpandoObject();
            result.success = true;
            result.message = "Cập nhật giỏ hàng thành công !";
           

            return result;
        }


    }
}
