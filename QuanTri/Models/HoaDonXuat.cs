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
    public partial class HoaDonXuat
    {
        public int MaHoaDonXuat { get; set; }
        public DateTime NgayXuat { get; set; }
        public  int MaKhachHang { get; set; }
        public int MaNhanVien { get; set; }
        public List<ChiTietHoaDonXuat> listjson_chitiethoadonxuat { get; set; }

    }
}