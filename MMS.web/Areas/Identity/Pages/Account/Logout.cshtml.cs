using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using MMS.web.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using MMS.web.Extensions;
using System.Globalization;
using Microsoft.AspNetCore.Http;
using MMS.data.UnitOfWork;
using System.Security.Claims;

namespace MMS.web.Areas.Identity.Pages.Account
{
    /// <summary>
    /// 
    /// </summary>
    [AllowAnonymous]
    public class LogoutModel : PageModel
    {
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly ILogger<LogoutModel> _logger;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IUnitOfWork _uowProvider;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="signInManager"></param>
        /// <param name="logger"></param>
        /// <param name="uowProvider"></param>
        /// <param name="httpContextAccessor"></param>
        public LogoutModel(SignInManager<ApplicationUser> signInManager, ILogger<LogoutModel> logger, IUnitOfWork uowProvider, IHttpContextAccessor httpContextAccessor)
        {
            _signInManager = signInManager;
            _logger = logger;
            _uowProvider = uowProvider;
            _httpContextAccessor = httpContextAccessor;
        }

        /// <summary>
        /// 
        /// </summary>
        public void OnGet()
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="returnUrl"></param>
        /// <returns></returns>
        public async Task<IActionResult> OnPost(string returnUrl = null)
        {
            await _signInManager.SignOutAsync();
            AuditLogout();
            HttpContext.Session.Clear();
            _logger.LogInformation("User logged out.");
            if (returnUrl != null)
            {
                return LocalRedirect(returnUrl);
            }
            else
            {
                return LocalRedirect("~/");
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private async void AuditLogout()
        {
            try
            {
                var objaudit = new MMS.data.Entities.UserAudit();
                //objaudit.RoleId = Guid.Parse(User.FindFirst("RoleId").Value);
                objaudit.ControllerName = "Account";
                objaudit.ActionName = "Logout";
                objaudit.Area = "identity";
                objaudit.LoggedOutAt = DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
                if (_httpContextAccessor.HttpContext != null)
                    objaudit.IpAddress = Convert.ToString(_httpContextAccessor.HttpContext.Connection.RemoteIpAddress);
                objaudit.UserId = Convert.ToInt32(HttpContext.Session.GetString("UserID"));
                objaudit.PageAccessed = "";
                objaudit.UrlReferrer = "";
                objaudit.SessionId = HttpContext.Session.Id;
                objaudit.CreatedOn = DateTime.UtcNow;
                await _uowProvider.UserAuditRepository.Insert(objaudit);
            }
            catch { }

        }
    }
}