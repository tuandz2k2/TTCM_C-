using Microsoft.AspNetCore.Mvc;

using TTCM_Web.Models;

namespace TTCM_Web.Areas.Admin.Controllers
{
    [Area("Admin")]

    [Route("Admin")]
    public class HomeAdminController : Controller
    {
        BtTtcmWebContext db=new BtTtcmWebContext();
        
        [Route("Index")]
        public IActionResult Index()
        {
            return View();
        }
       
        [Route("DanhSachTinTuc")]
        public IActionResult DanhSachTinTuc()
        {
            var lstTT = db.TTinTucs.ToList();
            return View(lstTT);
        }
        [Route("DanhSachUser")]
        public IActionResult DanhSachUser()
        {
            var lstTT = db.TUsers.ToList();
            return View(lstTT);
        }
        [Route("DanhSachHoaDon")]
        public IActionResult DanhSachHoaDon()
        {
            var lstTT = db.THoaDonBans.ToList();
            return View(lstTT);
        }
        [Route("ChiTietHoaDon")]

        public IActionResult DanhSachCT(string mahd)
        {
            var lstTT = db.TChiTietHdbs.Where(x=>x.MaHoaDon==mahd).ToList();
            return View(lstTT);
        }
        [Route("CTDanhSachChoXN")]

        public IActionResult CTDanhSachChoXN()
        {
            var lstTT = db.TChiTietHdbs.Where(x=>x.MaHoaDon=="HDB01").ToList();
            return View(lstTT);
        }
        [Route("DanhSachChoXN")]

        public IActionResult DanhSachChoXN()
        {
            var lstTT = db.THoaDonBans.Where(x=>x.GhiChu=="1").ToList();
            return View(lstTT);
        }
         [Route("DanhUser")]

        public IActionResult DanhUser()
        {
           
            
            var lstUser = db.TUsers.ToList();
            return View(lstUser);
        }
        [Route("DanhN")]
        public IActionResult DanhN()
        {
            var lstUser = db.TNhaCungCaps.ToList();
            return View(lstUser);
        }


    }
}
