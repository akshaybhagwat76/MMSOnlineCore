using AspNetSeo;
using AspNetSeo.CoreMvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MMS.data.Entities;
using MMS.data.UnitOfWork;
using MMS.web.Extensions;
using MMS.web.Models;
using MMS.web.Services;
using System;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace MMS.web.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [ApiExplorerSettings(IgnoreApi = true)]
    public class HomeController : SeoController
    {
        public static string key = "sble-3ln6-iouy12";
        private readonly IUnitOfWork _uowProvider;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="uowProvider"></param>
        public HomeController(IUnitOfWork uowProvider)
        {
            _uowProvider = uowProvider;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IActionResult Index()
        {
            return LocalRedirect(Url.GetLocalUrl("~/admin"));
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        [Route("~/Error")]
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";
            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IActionResult login()
        {
            LoginModels obj = new LoginModels();
            return View(obj);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IActionResult logout()
        {
            HttpContext.Session.Clear();
            return View("login", "home");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<ActionResult> login(LoginModels obj)
        {
            var user = await _uowProvider.UsersRepository.Get(obj.Email);
            if (user != null)
            {
                var salt = user.Salt;
                var comb = obj.Password + salt;
                var enc = Encryption.SHA512(comb);
                var pre = ByteArrayToString(enc);

                var post = ByteArrayToString(user.PasswordHash);

                if (pre == post)
                {
                    var account = await _uowProvider.AccountsRepository.Get(user.AccountID);

                    HttpContext.Session.SetString("AccountId", user.AccountID);
                    HttpContext.Session.SetString("UserID", user.UserID.ToString());
                    HttpContext.Session.SetString("IncludeTransportation", account.Include_Transportation.ToString());

                    return RedirectToAction("Index", "Home", new { area = "Admin"});
                }
                else {
                    ModelState.AddModelError("", "You have entered invalid credentials.");
                }
            }
            return View(obj);
        }
        static string ByteArrayToString(byte[] arrInput)
        {
            int i;
            StringBuilder sOutput = new StringBuilder(arrInput.Length);
            for (i = 0; i < arrInput.Length; i++)
            {
                sOutput.Append(arrInput[i].ToString("X2"));
            }
            return sOutput.ToString();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";
            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IActionResult Privacy()
        {
            return View();
        }
    }
}