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

    public class HoaDonNhap
    {    
        public int MaHoaDonNhap { get; set; }
        public DateTime NgayNhap { get; set; }
        public int MaNhanVien { get; set; }
        public int MaNhaCungCap { get; set; }
        public List<ChiTietHoaDonNhap> listjson_chitiethoadonnhap { get; set; }
    }
}
