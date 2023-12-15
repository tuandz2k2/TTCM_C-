using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using TTCM_Web.Models;

namespace TTCM_Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Route("Admin")]
    public class SanPhamAdminController : Controller
    {
        BtTtcmWebContext db = new BtTtcmWebContext();
        [Route("DanhSachSanPham")]        
        public IActionResult Index()
        {
            var lstSanPham = db.TDanhMucSps.ToList();
            return View(lstSanPham);
        }
        [HttpGet]
        [Route("ThemSanPham")]
        public IActionResult ThemSanPhamMoi()
        {
            ViewBag.MaTinTuc = new SelectList(db.TTinTucs.ToList(), "MaTinTuc", "TieuDe");
            ViewBag.MaNhacc = new SelectList(db.TNhaCungCaps.ToList(), "MaNcc", "TieuNcc");
            ViewBag.MaLoai = new SelectList(db.TLoaiSps.ToList(), "MaLoai", "Loai");
            return View();
        }
        [HttpPost]
        [Route("ThemSanPham")]
        [ValidateAntiForgeryToken]
        public IActionResult ThemSanPhamMoi(TDanhMucSp sanPham)
        {
            if (ModelState.IsValid)
            {
                db.TDanhMucSps.Add(sanPham);
                db.SaveChanges();
                return RedirectToAction("DanhMucSanPham");
            }
            return View(sanPham);
        }
        [HttpGet]
        [Route("SuaSanPham")]
        public IActionResult SuaSanPham(string maSanPham)
        {
            ViewBag.MaTinTuc = new SelectList(db.TTinTucs.ToList(), "MaTinTuc", "TieuDe");
            ViewBag.MaNhacc = new SelectList(db.TNhaCungCaps.ToList(), "MaNcc", "TieuNcc");
            ViewBag.MaLoai = new SelectList(db.TLoaiSps.ToList(), "MaLoai", "Loai");
            var sanPham = db.TDanhMucSps.Find(maSanPham);
            return View(sanPham);

        }
        [HttpPost]
        [Route("SuaSanPham")]
        [ValidateAntiForgeryToken]
        public IActionResult SuaSanPhamMoi(TDanhMucSp sanPham)
        {
            if (ModelState.IsValid)
            {
                db.Update(sanPham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(sanPham);
        }
        [Route("XoaSanPham")]
        public IActionResult XoaSanPham(string maSanPham)
        {
            TempData["Message"] = "";
            var chiTietSanPham = db.TChiTietSanPhams.Where(x => x.MaSp == maSanPham).ToList();
            if (chiTietSanPham.Count() > 0)
            {
                TempData["Message"] = "No delete product";
                return RedirectToAction("DanhMucSanPham");
            }
            var anhSanPham = db.TAnhSps.Where(x => x.MaSp == maSanPham).ToList();
            if (anhSanPham.Any()) db.Remove(anhSanPham);
            db.Remove(db.TDanhMucSps.Find(maSanPham));
            db.SaveChanges();
            TempData["Message"] = "product deleted";
            return RedirectToAction("DanhMucSanPham");
        }
        [Route("LoaiSanPham")]
        public IActionResult LoaiSanPham()
        {
            var lstLoai = db.TLoaiSps.ToList();
            return View(lstLoai);
        }
        [Route("ChiTiet")]
        public IActionResult ChiTiet(string maSanPham)
        {
            var chiTiet=db.TChiTietSanPhams.Where(x=>x.MaSp == maSanPham);
            return View(chiTiet);
        }
    }
}
