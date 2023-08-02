﻿using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface INhanVienBLL
    {
        bool Them(NhanVien model);
        bool Sua(NhanVien model);
        bool Xoa(int id);
        NhanVien LayTheoMaNhanVien(int id);
        List<NhanVien> GetAllStaff();
        List<NhanVien> Search(int pageIndex, int pageSize, out long total, string name);
    }
}
