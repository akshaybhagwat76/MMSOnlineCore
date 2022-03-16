using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Configuration;
using MMS.data.Infrastructure;
using MMS.web.Services;
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
        public const int IsFirstRequest = 0;
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
            ConnectionString = HttpContext.Session.GetString("ConnString");

            AccountId = HttpContext.Session.GetString("AccountId");
            IncludeTransportation = Convert.ToBoolean(HttpContext.Session.GetString("IncludeTransportation"));
            ViewBag.IsTransportation = IncludeTransportation;
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("IsFirstRequest")))
            {
                TriggerTransportationChange();
            }
            base.OnActionExecuting(context);
        }

        public void TriggerTransportationChange()
        {
            HttpContext.Session.SetString("IsFirstRequest", "SetConn");
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                conn.Open();

                SqlDependency.Start(ConnectionString);

                string commandText = "select AccountID, Representative, Include_Transportation from dbo.Accounts";

                SqlCommand cmd = new SqlCommand(commandText, conn);

                SqlDependency dependency = new SqlDependency(cmd);

                dependency.OnChange += new OnChangeEventHandler(dbChangeNotification);

                var reader = cmd.ExecuteReader();


            }
        }

        private void dbChangeNotification(object sender, SqlNotificationEventArgs e)
        {
            string commandText = $"select * from dbo.Accounts where AccountID='{AccountId}'";

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
                    //HttpContext.Session.SetString("IncludeTransportation", IncludeTransportation.ToString());
                    ViewBag.IsTransportation = IncludeTransportation;
                }
            }




            // get the results of each column

        }
    }
}