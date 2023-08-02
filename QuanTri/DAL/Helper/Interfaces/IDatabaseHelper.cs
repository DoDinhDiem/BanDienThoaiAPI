using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace DAL.Helper
{
  
        public class StoreParameterInfo
        {
            public string StoreProcedureName { get; set; }
            public List<Object> StoreProcedureParams { get; set; }
        }
        public interface IDatabaseHelper
        {
            void SetConnectionString(string connectionString);
            /// <summary>
            ///Mở kết nối với PostGresDB
            /// </summary>
            /// <returns></returns>
            string OpenConnection();
            /// <summary>
            /// Mở kết nối và bắt đầu giao dịch
            /// </summary>
            /// <returns></returns>
            string OpenConnectionAndBeginTransaction();
            /// <summary>
            /// Đóng Kết nối với PostGres DB
            /// </summary>
            /// <returns> String.Empty khi Đóng kết nối thành công hoặc Thông báo Lỗi khi đóng kết nối xảy ra sự cố</returns>
            string CloseConnection();
            /// <summary>
            /// Đóng Kết nối và kết thúc giao dịch
            /// </summary>
            /// <returns>String.Empty khi Đóng kết nối thành công hoặc Thông báo Lỗi khi đóng kết nối xảy ra sự cố</returns>
            string CloseConnectionAndEndTransaction(bool isRollbackTransaction);

            string ExecuteNoneQuery(string strquery);

            DataTable ExecuteQueryToDataTable(string strquery, out string msgError);

            object ExecuteScalar(string strquery, out string msgError);
            #region Execute StoreProcedure
            /// <summary>
            /// Thực thi thủ tục Không truy vấn
            /// </summary>
            /// <param name="sprocedureName">Tên thủ tục</param>
            /// <param name="paramObjects">Liệt kê các đối tượng tham số, mỗi mục bao gồm 'ParamName' và 'ParamValue'</param>
            /// <returns>String.Empty khi chạy truy vấn thành công hoặc Lỗi thông báo khi chạy truy vấn xảy ra sự cố</returns>
            string ExecuteSProcedure(string sprocedureName, params object[] paramObjects);
            /// <summary>
            ///  Thủ tục thực thi trả về DataTale
            /// </summary>
            /// <param name="msgError">String.Empty khi chạy truy vấn thành công hoặc Lỗi thông báo khi chạy truy vấn xảy ra sự cố</param>
            /// <param name="sprocedureName">Procedure Name</param>
            /// <param name="paramObjects">List Param Objects, Each Item include 'ParamName' and 'ParamValue'</param>
            /// <returns>Table result</returns>
            DataTable ExecuteSProcedureReturnDataTable(out string msgError, string sprocedureName, params object[] paramObjects);
            /// <summary>
            /// Thủ tục thực thi trả về DataSet
            /// </summary>
            /// <param name="msgError">String.Empty when run query success or Message Error when run query happen issue</param>
            /// <param name="sprocedureName">Procedure Name</param>
            /// <param name="paramObjects">List Param Objects, Each Item include 'ParamName' and 'ParamValue'</param>
            /// <returns>DataSet result</returns>
            DataSet ExecuteSProcedureReturnDataset(out string msgError, string sprocedureName, params object[] paramObjects);
            /// <summary>
            /// Execute Procedure None Query
            /// </summary>
            /// <param name="sqlConnection">sqlConnection: Connection use to connect to SQL Server</param>
            /// <param name="sprocedureName">Procedure Name</param>
            /// <param name="paramObjects">List Param Objects, Each Item include 'ParamName' and 'ParamValue'</param>
            /// <returns>String.Empty when run query success or Message Error when run query happen issue</returns>
            string ExecuteSProcedure(SqlConnection sqlConnection, string sprocedureName, params object[] paramObjects);
            /// <summary>
            /// Execute Procedure None Query with transaction
            /// </summary>
            /// <param name="sprocedureName">Procedure Name</param>
            /// <param name="paramObjects">List Param Objects, Each Item include 'ParamName' and 'ParamValue'</param>
            /// <returns>String.Empty when run query success or Message Error when run query happen issue</returns>
            string ExecuteSProcedureWithTransaction(string sprocedureName, params object[] paramObjects);
            /// <summary>
            /// Execute Scalar Procedure query List store and command
            /// </summary>
            /// <param name="storeParameterInfos">List Store and ListList Parameter</param>
            /// <returns>List msgErrors return from storeprocedure</returns>
            List<string> ExecuteScalarSProcedure(List<StoreParameterInfo> storeParameterInfos);
            /// <summary>
            /// Thực thi truy vấn Thủ tục vô hướng Danh sách lưu trữ và lệnh
            /// </summary>
            /// <param name="storeParameterInfos">Lưu trữ danh sách và tham số danh sách danh sách</param>
            /// <returns> Danh sách msgErrors trả về từ storeprocedure</returns>
            List<string> ExecuteSProcedureWithTransaction(List<StoreParameterInfo> storeParameterInfos);
            /// <summary>
            ///  Execute Scalar Procedure query
            /// </summary>
            /// <param name="msgError">String.Empty when run query success or Message Error when run query happen issue</param>
            /// <param name="strConnectionString">Connection String use to connect to PostGresDB</param>
            /// <param name="sprocedureName">Procedure Name</param>
            /// <param name="paramObjects">List Param Objects, Each Item include 'ParamName' and 'ParamValue'</param>
            /// <returns>Value return from Store</returns>
            object ExecuteScalarSProcedure(out string msgError, string sprocedureName, params object[] paramObjects);
            /// <summary>
            ///  Execute Scalar Procedure query with transaction
            /// </summary>
            /// <param name="msgError">String.Empty when run query success or Message Error when run query happen issue</param>        
            /// <param name="sprocedureName">Procedure Name</param>
            /// <param name="paramObjects">List Param Objects, Each Item include 'ParamName' and 'ParamValue'</param>
            /// <returns>Value return from Store</returns>
            object ExecuteScalarSProcedureWithTransaction(out string msgError, string sprocedureName, params object[] paramObjects);
            /// <summary>
            /// Execute Scalar Procedure query List store and command
            /// </summary>
            /// <param name="msgErrors">List Error message</param>
            /// <param name="storeParameterInfos">List Store and ListList Parameter</param>
            /// <returns>List Object return from storeprocedure</returns>
            List<object> ExecuteScalarSProcedure(out List<string> msgErrors, List<StoreParameterInfo> storeParameterInfos);
            /// <summary>
            /// Execute Scalar Procedure query List store with transaction
            /// </summary>
            /// <param name="msgErrors">List Error message</param>
            /// <param name="storeParameterInfos">List Store and ListList Parameter</param>
            /// <returns>List Object return from storeprocedure</returns>
            List<object> ExecuteScalarSProcedureWithTransaction(out List<string> msgErrors, List<StoreParameterInfo> storeParameterInfos);
            /// <summary>
            /// Execute Procedure return List Object Results
            /// </summary>
            /// <param name="msgError">String.Empty when run query success or Message Error when run query happen issue</param>
            /// <param name="sprocedureName">Procedure Name</param>
            /// <param name="outputParamCountNumber">outputParam Count Number</param>
            /// <param name="paramObjects">List Param Objects, Each Item include 'ParamName' and 'ParamValue'</param>
            /// <returns>List Object Result in query</returns>
            List<Object> ReturnValuesFromExecuteSProcedure(out string msgError, string sprocedureName, int outputParamCountNumber, params object[] paramObjects);
            #endregion
        

    }
}
