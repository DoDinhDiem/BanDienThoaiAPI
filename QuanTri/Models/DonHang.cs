//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
using System;

namespace Models
{
    public class DonHang
    {

        public int MaDonHang { get; set; }
        public int MaKhachHang { get; set; }
        public DateTime NgayDat { get; set; }
        public int TrangThaiDonHang { get; set; }
        public List<ChiTietDonHang> listjson_chitietdonhang { get; set; }


    }
}