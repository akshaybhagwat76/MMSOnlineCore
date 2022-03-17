using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Data;
using System.Data.SqlClient;

namespace MMS.web.Areas.Admin.Controllers
{
    /// <summary>
    /// 
    /// </summary>
   // [Authorize(Policy = "RequireSuperRole")]
    [Area("Admin")]
    [ApiExplorerSettings(IgnoreApi = true)]
    public class BaseController : Controller
    {
        /// <summary>
        /// 
        /// </summary>
        public string UserID = "";
        /// <summary>
        /// 
        /// </summary>
        public string AccountId = "";
        /// <summary>
        /// 
        /// </summary>
        public Boolean IncludeTransportation = false;
        public string ConnectionString = "";
        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            UserID = HttpContext.Session.GetString("UserID");
            if (!string.IsNullOrEmpty(HttpContext.Session.GetString("ConnString")))
            {
                ConnectionString = HttpContext.Session.GetString("ConnString");
            }

            AccountId = HttpContext.Session.GetString("AccountId");
            string commandText = $"select * from dbo.Accounts where AccountID='{AccountId}'";

            if (!string.IsNullOrEmpty(ConnectionString))
            {
                SqlConnection connection = new SqlConnection(ConnectionString);

                SqlDataReader rdr = null;
                connection.Open();
                SqlCommand cmd = new SqlCommand(commandText, connection);
                cmd.CommandType = CommandType.Text;
                rdr = cmd.ExecuteReader();

                var dataTable = new DataTable();
                dataTable.Load(rdr);

                if (dataTable.Rows.Count > 0)
                {
                    string include_Transportation = Convert.ToString(dataTable.Rows[0]["Include_Transportation"]);
                    if (!string.IsNullOrEmpty(include_Transportation))
                    {
                        IncludeTransportation = Convert.ToBoolean(include_Transportation);
                        HttpContext.Session.SetString("IncludeTransportation", IncludeTransportation.ToString());
                        ViewBag.IsTransportation = IncludeTransportation;
                    }
                }
                connection.Close();
            }
            base.OnActionExecuting(context);
        }

    }
}