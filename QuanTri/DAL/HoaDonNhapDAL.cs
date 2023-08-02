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
    public class HoaDonNhapDAL : IHoaDonNhapDAL
    {
        private IDatabaseHelper _dbHelper;
        public HoaDonNhapDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public HoaDonNhap LayTheoMaHoaDonNhap(int id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_hoadonnhap_id",
                     "@MaHoaDonNhap", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return result.ConvertTo<HoaDonNhap>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Them(HoaDonNhap model)
        {

            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_hoadonnhap_create",
                "@MaNhanVien", model.MaNhanVien,
                "@MaNhaCungCap", model.MaNhaCungCap,
                "@listjson_chitiethoadonnhap", model.listjson_chitiethoadonnhap != null ? MessageConvert.SerializeObject(model.listjson_chitiethoadonnhap) : null
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

        public bool Sua(HoaDonNhap model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_hoadonnhap_update",
                "@MaHoaDonNhap", model.MaHoaDonNhap,
                "@MaNhanVien", model.MaNhanVien,
                "@MaNhaCungCap", model.MaNhaCungCap,
                "@listjson_chitiethoadonnhap", model.listjson_chitiethoadonnhap != null ? MessageConvert.SerializeObject(model.listjson_chitiethoadonnhap) : null
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
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_hoadonnhap_delete",
                "@MaHoaDonNhap", id);
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
        public List<HoaDonNhap> Search(int pageIndex, int pageSize, out long total, string name)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_hoadonnhap_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@menuized_id", name
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<HoaDonNhap>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
