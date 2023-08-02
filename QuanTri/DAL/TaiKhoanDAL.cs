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
    public class TaiKhoanDAL : ITaiKhoanDAL
    {
        private IDatabaseHelper _dbHelper;
        public TaiKhoanDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }



        public NhanVien GetAccount(string username, string password)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nhanvien_username_password",
                     "@TaiKhoan", username,
                     "@MatKhau", password);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<NhanVien>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
