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
    public class KhoDAL : IKhoDAL
    {
        private IDatabaseHelper _dbHelper;
        public KhoDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public Kho LayTheoMaKho(int id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_kho_id",
                     "@MaKho", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return result.ConvertTo<Kho>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Them(Kho model)
        {

            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_kho_create",
                "@TenKho", model.TenKho,
                "DiaChi", model.DiaChi,
                "@listjson_chitietkho", model.listjson_chitiekho != null ? MessageConvert.SerializeObject(model.listjson_chitiekho) : null
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

        public bool Sua(Kho model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_kho_update",
                "@MaKho", model.MaKho,
                "@TenKho", model.TenKho,
                "DiaChi", model.DiaChi,
                "@listjson_chitietkho", model.listjson_chitiekho != null ? MessageConvert.SerializeObject(model.listjson_chitiekho) : null
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
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_kho_delete",
                "@MaKho", id);
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
        public List<Kho> Search(int pageIndex, int pageSize, out long total, string name)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_kho_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@warehouse_name", name
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<Kho>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
