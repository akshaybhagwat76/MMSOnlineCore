using Microsoft.AspNetCore.Mvc;
using MMS.data.UnitOfWork;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace MMS.web.Areas.Admin.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class AuditLogController : BaseController
    {

        private readonly IUnitOfWork _uowProvider;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="uowProvider"></param>
        public AuditLogController(IUnitOfWork uowProvider)
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
        [HttpPost]
        public async Task<JsonResult> getAuditLogs()
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

                var data = await _uowProvider.UserAuditRepository.Search(page, pageSize, sortColumn, sortColumnDir, searchValue);

                if (data.Count() > 0)
                {
                    recordsTotal = data.FirstOrDefault().TotalRecord;
                    var query = data.Select(o => new
                    {
                        o.AuditId,
                        o.SessionId,
                        o.IpAddress,
                        o.ControllerName,
                        o.ActionName,
                        o.Area,
                        LoggedInAt = o.LoggedInAt != null ? Convert.ToDateTime(o.LoggedInAt).ToString("MM-dd-yyyy HH:mm") : "",
                        LoggedOutAt = o.LoggedOutAt != null ? Convert.ToDateTime(o.LoggedOutAt).ToString("MM-dd-yyyy HH:mm") : "",
                        o.UrlReferrer,
                        o.PageAccessed,
                        CreatedOn = o.CreatedOn != null ? Convert.ToDateTime(o.CreatedOn).ToString("MM-dd-yyyy HH:mm") : "",
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
