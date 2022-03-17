using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Headers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using MMS.data.UnitOfWork;
using MMS.web.Extensions;
using MMS.web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MMS.web.Filters
{
    /// <summary>
    /// 
    /// </summary>
    public class AuditFilterAttribute : ActionFilterAttribute
    {
        private readonly IUnitOfWork _uowProvider;
        private readonly IHttpContextAccessor _httpContextAccessor;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="httpContextAccessor"></param>
        /// <param name="uowProvider"></param>
        public AuditFilterAttribute(IHttpContextAccessor httpContextAccessor, IUnitOfWork uowProvider)
        {
            _httpContextAccessor = httpContextAccessor;
            _uowProvider = uowProvider;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="filterContext"></param>
        public async override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try 
            {
                var objaudit = new MMS.data.Entities.UserAudit();
                var controllerName = ((ControllerBase)filterContext.Controller)
                    .ControllerContext.ActionDescriptor.ControllerName;
                var actionName = ((ControllerBase)filterContext.Controller)
                    .ControllerContext.ActionDescriptor.ActionName;
                var actionDescriptorRouteValues = ((ControllerBase)filterContext.Controller)
                    .ControllerContext.ActionDescriptor.RouteValues;

                if (actionDescriptorRouteValues.ContainsKey("area"))
                {
                    var area = actionDescriptorRouteValues["area"];
                    if (area != null)
                    {
                        objaudit.Area = Convert.ToString(area);
                    }
                }

                var request = filterContext.HttpContext.Request;

                objaudit.LangId = "1";

                if (!string.IsNullOrEmpty(_httpContextAccessor.HttpContext.Session.GetString("UserID")))
                {
                    objaudit.UserId = int.Parse(_httpContextAccessor.HttpContext.Session.GetString("UserID"));
                }
                else
                {
                    objaudit.UserId = null;
                }

                objaudit.SessionId = filterContext.HttpContext.Session.Id; ; // Application SessionID // User IPAddress 
                if (_httpContextAccessor.HttpContext != null)
                    objaudit.IpAddress = Convert.ToString(_httpContextAccessor.HttpContext.Connection.RemoteIpAddress);

                objaudit.PageAccessed = Convert.ToString(filterContext.HttpContext.Request.Path); // URL User Requested 

                objaudit.LoginStatus = "A";
                objaudit.ControllerName = controllerName; // ControllerName 
                objaudit.ActionName = actionName;
                objaudit.CreatedOn = DateTime.UtcNow;

                RequestHeaders header = request.GetTypedHeaders();
                Uri uriReferer = header.Referer;

                if (uriReferer != null)
                {
                    objaudit.UrlReferrer = header.Referer.AbsoluteUri;
                }

                if (!string.IsNullOrEmpty(request.QueryString.Value)) {
                    objaudit.PageAccessed += request.QueryString.Value;
                }
                if(!string.IsNullOrEmpty(objaudit.PageAccessed) && objaudit.PageAccessed.Contains("home"))
                {
                    objaudit.PageAccessed = objaudit.PageAccessed.Replace("home", "transactions");
                }

                await _uowProvider.UserAuditRepository.Insert(objaudit);
            }
            catch { }
        }
    }
}
