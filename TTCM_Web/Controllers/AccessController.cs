using Microsoft.AspNetCore.Mvc;
using TTCM_Web.Models;

namespace TTCM_Web.Controllers
{
    public class AccessController : Controller
    {
        BtTtcmWebContext db=new BtTtcmWebContext();
        [HttpGet]
        public IActionResult Login()
        {
            if (HttpContext.Session.GetString("Username") == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index","Home");
            }
            
        }
        [HttpPost]
        public IActionResult Login(TUser user) {
            if (HttpContext.Session.GetString("Username")==null)
            {
                var u = db.TUsers.FirstOrDefault(x => x.Username.Equals(user.Username) && x.Password.Equals(user.Password));
                if(u != null)
                {
					HttpContext.Session.SetString("Username", u.Username.ToString());
					if (u.LoaiUser==1)
                    {
                        return RedirectToAction("DanhSachTinTuc", "Admin");
                    }
                    else 
                    { 
                        return RedirectToAction("Index", "Home");

                    }
                   
                }
            }
            return View();
        }
        public IActionResult Logout() {
			HttpContext.Session.Clear();
			HttpContext.Session.Remove("Username");
			return RedirectToAction("Index", "Home");
		}
        public IActionResult Sigup()
        {
           
            return View();
        }
    }
}
