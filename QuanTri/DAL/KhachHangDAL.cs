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
    public class KhachHangDAL : IKhachHangDAL
    {
        private IDatabaseHelper _dbHelper;
        public KhachHangDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public List<KhachHang> GetAllCustumer()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_khachhang_full");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<KhachHang>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public KhachHang LayTheoMaKhachHang(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_khachhang_id",
                     "@MaKhachHang", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<KhachHang>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Them(KhachHang model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_khachhang_create",
                "@TenKhachHang", model.TenKhachHang,
                "@DiaChi", model.DiaChi,
                "@SoDienThoai", model.SoDienThoai,
                "@Email", model.Email
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
        public bool Sua(KhachHang model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_khachhang_update",
                "@MaKhachHang", model.MaKhachHang,
                "@TenKhachHang", model.TenKhachHang,
                "@DiaChi", model.DiaChi,
                "@SoDienThoai", model.SoDienThoai,
                "@Email", model.Email
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
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_khachhang_delete",
                "@MaKhachHang", id);
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
        public List<KhachHang> Search(int pageIndex, int pageSize, out long total, string name)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_khachhang_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@customer_name", name
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<KhachHang>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
