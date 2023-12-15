using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TTCM_Web.Models;

namespace TTCM_Web.Areas.Admin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class XacNhanController : ControllerBase
    {
        BtTtcmWebContext db=new BtTtcmWebContext();
        [HttpPut]
        [Route("capnhat")]
        public bool capnhat(string hdb, int tong)
        {
            var hd = db.THoaDonBans.FirstOrDefault(x => x.MaHoaDon == hdb);
            if (hd == null) return false;
            else
            {
                hd.GhiChu = "2";
                db.Update(hd);
                db.SaveChanges();
                return true;
            }

        }
    }
}
