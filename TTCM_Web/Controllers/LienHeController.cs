using Microsoft.AspNetCore.Mvc;
using TTCM_Web.Models;

namespace TTCM_Web.Controllers
{
    public class LienHeController : Controller
    {
        BtTtcmWebContext db = new BtTtcmWebContext();
        public IActionResult Index()
        {
            var lstTinTuc = db.TTinTucs.ToList();
            return View(lstTinTuc);
        }
    }
}
