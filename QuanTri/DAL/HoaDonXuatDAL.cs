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
    public class HoaDonXuatDAL : IHoaDonXuatDAL
    {
        private IDatabaseHelper _dbHelper;
        public HoaDonXuatDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public HoaDonXuat LayTheoMaHoaDonXuat(int id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_hoadonxuat_id",
                     "@MaHoaDonXuat", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return result.ConvertTo<HoaDonXuat>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Them(HoaDonXuat model)
        {

            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_hoadonxuat_create",
                "@MaKhachHang", model.MaKhachHang,
                "@MaNhanVien", model.MaNhanVien,
                "@listjson_chitiethoadonxuat", model.listjson_chitiethoadonxuat != null ? MessageConvert.SerializeObject(model.listjson_chitiethoadonxuat) : null
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

        public bool Sua(HoaDonXuat model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_hoadonxuat_update",
                "@MaHoaDonXuat", model.MaHoaDonXuat,
                "@MaKhachHang", model.MaKhachHang,
                "@MaNhanVien", model.MaNhanVien,
                "@listjson_chitiethoadonxuat", model.listjson_chitiethoadonxuat != null ? MessageConvert.SerializeObject(model.listjson_chitiethoadonxuat) : null
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
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_hoadonxuat_delete",
                "@MaHoaDonXuat", id);
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
        public List<HoaDonXuat> Search(int pageIndex, int pageSize, out long total, string name)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_hoadonxuat_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@exportinvoice_id", name
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<HoaDonXuat>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
