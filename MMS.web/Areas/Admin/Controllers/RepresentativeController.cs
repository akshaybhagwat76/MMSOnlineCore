using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MMS.data.UnitOfWork;
using MMS.web.Areas.Admin.ViewModels.Input;
using MMS.web.Filters;
using MMS.web.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MMS.web.Areas.Admin.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [ServiceFilter(typeof(AuditFilterAttribute))]
    public class RepresentativeController : BaseController
    {
        private readonly IUnitOfWork _uowProvider;
        private readonly IEmailSender _emailSender;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="uowProvider"></param>
        /// <param name="emailSender"></param>
        public RepresentativeController(IUnitOfWork uowProvider, IEmailSender emailSender)
        {
            _uowProvider = uowProvider;
            _emailSender = emailSender;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public async Task<IActionResult> Index(string msg)
        {
            if (!string.IsNullOrEmpty(HttpContext.Session.GetString("UserID")))
            {
                var obj = new RepresentativeModel();
                var data = await _uowProvider.RepresentativeRepository.Get(AccountId);
                ViewBag.Message = msg;

                if (data != null)
                {
                    obj.Name = data.Name;
                    obj.Email = data.Email;
                    obj.OfficePhone = data.OfficePhone;
                    obj.CellPhone = data.CellPhone;
                    obj.ImageURL = data.Image_URL;
                    obj.Notes = data.Notes;
                }

                return View(obj);
            }

            return RedirectToAction("login", "Home");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> Index(RepresentativeModel m)
        {
            if (!string.IsNullOrEmpty(HttpContext.Session.GetString("UserID")))
            {
                if (ModelState.IsValid)
                {
                    try
                    {
                        Dictionary<string, string> data = new Dictionary<string, string>();
                        data.Add("<<currentDate>>", DateTime.Now.Date.ToString("dd MMM, yyyy"));
                        data.Add("<<username>>", m.Email);
                        data.Add("<<name>>", m.Name);
                        data.Add("<<message>>", m.Message);

                        await _emailSender.SendEmailAsync(m.Email, "Enquiry from supplier", data, "ContactUs.html");

                        return RedirectToAction("index", new { msg = "Message successfully sent." });
                    }
                    catch (Exception ex)
                    {
                        ModelState.AddModelError("", ex.Message);
                        return View(m);
                    }

                }
                return View(m);
            }
            return RedirectToAction("login", "Home");
        }
    }
}
