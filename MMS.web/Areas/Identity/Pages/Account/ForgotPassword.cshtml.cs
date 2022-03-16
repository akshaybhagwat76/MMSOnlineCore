using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text.Encodings.Web;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using MMS.web.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MMS.web.Services;

namespace MMS.web.Areas.Identity.Pages.Account
{
    /// <summary>
    /// 
    /// </summary>
    [AllowAnonymous]
    public class ForgotPasswordModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IEmailSender _emailSender;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userManager"></param>
        /// <param name="emailSender"></param>
        public ForgotPasswordModel(UserManager<ApplicationUser> userManager, IEmailSender emailSender)
        {
            _userManager = userManager;
            _emailSender = emailSender;
        }

        /// <summary>
        /// 
        /// </summary>
        [BindProperty]
        public InputModel Input { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public class InputModel
        {
            /// <summary>
            /// 
            /// </summary>
            [Required]
            [Display(Name ="Email-id")]
            [EmailAddress(ErrorMessage = "Please enter valid email address.")]
            public string Email { get; set; }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public async Task<IActionResult> OnPostAsync()
        {
            if (ModelState.IsValid)
            {
                var user = await _userManager.FindByEmailAsync(Input.Email);
                if (user == null || !(await _userManager.IsEmailConfirmedAsync(user)))
                {
                    ModelState.AddModelError("Input.Email", "Please enter the registered Email-id.");
                    // Don't reveal that the user does not exist or is not confirmed
                    //return RedirectToPage("./ForgotPasswordConfirmation");
                }
                else
                {
                    // For more information on how to enable account confirmation and password reset please 
                    // visit https://go.microsoft.com/fwlink/?LinkID=532713
                    var code1 = await _userManager.GeneratePasswordResetTokenAsync(user);
                    var code = code1.Base64ForUrlEncode();
                    var userId = user.Email;

                    var callbackUrl = Url.Page(
                        "/Account/ResetPassword",
                        pageHandler: null,
                        values: new { userId, code },
                        protocol: Request.Scheme);

                    Dictionary<string, string> data = new Dictionary<string, string>();
                    data.Add("<<username>>", user.FirstName);
                    data.Add("<<activationLink>>", callbackUrl);

                    await _emailSender.SendEmailAsync(user.Email, "Reset Password Email", data, "resetpassword_email.html");

                    return RedirectToPage("./ForgotPasswordConfirmation");
                }
            }

            return Page();
        }
    }
}
