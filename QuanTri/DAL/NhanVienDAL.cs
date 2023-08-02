using DAL.Helper;
using DAL.Interfaces;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class NhanVienDAL : INhanVienDAL
    {
        private IDatabaseHelper _dbHelper;
        public NhanVienDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public List<NhanVien> GetAllStaff()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nhanvien_full");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<NhanVien>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public NhanVien LayTheoMaNhanVien(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nhanvien_id",
                     "@MaNhanVien", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<NhanVien>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Them(NhanVien model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_nhanvien_create",
                "@HoTen", model.HoTen,
                "@NgaySinh", model.NgaySinh,
                "@GioiTinh", model.GioiTinh,
                "@AnhDaiDien", model.AnhDaiDien,
                "@DiaChi", model.DiaChi,
                "@Email", model.Email,
                "@DienThoai", model.DienThoai,
                "@TaiKhoan", model.TaiKhoan,
                "@MatKhau", model.MatKhau,
                "@TrangThai", model.TrangThai,
                "@LoaiQuyen", model.LoaiQuyen
                );
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Sua(NhanVien model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_nhanvien_update",
                "@MaNhanVien", model.MaNhanVien,
                "@HoTen", model.HoTen,
                "@NgaySinh", model.NgaySinh,
                "@GioiTinh", model.GioiTinh,
                "@AnhDaiDien", model.AnhDaiDien,
                "@DiaChi", model.DiaChi,
                "@Email", model.Email,
                "@DienThoai", model.DienThoai,
                "@TaiKhoan", model.TaiKhoan,
                "@MatKhau", model.MatKhau,
                "@TrangThai", model.TrangThai,
                "@LoaiQuyen", model.LoaiQuyen
                );
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Xoa(int id)
        {

            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_nhanvien_delete",
                "@MaNhanVien", id);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<NhanVien> Search(int pageIndex, int pageSize, out long total, string name)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nhanvien_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@staff_name", name
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<NhanVien>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
