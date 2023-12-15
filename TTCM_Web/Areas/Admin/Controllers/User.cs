using Microsoft.AspNetCore.Mvc;
using TTCM_Web.Models;

namespace TTCM_Web.Areas.Admin.Controllers
{
    public class User : Controller
    {
        BtTtcmWebContext db = new BtTtcmWebContext();
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult ListUser()
        {
            var lstSanPham = db.TDanhMucSps.ToList();
            return View(lstSanPham);
        }
    }
}
