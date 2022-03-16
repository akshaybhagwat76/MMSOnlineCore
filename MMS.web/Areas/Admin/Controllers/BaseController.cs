using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Security.Claims;

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
        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        public override void OnActionExecuting(ActionExecutingContext context)
        {

            UserID = HttpContext.Session.GetString("UserID");
            AccountId = HttpContext.Session.GetString("AccountId");
            IncludeTransportation = Convert.ToBoolean(HttpContext.Session.GetString("IncludeTransportation"));
            ViewBag.IsTransportation = IncludeTransportation;
            base.OnActionExecuting(context);
        }
    }
}