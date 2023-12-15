using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TTCM_Web.Models;

namespace TTCM_Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GioHangAPIController : ControllerBase
    {
        BtTtcmWebContext db=new BtTtcmWebContext();
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

        //public IActionResult AddToCart(string id, int SoLuong, string type = "Normal")
        //{
        //    var myCart = Carts;
        //    var item = myCart.SingleOrDefault(p => p.MaHh == id);

        //    if (item == null)//chưa có
        //    {
        //        var hangHoa = db.TDanhMucSps.SingleOrDefault(p => p.MaSp == id);
        //        item = new CartItem
        //        {
        //            MaHh = id,
        //            TenHH = hangHoa.TenSp,
        //            DonGia = (int)hangHoa.GiaNhoNhat,
        //            SoLuong = SoLuong,
        //            Hinh = hangHoa.AnhDaiDien
        //        };
        //        myCart.Add(item);
        //    }
        //    else
        //    {
        //        item.SoLuong += SoLuong;
        //    }
        //    HttpContext.Session.Set("GioHang", myCart);

        //    if (type == "ajax")
        //    {
        //        return Json(new
        //        {
        //            SoLuong = Carts.Sum(c => c.SoLuong)
        //        });
        //    }
        //    return RedirectToAction("Index","Cart");
        //}
        public int splitId(string id)
        {
            //KH002 
            string res = id.Substring(3, id.Length - 3);
            return int.Parse(res);
        }
        [HttpPost]
        [Route("themvaogiohang")]
        public string ThemVaoGioHang(string MaKH, string MaSP, double DonGiaBan, int SoLuong)
        {
            bool check = true;
            //tìm khách hàng có giỏ hàng rồi
            //chưa thanh toán ghichu=0(giỏ hàng) , đang chờ thanh toán ghi chú là 1, đã thanh toán ghi chú là 2
            var hoadonban = db.THoaDonBans.FirstOrDefault(x => x.MaKhachHang == MaKH && x.GhiChu == "0");
            var chitietsanpham = db.TChiTietSanPhams.FirstOrDefault(x => x.MaSp == MaSP);
           
            if (hoadonban == null)
            {
                var lstHoaDonBan = db.THoaDonBans.ToList();
                string id = "";
                if (lstHoaDonBan.Count() == 0)
                    id = "HDB01";
                else
                {
                    int lastId = splitId(lstHoaDonBan.OrderByDescending(x => splitId(x.MaHoaDon)).FirstOrDefault().MaHoaDon.ToString());
                    if (lastId > 8)
                        id = "HDB" + (lastId + 1).ToString();
                    else
                        id = "HDB0" + (lastId + 1).ToString();
                }

                hoadonban = new THoaDonBan();
                hoadonban.MaHoaDon = id;
                hoadonban.NgayHoaDon = DateTime.Now;
                hoadonban.GhiChu = "0";//chưa thanh toán
                                       // hoadonban.TinhTrangHoaDon = "Trong giỏ hàng";
                var khachhang = db.TKhachHangs.FirstOrDefault(x => x.MaKhanhHang == MaKH);
                hoadonban.TongTienHd = 0;
                hoadonban.MaNhanVien = "NV00";
                hoadonban.MaKhachHang = MaKH;
                db.THoaDonBans.Add(hoadonban);
                db.SaveChanges();
                TChiTietHdb chitiethdbmoi = new TChiTietHdb();
                chitiethdbmoi.MaChiTietSp = chitietsanpham.MaChiTietSp;
                chitiethdbmoi.MaHoaDon = hoadonban.MaHoaDon;
                chitiethdbmoi.SoLuongBan = SoLuong;
                chitiethdbmoi.DonGiaBan = (int)DonGiaBan;
                db.TChiTietHdbs.Add(chitiethdbmoi);
                db.SaveChanges();
            }

            else//Khách hàng đó đã Có giỏ hàng 
            {
                var chitiethdb = db.TChiTietHdbs.Where(x => x.MaHoaDon == hoadonban.MaHoaDon).ToList();
                foreach (var i in chitiethdb)
                {
                    if (chitietsanpham.MaChiTietSp == i.MaChiTietSp)//Sản phẩm đã có trong giỏ hàng
                    {
                        i.SoLuongBan += SoLuong;
                        db.SaveChanges();
                        break;
                    }
                    else//Sản phẩm chưa có trong giỏ hàng
                    {
                        TChiTietHdb chitiethdbmoi = new TChiTietHdb();
                        chitiethdbmoi.MaChiTietSp = chitietsanpham.MaChiTietSp;
                        chitiethdbmoi.MaHoaDon = hoadonban.MaHoaDon;
                        chitiethdbmoi.SoLuongBan = SoLuong;
                        chitiethdbmoi.DonGiaBan=(int)DonGiaBan; 
                        db.TChiTietHdbs.Add(chitiethdbmoi);
                        db.SaveChanges();
                        break;
                    }
                }              
            }
            
           
            return "";
        }
        [HttpDelete]
       
        public bool XoaChiTietSP(string machitietsp)
        {
            var chitiethdb = db.TChiTietHdbs.FirstOrDefault(x=>x.MaChiTietSp==machitietsp);
            if (chitiethdb == null) { return false; }
            db.TChiTietHdbs.Remove(chitiethdb);

            db.SaveChanges();
            return true;
        }
        [HttpPut]
        [Route("capnhat")]
        public bool capnhat(string hdb,int tong)
        {
            var hd = db.THoaDonBans.FirstOrDefault(x => x.MaHoaDon == hdb);
            if (hd == null) return false;
            else
            {
                hd.GhiChu = "1";
                hd.TongTienHd = tong;
                db.Update(hd);
                db.SaveChanges() ;
                return true;
            }

        }

    }

}
