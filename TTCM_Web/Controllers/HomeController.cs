using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Diagnostics;
using TTCM_Web.Models;

namespace TTCM_Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
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
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}