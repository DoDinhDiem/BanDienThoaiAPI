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
    public class KiemKhoDAL : IKiemKhoDAL
    {
        private IDatabaseHelper _dbHelper;
        public KiemKhoDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public KiemKho LayTheoMaKiemKho(int id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_kiemkho_id",
                     "@MaKiemKho", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return result.ConvertTo<KiemKho>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Them(KiemKho model)
        {

            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_kiemkho_create",
                "@MaNhanVien", model.MaNhanVien,
                "@ThoiGianBatDau", model.ThoiGianBatDau,
                "@ThoiGianKetThuc", model.ThoiGianKetThuc,
                "@TrangThaiKho", model.TrangThaiKho,
                "@MaKho", model.MaKho,
                "MoTa", model.MoTa,
                "@listjson_chitietkiemkho", model.listjson_chitietkiemkho != null ? MessageConvert.SerializeObject(model.listjson_chitietkiemkho) : null
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

        public bool Sua(KiemKho model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_kiemkho_update",
                "@MaKiemKho", model.MaKiemKho,
                 "@MaNhanVien", model.MaNhanVien,
                "@ThoiGianBatDau", model.ThoiGianBatDau,
                "@ThoiGianKetThuc", model.ThoiGianKetThuc,
                "@TrangThaiKho", model.TrangThaiKho,
                "@MaKho", model.MaKho,
                "MoTa", model.MoTa,
                "@listjson_chitietkiemkho", model.listjson_chitietkiemkho != null ? MessageConvert.SerializeObject(model.listjson_chitietkiemkho) : null
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
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_kiemkho_delete",
                "@MaKiemKho", id);
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
        public List<KiemKho> Search(int pageIndex, int pageSize, out long total, string name)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_kiemkho_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@inventory_id", name
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<KiemKho>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
