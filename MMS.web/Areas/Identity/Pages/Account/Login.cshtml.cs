using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using MMS.web.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using MMS.data.UnitOfWork;
using Microsoft.AspNetCore.Http;
using MMS.web.Extensions;
using System.Globalization;
using Microsoft.AspNetCore.Session;
using System.Security.Claims;

namespace MMS.web.Areas.Identity.Pages.Account
{
    /// <summary>
    /// 
    /// </summary>
    [AllowAnonymous]
    public class LoginModel : PageModel
    {
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly ILogger<LoginModel> _logger;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<ApplicationRole> _roleManager;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IUnitOfWork _uowProvider;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="signInManager"></param>
        /// <param name="logger"></param>
        /// <param name="userManager"></param>
        /// <param name="roleManager"></param>
        /// <param name="uowProvider"></param>
        /// <param name="httpContextAccessor"></param>
        public LoginModel(SignInManager<ApplicationUser> signInManager, ILogger<LoginModel> logger, UserManager<ApplicationUser> userManager, RoleManager<ApplicationRole> roleManager, IUnitOfWork uowProvider, IHttpContextAccessor httpContextAccessor)
        {

            _signInManager = signInManager;
            _logger = logger;
            _userManager = userManager;
            _roleManager = roleManager;
            _uowProvider = uowProvider;
            _httpContextAccessor = httpContextAccessor;
        }

        /// <summary>
        /// 
        /// </summary>
        [BindProperty]
        public InputModel Input { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public IList<AuthenticationScheme> ExternalLogins { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string ReturnUrl { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [TempData]
        public string ErrorMessage { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public class InputModel
        {
            /// <summary>
            /// 
            /// </summary>
            [Required(ErrorMessage = "User Email is required")]
            [Display(Name = "Email")]
            [EmailAddress(ErrorMessage = "Please enter valid email address.")]
            public string Email { get; set; }

            /// <summary>
            /// 
            /// </summary>
            [Required(ErrorMessage = "Password is required")]
            [DataType(DataType.Password)]
            [StringLength(100, ErrorMessage = "Password must be at least 8 characters", MinimumLength = 5)]
            public string Password { get; set; }

            /// <summary>
            /// 
            /// </summary>
            [Display(Name = "Remember me?")]
            public bool RememberMe { get; set; }
        }

        /// <summary>
        /// 
        /// </summary>
        public async Task OnGetAsync(string returnUrl = null)
        {
            if (!string.IsNullOrEmpty(ErrorMessage))
            {
                ModelState.AddModelError(string.Empty, ErrorMessage);
            }

            returnUrl = returnUrl ?? Url.Content("~/");

            // Clear the existing external cookie to ensure a clean login process
            await HttpContext.SignOutAsync(IdentityConstants.ExternalScheme);

            ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();

            ReturnUrl = returnUrl;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="returnUrl"></param>
        /// <returns></returns>
        public async Task<IActionResult> OnPostAsync(string returnUrl = null)
        {
            returnUrl = returnUrl ?? Url.Content("~/");
            if (ModelState.IsValid)
            {
                try
                {

                    // This doesn't count login failures towards account lockout
                    // To enable password failures to trigger account lockout, set lockoutOnFailure: true

                    var user = await _uowProvider.UsersRepository.Get(Input.Email);

                    if (user != null)
                    {
                        var salt = user.Salt;
                        var comb = Input.Password + salt;
                        var enc = Encryption.SHA512(comb);
                        var pre = Encryption.ByteArrayToString(enc);
                        var post = Encryption.ByteArrayToString(user.PasswordHash);

                        if (pre == post)
                        {
                            HttpContext.Session.SetString("UserID", user.UserID.ToString());
                            HttpContext.Session.SetString("AccountId", user.AccountID);
                            HttpContext.Session.SetString("GivenName", user.Name);


                            return LocalRedirect(Url.GetLocalUrl("~/admin"));
                        }
                        else
                        {
                            ModelState.AddModelError("", "You have entered invalid credentials.");
                        }
                    }
                    else
                    {
                        ModelState.AddModelError(string.Empty, "You have entered invalid credentials.");
                        //    return Page();
                    }

                    //if (user == null)
                    //{
                    //    ModelState.AddModelError(string.Empty, "You have entered invalid credentials.");
                    //    return Page();
                    //}

                    //var result = await _signInManager.PasswordSignInAsync(user.UserName, Input.Password, Input.RememberMe, lockoutOnFailure: true);

                    //if (result.Succeeded)
                    //{
                    //    _logger.LogInformation("User logged in.");

                    //    if (!user.IsActive || user.IsDeleted)
                    //    {
                    //        _logger.LogWarning("User account locked out.");
                    //        await _signInManager.SignOutAsync();
                    //        _logger.LogInformation("User logged out.");

                    //        ModelState.AddModelError(string.Empty, $"Your account does not active.");
                    //        return Page();
                    //    }
                    //    else if (!user.EmailConfirmed)
                    //    {
                    //        await _signInManager.SignOutAsync();
                    //        ModelState.AddModelError(string.Empty, $"Email verification is pending.");

                    //        return Page();
                    //    }

                    //    var roles = await _userManager.GetRolesAsync(user);
                    //    var role = await _roleManager.FindByNameAsync(roles.FirstOrDefault());

                    //    AuditLogin(role.Id, user.Id);

                    //    if (roles.Contains("superadmin"))
                    //    {
                    //        return LocalRedirect(Url.GetLocalUrl("~/admin"));
                    //    }
                    //    else
                    //    {
                    //        if (role == null || string.IsNullOrWhiteSpace(role.RedirectUrl))
                    //        {
                    //            await _signInManager.SignOutAsync();
                    //            ModelState.AddModelError(string.Empty, "You have entered invalid credentials.");
                    //            return Page();
                    //        }
                    //        else
                    //        {
                    //            return LocalRedirect(Url.GetLocalUrl(role.RedirectUrl));
                    //        }

                    //    }

                    //}
                    //if (result.RequiresTwoFactor)
                    //{
                    //    return RedirectToPage("./LoginWith2fa", new { ReturnUrl = returnUrl, RememberMe = Input.RememberMe });
                    //}
                    //if (result.IsLockedOut)
                    //{
                    //    _logger.LogWarning("User account locked out.");
                    //    return RedirectToPage("./Lockout");
                    //}
                    //else
                    //{
                    //    ModelState.AddModelError(string.Empty, "You have entered invalid credentials.");
                    //    return Page();
                    //}

                }
                catch (Exception ex)
                {
                    ModelState.AddModelError(string.Empty, ex.Message);
                    return Page();
                }
            }

            // If we got this far, something failed, redisplay form
            return Page();
        }

        /// <summary>
        /// 
        /// </summary>
        private async void AuditLogin(Guid? RoleId, Guid? UserId)
        {
            try 
            {
                var audit = new MMS.data.Entities.UserAudit();
                audit.RoleId = RoleId;
                audit.ControllerName = "Account";
                audit.ActionName = "Login";
                audit.Area = "identity";
                audit.LoggedInAt = DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
                if (_httpContextAccessor.HttpContext != null)
                    audit.IpAddress = Convert.ToString(_httpContextAccessor.HttpContext.Connection.RemoteIpAddress);
                audit.UserId = UserId;
                audit.PageAccessed = "";
                audit.UrlReferrer = "";
                audit.SessionId = HttpContext.Session.Id;
                audit.CreatedOn = DateTime.UtcNow;

                await _uowProvider.UserAuditRepository.Insert(audit);
            }
            catch { }

        }
    }
}
