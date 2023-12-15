using Microsoft.AspNetCore.Mvc;
using TTCM_Web.Models;
using Microsoft.AspNetCore.Http;
namespace TTCM_Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class APISanPhamController : ControllerBase
    {
        BtTtcmWebContext db=new BtTtcmWebContext();
        [HttpGet("{maLoai}")]
        public List<TDanhMucSp> GetProduct(string maLoai)
        {
            var sanPham=db.TDanhMucSps.Where(x=>x.MaLoai==maLoai).ToList();
            return sanPham;
        }
    }
}
