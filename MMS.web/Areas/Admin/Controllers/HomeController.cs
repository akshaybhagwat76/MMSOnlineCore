using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MMS.data.UnitOfWork;
using MMS.web.Areas.Admin.ViewModels.Input;
using MMS.web.Config;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.Caching.Memory;
using MMS.web.Filters;

namespace MMS.web.Areas.Admin.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [ServiceFilter(typeof(AuditFilterAttribute))]
    public class HomeController : BaseController
    {
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
            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        //public IActionResult login()
        //{
        //    return RedirectToAction("login", "Home", new { area = "" });
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<JsonResult> getTransections()
        {
            try
            {

                var draw = HttpContext.Request.Form["draw"].FirstOrDefault();
                var start = Request.Form["start"].FirstOrDefault();
                var length = Request.Form["length"].FirstOrDefault();
                var sortColumn = Request.Form["columns[" + Request.Form["order[0][column]"].FirstOrDefault() + "][name]"].FirstOrDefault();
                var sortColumnDir = Request.Form["order[0][dir]"].FirstOrDefault();
                var searchValue = Request.Form["search[value]"].FirstOrDefault();

                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                var page = (Convert.ToInt32(start) / Convert.ToInt32(length)) + 1;
                int recordsTotal = 0;

                var data = await _uowProvider.TransactionHeaderRepository.Search(AccountId, page, pageSize, sortColumn, sortColumnDir, searchValue);

                if (data.Count() > 0)
                {
                    recordsTotal = data.FirstOrDefault().TotalRecord;
                    var query = data.Select(o => new
                    {
                        TicketNumber = o.TicketNumber,
                        TicketDate = o.TicketDate.Value.ToString("MM-dd-yyyy"),
                        Weight = o.Weight
                    });

                    return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = query });
                }
                else
                    return Json(new { draw = draw, recordsFiltered = 0, recordsTotal = 0, data = "" });

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}